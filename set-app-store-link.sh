#!/bin/bash
#
# Turns every "Get the App" button on the site into a live link.
#
#   ./set-app-store-link.sh https://apps.apple.com/app/id0000000000
#   ./set-app-store-link.sh --clear     # back to "Coming to the App Store"
#
# The buttons read one constant, so this rewrites a single line in each page. Until it is
# set they render as a non-clickable "Coming to the App Store" badge — a prominent button
# pointing at a listing that does not exist is worse than no button, and App Review follows
# the marketing URL.
set -euo pipefail

URL="${1:-}"
if [[ -z "$URL" ]]; then
  echo "usage: $0 <app-store-url> | --clear" >&2
  exit 2
fi
if [[ "$URL" == "--clear" ]]; then
  URL=""
elif [[ ! "$URL" =~ ^https://apps\.apple\.com/ ]]; then
  echo "error: expected a https://apps.apple.com/... URL, got: $URL" >&2
  exit 1
fi

cd "$(dirname "${BASH_SOURCE[0]}")"
for page in index.html support.html privacy.html; do
  python3 - "$page" "$URL" <<'PY'
import re, sys
path, url = sys.argv[1], sys.argv[2]
s = open(path).read()
new = f'  var APP_STORE_URL = "{url}";'
s, n = re.subn(r'^  var APP_STORE_URL = "[^"]*";$', new.replace("\\", "\\\\"), s, flags=re.M)
assert n == 1, f"{path}: expected one APP_STORE_URL line, found {n}"
open(path, "w").write(s)
print(f"  {path}: {url or '(cleared)'}")
PY
done
echo "Done. Commit and push to publish."

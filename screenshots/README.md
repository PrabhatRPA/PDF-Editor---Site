# Marketing screenshots

Drop the App Store frames here with these exact names. `index.html` looks for them by name,
and any it cannot find removes itself from the page — so the site never shows a broken image
while the set is incomplete.

| File | Device | Pixel size |
|---|---|---|
| `iphone-01.png` … `iphone-08.png` | iPhone | 1284 × 2778 |
| `ipad-01.png` … `ipad-08.png` | iPad | 2048 × 2732 |

Order matters only in that `01` is shown first, so lead with the strongest frame.

Keep them as PNG. If the page feels slow on a phone, re-encode at a lower quality rather than
resizing — the strip scales them down in CSS and a smaller source will look soft on a
high-density screen.

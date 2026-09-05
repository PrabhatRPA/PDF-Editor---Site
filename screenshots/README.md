# Screenshots on the site

These are **web copies**, not the App Store assets. They are resized and re-encoded as JPEG
because the strips on the home page display them at 232pt (iPhone) and 340pt (iPad): serving
the full-resolution PNGs would have put 47 MB on a single page to draw about a megabyte of
pixels. As JPEG at 760px and 1040px wide the whole gallery is 1.4 MB.

| | Served at | Source |
|---|---|---|
| `iphone-*.jpg` | 760 px wide | 1284 × 2778 PNG |
| `ipad-*.jpg` | 1040 px wide | 2048 × 2732 PNG |

**The originals are the App Store submission assets** and live in the app repository under
`Design/AppStore/`. Upload those to App Store Connect, not these.

To regenerate after changing a source frame:

```bash
sips -s format jpeg -s formatOptions 82 -Z 760  iphone-01-hero.png --out iphone-01-hero.jpg
sips -s format jpeg -s formatOptions 82 -Z 1040 ipad-01-hero.png   --out ipad-01-hero.jpg
```

Each image carries its real `width` and `height`, so the page reserves the right space and
does not jump as they load. Any file that goes missing still removes itself from the strip.

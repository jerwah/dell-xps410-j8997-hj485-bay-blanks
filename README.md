# Dell XPS 410 5.25" drive bay blank (J8997)

I'm turning my old Dell XPS 410 into a NAS, and pulling the optical drives left empty 5.25" bays. I only had one genuine Dell blank, so I measured it with calipers and modeled a printable replacement.
This repo has the parametric OpenSCAD source, a ready-to-print STL, and my full measurement record of the original part.

![Two printed blanks installed in my XPS 410](photos/printed-installed-xps410.jpg)

<img src="photos/printed-vs-original-back.jpg" width="400" alt="Back view: my printed blank next to the original Dell blank (the one with the sticker), both holding the spare screws">

Back view: my print next to the original Dell blank (the one with the sticker), both holding the spare screws.

> **AI-assisted.** I made this with the help of Claude (Anthropic) in Claude Code: the OpenSCAD code, documentation and research were written with AI assistance.
> I did the measuring, every test print, and made the design decisions.

**Part numbers and search terms:** Dell J8997 / 0J8997 (molded inside), HH978 (molded inside), DP/N 0J9006 (sticker), possibly FH991 (see Compatibility).
5.25 inch bay blank, drive bay cover, optical drive bay filler, ODD filler, drive panel insert, CD/DVD bay cover.

## Compatibility

| Model | Status |
|---|---|
| Dell XPS 410 | **Tested**: fits and latches like the original |
| Dell Dimension 9200 | Same machine as the XPS 410 under another name, same part (J8997); should fit |
| Dell XPS 400, Dimension 9150, Dimension 9100 | Appears to be the same part (same drive panel and latch), but I couldn't find a source naming the part number; untested |
| Dell Precision 390, 490, T3400, T3500 | **May fit**: their filler, FH991, looks identical and is listed by a seller as compatible with J8997; untested |

**To check your own machine:** look inside your existing blank for **J8997** molded into the plastic.
Measurements: the original's outer lip is ~146.66 x ~39.62 mm, and it has a tab at one end and a two-arm squeeze latch at the other.
If you try it on another model, please open an issue and let me know how it went.

## Files

| File | What |
|---|---|
| `stl/xps410_bay_blank.stl` | The part, with breakaway supports built in. Print this. |
| `stl/test/latch_test.stl` | Just the latch end, to check the latch fit on your printer before printing the whole part |
| `stl/test/boss_test.stl` | Five screw bosses with hole sizes 2.6 to 3.0 mm, to tune the spare-screw holes if desired |
| `xps410_bay_blank.scad` | Parametric OpenSCAD source (OpenSCAD 2021.01 or later) |
| `MEASUREMENTS.md` | Every dimension of the original part, where it came from, and my test print log |
| `photos/` | Photos of the original Dell part, and the printed ones installed |

## Printing

I printed mine on a Creality Ender-3 V3 SE (stock 0.4 mm nozzle, textured PEI plate) with OrcaSlicer 2.5, in PLA and PETG.

- **Orientation:** face down, exactly as the STL loads. The plate's texture becomes the matte front face, matching the original.
- **Plate:** textured PEI.
- **Supports: OFF in the slicer.** The breakaway supports are part of the model (pillars under the latch legs, a shelf under the tab and the lip on the tab side), with a deliberate small air gap so they snap off easily.
- **The slicer warning is expected.** OrcaSlicer says `It seems object <name>.stl has floating regions. Please re-orient the object or enable support generation.` That is the built-in air gap. Click OK and print; do not enable supports.
- **Layer height:** 0.2 mm.
- **Brim:** a mouse-ear brim stops the corners of the cover lifting in PETG for me.

### PETG settings that worked for me

| Setting | Value |
|---|---|
| Nozzle | 230 °C |
| Bed | 80 °C |
| Flow ratio | 0.95 |
| Cooling | none for the first 3 layers, full speed at layer 5; fan 30 % to 90 % by layer time; keep fan always on: off |
| Overhangs and bridges fan | 90 %, forced |

### Removing the supports

1. **Let it cool fully** before touching the supports: about 15 to 20 minutes, until the bed is under 30 °C and the part feels room temperature.
2. **Use needle nose pliers to support the latch arm** and use a second set of pliers to break off the nub. (The small support pillar under the end of each latch leg). Do not break them off by hand, you'll probably snap an arm. Ask me how I know.

   ![OrcaSlicer preview of the latch end: keep the latch arms (green), break off the nub under each arm (red) with pliers](photos/slicer-latch-nub-annotated.png)

   <img src="photos/support-removal-pliers.jpg" width="32%" alt="One pair of needle nose pliers holding the latch arm, a second pair on the nub"> <img src="photos/support-removal-one-nub-off.jpg" width="32%" alt="One nub removed"> <img src="photos/support-removal-done.jpg" width="32%" alt="Both nubs removed">

   In order: one pair of pliers holding the arm and one on the nub; one nub off; both nubs off.

3. There is also a breakaway support under the tab; there is a small extension you can grab with pliers and it should come off quite easily.

## Fit and use

- The three bosses on the back store spare optical-drive screws, as on the original. The screws thread straight into the 3.0 mm holes for me. You can also turn them off in the options.

## Customizing

Open `xps410_bay_blank.scad` in OpenSCAD and use the Customizer (Window > Customizer). Every dimension is a named variable. These are the ones worth adjusting:

| Variable | Default | What it is, and when to change it |
|---|---|---|
| `part` | `full` | What to build. `full` is the whole blank; the others are small test pieces: `latch_test` (just the latch end), `boss_test` (screw holes in five sizes), `coupon` (just the front plate, to check the fit in the opening). |
| `nub_h` | 0.3 | Height of the **crush nubs**: the six small bumps (three on top, three on the bottom) along the edges of the raised front face. They press against the opening so the blank doesn't rattle. Raise it if the blank is loose in the opening, lower it if it's too tight. |
| `leg_bottom_z` | 1.95 | Position of the **latch hooks**: the catches on the ends of the two latch arms (latch side) that click behind the bezel. Measured from the front face. Lower it if the hooks don't reach far enough to catch, raise it if they catch too early; about 0.2 per layer line. |
| `boss_hole_d` | 3.0 | Hole size in the **screw bosses**: the three round posts on the back that hold spare drive screws. Raise it if the screws won't go in, lower it if they fall out. The posts get wider with the hole. |
| `brace` | `pocket` | Shape of the **latch brace**: the support behind the U where the two latch arms join. `pocket` (a solid wedge) is strongest. `original` roughly copies the original Dell brace but was too weak in my testing; `hybrid` is in between. |
| `support_gap` | 0.3 | Air gap between the part and the **built-in support under the tab** (tab side). Raise it if that support fuses to the part, lower it if the tab sags onto it. |
| `leg_support_gap` | 0.25 | Same, for the **support pillars under the latch legs** (latch side). |
| `print_supports` | true | Set to false to leave out the built-in supports, if you would rather use your slicer's. |
| `include_screw_bosses` | true | Set to false to leave out the screw bosses. |

## Photos

Photos of the original Dell part are in `photos/`. They're for shape only; the camera angles make their scale unreliable, so every dimension came from calipers wherever possible (see `MEASUREMENTS.md`).

## Not affiliated with Dell

This is an independent design made by measuring an original part. It contains no Dell logo or artwork.
Dell, XPS, Dimension and Precision are trademarks of Dell Inc.; they are used here only to say which computers the part fits.

## License

[Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/). See [LICENSE](LICENSE).
You may use, change, share and sell it, as long as you credit this project and share changed versions under the same license.

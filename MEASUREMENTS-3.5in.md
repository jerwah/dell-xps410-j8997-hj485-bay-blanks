# Dell XPS 410 3.5" bay blank: measurements of the original

Modeled and test printed in PETG (two latch tests, two face coupons, stock and honeycomb full blanks), November 2026.

Reference part: one genuine Dell 3.5" bay blank, measured with calipers (November 2026).
This file is the single source for every dimension in the 3.5" OpenSCAD model.

**Source codes**

- **M** = measured with calipers
- **D** = derived from other values (formula shown)
- **E** = estimated (from a photo, or "about")
- **C** = design choice (not on the original, or not measurable)
- **T** = tuned from a test print (the measured value is in the notes)

## Coordinate conventions

Same as the 5.25" blank: viewed from the **front** as installed, **tab on the left, latch on the right**.

| Axis | Meaning | Zero |
|---|---|---|
| X | length, tab side to latch side | tab-side edge of the flange (tab not included) |
| Y | height | the **clip edge**: the long edge the latch sits near |
| Z | height above the table with the part lying **face-down** | the front face (the table) |

The latch sits near one long edge and the tab near the other.
Seen from the front (latch on the right), the clip edge is at the bottom; seen from the back (face down, latch on the right, as in photo `PXL_20261112_011719043`), it is at the top.

## Identification and material

| Item | Value |
|---|---|
| Dell part number (sticker) | `CN-0KJ293-...` (the rest is a unit serial) (DP/N **0KJ293**) |
| Molded part numbers | BK-P/N HJ485, MNG-P/N P8106 |
| Molder | MITAC SHUNDE, UL T1214 |
| Material | ABS |
| Date dials | 06, 8, 1, 5 |
| Also used in | Dell PowerEdge SC440 (eBay listing naming HJ485, P8106 and KJ293) |

## Flange and raised face

| Variable | Value | Src | Notes |
|---|---|---|---|
| `lip_w` | 106.18 | M | flange length, tab and latch not included |
| `lip_h` | 25.8 | M | flange height |
| `lip_t` | 1.94 | M | flange thickness |
| `face_w` | 99.5 | M | raised face length |
| `face_h` | 22.85 | M | raised face height. Re-measured 2026-11-12: the first reading (23.38) caught a pair of facing crush nubs (one on each long edge, same X); the bay accepted 23.38 anyway |
| `face_proud` | 4.22 | M | face stands in front of the flange |
| fit in the front panel | about 1 mm inset | M | re-measured 2026-11-12, `face_proud` confirmed; the original blank also sits about 1 mm inset, same as the stock print |
| `flush_extra` | 1.0 | C | `more_flush`: the face 1 mm deeper so it sits nearly flush; flange, latch, fins and back unchanged (every Z behind the face moves 1.0). Off for stock, on by default when the blank breathes |
| `plate_t` | 6.16 | D | `face_proud + lip_t`; Z of the flange's back surface |
| `face_margin_y` | 1.475 | D | `(lip_h - face_h) / 2` |
| `face_margin_tab` | 3.18 | D | measured 3.14; the two end readings summed 0.08 short of `lip_w - face_w`, split evenly |
| `face_margin_latch` | 3.50 | D | measured 3.46; as above |

## Crush nubs

| Variable | Value | Src | Notes |
|---|---|---|---|
| count | 3 on each long edge | M | same on both edges |
| nub tab-side edges from the face's tab-side edge | 10.6, 47.8, 85.4 | M | |
| nub centers, X | 14.66, 51.86, 89.46 | D | `face_margin_tab + edge + nub_w/2` |
| `nub_w`, `nub_h` | 1.75, 0.3 | M/E | "exactly the same" as the 5.25" nubs. Cross-check 2026-11-12: across a pair of facing nubs the face reads 23.38 vs 22.85 without, so each nub is about 0.265; 0.3 kept (slightly snugger) |
| Z extent | full face depth (0 to 4.22) | E | |
| end nubs (`end_nubs`) | 2 on each short end (tab end and latch end), 4 in all | M | found 2026-11-12; the 5.25" blank has none |
| `end_nub_from_edge` | 2.76 | M | face's long edge to the near side of the nub, same at both long edges and both ends |
| end nub size | 1.75 x 0.3, full face depth | E | assumed the same as the long-edge nubs |

## Tab

| Variable | Value | Src | Notes |
|---|---|---|---|
| `tab_out` | 2.72 | M | |
| `tab_h` | 9.66 | M | second reading (first 9.53) |
| tab gap to the far edge | 4.09 | D | measured 3.96; readings summed 25.55 vs 25.8, the 0.25 split evenly between the two gaps |
| tab gap to the clip edge | 12.05 | D | measured 11.93; `lip_h - 4.09 - tab_h` |
| `tab_t` | 1.94 | M | in the flange (Z 4.22 to 6.16) |

## Back pocket, fins and corner boxes

The raised face is a hollow shell; the pocket is open at the back.

| Variable | Value | Src | Notes |
|---|---|---|---|
| pocket depth | 4.14 | M | flange back to pocket floor |
| `floor_z` | 2.02 | D | `plate_t - 4.14`; floor thickness |
| `rim_y` | 3.4 | M | both long edges, flange edge to pocket edge |
| `rim_tab`, `rim_latch` | 5.6, 5.6 | M | tab not included |
| pocket size | 94.98 x 19.0 | D | X 5.6 to 100.58, Y 3.4 to 22.4 |
| face wall thickness | about 1.93 sides (was 2.19 with the old `face_h`), 2.42 tab end, 2.10 latch end | D | from the face and pocket sizes |
| fins | 2, one on each long edge | M | the inner face flush with the pocket edge |
| `fin_t` | 1.46 | M | so Y 1.94 to 3.4 and 22.4 to 23.86 (D) |
| `fin_z` | 12.95 | M | table to fin top; read 12.9 to 13.0, hard to measure |
| fin base length | 49 | M | at the flange back |
| fin ramp start, latch side | 29 | M | flange latch edge to the foot of the ramp; base X 28.18 to 77.18 (D) |
| `fin_ramp_angle` | 45 | E | |
| fin rise / flat top | 6.79 / 35.42 | D | `fin_z - plate_t`; `49 - 2 * rise` (flat top X 34.97 to 70.39) |
| corner boxes | 4, one in each pocket corner | M | 6 x 6 outside; two 1.4 walls, the other two sides are the pocket walls; hollow |
| corner box top | flush with the flange back (Z 6.16) | M | |
| corner boxes when vented | **left out** | C | they serve no purpose found (likely mold features); dropping them lets the vents use the full pocket length (`include_corner_boxes`) |
| posts on the corner boxes | 3 tall, 1.2 dia | M | **left out** (C): no function found, they touch nothing, fiddly to print; likely tooling features |

## Screw bosses and ribs

Same bosses and screws as the 5.25" blank, four instead of three.

| Variable | Value | Src | Notes |
|---|---|---|---|
| count | 4 | M | in a line, joined by a long rib, with triangle ribs |
| `boss_pitch` | 17.73 | D | 16.4 measured inside the ribs, plus `rib_t` 1.33 (5.25" blank: 17.8) |
| boss centers, X | 26.50, 44.23, 61.96, 79.69 | D | centered on the pocket (X 53.09) |
| boss centers, Y | 12.9 | M/D | exactly centered, `lip_h / 2` |
| `boss_d`, `boss_hole_d`, `boss_hole_depth` | 5.5, 3.0, 5.5 | D/C | as on the 5.25" blank |
| `boss_h` | 5.26 above the floor | E | "identical" to the 5.25" bosses; top at Z 7.28 (D) |
| `rib_t` | 1.33 | E | as on the 5.25" blank |
| rib layout | long rib through all 4 bosses, triangle ribs as on the 5.25" | E | |

## Latch

Two arms joined by a U at a short end wall, running out past the flange's latch edge.
From the back, the arms converge from the U to a narrow waist, S-bend outward, and run straight to the tips.
Each tip has a hook on its outer side.

### End wall

| Variable | Value | Src | Notes |
|---|---|---|---|
| `wall_t` | 1.7 | M | X 104.48 to 106.18 (inside `lip_w`) |
| wall length, Y | 16.94 | D | from the clip edge: 3.5 to the U + U 7.44 + 6 past the U |
| wall Z | 2.92 to 7.46 | M/D | top level with the arm tops; sticks out the same 1.3 on the face side as on the back |
| `wall_corner_r` | 0.5 | E | tiny rounding on the wall's corners, seen from the front and side |
| braces | 3 triangles on the back side only, evenly spaced | M | sizes estimated: 1.3 tall (flange back to wall top), about 2 long, about 1.2 thick (E) |

### Arms (back view)

| Variable | Value | Src | Notes |
|---|---|---|---|
| U position | Y 3.5 to 10.94 at the wall | M/D | 3.5 from the clip edge; U 7.44 wide where it meets the wall, slightly wider just past it |
| latch centerline, Y | 7.22 | D | |
| `arm_len` (B) | 18.39 | M | wall outer face to the tips; tips at X 124.57 (D) |
| `arm_t` | 1.8 | M | the stem, in Y |
| slot length (F) | 7.8 | M/E | inside the U, closed end to the waist |
| waist gap (E) | 2.0 | M | narrowest gap between the arms |
| tip gap (A) | 6.15 | M | between the arms on the straight tip run |
| tip span (C) | 13.34 | M | outside to outside across the hooks; tips at Y 0.55 to 13.89 (D) |
| cross-check | 2 x 3.65 + 6.15 = 13.45 vs 13.34 | D | |
| S-bend | about X +8 to +11 from the wall | E | from the annotated photo (scale from B and C, about 69 px/mm) |

### Arm height and hook (end view)

| Variable | Value | Src | Notes |
|---|---|---|---|
| arm Z | 1.92 to 7.46 | M/D | table to top 7.46 (M), arm height 5.54 (M); bottom read as "2" |
| hook length | 4.77 | M | along the arm from the tip, then tapers back into the arm |
| hook width (D) | 3.65 | M | stem plus hook; read 3.6 and 3.7 |
| face-side flat | 2.5 wide at Z 1.92 | M | |
| ramp | Z 1.92 to 2.66, widening from 2.5 to 3.65 | D | `5.54 - 1.5 - 3.3` = 0.74 tall (was 1.94 before test 1); about 57 degrees from vertical, watch for droop when printed face down |
| hook outer face | Z 2.66 to 4.16 | M | 1.5 tall (height measured; moved down 1.2 after test 1) |
| catch face | Z 4.16, faces the back | T | square ledge back to the stem; measured position Z 5.36 printed 6 layers (1.2) too far from the face in latch test 1 (2026-11-12) |
| stem behind the catch | Z 4.16 to 7.46 | T | 3.3 tall (measured 2.1, lengthened by 1.2 after test 1), 1.8 wide |
| hook direction | outward (away from the other arm) | M | the two arms are mirror images |

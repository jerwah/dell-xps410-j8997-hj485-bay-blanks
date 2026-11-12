# Dell XPS 410 5.25" bay blank: measurements of the original

Reference part: one genuine Dell blank, measured with calipers (November 2026).
This file is the single source for every dimension in the OpenSCAD model.

**Source codes**

- **M** = measured with calipers
- **D** = derived from other values (formula shown)
- **E** = estimated (from a photo, or "about")
- **C** = design choice (not on the original, or not measurable)

## Coordinate conventions

Viewed from the front as installed: **tab on the left, latch on the right**.

| Axis | Meaning | Zero |
|---|---|---|
| X | width, left to right | left edge of the lip (tab not included) |
| Y | height, bottom to top | bottom edge of the lip |
| Z | height above the table with the part lying **face-down** | the front face (the table) |

Some values were measured from the top edge; those are noted and converted.

## Identification and material

| Item | Value |
|---|---|
| Dell part number (sticker) | `CN-0J9006-...` (the rest is a unit serial) (DP/N **0J9006**) |
| Molded part numbers | P/N J8997, P/N HH978 |
| Molder | MITAC SHUNDE, UL T1214 |
| Material | ABS (Lanxess Novodur P2H-AT 701773 and 901510; GE Cycolac GPM5500-GY3172) |
| Date wheels | 06, 7, 2, 8 |
| Finish | black, matte texture |
| Construction | one molding; the latch is a molded plastic flexure (no metal spring) |

## Front plate (raised face + lip)

| Variable | Value | Src | Notes |
|---|---|---|---|
| `lip_w` | 146.66 | M | lip outer width, tab not included |
| `lip_h` | 39.62 | M | lip outer height |
| `lip_t` | 1.9 | M | lip thickness |
| `face_w` | 142.15 | M | raised (visible) face width |
| `face_h` | 36.95 | M | raised face height |
| `face_proud` | 4.5 | M | how far the face stands in front of the lip |
| `plate_t` | 6.4 | D | `face_proud + lip_t`; Z of the lip's back surface |
| `face_margin_y` | 1.335 | D | `(lip_h - face_h) / 2`; measured 1.5 each, superseded |
| `face_margin_left` | 3.38 | D | `(lip_w - face_w + 2.25) / 2`; measured 3.5 |
| `face_margin_right` | 1.13 | D | `lip_w - face_w - face_margin_left`; measured 1.25 |
| `face_corner_r` | 0.5 | E | "tiny, barely rounded" |
| `overall_w` | 155.70 | M | tab + lip + latch; used as a cross-check |

The face sits about 2.25 mm further from the left edge than from the right (measured left-minus-right difference, kept).
The margins are derived because the four small margin readings summed 0.24 to 0.33 mm more than the full-width readings.

## Crush nubs (anti-rattle bumps)

| Variable | Value | Src | Notes |
|---|---|---|---|
| count | 3 top + 3 bottom | M | top and bottom are identical (mirrored) |
| `nub_right_edges_from_face_left` | 13.42, 71.83, 130.6 | M | measured to each nub's right edge, from the face's left edge |
| `nub_w` | 1.75 | M | along X |
| `nub_h` | 0.3 | E | "< 0.33"; good tuning knob for fit |
| nub centers, X | 15.93, 74.34, 133.11 | D | `face_margin_left + edge - nub_w/2` |
| edge | raised face edges | M | confirmed: on the face, not the lip |
| Z extent | full face depth (0 to 4.5) | E | |

## Left tab

| Variable | Value | Src | Notes |
|---|---|---|---|
| `tab_out` | 3.25 | D | `6.75 - 3.5` (lip-left measured with and without the tab) |
| `tab_from_top` | 8.5 | M | lip top edge to tab top edge |
| `tab_from_bottom` | 18.88 | M | tab bottom edge to lip bottom edge |
| `tab_h` | 12.24 | D | `lip_h - tab_from_top - tab_from_bottom` |
| `tab_t` | 1.9 | M | same as `lip_t`, flush with the lip (Z 4.5 to 6.4) |

## Back pocket and side rails

| Variable | Value | Src | Notes |
|---|---|---|---|
| `floor_z` | 4.2 | M | pocket floor, height above the table |
| pocket depth | 2.2 | D | `plate_t - floor_z` |
| `rim_top`, `rim_bottom` | 3.5 | M | lip edge to pocket edge |
| `rim_right` | 3.26 | M | |
| `rim_left` | 5.86 | M | tab not included |
| pocket size | 137.54 x 32.62 | D | `lip_w - rim_left - rim_right` x `lip_h - 2*rim_top` |
| ends (past the ramps) | flush with the lip back (6.4) | M | no separate end walls |
| `rail_z` | 13.6 | M | rail top above the table (alt. reading 6.6 above the lip = 13.0, superseded) |
| `rail_inset` | 2.27 | M | lip top/bottom edge to the rail's outer face |
| `rail_t` | 1.1 | M | both rails; inner face sits 0.13 outside the pocket edge (2.27 + 1.1 = 3.37 vs 3.5) |
| `ramp_start_left` | 25.0 | M | lip left edge to the foot of the left ramp |
| `ramp_start_right` | 21.5 | M | lip right edge to the foot of the right ramp |
| `ramp_angle` | 45 | E | "approximately 45, hard to measure" |
| ramp rise / length | 7.2 / 7.2 | D | `rail_z - plate_t`; `rise / tan(ramp_angle)` |
| rail flat top, X | 32.2 to 117.96 | D | |

## Screw bosses and ribs (spare-screw storage)

| Variable | Value | Src | Notes |
|---|---|---|---|
| `boss_d_orig` | 5.0 | M | original outer diameter; positions the bosses |
| `boss_wall` | 1.25 | D/C | `(5.0 - 2.5) / 2`; wall around the hole, kept constant |
| `boss_d` | 5.5 | D | `boss_hole_d + 2 * boss_wall`; grows with the hole |
| `boss_h` | 5.26 | M | above the floor; top at Z 9.46 (D) |
| `boss_pitch` | 17.8 | M | measured side to side, both gaps identical |
| `boss_mid_x` | 70.32 | D | `67.82 + boss_d_orig/2` (measured lip left edge to the middle boss's left side) |
| boss centers, X | 52.52, 70.32, 88.12 | D | |
| boss centers, Y | 19.81 | M/D | "exactly centered" -> `lip_h / 2` |
| `boss_hole_d` | 3.0 | C | original not measurable; chosen by test printing (2.5 was too tight, at 3.0 the screws thread in) |
| `boss_hole_depth` | 5.5 | C | screw thread is 4.91; leaves about 4 mm in front of the hole |
| screw thread | 2.88 dia x 4.91 long | M | spare optical-drive screws, stored on the blank |
| `rib_t` | 1.33 | M | all ribs |
| long rib | 55.82 long, along X through all 3 bosses | M | top flush with the boss tops |
| triangle ribs | 7.5 along the floor, rising to the boss top | M | end bosses: 3 each (up, down, outward); middle boss: 2 (up, down) |
| cross-check | 35.6 + 2 x (2.5 + 7.5) = 55.6 vs 55.82 | D | the long rib's ends are the outward triangles |

## Latch (molded flexure, right end)

Two parallel arms joined at their inner end by a U.
Each arm runs right along X, bends 90 degrees down toward the front, and ends in a leg with a hook on its outer side (top arm hooks up, bottom arm hooks down).
Squeezing the arms together releases it.

| Variable | Value | Src | Notes |
|---|---|---|---|
| `arm_t` | 2.9 | M | each arm, in the bending direction (Y), hook not included |
| `arm_gap` | 4.5 | M | between the arms at rest |
| `latch_span` | 10.32 | M | outside to outside at the U (stiff end); confirms 2.9 + 4.5 + 2.9 |
| latch from top / bottom | 12.58 / 16.72 | D | measured 12.22 / 16.36 (fiddly, springy); rescaled keeping the 4.14 offset |
| `arm_w` | 3.5 | M | arm depth (Z) on the horizontal run |
| `arm_top_z` | 12.3 | M | so the arm bottom is at Z 8.8 (D) |
| bend inner / outer radius | 1.5 / 5 | E | from photo `original-latch-side-profile.jpg` |
| `leg_w` | 4.0 | M | leg size in X after the bend |
| `leg_out` | 5.45 | M | lip right edge to the leg's outer face (furthest point) |
| leg inner gap | 1.45 | D | `leg_out - leg_w`; the bezel edge sits here |
| `leg_bottom_z` | 1.95 | C | lowest point of the hook/leg; measured 3.3, lowered by test fitting so the hooks catch |
| `hook_len` | 2.5 | C | along the leg (Z); measured 3.0, reduced by test fitting |
| `hook_flat` | 1.6 | C | flat top of the hook; measured 1.9, reduced with the hook |
| `hook_out` | 1.4 | C | overhang beyond the arm; estimated 1.7, reduced by test fitting |
| hook ramp | 0.9 | D | `hook_len - hook_flat`, ramp faces the leg tip |
| catch face Z | 4.45 | D | `leg_bottom_z + hook_len`; 6.3 on the original (level with the lip back), 1.85 lower here from test fitting |
| catch face | square | M | |
| `u_wall` | 1.68 | M | U crossbar thickness |
| `u_top_z` | 15.2 | D | `floor_z + 11` (measured 11 above the floor) |
| arm length | 19.34 | M | leg outer face to the outside of the U crossbar |
| U crossbar, X | 132.77 to 134.45 | D | `lip_w + leg_out - 19.34`, `+ u_wall` |
| U to arm transition | slope down from 15.2 to 12.3 | E | from photo `original-latch-side-profile.jpg` |
| squeeze travel | small; arms can be made to touch | M | |
| brace fins | 2 fins, 0.8 thick, from the U's back (pocket side) down to the floor at about 45 degrees, at the arms' inner faces, mostly filled between | M/E | selectable with `brace`: **pocket** (default; a deliberate deviation, because the original style was too weak when printed) is a solid wedge sloping into the empty pocket, `fin_w` 4.5, stiffest; **original** follows the Dell part (per the author's hand sketch, not published): a slanted strut between the arms from the U top down to the top corner of the latch-end wall, open underneath. Its underside starts at the arms' bottom (Z 8.8), so it is as deep as the crossbar at the U (6.4, derived). The U crossbar stops at arm level (Z 8.8 to 15.2) with no wall down to the floor; the brace alone carries the latch. `fin_orig_w` 2.3 (fins at the gap's thirds, filled), `fin_foot_w` 1.2 estimated; slope derived from the two end points (about 44.5 degrees). Keeps the arms' slight up/down flex. **hybrid** is the original strut plus the U wall down to the floor, for strength |

## Let it breathe (vents, not on the original)

| Variable | Value | Src | Notes |
|---|---|---|---|
| `let_it_breathe` | stock | C | `round`, `honeycomb` or `slots` cuts vents through the pocket floor and drops the screw bosses |
| `vent_hole` | 5.0 | C | round diameter, honeycomb across the flats, slot width |
| `vent_web` | 1.6 | C | plastic between neighbouring vents |
| `vent_margin` | 2.5 | C | solid strip inside the pocket edges and before the latch brace |
| vent area, X | 8.36 to 119.27 | D | `rim_left + vent_margin` to the brace (`u_x0 - fin_reach` for the pocket brace) `- vent_margin` |
| vent area, Y | 6.0 to 33.62 | D | `rim_bottom + vent_margin` to `lip_h - rim_top - vent_margin` |
| pitch / row height | 6.6 / 5.72 | D | `vent_hole + vent_web`; `pitch * sin(60)` (hex packing, alternate rows offset half a pitch) |

All three patterns tested in PETG: same fit as the stock blank.

## Tools and print setup

- OpenSCAD 2021.01, OrcaSlicer 2.5.
- Creality Ender-3 V3 SE, stock 0.4 mm nozzle, stock textured PEI sheet.
- Print face-down: the textured sheet gives the face a matte texture, and the latch arms flex in the bed plane.
- **PETG profile** Nozzle 230 °C (first and other layers), bed 80 °C, flow ratio 0.95, pressure advance off. Cooling: none for the first 3 layers, full speed at layer 5, fan 30 % (layer time 30 s or more) to 90 % (under 5 s), keep fan always on off, overhangs and external bridges 90 % (forced). Mouse-ear brim.
- Supports are built into the model (`print_supports`, default on); slicer supports OFF. Leg pillars always, walls under the arms for the original brace, and a shelf under the tab and left lip. `support_gap` 0.3 (tab, lip and arm walls), `leg_support_gap` 0.25 (leg pillars), `support_xy` 0.4.

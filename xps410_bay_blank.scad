// 5.25" drive bay blank, fits Dell XPS 410 / Dimension 9200 (Dell P/N J8997)
// https://github.com/jerwah/dell-xps410-j8997-bay-blank
// Copyright (c) 2026 JerWah. Licensed under CC BY-SA 4.0 (see LICENSE).
// AI-assisted: designed with Claude (Anthropic) in Claude Code; measurements,
// test prints and design decisions by the author.
//
// Parametric model. All dimensions in mm; see MEASUREMENTS.md for sources.
//
// Coordinates (print orientation, face-down on the bed):
//   X = width, left to right as seen from the FRONT (0 = lip left edge);
//       the final mirror() at the bottom makes this come out right
//       when the face-down part is viewed from above
//   Y = height, bottom to top                     (0 = lip bottom edge)
//   Z = height above the bed                      (0 = front face)
// Tab on the left, latch on the right.
//
// Version 1.0: complete part, test printed in PLA and PETG. Front plate, tab, crush nubs, back pocket,
// side rails, screw bosses + ribs (optional), spring latch.

/* [What to build] */
part = "full"; // [full, coupon, latch_test, boss_test]
include_screw_bosses = true; // spare-screw storage on the back (ignored when the blank breathes)

/* [Let it breathe (NAS mode)] */
// Vent holes through the blank, for airflow when a fan pulls air through the
// drive bays. Any choice except "stock" also drops the screw bosses.
let_it_breathe = "stock"; // [stock:Stock (no air), round:Round holes, honeycomb:Honeycomb, slots:Slots]
vent_hole   = 5.0;  // hole size: diameter (round), across the flats (honeycomb), width (slots)
vent_web    = 1.6;  // plastic left between neighbouring holes
vent_margin = 2.5;  // solid strip kept between the vents and the pocket edges / latch

/* [Front plate] */
lip_w      = 146.66;  // lip outer width, tab not included
lip_h      = 39.62;   // lip outer height
lip_t      = 1.9;     // lip thickness
face_w     = 142.15;  // raised face width
face_h     = 36.95;   // raised face height
face_proud = 4.5;     // how far the face stands in front of the lip
face_offset_x = 2.25; // face sits this much further from the left edge than the right
face_corner_r = 0.5;  // "tiny" rounding on the face corners

/* [Left tab] */
tab_out         = 3.25;  // how far the tab sticks out past the lip
tab_from_top    = 8.5;   // lip top edge to tab top edge
tab_from_bottom = 18.88; // tab bottom edge to lip bottom edge

/* [Crush nubs] */
nub_edges = [13.42, 71.83, 130.6]; // each nub's right edge, from the face's left edge
nub_w     = 1.75;                  // along X
nub_h     = 0.3;                   // how far a nub sticks out (fit tuning knob)

/* [Back pocket] */
floor_z    = 4.2;   // pocket floor height above the bed
rim_left   = 5.86;  // lip edge to pocket edge
rim_right  = 3.26;
rim_top    = 3.5;
rim_bottom = 3.5;

/* [Side rails] */
rail_z           = 13.6;  // rail top height above the bed
rail_inset       = 2.27;  // lip top/bottom edge to the rail's outer face
rail_t           = 1.1;   // rail thickness
ramp_start_left  = 25.0;  // lip left edge to the foot of the left ramp
ramp_start_right = 21.5;  // lip right edge to the foot of the right ramp
ramp_angle       = 45;    // slope of the ramps, degrees

/* [Screw bosses and ribs] */
boss_d_orig     = 5.0;    // original boss outer diameter (measured); positions the bosses
boss_wall       = 1.25;   // wall around the hole; outer diameter = hole + 2 x wall
boss_h          = 5.26;   // boss height above the floor
boss_pitch      = 17.8;   // spacing between bosses
boss_mid_left   = 67.82;  // lip left edge to the LEFT SIDE of the middle boss
boss_hole_d     = 3.0;    // spare screws self-tap (boss_test in PETG: 3.0 won)
boss_hole_depth = 5.5;    // screw thread is 4.91
rib_t           = 1.33;   // rib thickness
gusset_len      = 7.5;    // triangle rib length along the floor, past the boss

/* [Latch] */
arm_t        = 2.9;   // arm thickness in the bending direction (Y)
arm_gap      = 4.5;   // gap between the arms at rest
latch_offset = 4.14;  // latch sits this much closer to the top than the bottom
arm_w        = 3.5;   // arm depth (Z) on the horizontal run
arm_top_z    = 12.3;  // arm top height above the bed
arm_len      = 19.34; // outside of the U to the leg's outer face
u_wall       = 1.68;  // U crossbar thickness (X)
u_h          = 11;    // U height above the floor
arm_root_len = 4;     // slope from the U top down to the arm (estimated)
bend_r_in    = 1.5;   // inside radius of the 90 degree bend (estimated)
leg_w        = 4.0;   // leg size in X after the bend
leg_out      = 5.45;  // lip right edge to the leg's outer face
leg_bottom_z = 1.95;  // lowest point of the leg/hook (measured 3.3; lowered after test prints 1 and 2)
hook_len     = 2.5;   // hook length along the leg (measured 3.0; test print 1: too large)
hook_flat    = 1.6;   // flat part of the hook, ending at the square catch face (measured 1.9)
hook_out     = 1.4;   // hook overhang beyond the arm (estimated 1.7; test print 1: too large)
brace        = "pocket"; // [pocket, original, hybrid, none]
// hybrid:   the original slanted strut, plus the U wall down to the floor
// pocket:   solid wedge from the U top down into the empty pocket (stiffest)
// original: like the Dell part, a slanted strut from the U top down to the
//           top of the end wall, between the arms, open underneath
fin_w        = 4.5;   // pocket brace width (spans the gap between the arms)
fin_angle    = 45;    // pocket brace slope, degrees (approximate)
fin_orig_w   = 2.3;   // original brace width: two 0.8 fins at the gap's thirds, filled between
fin_foot_w   = 1.2;   // small foot where the original brace meets the end wall (estimated)

/* [Print supports] */
print_supports = true; // built-in breakaway supports; turn the slicer's supports OFF
support_gap    = 0.3;  // air gap above the tab/lip shelf and arm walls (PETG test 2: perfect)
leg_support_gap = 0.25; // air gap above the latch leg pillars (PETG test 2: 0.3 too large)
support_xy     = 0.4;  // side clearance from the part's walls
arm_support_t  = 1.6;  // thickness of the walls under the arms (original brace only)

/* [Test pieces] */
latch_test_from_x = 120; // latch_test keeps everything right of this X
boss_test_holes = [2.6, 2.7, 2.8, 2.9, 3.0]; // one boss per hole size
boss_test_base  = 1.5;   // base plate thickness under the test bosses

/* [Hidden] */
$fn = 32;      // circle smoothness
eps = 0.01;    // tiny overlap so touching parts fuse into one solid

// ---- Derived values (calculated, never typed in) ----
plate_t           = face_proud + lip_t;                    // 6.4
face_margin_y     = (lip_h - face_h) / 2;                  // 1.335
face_margin_left  = (lip_w - face_w + face_offset_x) / 2;  // 3.38
tab_h             = lip_h - tab_from_top - tab_from_bottom; // 12.24

ramp_rise    = rail_z - plate_t;                           // 7.2
ramp_len     = ramp_rise / tan(ramp_angle);                // 7.2
rail_flat_x0 = ramp_start_left + ramp_len;                 // 32.2
rail_flat_x1 = lip_w - ramp_start_right - ramp_len;        // 117.96

boss_d     = boss_hole_d + 2 * boss_wall;                 // 5.0 with the 2.5 hole
boss_mid_x = boss_mid_left + boss_d_orig / 2;              // 70.32
boss_xs    = [boss_mid_x - boss_pitch, boss_mid_x, boss_mid_x + boss_pitch];
boss_y     = lip_h / 2;                                    // centered
boss_top_z = floor_z + boss_h;                             // 9.46

latch_span = 2 * arm_t + arm_gap;                          // 10.3
latch_y0   = (lip_h - latch_span + latch_offset) / 2;      // 16.73, bottom of the latch
u_x0       = lip_w + leg_out - arm_len;                    // 132.77, outside of the U
u_x1       = u_x0 + u_wall;                                // 134.45, inside of the U
u_top_z    = floor_z + u_h;                                // 15.2
arm_bot_z  = arm_top_z - arm_w;                            // 8.8
leg_x1     = lip_w + leg_out;                              // 152.11, leg outer face
leg_x0     = leg_x1 - leg_w;                               // 148.11, leg inner face
bend_cx    = leg_x0 - bend_r_in;                           // center of the bend
bend_cz    = arm_bot_z - bend_r_in;
fin_reach  = u_h / tan(fin_angle);                         // 11, how far the brace reaches back
fin_y0     = latch_y0 + (latch_span - fin_w) / 2;          // pocket brace, centered on the latch
fin_orig_y0 = latch_y0 + (latch_span - fin_orig_w) / 2;    // original brace, centered on the latch
end_wall_x  = lip_w - rim_right;                           // 143.4, inside face of the latch-end wall
// the original brace's top edge runs from the U top to the end wall's top
// corner; its slope comes from those two points (about 45 degrees)
fin_slope   = (u_top_z - plate_t) / (end_wall_x - u_x1);   // drop per mm of X
// its underside starts at the bottom of the arms and runs parallel to the top,
// so at the U the brace is as deep as the whole crossbar (15.2 - 8.8 = 6.4)
fin_floor_x = u_x1 + (arm_bot_z - floor_z) / fin_slope;   // where the underside reaches the floor
fin_foot_x  = min(end_wall_x - fin_foot_w, fin_floor_x);
fin_foot_z  = arm_bot_z - (fin_foot_x - u_x1) * fin_slope; // underside height at the foot
// with the original brace the U stops at arm level (no wall down to the floor);
// the pocket brace leans on the U, and hybrid adds the wall back on purpose
u_bot_z     = (brace == "original") ? arm_bot_z : floor_z;

// Let it breathe: the rectangle the vents may use. It sits inside the back
// pocket, a vent_margin in from its edges, and stops short of the latch: the
// pocket brace reaches fin_reach back from the U, the other braces don't.
breathe    = let_it_breathe != "stock";
vent_x0    = rim_left + vent_margin;                                       // 8.36
vent_x1    = (brace == "pocket" ? u_x0 - fin_reach : u_x0) - vent_margin;  // 119.27
vent_y0    = rim_bottom + vent_margin;                                     // 6.0
vent_y1    = lip_h - rim_top - vent_margin;                                // 33.62
vent_pitch = vent_hole + vent_web;     // center to center, neighbouring holes
vent_rowh  = vent_pitch * sin(60);     // row to row in a hex-packed grid

// =====================================================================
// Front plate (version 0)
// =====================================================================

// A 2D rectangle with rounded corners, lower-left corner at the origin.
module rounded_rect(w, h, r) {
    translate([r, r])
        offset(r = r)
            square([w - 2*r, h - 2*r]);
}

// The visible raised face: from the bed (Z=0) up to the lip.
module face() {
    translate([face_margin_left, face_margin_y, 0])
        linear_extrude(height = face_proud + eps)
            rounded_rect(face_w, face_h, face_corner_r);
}

// The lip: a plain slab sitting on top of the face.
module lip() {
    translate([0, 0, face_proud])
        cube([lip_w, lip_h, lip_t]);
}

// The left tab: same thickness as the lip, flush with it.
module tab() {
    translate([-tab_out, tab_from_bottom, face_proud])
        cube([tab_out + eps, tab_h, lip_t]);
}

// Crush nubs: small bumps on the top and bottom edges of the face.
module nubs() {
    for (edge = nub_edges) {
        x = face_margin_left + edge - nub_w;   // nub's left edge
        // bottom edge of the face
        translate([x, face_margin_y - nub_h, 0])
            cube([nub_w, nub_h + eps, face_proud]);
        // top edge of the face
        translate([x, face_margin_y + face_h - eps, 0])
            cube([nub_w, nub_h + eps, face_proud]);
    }
}

// The hollow on the back, cut down from the lip's back surface to the floor.
module pocket() {
    translate([rim_left, rim_bottom, floor_z])
        cube([lip_w - rim_left - rim_right,
              lip_h - rim_top - rim_bottom,
              plate_t - floor_z + 1]);   // +1: cut through the top cleanly
}

module front_plate() {
    difference() {
        union() {
            face();
            lip();
            tab();
            nubs();
        }
        pocket();
    }
}

// =====================================================================
// Side rails (version 1)
// =====================================================================

// Draw a 2D shape in the "side view" (X across, Z up), then stand it up
// and give it thickness in Y. rotate([90,0,0]) turns the drawing's Y into Z;
// the extrusion then runs toward -Y, so we shift it back by the thickness.
module side_view(y0, thickness) {
    translate([0, y0 + thickness, 0])
        rotate([90, 0, 0])
            linear_extrude(height = thickness)
                children();
}

// One rail: a long flat top with a 45 degree ramp at each end.
module rail(y0) {
    side_view(y0, rail_t)
        polygon([
            [ramp_start_left,          plate_t - eps],  // foot of the left ramp
            [rail_flat_x0,             rail_z],         // top of the left ramp
            [rail_flat_x1,             rail_z],         // top of the right ramp
            [lip_w - ramp_start_right, plate_t - eps]   // foot of the right ramp
        ]);
}

module rails() {
    rail(rail_inset);                     // bottom rail
    rail(lip_h - rail_inset - rail_t);    // top rail
}

// =====================================================================
// Screw bosses and ribs (version 2)
// =====================================================================

// One triangle rib, drawn pointing along +X from the boss center,
// then turned to the requested direction (0 = right, 90 = up, ...).
// d is the boss diameter; it defaults to boss_d but the boss test passes its own.
module gusset(angle, d = boss_d) {
    rotate([0, 0, angle])
        side_view(-rib_t / 2, rib_t)
            polygon([
                [0,                      0],
                [d/2 + gusset_len,       0],       // tip, out on the floor
                [d/2,                    boss_h],  // meets the boss top
                [0,                      boss_h]
            ]);
}

module bosses_and_ribs() {
    for (i = [0 : 2]) {
        translate([boss_xs[i], boss_y, floor_z - eps]) {
            cylinder(d = boss_d, h = boss_h + eps);
            // up and down on every boss; outward on the two end bosses
            angles = (i == 0) ? [90, 270, 180]
                   : (i == 2) ? [90, 270, 0]
                   :            [90, 270];
            for (a = angles) gusset(a);
        }
    }
    // the long rib joining all three bosses
    translate([boss_xs[0], boss_y - rib_t / 2, floor_z - eps])
        cube([boss_xs[2] - boss_xs[0], rib_t, boss_h + eps]);
}

module boss_holes() {
    for (x = boss_xs)
        translate([x, boss_y, boss_top_z - boss_hole_depth])
            cylinder(d = boss_hole_d, h = boss_hole_depth + 1);
}

// Test strip: one boss per entry in boss_test_holes, each with the up/down
// ribs of the real middle boss, its hole size raised on the base beside it.
module boss_test() {
    pitch = 14;
    for (i = [0 : len(boss_test_holes) - 1]) {
        hole = boss_test_holes[i];
        d    = hole + 2 * boss_wall;
        translate([i * pitch, 0, 0]) difference() {
            union() {
                translate([-pitch / 2, -16, 0]) cube([pitch, 27, boss_test_base]);
                translate([0, 0, boss_test_base - eps]) {
                    cylinder(d = d, h = boss_h + eps);
                    for (a = [90, 270]) gusset(a, d);
                }
                translate([0, -13, boss_test_base - eps])
                    linear_extrude(height = 0.6 + eps)
                        text(str(hole), size = 3.5, halign = "center", valign = "center",
                             font = "Liberation Sans:style=Bold");
            }
            translate([0, 0, boss_test_base + boss_h - boss_hole_depth])
                cylinder(d = hole, h = boss_hole_depth + 1);
        }
    }
}

// =====================================================================
// Latch (version 3)
// =====================================================================

// Side view of one arm: horizontal run, 90 degree bend, downward leg,
// and a slope where it leaves the U.
module arm_profile() {
    // horizontal run, from inside the U to the start of the bend
    translate([u_x1 - eps, arm_bot_z])
        square([bend_cx - u_x1 + 2 * eps, arm_w]);

    // the bend: a quarter of an elliptical ring. The outside is an ellipse
    // (scale() stretches a circle) because the arm is 3.5 deep before the
    // bend and the leg is 4.0 wide after it.
    translate([bend_cx, bend_cz])
        intersection() {
            difference() {
                scale([leg_w + bend_r_in, arm_w + bend_r_in])
                    circle(r = 1, $fn = 96);
                circle(r = bend_r_in);
            }
            square([leg_w + bend_r_in, arm_w + bend_r_in]);  // upper-right quarter only
        }

    // the leg, running down toward the bed
    translate([leg_x0, leg_bottom_z])
        square([leg_w, bend_cz - leg_bottom_z + eps]);

    // slope from the top of the U down to the arm
    polygon([
        [u_x1 - eps,          arm_top_z - eps],
        [u_x1 - eps,          u_top_z],
        [u_x1 + arm_root_len, arm_top_z - eps]
    ]);
}

// One hook, pointing +Y, starting at Y = 0. Drawn in the end view
// (outward across, Z up), then rotated so it runs along X for the leg width.
// Ramp at the leg tip (so it cams in), square catch face at the top.
module hook() {
    translate([leg_x0, -eps, 0])
        rotate([90, 0, 90])
            linear_extrude(height = leg_w)
                polygon([
                    [0,        leg_bottom_z],
                    [hook_out, leg_bottom_z + hook_len - hook_flat],
                    [hook_out, leg_bottom_z + hook_len],   // catch face
                    [0,        leg_bottom_z + hook_len]
                ]);
}

module latch() {
    // the U crossbar joining the two arms
    translate([u_x0, latch_y0, u_bot_z - eps])
        cube([u_wall, latch_span, u_top_z - u_bot_z + eps]);

    // the brace: a wedge from the top of the U sloping down to the floor
    if (brace == "pocket") {
        // behind the U, into the empty pocket
        side_view(fin_y0, fin_w)
            polygon([
                [u_x0 + eps,       floor_z - eps],
                [u_x0 + eps,       u_top_z],
                [u_x0 - fin_reach, floor_z - eps]
            ]);
    } else if (brace == "original" || brace == "hybrid") {
        // A slanted strut between the arms: from the top of the U down to
        // the top corner of the end wall, with a small foot on the floor
        // beside the wall. Open underneath. Narrower than the arm gap so
        // the arms can still squeeze past it.
        side_view(fin_orig_y0, fin_orig_w)
            polygon([
                [u_x1 - eps,       u_top_z],                // top edge, at the U
                [end_wall_x + eps, plate_t - eps],          // top edge, at the wall's corner
                [end_wall_x + eps, floor_z - eps],          // down the wall face
                [fin_foot_x,       floor_z - eps],          // foot, along the floor
                [fin_foot_x,       fin_foot_z],             // up the foot
                [u_x1 - eps,       arm_bot_z]               // underside, back to the U
            ]);
    }

    // bottom arm + downward hook
    side_view(latch_y0, arm_t) arm_profile();
    translate([0, latch_y0, 0]) mirror([0, 1, 0]) hook();

    // top arm + upward hook
    side_view(latch_y0 + latch_span - arm_t, arm_t) arm_profile();
    translate([0, latch_y0 + latch_span, 0]) hook();
}

// =====================================================================
// Built-in breakaway supports
// =====================================================================
// Separate solids, never joined to the part: each stops support_gap
// short of the surface it holds up, so it snaps off after printing.

// Pillar under one leg and its hook, drawn like hook() (outward across,
// Z up) and run along X for the leg width. The top follows the hook's ramp.
module leg_support() {
    ramp = hook_len - hook_flat;
    translate([leg_x0, 0, 0])
        rotate([90, 0, 90])
            linear_extrude(height = leg_w)
                polygon([
                    [-arm_t,   0],
                    [hook_out, 0],
                    [hook_out, leg_bottom_z + ramp - leg_support_gap],
                    [0,        leg_bottom_z - leg_support_gap],
                    [-arm_t,   leg_bottom_z - leg_support_gap]
                ]);
}

// A thin wall under one arm and the end of the U, standing on the pocket
// floor. Only needed when the U doesn't reach the floor (original brace).
module arm_support(arm_y0) {
    translate([u_x0,
               arm_y0 + (arm_t - arm_support_t) / 2,
               floor_z - eps])
        cube([end_wall_x - support_xy - u_x0,
              arm_support_t,
              arm_bot_z - support_gap - floor_z + eps]);
}

// Shelf under the left tab and the left lip, which overhangs the face by 3.4.
module tab_support() {
    h = face_proud - support_gap;
    cube([face_margin_left - support_xy, lip_h, h]);              // under the lip
    translate([-tab_out, tab_from_bottom, 0])
        cube([tab_out + eps, tab_h, h]);                          // under the tab
}

module supports() {
    // leg pillars (all versions)
    translate([0, latch_y0 + latch_span, 0]) leg_support();
    translate([0, latch_y0, 0]) mirror([0, 1, 0]) leg_support();
    // arm walls, only when the U hangs free
    if (u_bot_z > floor_z) {
        arm_support(latch_y0);
        arm_support(latch_y0 + latch_span - arm_t);
    }
    tab_support();
}

// =====================================================================
// Let it breathe (NAS mode vents)
// =====================================================================

// The hole pattern as a flat 2D drawing, centered in the vent rectangle.
// Only whole holes are drawn: the counts are worked out first, then the
// grid is shifted so the leftover space is split evenly on both sides.
module vent_pattern_2d() {
    w  = vent_x1 - vent_x0;
    h  = vent_y1 - vent_y0;
    cx = (vent_x0 + vent_x1) / 2;
    cy = (vent_y0 + vent_y1) / 2;
    if (let_it_breathe == "slots") {
        // tall slots with round ends, side by side
        nx = floor((w - vent_hole) / vent_pitch) + 1;
        sx = cx - (nx - 1) * vent_pitch / 2;
        for (i = [0 : nx - 1])
            hull() {   // hull of two circles = a slot
                translate([sx + i * vent_pitch, vent_y0 + vent_hole / 2]) circle(d = vent_hole);
                translate([sx + i * vent_pitch, vent_y1 - vent_hole / 2]) circle(d = vent_hole);
            }
    } else {
        // hex-packed rows: every other row shifts half a pitch to the right
        ny = floor((h - vent_hole) / vent_rowh) + 1;
        nx = floor((w - vent_hole - vent_pitch / 2) / vent_pitch) + 1;
        sx = cx - ((nx - 1) * vent_pitch + vent_pitch / 2) / 2;
        sy = cy - (ny - 1) * vent_rowh / 2;
        for (j = [0 : ny - 1], i = [0 : nx - 1])
            translate([sx + i * vent_pitch + (j % 2) * vent_pitch / 2, sy + j * vent_rowh])
                if (let_it_breathe == "round")
                    circle(d = vent_hole);
                else   // honeycomb: a 6-sided "circle"; d is corner to corner,
                       // so divide by cos(30) to make vent_hole the flat-to-flat size
                    rotate(30) circle(d = vent_hole / cos(30), $fn = 6);
    }
}

// The pattern pushed up into 3D, tall enough to cut through the face and
// the pocket floor (the vent rectangle never reaches the thicker rim).
module vents() {
    translate([0, 0, -1])
        linear_extrude(height = floor_z + 2)
            vent_pattern_2d();
}

// =====================================================================
// Assembly
// =====================================================================

module full_part() {
    difference() {
        union() {
            front_plate();
            rails();
            if (include_screw_bosses && !breathe) bosses_and_ribs();
            latch();
        }
        if (include_screw_bosses && !breathe) boss_holes();
        if (breathe) vents();
    }
}

// Everything above is laid out as seen from the FRONT (X = left to right).
// But the part prints face-down, and from above you see its back, where
// left and right are swapped. mirror() flips X so the printed part has the
// tab on the left and the latch on the right when you look at its face.
mirror([1, 0, 0]) {
    if (part == "full") {
        full_part();
        if (print_supports) supports();
    } else if (part == "coupon") {
        front_plate();
        if (print_supports) tab_support();
    } else if (part == "latch_test") {
        intersection() {
            union() {
                full_part();
                if (print_supports) supports();
            }
            translate([latch_test_from_x, -10, -1])
                cube([100, lip_h + 20, 50]);
        }
    }
}

// The boss test prints bosses-up, so it is NOT mirrored (that would flip its text).
if (part == "boss_test") boss_test();

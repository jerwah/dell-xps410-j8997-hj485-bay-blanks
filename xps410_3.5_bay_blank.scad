// 3.5" drive bay blank, fits Dell XPS 410 (Dell P/N HJ485 / P8106, DP/N 0KJ293)
// https://github.com/jerwah/dell-xps410-j8997-hj485-bay-blanks
// Copyright (c) 2026 JerWah. Licensed under CC BY-SA 4.0 (see LICENSE).
// AI-assisted: designed with Claude (Anthropic) in Claude Code; measurements,
// test prints and design decisions by the author.
//
// Parametric model. All dimensions in mm; see MEASUREMENTS-3.5in.md for sources.
//
// Coordinates (print orientation, face-down on the bed):
//   X = length, tab side to latch side as seen from the FRONT (0 = flange edge, tab side);
//       the final mirror() at the bottom makes this come out right
//       when the face-down part is viewed from above
//   Y = height (0 = the "clip edge", the long edge the latch sits near)
//   Z = height above the bed (0 = front face)
// Tab on the left, latch on the right (seen from the front).
//
// Version 1.0: complete part, test printed in PETG (stock and Let it breathe honeycomb).
// Changes from the measured values, found by test prints:
//   the stem behind the hook's catch 2.1 -> 3.3 (the hook sat 1.2 too far from the face);
//   face_support_xy 0.6 (the latch-end shelf fused to the face at 0.4);
//   face_h 23.38 -> 22.85 (the first reading caught a pair of crush nubs);
//   end nubs added (two on each short end of the face).
// New option more_flush: the original sits about 1 mm inset in the front panel;
// on by default when the blank breathes, off for stock.

/* [What to build] */
part = "full"; // [full, coupon, latch_test]
include_screw_bosses = true; // spare-screw storage on the back (ignored when the blank breathes)
include_corner_boxes = true; // the four boxes in the pocket corners (ignored when the blank breathes)

/* [Let it breathe (NAS mode)] */
// Vent holes through the blank, for airflow when a fan pulls air through the
// drive bays. Any choice except "stock" also drops the screw bosses and the
// corner boxes, so the vents can use the whole pocket.
let_it_breathe = "stock"; // [stock:Stock (no air), round:Round holes, honeycomb:Honeycomb, slots:Slots]
vent_hole   = 5.0;  // hole size: diameter (round), across the flats (honeycomb), width (slots)
vent_web    = 1.6;  // plastic left between neighbouring holes
vent_margin = 2.5;  // solid strip kept between the vents and the pocket edges

/* [Flange and face] */
lip_w      = 106.18;  // flange length, tab and latch not included
lip_h      = 25.8;    // flange height
lip_t      = 1.94;    // flange thickness
face_w     = 99.5;    // raised face length
face_h     = 22.85;   // raised face height (re-measured 2026-11-12; 23.38 had caught a crush nub)
face_proud = 4.22;    // how far the face stands in front of the flange (as the original)
// The original sits about 1 mm inset in the front panel. "more flush" makes the
// face deeper so it sits nearly flush; the flange, latch and back do not change.
more_flush  = "auto"; // [auto:On when the blank breathes, on:On, off:Off (as the original)]
flush_extra = 1.0;    // how much deeper "more flush" makes the face
face_margin_tab = 3.18; // flange edge (tab side) to the face; the latch side gets the rest
face_corner_r = 0.5;  // "tiny" rounding on the face corners

/* [Tab] */
tab_out      = 2.72;  // how far the tab sticks out past the flange
tab_h        = 9.66;  // tab size along Y
tab_from_far = 4.09;  // gap between the tab and the edge AWAY from the clip

/* [Crush nubs] */
nub_edges = [10.6, 47.8, 85.4]; // each nub's tab-side edge, from the face's tab-side edge
nub_w     = 1.75;               // along X
nub_h     = 0.3;                // how far a nub sticks out (fit tuning knob)
end_nubs  = true;               // two more nubs on each short end of the face (the 5.25" blank has none)
end_nub_from_edge = 2.76;       // face's long edge to the near side of each end nub

/* [Back pocket] */
pocket_depth = 4.14;  // flange back down to the pocket floor
rim_y        = 3.4;   // long edges: flange edge to pocket edge
rim_tab      = 5.6;   // tab end (tab not included)
rim_latch    = 5.6;   // latch end

/* [Fins] */
fin_t           = 1.46;  // fin thickness; its inner face is flush with the pocket edge
fin_z           = 12.95; // fin top height above the bed
fin_base        = 49;    // fin length at the flange back
fin_from_latch  = 29;    // flange edge (latch side) to the foot of the nearer ramp
fin_ramp_angle  = 45;    // slope of the ramps, degrees

/* [Corner boxes] */
box_size = 6;    // outside size of each corner box
box_wall = 1.4;  // its two free walls (the other two are the pocket walls)

/* [Screw bosses and ribs] */
boss_count      = 4;
boss_wall       = 1.25;   // wall around the hole; outer diameter = hole + 2 x wall
boss_h          = 5.26;   // boss height above the floor (same as the 5.25" blank)
boss_rib_gap    = 16.4;   // measured gap between neighbouring bosses' ribs
boss_hole_d     = 3.0;    // spare screws self-tap (same screws as the 5.25" blank)
boss_hole_depth = 5.5;    // screw thread is 4.91
rib_t           = 1.33;   // rib thickness
gusset_len      = 7.5;    // outward triangle rib length along the floor, past the boss

/* [Latch: end wall] */
wall_t       = 1.7;   // end wall thickness (X), inside the flange length
wall_len     = 16.94; // along Y, from the clip edge
wall_corner_r = 0.5;  // small rounding on the wall's corners, seen from the front and side
brace_count  = 3;     // triangles on the back of the wall
brace_len    = 2.0;   // along the flange back (estimated)
brace_t      = 1.2;   // brace thickness (estimated)

/* [Latch: arms] */
u_from_edge = 3.5;    // clip edge to the U, where it meets the wall
u_w         = 7.44;   // U outside width where it meets the wall
u_wide_w    = 7.8;    // U outside width just past the wall (estimated)
u_wide_x    = 2.0;    // where that is, out from the wall (estimated)
arm_len     = 18.39;  // flange edge (wall outer face) to the tips
arm_t       = 1.8;    // arm (stem) thickness
arm_top_z   = 7.46;   // arm top height above the bed
arm_h       = 5.54;   // arm height (Z)
waist_x     = 7.8;    // slot inside the U: closed end to the waist
waist_gap   = 2.0;    // narrowest gap between the arms
bend_x0     = 8.3;    // S-bend starts (estimated from the photo)
bend_x1     = 11.0;   // S-bend ends (estimated from the photo)
tip_gap     = 6.15;   // gap between the arms on the straight run to the tips
tip_span    = 13.34;  // outside to outside across the hooks
hook_len    = 4.77;   // hook length along the arm, from the tip
hook_taper  = 1.5;    // hook tapers back into the arm over this length (estimated)
hook_flat   = 2.5;    // hook width on the face side
hook_face   = 1.5;    // straight outer face of the hook
hook_stem_h = 3.3;    // plain stem behind the catch face (measured 2.1; test 1 showed the hook 1.2 too far from the face)

/* [Print supports] */
print_supports  = true; // built-in breakaway supports; turn the slicer's supports OFF
support_gap     = 0.3;  // air gap above the tab and flange shelves (as the 5.25" blank)
arm_support_gap = 0.25; // air gap above the fences under the arms (as the 5.25" latch nubs)
support_xy      = 0.4;  // side clearance from the part's walls
face_support_xy = 0.6;  // clearance between the latch-end shelf and the face's edge (0.4 fused on the first layers in PETG, test of v0.2)

/* [Test pieces] */
latch_test_from_x = 92; // latch_test keeps everything right of this X

/* [Hidden] */
$fn = 32;      // circle smoothness
eps = 0.01;    // tiny overlap so touching parts fuse into one solid

// ---- Derived values (calculated, never typed in) ----
// Numbers in the comments are for the stock blank; more_flush adds 1.0 to every Z.
breathe       = let_it_breathe != "stock";
flush         = more_flush == "on" || (more_flush == "auto" && breathe);
z_shift       = flush ? flush_extra : 0;             // everything behind the face moves by this
face_out      = face_proud + z_shift;                // 4.22, the face as printed
plate_t       = face_out + lip_t;                    // 6.16
face_margin_y = (lip_h - face_h) / 2;                // 1.475
end_nub_out   = end_nubs ? nub_h : 0;                // supports step back by this at both face ends
face_x1       = face_margin_tab + face_w;            // 102.68, latch end of the face
tab_y0        = lip_h - tab_from_far - tab_h;        // 12.05

floor_z  = plate_t - pocket_depth;                   // 2.02
pocket_x0 = rim_tab;                                 // 5.6
pocket_x1 = lip_w - rim_latch;                       // 100.58
pocket_y0 = rim_y;                                   // 3.4
pocket_y1 = lip_h - rim_y;                           // 22.4

fin_x1     = lip_w - fin_from_latch;                 // 77.18, foot of the latch-side ramp
fin_x0     = fin_x1 - fin_base;                      // 28.18, foot of the tab-side ramp
fin_top_z  = fin_z + z_shift;                        // 12.95
fin_rise   = fin_top_z - plate_t;                    // 6.79
fin_ramp   = fin_rise / tan(fin_ramp_angle);         // 6.79

boss_d     = boss_hole_d + 2 * boss_wall;            // 5.5
boss_pitch = boss_rib_gap + rib_t;                   // 17.73, center to center
boss_cx    = (pocket_x0 + pocket_x1) / 2;            // 53.09, row centered in the pocket
boss_xs    = [for (i = [0 : boss_count - 1]) boss_cx + (i - (boss_count - 1) / 2) * boss_pitch];
boss_y     = lip_h / 2;                              // 12.9, centered
boss_top_z = floor_z + boss_h;                       // 7.28
gusset_len_y = (pocket_y1 - pocket_y0) / 2 - boss_d / 2; // 6.75, up/down ribs reach the pocket walls

latch_top_z = arm_top_z + z_shift;                   // 7.46
arm_bot_z  = latch_top_z - arm_h;                    // 1.92
wall_top_z = latch_top_z;                            // level with the arm tops
wall_bot_z = face_out - (wall_top_z - plate_t);      // 2.92, sticks out the same on both sides
latch_cy   = u_from_edge + u_w / 2;                  // 7.22, latch centerline (Y)
// Arm centerline offsets from the latch centerline (upper arm; the lower one is mirrored)
arm_c_wall  = u_w / 2 - arm_t / 2;                   // 2.82, at the wall
arm_c_wide  = u_wide_w / 2 - arm_t / 2;              // 3.0
arm_c_waist = waist_gap / 2 + arm_t / 2;             // 1.9
arm_c_tip   = tip_gap / 2 + arm_t / 2;               // 3.975
hook_w      = (tip_span - tip_gap) / 2;              // 3.595, inner face to hook tip (measured 3.65)
hook_ramp_h = arm_h - hook_face - hook_stem_h;       // 0.74
hook_catch_z = arm_bot_z + hook_ramp_h + hook_face;  // 4.16

// Let it breathe: the rectangle the vents may use, a vent_margin inside the
// pocket. Breathing drops the corner boxes, so the vents can use the full length.
boxes      = include_corner_boxes && !breathe;
vent_x0    = pocket_x0 + vent_margin;                // 8.1
vent_x1    = pocket_x1 - vent_margin;                // 98.08
vent_y0    = pocket_y0 + vent_margin;                // 5.9
vent_y1    = pocket_y1 - vent_margin;                // 19.9
vent_pitch = vent_hole + vent_web;     // center to center, neighbouring holes
vent_rowh  = vent_pitch * sin(60);     // row to row in a hex-packed grid

// =====================================================================
// Flange, face and pocket
// =====================================================================

// A 2D rectangle with rounded corners, lower-left corner at the origin.
module rounded_rect(w, h, r) {
    translate([r, r])
        offset(r = r)
            square([w - 2*r, h - 2*r]);
}

// The visible raised face: from the bed (Z=0) up to the flange.
module face() {
    translate([face_margin_tab, face_margin_y, 0])
        linear_extrude(height = face_out + eps)
            rounded_rect(face_w, face_h, face_corner_r);
}

// The flange: a plain slab sitting on top of the face.
module lip() {
    translate([0, 0, face_out])
        cube([lip_w, lip_h, lip_t]);
}

// The tab: same thickness as the flange, flush with it, near the far edge.
module tab() {
    translate([-tab_out, tab_y0, face_out])
        cube([tab_out + eps, tab_h, lip_t]);
}

// Crush nubs: small bumps on both long edges of the face, plus two on each
// short end (one 2.76 in from each long edge).
module nubs() {
    if (end_nubs)
        for (y = [face_margin_y + end_nub_from_edge,
                  face_margin_y + face_h - end_nub_from_edge - nub_w]) {
            translate([face_margin_tab - nub_h, y, 0])
                cube([nub_h + eps, nub_w, face_out]);   // tab end
            translate([face_x1 - eps, y, 0])
                cube([nub_h + eps, nub_w, face_out]);   // latch end
        }
    for (edge = nub_edges) {
        x = face_margin_tab + edge;   // nub's tab-side edge
        translate([x, face_margin_y - nub_h, 0])
            cube([nub_w, nub_h + eps, face_out]);
        translate([x, face_margin_y + face_h - eps, 0])
            cube([nub_w, nub_h + eps, face_out]);
    }
}

// The hollow on the back. The face is a shell: the pocket goes down
// pocket_depth from the flange back, leaving a thin floor.
module pocket() {
    translate([pocket_x0, pocket_y0, floor_z])
        cube([pocket_x1 - pocket_x0, pocket_y1 - pocket_y0, pocket_depth + 1]);
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
// Fins and corner boxes
// =====================================================================

// Draw a 2D shape in the "side view" (X across, Z up), then stand it up
// and give it thickness in Y (same helper as the 5.25" blank).
module side_view(y0, thickness) {
    translate([0, y0 + thickness, 0])
        rotate([90, 0, 0])
            linear_extrude(height = thickness)
                children();
}

// One fin: a short flat top with a 45 degree ramp at each end.
module fin(y0) {
    side_view(y0, fin_t)
        polygon([
            [fin_x0,            plate_t - eps],
            [fin_x0 + fin_ramp, fin_top_z],
            [fin_x1 - fin_ramp, fin_top_z],
            [fin_x1,            plate_t - eps]
        ]);
}

module fins() {
    fin(pocket_y0 - fin_t);   // clip edge side, inner face flush with the pocket edge
    fin(pocket_y1);           // far side
}

// One corner box, drawn in the pocket's lower-left corner: two walls,
// the pocket walls make the other two sides. mirror() places the others.
module corner_box() {
    translate([pocket_x0 - eps, pocket_y0 - eps, floor_z - eps]) {
        translate([box_size - box_wall, 0, 0])
            cube([box_wall, box_size, plate_t - floor_z + eps]);
        translate([0, box_size - box_wall, 0])
            cube([box_size, box_wall, plate_t - floor_z + eps]);
    }
}

module corner_boxes() {
    cx = (pocket_x0 + pocket_x1) / 2;
    cy = (pocket_y0 + pocket_y1) / 2;
    for (mx = [0, 1], my = [0, 1])
        translate([cx, cy, 0])
            mirror([mx, 0, 0]) mirror([0, my, 0])
                translate([-cx, -cy, 0])
                    corner_box();
}

// =====================================================================
// Screw bosses and ribs
// =====================================================================

// One triangle rib, drawn pointing along +X from the boss center,
// then turned to the requested direction (0 = +X, 90 = +Y, ...).
module gusset(angle, len) {
    rotate([0, 0, angle])
        side_view(-rib_t / 2, rib_t)
            polygon([
                [0,                0],
                [boss_d/2 + len,   0],       // tip, out on the floor
                [boss_d/2,         boss_h],  // meets the boss top
                [0,                boss_h]
            ]);
}

module bosses_and_ribs() {
    last = boss_count - 1;
    for (i = [0 : last]) {
        translate([boss_xs[i], boss_y, floor_z - eps]) {
            cylinder(d = boss_d, h = boss_h + eps);
            // up and down to the pocket walls on every boss
            for (a = [90, 270]) gusset(a, gusset_len_y + eps);
            // outward on the two end bosses
            if (i == 0)    gusset(180, gusset_len);
            if (i == last) gusset(0,   gusset_len);
        }
    }
    // the long rib joining all the bosses
    translate([boss_xs[0], boss_y - rib_t / 2, floor_z - eps])
        cube([boss_xs[last] - boss_xs[0], rib_t, boss_h + eps]);
}

module boss_holes() {
    for (x = boss_xs)
        translate([x, boss_y, boss_top_z - boss_hole_depth])
            cylinder(d = boss_hole_d, h = boss_hole_depth + 1);
}

// =====================================================================
// Latch
// =====================================================================
// The arms are drawn in "latch space": u = out from the flange edge (X),
// v = across from the latch centerline (Y). latch_space() moves that
// into place. Only the upper arm is drawn; mirror() makes the lower one.

module latch_space() {
    translate([lip_w, latch_cy, 0]) children();
}

// The upper arm seen from the back, as a chain of short straight pieces.
// hull() of two circles is a straight piece with round ends; the last
// piece uses squares so the tip ends square.
module arm_path_2d() {
    pts = [
        [-wall_t / 2, arm_c_wall],   // rooted inside the end wall
        [0,           arm_c_wall],   // leaves the wall
        [u_wide_x,    arm_c_wide],   // U at its widest
        [waist_x,     arm_c_waist],  // the waist
        [bend_x0,     arm_c_waist],  // S-bend starts
        [bend_x1,     arm_c_tip]     // S-bend ends
    ];
    for (i = [0 : len(pts) - 2])
        hull() {
            translate(pts[i])     circle(d = arm_t);
            translate(pts[i + 1]) circle(d = arm_t);
        }
    // straight run to the tip
    translate([bend_x1, arm_c_tip - arm_t / 2])
        square([arm_len - bend_x1, arm_t]);
}

// The hook's end view: w = out from the arm's inner face, z = height.
// The ramp is on the face side, the square catch face faces the back.
module hook_profile() {
    polygon([
        [0,         arm_bot_z],
        [hook_flat, arm_bot_z],
        [hook_w,    arm_bot_z + hook_ramp_h],
        [hook_w,    hook_catch_z],   // catch face
        [0,         hook_catch_z]
    ]);
}

// Stand an end-view drawing up along X (2D x -> +Y, 2D y -> Z, extrude -> +X),
// as the 5.25" blank's hook() does.
module end_view(len) {
    rotate([90, 0, 90]) linear_extrude(height = len) children();
}

// The upper arm's hook, starting at the arm's inner face.
module hook_3d() {
    hx0 = arm_len - hook_len;   // where the full hook starts
    v0  = tip_gap / 2;          // the arm's inner face
    translate([hx0, v0, 0]) end_view(hook_len) hook_profile();
    // taper from the plain arm up to the full hook
    hull() {
        translate([hx0, v0, 0]) end_view(eps) hook_profile();
        translate([hx0 - hook_taper, v0, 0]) end_view(eps)
            translate([0, arm_bot_z]) square([arm_t, hook_catch_z - arm_bot_z]);
    }
}

module upper_arm() {
    translate([0, 0, arm_bot_z])
        linear_extrude(height = arm_h) arm_path_2d();
    hook_3d();
}

// The footprint of one arm on the bed side: the stem, plus the wider hook flat.
module upper_arm_bottom_2d() {
    arm_path_2d();
    translate([arm_len - hook_len, tip_gap / 2]) square([hook_len, hook_flat]);
}

// The end wall the latch grows from, with its triangle braces on the back.
module end_wall() {
    // drawn in the end view (Y across, Z up) so its corners can be rounded
    translate([lip_w - wall_t, 0, wall_bot_z])
        end_view(wall_t)
            rounded_rect(wall_len, wall_top_z - wall_bot_z, wall_corner_r);
    for (i = [0 : brace_count - 1]) {
        y = wall_len * (i + 0.5) / brace_count;
        side_view(y - brace_t / 2, brace_t)
            polygon([
                [lip_w - wall_t + eps,             plate_t - eps],
                [lip_w - wall_t + eps,             wall_top_z],
                [lip_w - wall_t - brace_len,       plate_t - eps]
            ]);
    }
}

module latch() {
    end_wall();
    latch_space() {
        upper_arm();
        mirror([0, 1, 0]) upper_arm();
    }
}

// =====================================================================
// Built-in breakaway supports
// =====================================================================
// Separate solids, never joined to the part: each stops a small gap short
// of the surface it holds up, so it snaps off after printing.

// Shelf under the tab and the flange overhang at the tab end.
module tab_support() {
    h = face_out - support_gap;
    cube([face_margin_tab - end_nub_out - support_xy, lip_h, h]);
    translate([-tab_out, tab_y0, 0])
        cube([tab_out + eps, tab_h, h]);
}

// Shelf under the flange overhang at the latch end, stepping down under
// the end wall (which hangs lower than the flange), and cut away around
// the arm roots.
module latch_end_support() {
    difference() {
        translate([face_x1 + end_nub_out + face_support_xy, 0, 0])
            cube([lip_w - face_x1 - end_nub_out - face_support_xy, lip_h, face_out - support_gap]);
        // room for the end wall
        translate([lip_w - wall_t - support_xy, -1, wall_bot_z - support_gap])
            cube([wall_t + support_xy + 1, wall_len + support_xy + 1, 10]);
        // room for the arm roots
        latch_space()
            translate([0, 0, arm_bot_z - arm_support_gap])
                linear_extrude(height = 10)
                    offset(delta = support_xy) {
                        upper_arm_bottom_2d();
                        mirror([0, 1]) upper_arm_bottom_2d();
                    }
    }
}

// A fence under each arm: the arms float 1.92 (stock) above the bed for their whole length.
module arm_supports() {
    latch_space()
        linear_extrude(height = arm_bot_z - arm_support_gap) {
            upper_arm_bottom_2d();
            mirror([0, 1]) upper_arm_bottom_2d();
        }
}

module supports() {
    tab_support();
    latch_end_support();
    arm_supports();
}

// =====================================================================
// Let it breathe (NAS mode vents), same as the 5.25" blank
// =====================================================================

module vent_pattern_2d() {
    w  = vent_x1 - vent_x0;
    h  = vent_y1 - vent_y0;
    cx = (vent_x0 + vent_x1) / 2;
    cy = (vent_y0 + vent_y1) / 2;
    if (let_it_breathe == "slots") {
        nx = floor((w - vent_hole) / vent_pitch) + 1;
        sx = cx - (nx - 1) * vent_pitch / 2;
        for (i = [0 : nx - 1])
            hull() {
                translate([sx + i * vent_pitch, vent_y0 + vent_hole / 2]) circle(d = vent_hole);
                translate([sx + i * vent_pitch, vent_y1 - vent_hole / 2]) circle(d = vent_hole);
            }
    } else {
        ny = floor((h - vent_hole) / vent_rowh) + 1;
        nx = floor((w - vent_hole - vent_pitch / 2) / vent_pitch) + 1;
        sx = cx - ((nx - 1) * vent_pitch + vent_pitch / 2) / 2;
        sy = cy - (ny - 1) * vent_rowh / 2;
        for (j = [0 : ny - 1], i = [0 : nx - 1])
            translate([sx + i * vent_pitch + (j % 2) * vent_pitch / 2, sy + j * vent_rowh])
                if (let_it_breathe == "round")
                    circle(d = vent_hole);
                else
                    rotate(30) circle(d = vent_hole / cos(30), $fn = 6);
    }
}

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
            fins();
            if (boxes) corner_boxes();
            if (include_screw_bosses && !breathe) bosses_and_ribs();
            latch();
        }
        if (include_screw_bosses && !breathe) boss_holes();
        if (breathe) vents();
    }
}

// Laid out as seen from the FRONT; mirror() flips X for the face-down print,
// exactly as on the 5.25" blank.
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

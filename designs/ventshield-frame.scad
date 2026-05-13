// VentShield — parametric vent filter frame
// Usage: set sku at bottom of file, render, export STL
// Print in TPU 95A, 0.2mm layers, 0.4mm nozzle

include <common-params.scad>

// --- Active SKU (change this to render different sizes) ---
active_sku = sku_small;  // sku_small, sku_medium, or sku_large

// --- Derived dimensions ---
vent_w = in2mm(active_sku[0]);
vent_h = in2mm(active_sku[1]);
sku_name = active_sku[2];
num_magnets = active_sku[3];

outer_w = vent_w + 2 * frame_overlap;
outer_h = vent_h + 2 * frame_overlap;

inner_w = vent_w - 2 * channel_inset;
inner_h = vent_h - 2 * channel_inset;

module magnet_pocket() {
    cylinder(d=magnet_d, h=magnet_h + 0.1, $fn=32);
}

module frame_body() {
    difference() {
        // Outer shell
        translate([0, 0, 0])
            cube([outer_w, outer_h, frame_thickness]);

        // Inner cutout (vent opening)
        translate([frame_wall, frame_wall, -0.1])
            cube([outer_w - 2*frame_wall, outer_h - 2*frame_wall, frame_thickness + 0.2]);
    }
}

module filter_channel() {
    // Channel around inner perimeter for filter insert
    cw = channel_width;
    cd = channel_depth;

    translate([frame_wall - cw, frame_wall - cw, frame_thickness - cd])
        difference() {
            cube([outer_w - 2*frame_wall + 2*cw, outer_h - 2*frame_wall + 2*cw, cd + 0.1]);
            translate([cw, cw, -0.1])
                cube([outer_w - 2*frame_wall, outer_h - 2*frame_wall, cd + 0.3]);
        }
}

module magnet_pockets() {
    mz = -0.1;  // pocket from bottom face
    inset = frame_wall / 2;

    // Corners
    positions_corners = [
        [inset, inset],
        [outer_w - inset, inset],
        [inset, outer_h - inset],
        [outer_w - inset, outer_h - inset]
    ];

    // Midpoints (long sides)
    positions_mid_h = [
        [outer_w / 2, inset],
        [outer_w / 2, outer_h - inset]
    ];

    // Midpoints (short sides) — only for 8+ magnets
    positions_mid_w = [
        [inset, outer_h / 2],
        [outer_w - inset, outer_h / 2]
    ];

    // Extra midpoints for large SKU (12 magnets)
    positions_extra = (num_magnets >= 12) ? [
        [outer_w / 3, inset],
        [2 * outer_w / 3, inset],
        [outer_w / 3, outer_h - inset],
        [2 * outer_w / 3, outer_h - inset]
    ] : [];

    all_positions = concat(positions_corners, positions_mid_h, positions_mid_w, positions_extra);

    for (i = [0 : min(num_magnets - 1, len(all_positions) - 1)]) {
        translate([all_positions[i][0], all_positions[i][1], mz])
            magnet_pocket();
    }
}

module friction_lip() {
    // Downward-facing lip around outer edge for gripping register frame
    lh = lip_height;
    lt = lip_thickness;

    difference() {
        translate([0, 0, -lh])
            cube([outer_w, outer_h, lh]);
        translate([lt, lt, -lh - 0.1])
            cube([outer_w - 2*lt, outer_h - 2*lt, lh + 0.2]);
    }

    // Inner taper for interference fit
    difference() {
        translate([lt - lip_taper, lt - lip_taper, -lh])
            cube([outer_w - 2*(lt - lip_taper), outer_h - 2*(lt - lip_taper), lh/2]);
        translate([lt, lt, -lh - 0.1])
            cube([outer_w - 2*lt, outer_h - 2*lt, lh + 0.2]);
    }
}

module living_hinges() {
    // Horizontal fold line at midpoint of height
    fold_y = outer_h / 2;

    // Cut relief channels beside hinge zones
    for (x_pos = [frame_wall, outer_w - frame_wall - hinge_width]) {
        // Left of hinge
        if (x_pos > frame_wall + hinge_gap) {
            translate([frame_wall, fold_y - hinge_gap/2, hinge_thickness])
                cube([x_pos - frame_wall - hinge_gap, hinge_gap, frame_thickness]);
        }
    }

    // Thin the frame at fold line (except at hinge zones)
    difference() {
        translate([0, fold_y - hinge_gap/2, hinge_thickness])
            cube([outer_w, hinge_gap, frame_thickness - hinge_thickness + 0.1]);

        // Keep material at hinge zones (corners and center)
        for (xp = [0, outer_w/2 - hinge_width/2, outer_w - hinge_width]) {
            translate([xp, fold_y - hinge_gap/2 - 0.1, -0.1])
                cube([hinge_width, hinge_gap + 0.2, frame_thickness + 0.2]);
        }
    }
}

// --- Assembly ---
module ventshield_frame() {
    color("DodgerBlue", 0.8)
    difference() {
        union() {
            frame_body();
            friction_lip();
        }
        filter_channel();
        magnet_pockets();
        living_hinges();
    }
}

// Render
ventshield_frame();

// Info echo
echo(str("VentShield ", sku_name, ": ", outer_w, "x", outer_h, "mm outer, ", num_magnets, " magnets"));

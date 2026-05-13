// VentShield — shared parametric dimensions
// All units in mm unless noted

// Frame geometry
frame_wall = 8;           // width of frame border
frame_thickness = 6;      // total frame height (z)
frame_overlap = 5;        // how far frame extends past vent opening per side

// Filter channel
channel_width = 4;        // slot width for filter insert
channel_depth = 3;        // slot depth from top face
channel_inset = 2;        // inset from inner frame edge

// Magnet pockets (N52 disc, 6mm x 2mm)
magnet_d = 6.2;           // slightly oversized for press-fit
magnet_h = 2.2;           // pocket depth (magnet flush or slightly recessed)
magnet_wall_min = 1.5;    // min material between magnet pocket and frame edge

// Living hinge
hinge_width = 12;         // width of hinge zone along fold line
hinge_thickness = 1.0;    // thin section for flex (TPU 95A)
hinge_gap = 0.6;          // relief cuts beside hinge for easier fold

// Friction grip lip
lip_height = 3;           // downward lip that grips register edge
lip_thickness = 1.5;      // wall thickness of grip lip
lip_taper = 0.5;          // inward taper for interference fit (mm total)

// Register dimensions (inches to mm conversion)
function in2mm(x) = x * 25.4;

// SKU definitions: [width_in, height_in, name, magnet_count]
sku_small  = [6, 10, "small",  8];
sku_medium = [6, 12, "medium", 8];
sku_large  = [12, 12, "large", 12];

// Tolerance
fit_tolerance = 0.3;      // general print tolerance

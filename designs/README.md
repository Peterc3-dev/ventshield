# VentShield — CAD Designs

## Approach

Parametric design — all dimensions driven by parameters so a single model generates all three SKUs.

## Planned Files

- `ventshield-frame.scad` — Main parametric frame (OpenSCAD)
- `common-params.scad` — Shared dimensions (magnet pockets, filter channel, hinge geometry)

## Key Parameters

| Parameter | Description | Small | Medium | Large |
|---|---|---|---|---|
| `vent_w` | Vent width (inches) | 6 | 6 | 10/12 |
| `vent_h` | Vent height (inches) | 10 | 12 | 10/12 |
| `frame_overlap` | Grip overlap per side (mm) | 5 | 5 | 5 |
| `channel_width` | Filter insert slot width (mm) | 4 | 4 | 4 |
| `channel_depth` | Filter insert slot depth (mm) | 2 | 2 | 2 |
| `magnet_d` | Magnet diameter (mm) | 6 | 6 | 6 |
| `magnet_h` | Magnet height (mm) | 2 | 2 | 2 |
| `hinge_thickness` | Living hinge thin section (mm) | 1.0 | 1.0 | 1.0 |

## Print Notes

- Material: TPU 95A (Shore 95A) for flexibility and living hinge durability
- Nozzle: 0.4mm, layer: 0.2mm
- Hinge zones: 100% infill for fatigue resistance
- Frame body: 20% infill

## Dependencies

- OpenSCAD 2021.01+ (or FreeCAD 0.21+ if migrated)
- Slicer: PrusaSlicer or Cura with TPU profile

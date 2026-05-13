# VentShield — Prototype Plan

## Phase 1: Proof of Concept

Goal: validate that a snap-on frame with MERV 8-11 media meaningfully reduces particulate count from a vent without noticeably reducing airflow.

### 3D Printed Frame

**Approach**: Parametric design in OpenSCAD (or FreeCAD if complex surfacing needed). One base model with size parameters for each SKU.

**Design Requirements**:
- Outer dimensions match register face + 5mm overlap per side for grip
- Channel slot for filter insert (3-5mm wide, 2mm deep)
- Magnet pockets: recessed holes for 6mm x 2mm N52 disc magnets (press-fit or glued)
- Living hinge zones: thin sections (0.8-1.2mm) at fold lines for collapsibility
- Material: TPU 95A for flexibility (closest FDM approximation to TPE)

**Print Settings**:
- Nozzle: 0.4mm
- Layer height: 0.2mm
- Infill: 20% (frame sections), 100% (hinge zones)
- Print time estimate: 2-3 hours per frame

**Files to Create**:
- `designs/ventshield-frame-small.scad` — 6x10 parametric
- `designs/ventshield-frame-medium.scad` — 6x12
- `designs/ventshield-frame-large.scad` — 10x10 / 12x12
- `designs/common-params.scad` — shared dimensions (magnet pockets, channel width, hinge geometry)

### Bill of Materials (10 Prototypes)

| Item | Qty | Est. Cost | Source |
|---|---|---|---|
| TPU 95A filament (1kg spool) | 1 | $25 | Amazon |
| N52 neodymium disc magnets 6x2mm | 80 (8/frame) | $12 | Amazon/K&J Magnetics |
| MERV 8 filter media sheet (20x25) | 2 | $15 | Filterbuy/Amazon |
| MERV 11 filter media sheet (20x25) | 2 | $20 | Filterbuy/Amazon |
| MERV 13 filter media sheet (20x25) | 1 | $15 | Filterbuy/Amazon |
| Antimicrobial spray treatment (silver ion) | 1 | $15 | Amazon |
| pH indicator paper/strips (for saturation indicator R&D) | 1 pk | $8 | Amazon |
| Cyanoacrylate glue (magnet bonding) | 1 | $5 | Any |
| **Total** | | **~$115** | |

### Test Protocol

**Equipment Needed**:
- Particle counter (Temtop M2000 or equivalent): PM2.5, PM10, HCHO, TVOC
- Anemometer (for airflow velocity measurement)
- Hygrometer (humidity baseline)
- Phone camera (documentation)

**Test Procedure**:

1. **Baseline (no filter)**
   - Run HVAC for 30 min to stabilize
   - Measure at vent face: PM2.5, PM10, air velocity, temperature
   - Measure room ambient: PM2.5, PM10, humidity, temp
   - Record 3 readings, 5 min apart

2. **With VentShield (per MERV rating)**
   - Install frame + filter insert
   - Wait 15 min for stabilization
   - Measure at vent face (downstream of filter): PM2.5, PM10, air velocity
   - Measure room ambient after 30 min, 60 min
   - Record 3 readings per interval

3. **Airflow Impact**
   - Measure air velocity at vent face: no filter vs. MERV 8 vs. 11 vs. 13
   - Calculate pressure drop (velocity reduction as proxy)
   - Subjective assessment: can you feel reduced airflow from normal room position?

4. **Attachment Durability**
   - Install on ceiling vent
   - Time to failure (falls off) under normal HVAC operation
   - Test with magnets only, friction only, both
   - Vibration test: tap register, run HVAC on high

**Data Recording**: spreadsheet template at `docs/test-data-template.csv` (TODO)

### Fit Testing Checklist

Test frame fit on the following register types:

- [ ] Metal 6x10 ceiling (standard stamped steel)
- [ ] Metal 6x12 ceiling
- [ ] Metal 10x10 ceiling
- [ ] Plastic 6x10 wall
- [ ] Plastic 6x12 wall
- [ ] Metal 4x10 (bathroom — stretch goal)
- [ ] Hotel-style metal ceiling diffuser (if accessible)
- [ ] Adjustable-louver vs. fixed-louver registers

**For each, record**:
- Outer frame dimensions (actual, not nominal)
- Lip/flange depth
- Material (steel, aluminum, plastic)
- Louver type (adjustable vs. fixed)
- Magnet adherence (strong/weak/none)
- Friction grip fit (tight/loose/no grip)

## Phase 2: Refined Prototype (Post-Testing)

- Revise frame dimensions based on fit testing
- Select final MERV rating based on particulate reduction vs. airflow data
- Source antimicrobial-treated media (vs. spray-treating generic media)
- Design carrying pouch / travel case
- Explore injection molding quotes for production frame

## Timeline

| Week | Milestone |
|---|---|
| 1 | Order BOM, create parametric CAD files |
| 2 | Print first frames, cut filter inserts |
| 3 | Fit testing across available vent types |
| 4 | Air quality testing protocol execution |
| 5 | Data analysis, design revision |
| 6 | Revised prototype, begin market validation |

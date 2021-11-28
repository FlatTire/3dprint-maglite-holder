/*************
 * CONSTANTS *
 *************/

// Dimension of the flashlight
LIGHT_OD = 39.6875;

/*************
 * variables *
 *************/
$fn = 200; 

// Extra space within the holder
//od_buffer = 1.500;
od_buffer = 0.200;

// Overall height of the holder
holder_height = 105.000;

// Height of material at the bottom of the holder
holder_bottom_height = 8.000;

// holder_wall_thickness
holder_wall_thickness = 8.000;


/**
 * Define variables for trimming out the model
*/
trim_breadth = 200.000;
raft_height = 3.000;

airhole_radius = 1.5875;
taper_height = 25.000;

/***********
 * drawing *
 ***********/
difference() {
    rotate([0, 0, 45.000])
    union () {
        intersection () {

            intersection () {
                union () {
                    // ((Holder + Legs) - Flashlight) - Cylinder to clear the bottom
                    difference ()
                    {
                        // (Holder + Legs) - Flashlight
                        difference ()
                        {
                            // Holder + Legs
                            union () {
                                // Holder
                                difference() {
                                    color("red")
                                    cylinder(
                                        h=holder_height+holder_bottom_height,
                                        r=LIGHT_OD+od_buffer+holder_wall_thickness);

                                    color("yellow")
                                    translate([0, 0, holder_height+holder_bottom_height-taper_height+1])
                                    cylinder(
                                        h=taper_height,
                                        r1=LIGHT_OD+od_buffer,
                                        r2=LIGHT_OD+od_buffer+holder_wall_thickness+4.00);
                                };    

                                // Leg 1
                                color("orange")
                                translate([
                                    LIGHT_OD+od_buffer+holder_wall_thickness+10,
                                    0,
                                    -8.00])
                                rotate([0, -20, 0])
                                cylinder(
                                    h=holder_height,
                                    r1=LIGHT_OD*(2/3),
                                    r2=0);

                                // Leg 2
                                color("orange")
                                translate([
                                    -1*(LIGHT_OD+od_buffer+holder_wall_thickness+10),
                                    0,
                                    -8.00])
                                rotate([0, 20, 0])
                                cylinder(
                                    h=holder_height,
                                    r1=LIGHT_OD*(2/3),
                                    r2=0);

                                // Leg 3
                                color("orange")
                                translate([
                                    0,
                                    -1*(LIGHT_OD+od_buffer+holder_wall_thickness+10),
                                    -8.00])
                                rotate([-20, 0, 0])
                                cylinder(
                                    h=holder_height,
                                    r1=LIGHT_OD*(2/3),
                                    r2=0);

                                // Leg 4
                                color("orange")
                                translate([
                                    0,
                                    LIGHT_OD+od_buffer+holder_wall_thickness+10,
                                    -8.00])
                                rotate([20, 0, 0])
                                cylinder(
                                    h=holder_height,
                                    r1=LIGHT_OD*(2/3),
                                    r2=0);
                            };
                            
                            // Basic flashlight component
                            color("blue")
                            translate([0, 0, holder_bottom_height])
                            cylinder(
                                h=holder_height+holder_bottom_height+1,
                                r=LIGHT_OD+od_buffer);
                        };
                    };
                };
            };
            cylinder(r=5200, h=12000);
        };
        cylinder(
            r=160*0.85,
            h=4.000);
    };

    union() {
        color("green")
        translate([-200, 0, raft_height+holder_bottom_height*0.5-0.3])
        rotate([0, 90, 0])
        cylinder(h=400, r=airhole_radius);

        color("green")
        translate([0, 200, raft_height+holder_bottom_height*0.5-0.3])
        rotate([90, 0, 0])
        cylinder(h=400, r=airhole_radius);
    };
};    
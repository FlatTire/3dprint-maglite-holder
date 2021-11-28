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
od_buffer = 1.500;

// Overall height of the holder
holder_height = 65.000;

// Height of material at the bottom of the holder
holder_bottom_height = 8.000;

// holder_wall_thickness
holder_wall_thickness = 8.000;

/***********
 * drawing *
 ***********/

// ((Holder + Legs) - Flashlight) - Cylinder to clear the bottom
difference ()
{
    // (Holder + Legs) - Flashlight
    difference ()
    {
        // Holder + Legs
        union () {
            // Holder
            color("red")
            cylinder(
                h=holder_height+holder_bottom_height,
                r=LIGHT_OD+od_buffer+holder_wall_thickness);

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

    color("black")
    translate([0, 0, -50.000])
    cylinder(h=50.000, r=200);
};
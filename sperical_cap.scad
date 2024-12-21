/*
    spherical_cap.scad

    Create a cap of a given diameter

*/

// Include the threading library (if needed)
include <threads.scad>

// Enter the parameters for a given spherical cap
cap_diameter = 27; // in mm
cap_height = 7; // mm

module spherical_cap (diameter, height, vertices = 150, threaded = true) {

    // Radius of the sphere
    radius = (pow(diameter/2, 2) + pow(height, 2)) / (height * 2);

    // Information for the internal threads
    thread_diameter = 5; // M5
    thread_pitch = 0.8;  // M5
    thread_height = sqrt(pow(radius-2,2) - pow (thread_diameter / 2, 2));

    difference () {
    translate([0,0, -1 * (radius - cap_height)]) {
        if (threaded) {
            difference () {
                sphere(radius, $fn = vertices);
                ScrewThread(outer_diam = thread_diameter, height = thread_height, pitch = thread_pitch);
            }
        } else {
           sphere(radius, $fn = vertices);
        }
    }
    translate([-radius,-radius,-2 * radius]) {
        cube([radius * 2, radius * 2, radius * 2]);
    }
}

}

spherical_cap (cap_diameter, cap_height);








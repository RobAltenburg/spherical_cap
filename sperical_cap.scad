/*
    spherical_cap.scad

    Create a cap of a given diameter

*/


// Include the threading library
include <threads.scad>

// Enter the parameters for a given spherical cap
cap_diameter = 27; // in mm
cap_height = 7; // mm
vert_factor = 10; //verticies in the final object is cap_diameter * vert_factor

// Radius of the sphere
radius = (pow(cap_diameter/2, 2) + pow(cap_height, 2)) / (cap_height * 2);

//
thread_diameter = 5;
thread_pitch = 0.8;
thread_height = sqrt(pow(radius-2,2) - pow (thread_diameter / 2, 2));

difference () {
    translate([0,0, -1 * (radius - cap_height)]) {
        difference () {
            sphere(radius, $fn = vert_factor * cap_diameter);
            ScrewThread(outer_diam = thread_diameter, height = thread_height, pitch = thread_pitch);
        }
    }
    translate([-radius,-radius,-2 * radius]) {
        cube([radius * 2, radius * 2, radius * 2]);
    }
}

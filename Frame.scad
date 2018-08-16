use <raspi3.scad>;

module frame_bottom() {
    difference() {
        union() {
            for(i=[-1,1]) {
                for(j=[0,1]) {
                    translate([3.5+j*58, i*24.5, 0]) {
                        cylinder(d=2.3, h=23, $fn=16);
                        cylinder(d=5.7, h=20, $fn=32);
                    }
                }
            }
            difference() {
                union() {
                    hull() {
                        translate([36, -29, 0]) cube([50, 22, 18]);
                        translate([23, -29, 0]) cube([1, 18, 18]);
                    }
                    translate([0, -29, 0]) cube([23, 18, 18]);
                    translate([36, 16, 0]) cube([50, 12, 18]);
                    hull() {
                        translate([0, 9, 0]) cube([23, 19, 18]);
                        translate([36, 16, 0]) cube([1, 12, 18]);
                    }
                    hull() {
                        translate([0, -29, 0]) cube([22, 49, 6]);
                        translate([35, -29, 0]) cube([0.3, 49, 0.3]);
                    }
                }
                translate([-0.1, 0, 65/2]) rotate([0, 90, 0]) cylinder(d1=65, d2=1, h=50, $fn=128);
            }
        }
        for(i=[-1,1]) {
            hull() {
                translate([1, i*25, 5]) rotate([0, 90, 0]) cylinder(d=10.5, h=1.5, $fn=32);
                translate([19, i*25, -5]) rotate([0, 90, 0]) cylinder(d=10.5, h=1.5, $fn=32);
            }
            translate([-1, i*25, 5]) rotate([0, 90, 0]) cylinder(d=4.15, h=3.5, $fn=32);
        }
    }
}

module frame_top() {
    difference() {
        union() {
            for(i=[-1,1]) {
                for(j=[0,1]) {
                    difference() {
                        translate([3.5+j*58, i*24.5, 21.5]) cylinder(d=5.7, h=38, $fn=32);
                        translate([3.5+j*58, i*24.5, 21]) cylinder(d=2.6, h=7, $fn=32);
                    }
                }
            }
            difference() {
                union() {
                    translate([0, -29, 38]) cube([86, 58, 22]);
                    translate([6, 19.5, 25]) cube([52.5, 2, 35]);
                    translate([0, -29, 25]) cube([65, 2, 35]);
                }
                translate([6, 21.5, 20]) cube([52.5, 10, 50]);
                translate([-0.1, 0, 28]) rotate([0, 90, 0]) cylinder(d1=65, d2=1, h=50, $fn=128);
                translate([24, -30, 24]) cube([35, 4, 5.5]);
                translate([86.1, 0, 28]) rotate([0, -90, 0]) cylinder(d1=65, d2=1, h=70, $fn=128);
                translate([0, -7, 37]) cube([70, 23, 5]);
            }
            translate([3, 21.8, 35]) rotate([0, 0, -8]) cube([20, 2, 25]);
        }
        for(i=[-1,1]) {
            hull() {
                translate([1, i*25, 55]) rotate([0, 90, 0]) cylinder(d=10.5, h=1.5, $fn=32);
                translate([19, i*25, 65]) rotate([0, 90, 0]) cylinder(d=10.5, h=1.5, $fn=32);
            }
            translate([-1, i*25, 55]) rotate([0, 90, 0]) cylinder(d=4.15, h=3.5, $fn=32);
        }
        translate([1, 38, 38]) rotate([45, 0, 0]) cube([20, 20, 20]);
    }
}

frame_top();
frame_bottom();
translate([32.5, 0, 20]) color("blue") raspi3();
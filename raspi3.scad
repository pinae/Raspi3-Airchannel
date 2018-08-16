module raspi3() {
    ph = 1.25;
    mxh = 2;
    hdx = 58;
    hdy = 49;
    cr = 3;
    be = -58/2;
    difference() {
        union() {
            for(x=[-1, 1]) {
                for(y=[-1, 1]) {
                    translate([x*(85/2-cr)+27/2-3.5, y*(56/2-cr), 0]) cylinder(r=cr, h=ph, $fn=32);
                }
            }
            translate([be-3.5, -56/2+cr, 0]) cube([85, 56-2*cr, ph]);
            translate([be, -56/2, 0]) cube([85-2*cr, 56, ph]);
            // micro USB power
            translate([be+10.6, -56/2-(57.35-56)+5.7/2, ph+3.1/2]) cube([8.07, 5.7, 3.1], center=true);
            // HDMI socket
            translate([be+32, -56/2-(57.7-56)+11.6/2, ph+6.5/2]) cube([15.06, 11.6, 6.5], center=true);
            // ethernet
            translate([be+85-2-21.3/2, -56/2+10.25, ph+13.5/2]) cube([21.3, 15.85, 13.5], center=true);
            // usb
            for(i=[29, 47]) {
                translate([be+85-2-17.1/2, -56/2+i, ph+16/2]) cube([17.1, 15.25, 16], center=true);
            }
            // pin header
            translate([be+29, 49/2, ph+8.5/2-mxh/2]) cube([50.65, 5, 8.5+ph+mxh], center=true);
            // display connector
            translate([be+1.1-3.88/2, 0, ph+5.5/2]) cube([3.88, 22.3, 5.5], center=true);
            // camera connector
            translate([be+32+13-3.88/2, -56/2+11.5, ph+5.5/2]) cube([3.88, 22.3, 5.5], center=true);
            // headphone jack
            translate([be+53.5-7.2/2, -56/2+12.5/2, ph+6/2]) cube([7.2, 12.5, 6], center=true);
            translate([be+53.5-7.2/2, -56/2, ph+6/2]) rotate([90, 0, 0]) cylinder(d=6, h=2.8, $fn=32);
        }
        for(x=[-hdx/2, hdx/2]) {
            for(y=[-hdy/2, hdy/2]) {
                translate([x, y, -1]) cylinder(d=2.75, h=ph+2, $fn=32);
            }
        }
    }
}
translate([0, 0, 3]) color("blue") raspi3();
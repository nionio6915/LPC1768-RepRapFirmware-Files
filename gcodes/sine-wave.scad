//for (i = [0:1:360]) { translate([i/360, sin(i), 0]) cylinder (h=0.3, r=0.05, center=false); }
amplitude=150;
linear_extrude(1) polygon([ for (a = [0:1:359]) [(300/359)*a, amplitude * sin(a)], for (a = [359:-1:0]) [(300/359)*a, amplitude * sin(a) - 4] ]);

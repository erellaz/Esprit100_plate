// Top plate for Esprit and Pegasus box
// 2024-09-07

scale=25.4;    // Inch to mm
tol=0.25;

//Resolution for STL export only. That is for display in Openscad and 3D printing only. 
//Please do comment this before going to Freecad, or you will end up with inefficient facets.
// and will not play well with export to .step files
$fn=350;

x=109;
y=104;
r1=0.26*scale/2; // 1/4 - 20 screws clearance drill, close fit
r2=2.2; //M4

xi=42.5;
xj=20;
xl=15;
xm=25;

yi=1*scale;
yk=40;
yj=37.5;
yl=15;


//makes a rectangle of size x,y with rounded corner of radius r
module rounded_square(x,y,r){
    union(){
    xi=x/2-r;
    yi=y/2-r;

    translate([xi,yi]) circle(r);
    translate([xi,-yi]) circle(r);
    translate([-xi,yi]) circle(r);
    translate([-xi,-yi]) circle(r);

    square(size = [x-2*r,y],center=true);
    square(size = [x,y-2*r],center=true);
    }
}

//____________________________________________________________________________
//linear_extrude(6) {
difference(){

// Plate
square(size = [x,y],center=true);

// Holes
union(){
    // Holes to ring
    translate([xi,yi]) circle(r1);
    translate([xi,-yi]) circle(r1);
    translate([-xi,yi]) circle(r1);
    translate([-xi,-yi]) circle(r1); 
    
     // Holes to ring
    translate([xi,yk]) circle(r1);
    translate([xi,-yk]) circle(r1);
    translate([-xi,yk]) circle(r1);
    translate([-xi,-yk]) circle(r1);
    
    // Axial holes
    translate([0,0]) circle(r1);
    translate([xi,0]) circle(r1);
    translate([-xi,0]) circle(r1); 
    
    // Holes to Pegasus Power Box
    translate([xj,yj]) circle(r2);
    translate([xj,-yj]) circle(r2);
    translate([-xj,yj]) circle(r2);
    translate([-xj,-yj]) circle(r2); 
    translate([0,yj]) circle(r2);
    translate([0,-yj]) circle(r2);
    
    // Extra holes
    translate([xl,yl]) circle(r1);
    translate([xl,-yl]) circle(r1);
    translate([-xl,yl]) circle(r1);
    translate([-xl,-yl]) circle(r1);
    translate([xm,0]) circle(r1);
    translate([-xm,0]) circle(r1);
}

}
//}//linear_extrude
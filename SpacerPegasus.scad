// Top plate for Esprit and Pegasus box
// 2024-09-07

scale=25.4;    // Inch to mm
tol=0.25;

//Resolution for STL export only. That is for display in Openscad and 3D printing only. 
//Please do comment this before going to Freecad, or you will end up with inefficient facets.
// and will not play well with export to .step files
$fn=350;

x=90;
y=15;
r1=3.3/2; // 1/4 - 20 screws clearance drill, close fit
r2=2.2; //M4

xi=42.5;
xj=20;
xk=37.5;


//linear_extrude(6) {
difference(){

// Plate
square(size = [x,y],center=true);

// Holes
union(){
 
    
    // Holes to Pegasus Power Box
    translate([0,0]) circle(r1);
    translate([xj,0]) circle(r1);
    translate([-xj,0]) circle(r1);
  
    
    translate([xk,0]) circle(r2);
    translate([-xk,0]) circle(r2);


}

}
//}
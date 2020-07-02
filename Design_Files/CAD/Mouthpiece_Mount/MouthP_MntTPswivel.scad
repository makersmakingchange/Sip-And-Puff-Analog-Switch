$fn=30;//normally 30 for this design and long render time on my ancient Mac...
//Mouthpiece Mount Top Swivel

difference(){
    minkedShape();//use this line for smoothness (very slow rendering), or next, but not both...
    //mainShape(); //faster for testing
    
//clean removals (non Minkowski)
cylinder(d=3.2,h=6,center=true,$fn=30);//

translate([0,0,2])cylinder(d=7,h=3,center=true,$fn=6);//
translate([-15,0,7])rotate([0,90,0])cylinder(d=10,h=10,center=true,$fn=6);//hex capture  for luer
  translate([-15,0,7])rotate([0,90,0])cylinder(d=7,h=20,center=true,$fn=30);//luer hole
    translate([-6,0,7])rotate([0,90,0])resize([0,18,0])cylinder(d=12,h=5,center=true,$fn=30);//luer nut clearance
}

//translate([0,0,-3])cylinder(d=7,h=4,center=true,$fn=6);//
//translate([0,0,9/2])cylinder(d=19.4,h=2.5,center=true); //insert capture
//translate([-8.4,0,20.5])rotate([0,-60,0]) cylinder(d=7,h=100,center=true);//
//translate([0,0,-1])ArrayCentItems(2,2,20) cylinder(d1=3.2,d2=2.6,h=7,center=true);// 4 corner holes  
//translate([0,0,-5])ArrayCentItems(2,2,20) cylinder(d=5.7,h=4,center=true);// 4 Screw head holes  
//CircleItems(3,8.6,0)cube([2,1.2,20], center = true);//(n,r,myRot)

    



//subtractions
//cylinder(d=(D-3/16),h=H);
//translate([0,D/2,H/2])
//translate([-35/2,0,0])cube([35,35,4],center=true);-


// subroutines
module minkedShape(){
minkowski()
{
mainShape();
sphere(d=3,center=true);
}//mink
}

module mainShape(){
    union(){
difference(){

resize([0,0,50])sphere(d=25,center=true);
//removals
//translate([-20/2,0,0])cube([20,35,9],center=true);
 translate([0,0,-25/2-1.0])cylinder(d=25,h=25,center=true);
translate([5,0,25/2+1.0])cube([25,25,25], center = true);// chop elongated  sphere
//translate([0,0,15/2])cylinder(d=12,h=12,center=true);
 CircleItems(12,12.5,0) cylinder(d=3,h=5,center=true);
 
}//end diff


}//union 

}//main

module ArrayCentItems(xCount,yCount,itemGap)
{
for (x = [1:xCount]){
for (y = [1:yCount]){
translate([x*itemGap-(xCount+1)*itemGap/2,y*itemGap-(yCount+1)*itemGap/2,0])
children();
}//for y
}//for x
}//end module

module CircleItems(n,r,myRot)
{
segment=360 / n;
for (i=[1:n])
{
rotate([0, 0, segment*i+myRot])
translate ([r,0,0])
children();
}//for
}//module
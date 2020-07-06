$fn=100;
//Mouthpiece holder

difference(){
union(){
cylinder(d=35,h=9,center=true);
//translate([-20/2,0,0])cube([20,35,9],center=true);
  
}//end union
cylinder(d1=7.4,d2=8,h=10,center=true);
translate([0,0,9/2])cylinder(d=19.4,h=2.5,center=true); //insert capture
//translate([-8.4,0,20.5])rotate([0,-60,0]) cylinder(d=7,h=100,center=true);//
ArrayCentItems(2,2,20) cylinder(d=3.2,h=10,center=true);// 4 corner holes  
translate([0,0,-5])ArrayCentItems(2,2,20) cylinder(d=5.7,h=4,center=true);// 4 Screw head holes  
CircleItems(3,8.6,0)cube([2,1.2,20], center = true);//(n,r,myRot)
}//end diff
    



//subtractions
//cylinder(d=(D-3/16),h=H);
//translate([0,D/2,H/2])
//translate([-35/2,0,0])cube([35,35,4],center=true);-


// subroutines

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
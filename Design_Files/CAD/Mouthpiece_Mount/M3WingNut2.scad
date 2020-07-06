$fn=50;
difference(){
union(){
translate([0,0,14])cylinder(d=9,h=6,center=true);
translate([0,0,5.5])
    minkowski(){
    minkowski(){
difference(){

cube([13,1,7], center = true);//Main plate   original cube([90,68,8.5]
 translate([-3,0,0])cube([3,2,7], center = true);//Main plate   original cube([90,68,8.5]      
}

cylinder(d=6,h=3,center=true);
}  //mink
sphere(d=1,center=true,$fn=50);
}  //outer mink
}//end union
translate([0,0,15])cylinder(d1=3,d2=2.8,h=7,center=true);
translate([0,0,12/2])cylinder(d=5.5,h=12,center=true);
ArrayCentItemsVar(0,2,0,77) translate([0,0,12/2])cylinder(d=70,h=12,center=true);
translate([0,0,12])cylinder(d1=4,d2=3,h=1,center=true);
}//end diff






//subs
module ArrayCentItemsVar(xCount,yCount,itemGapX,itemGapY)
{
for (x = [1:xCount]){
for (y = [1:yCount]){
translate([x*itemGapX-(xCount+1)*itemGapX/2,y*itemGapY-(yCount+1)*itemGapY/2,0])
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
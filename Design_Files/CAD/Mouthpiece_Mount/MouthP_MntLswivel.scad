$fn=30;
//Mouthpiece Mount Cap

difference(){
    //minkedShape();
    mainShape();
//clean removals (non Minkowski)
cylinder(d=3.2,h=6,center=true,$fn=30);//
translate([-13,0,25])rotate([0,90,0])cylinder(d=3.2,h=12,center=true);//top hole   
translate([-13,0,25])rotate([0,90,0])cylinder(d=7,h=7,center=true,$fn=6);//top nut capture        
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
sphere(d=2,center=true);
}//mink
}

module mainShape(){
    union(){
difference(){

resize([0,0,70])sphere(d=35,center=true);
//removals
//translate([-20/2,0,0])cube([20,35,9],center=true);
 translate([0,0,-35/2-2])cylinder(d=35,h=35,center=true);
translate([10,0,35/2+2])cube([35,35,35], center = true);
translate([0,0,15/2])cylinder(d=30,h=12,center=true);
 translate([-13,0,25])rotate([0,90,0])cylinder(d=15,h=6,center=true);//chop area for top hole
 
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
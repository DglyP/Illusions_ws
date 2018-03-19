PGraphics pg;
boolean active = false;
  
void setup(){
  size (800,400);
  pg = createGraphics (width, height);
}

void draw() {

  background(255);
  pg.beginDraw();
translate(300,100);
  
beginShape();
curveVertex(-30,  0);
curveVertex(-30,  0);
curveVertex(0,  100);
curveVertex(-29, 200);
curveVertex(-35, 250);
curveVertex(-35, 250);
endShape();

beginShape();
curveVertex(-0, 150);
curveVertex(-0, 150);
curveVertex(28, 200);
curveVertex(35, 250);
curveVertex(35, 250);
endShape();

  arc(0, 0, 105, 90, radians(30), radians(250));
  ellipse(-7, 22, 15, 15);
  
 
    translate(120,0);
  beginShape();
curveVertex(30,  0);
curveVertex(30,  0);
curveVertex(0,  100);
curveVertex(29, 200);
curveVertex(35, 250);
curveVertex(35, 250);
endShape();

beginShape();
curveVertex(-0, 150);
curveVertex(-0, 150);
curveVertex(-28, 200);
curveVertex(-35, 250);
curveVertex(-35, 250);
endShape();

  arc(0, 0, 105, 90, radians(-70),  radians(150), OPEN);

ellipse(7, 22, 15, 15);
stroke(0, 255, 255);
strokeWeight(6); 

 if(active){
    stroke(125);
  rect(-50,-100,200,width,10);
  }
  pg.endDraw();
  
  image (pg,0,0);


}

void  mouseClicked() {
  if(active){
    active = false;
  }else{
  active= true;
  }
}
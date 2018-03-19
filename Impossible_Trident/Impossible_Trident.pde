PGraphics pg;
PGraphics pgAux;
PImage img;
  
void setup(){
  size (800,400);
  pg = createGraphics (width, height);
}

void draw() {
  background(255);
  pg.beginDraw();
  int[] beginLine  = new int[2], 
        endLine = new int[2];
  int dif = 20,
  line = 0;
  beginLine[0] = 500;
  beginLine[1] = 100;
  endLine[0] = 100;
  endLine[1] = 200;

 
  for(int i = 0; i < 3; i++){
    int j = i * 2;
    int beginX1 = beginLine[0]+(j*dif),
        beginX2 = beginLine[0]+((j+1)*dif),
        endX1 = endLine[0]+(j*dif),
        endX2 = endLine[0]+((j+1)*dif),
        beginY1 = beginLine[1]+(j*dif),
        beginY2 = beginLine[1]+((j+1)*dif),
        endY1 = endLine[1]+(j*dif),
        endY2 = endLine[1]+((j+1)*dif);
    float r2 = dist(endX1, endY1, endX2, endY2);
    
    if(line == 2){
       beginX1 = beginX1 - (dif*3);
       beginY1 = beginY1  + ((dif*3)/4);
       line( beginX1, beginY1-((dif*5)/4), beginX1, beginY1);
        line( beginX1, beginY1, beginX1 + dif, beginY1 + dif);
   }
   if(line == 4){
     line(beginX1 - (dif * 4), beginY1 - (dif * 4), beginX1, beginY1);
   }
    line(beginX1, beginY1, endX1, endY1);
     line++;
    
    if(line == 1 || line == 3){
       beginX2 = beginX2 - (dif*2);
       beginY2 = beginY2  + (dif/2);
       if(line == 1){
          line(beginX2, beginY2, beginX2 + (dif*2), beginY2 + (dif*2));
       }
   }
   if(line == 5){
       beginX2 = beginX2 - (dif);
       beginY2 = beginY2  + ((dif*1)/4);
       line(beginX1, beginY1, beginX2, beginY2);
   }
     
     line(beginX2, beginY2, endX2, endY2);
     line++;
   
   // System.out.println("I: : " + i);
   // System.out.println("Inicio1: X: " + beginX1 + " Y: " + beginY1);
   //  System.out.println("Fin1: X: " + endX1 + " Y: " + endY1);
   //  System.out.println("Inicio2: X: " + beginX2 + " Y: " + beginY2);
   //  System.out.println("Fin1: X: " + endX2 + " Y: " + endY2);
   //  System.out.println(line);

  //noFill();
    ellipse( ((endLine[0]+(j*dif))+dif/2), ((endLine[1]+(j*dif))+dif/2), (r2),(r2));

     
  
   
  }
  pg.endDraw();
  
  image (pg,0,0);


}
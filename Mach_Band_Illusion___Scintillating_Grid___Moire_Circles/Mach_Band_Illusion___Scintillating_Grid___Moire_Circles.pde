int illusions = 3;
int current = 1;
//toggle illusion activation
boolean active = true;

//inf
int a =0;
int b = 0;
int x,y;

void setup() {
  size(800, 800);
  fill(0);
  stroke(0);
  smooth();
}

void draw() {
  background(255);
  pushStyle();
  switch(current) {
  case 1:
    colorbn();
    break;
  case 2:
    moirecircles();
    break;
  case 3:
    scintillating();
    break;
    //println("implementation is wrong!");
  }
  popStyle();
}

// switch illusion using the spacebar
void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
  if (key == 'a')
    active = !active;
}

void scintillating() {
  background(0);          // black background

  //style
  strokeWeight(3);        // medium weight lines 
  smooth();               // antialias lines
  stroke(100, 100, 100);  // dark grey colour for lines

  int step = 25;          // grid spacing

  //vertical lines
  for (int x = step; x < width; x = x + step) {
    line(x, 0, x, height);
  }

  //horizontal lines
  for (int y = step; y < height; y = y + step) {
    line(0, y, width, y);
  }

  // Circles
  if (active) {
    ellipseMode(CENTER);
    stroke(255, 255, 255);  // white circles
    for (int i = step; i < width -5; i = i + step) {
      for (int j = step; j < height -15; j = j + step) {
        strokeWeight(6); 
        point(i, j);
        strokeWeight(3);
      }
    }
  }
}

void moirecircles(){
  //http://www.michaelbach.de/ot/lum-moire1/index.html
  background(250);

  noFill();
  stroke( 0 );
  strokeWeight(3);

  int oneThirdWidth = width / 3;
  int twoThirdsWidth = 2 * width / 3;

  // draw the set of concentric circles on the left:
  for( int n = 0; n < twoThirdsWidth; n = n + 15 ) {
    ellipse( oneThirdWidth, height / 2, n, n );
    stroke(#006600);
  }
  noStroke();  
  if(active){
    float t = millis()/1000.0f;
    if(twoThirdsWidth > width/2 || twoThirdsWidth  < 0 ){
      t *= -1;
    }
    translate(100*cos(t),100*sin(t));
  }
  // draw the set of concentric circles on the right:
  for( int n = 0; n < twoThirdsWidth; n = n + 15 ) {
    ellipse( twoThirdsWidth, height / 2 , n, n);
    stroke(#0000b3);
    }
}

float angle = 0;
void colorbn(){
  // https://www.openprocessing.org/sketch/168577
  background(255);
  int color1=50;
  strokeWeight(1);
  if(active){
    for(int g=1;g<=800;g++){
      stroke(color1);
      line(g,0,g,800);
      if(g%4==0)
      color1++;
    }
  }
  noStroke();
  fill(119);
  rect(50,height/2-40,700,80);
  if(active){
    float c = (cos(angle + PI/2) * width/2) + width/2;
  angle += 0.01;
  for (int i=0; i<width; i++) {
    line(i, 0, i, height);
  }
  noStroke();
  rect(0, 0, c, height);
}
}
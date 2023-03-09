int y=200;
int y2=400;
int y3=0;
int x=200;
int x2=400;
int x3=600;
float angle=0;

void setup() {
  size(600, 600); 
  stroke(255);
  rectMode(CENTER);
}

void draw() { 
  background(0);
  line(0, y, width, y);
  line(0, y2, width, y2); 
  line(0, y3, width, y3);
  line(x, 0, x, height);
  line(x2, 0, x2, height);
  line(x3, 0, x3, height);
  
  translate(width/2, height/2);
  rotate(radians(angle));
  rect(0,0,200,200);
  
  y--;
  y2--;
  y3--;
  x++;
  x2++;
  x3++;
  angle+=0.45;
  if(y<0) {
    y=height;
  }
  if(y2<0) {
    y2=height;
  }
  if(y3<0) {
    y3=height;
  }
  if(x>width) {
    x=0;
  }
  if(x2>width) {
    x2=0;
  }
  if(x3>width) {
    x3=0;
  }
} 

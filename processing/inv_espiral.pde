final int NUM_LINES = 500;
float maxRadius;
final int NUM_TURNS = 10;
float startAngle = 0;
final float START_ANGLE_CHANGE = 0.5; 
float x;
float y;
 
 
void setup() {
  size(600, 800);
  maxRadius = sqrt(sq(width/2)+sq(height/2)); 
}
 
void draw() {
  background(255);
  float xp=10;
  float yp=10;
  for(int i = 0; i<NUM_LINES;i++){
    x = width/2+i*cos((i+startAngle)*NUM_TURNS*TWO_PI/maxRadius);
    y = height/2+i*sin((i+startAngle)*NUM_TURNS*TWO_PI/maxRadius);
    rect(x,y,xp,yp);
    xp=10;
    yp=10;
  }
  startAngle+=START_ANGLE_CHANGE;
}

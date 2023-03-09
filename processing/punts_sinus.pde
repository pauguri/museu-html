float s;
float angle = 0;

void setup() {
  size(640, 640); 
  noStroke();
}

void draw() {
  background(0);

  for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= height; j += 20) {
      s = sin(angle+i/2+j/2)*20;
      ellipse(i, j, s,s);
      
    }
  }
  angle+= 0.02;
}

import peasy.*;

PeasyCam cam;
PFont font;
int c[] = {0, 100, 200, 300, 400};

void setup() {
  size(800, 800, P3D);
  colorMode(HSB, 500);
  cam = new PeasyCam(this, 300);
  font = createFont("Poppins-Regular.ttf",32);
  textFont(font);
  noStroke();
}

void draw() {
  background(100);
  translate(0, 0, -25);
  
  fill(0,0,500);
  text("piramide",-70,80);
  
  if (mousePressed) {
    for (int i=0; i<5; i++) {
      c[i]++;
      if (c[i]>=500) {
        c[i]=0;
      }
    }
  }


  lights();
  pointLight(255, 255, 255, 100, 100, 100);
  fill(c[0], 255, 255);
  square(-50, -50, 100);

  push();
  rotateY(radians(90));
  translate(0, 0, -50);
  fill(c[1], 500, 500);
  beginShape(TRIANGLE);
  vertex(0, -50, 0);
  vertex(0, 50, 0);
  vertex(-100, 0, 50);
  endShape();
  pop();

  push();
  rotateY(radians(-90));
  translate(0, 0, -50);
  fill(c[2], 500, 500);
  beginShape(TRIANGLE);
  vertex(0, -50, 0);
  vertex(0, 50, 0);
  vertex(100, 0, 50);
  endShape();
  pop();

  push();
  rotateX(radians(90));
  translate(0, 0, -50);
  fill(c[3], 500, 500);
  beginShape(TRIANGLE);
  vertex(-50, 0, 0);
  vertex(50, 0, 0);
  vertex(0, 100, 50);
  endShape();
  pop();

  push();
  rotateX(radians(-90));
  translate(0, 0, -50);
  fill(c[4], 500, 500);
  beginShape(TRIANGLE);
  vertex(-50, 0, 0);
  vertex(50, 0, 0);
  vertex(0, -100, 50);
  endShape();
  pop();
}

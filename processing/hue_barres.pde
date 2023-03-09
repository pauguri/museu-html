

void setup() {
  size(1920, 800); 
  noStroke();
  background(0);
  colorMode(HSB,height);
}

void draw() { 
  fill(mouseY,height,height);
  rect(mouseX,0,10,height);
} 

void mouseClicked() {
  background(0);
}

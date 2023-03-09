int x = 20;
int y = 20;
int col = 0;
boolean xup = false;
boolean yun = false;

void setup(){
  size(1920,800);
  noStroke();
  background(0);
  colorMode(HSB,500);
}

void draw(){
  fill(col,500,500);
  ellipse(x,y,40,40);
  if(xup){
    x-=2;
    if(x<=20){
      xup = false;
    }
  } else {
    x+=2;
    if(x>=1900){
      xup = true;
    }
  }
  
  if(yun){
    y-=2;
    if(y<=20){
      yun = false;
    }
  } else {
    y+=2;
    if(y>=780){
      yun = true;
    }
  }
  
  col++;
  if(col>=500){
    col = 0;
  }
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    yun = !yun;
  } else if (mouseButton == RIGHT) {
    background(0);
  }
}

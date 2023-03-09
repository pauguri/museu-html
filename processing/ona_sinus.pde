int x = 0;
float y = 0;
float y2 = 0;
float y3 = 0;
float y4 = 0;
float ang = 0.0;
boolean right = true;

void setup(){
  size(1920,400);
  noStroke();
  background(0);
}

void draw(){
  if(right){
    x+=2;
    if(x>=width){
      right = false;
      background(0);
    }
  } else {
    x-=2;
    if(x<=0){
      right = true;
      background(0);
    }
  }
  y=sin(ang)*190;
  translate(0,height/2);
  fill(255);
  ellipse(x,y,20,20);
  
  y2=cos(ang)*190;
  fill(50,255,255);
  ellipse(x,y2,20,20);
  
  y3=sin(ang+3.1416)*190;
  fill(255,50,255);
  ellipse(x,y3,20,20);
  
  y4=cos(ang+3.1416)*190;
  fill(255,255,50);
  ellipse(x,y4,20,20);
  
  ang+=0.02;
}

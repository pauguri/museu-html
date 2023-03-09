int a;
float x,bgh,ch;

void setup(){
  size(600,600);
  noStroke();
  colorMode(HSB,200);
}

void draw(){
  x=-abs(sin(radians(a)))*200;
  if(x>-1){
    bgh=random(200);
    ch=bgh+100;
    if(ch>200){
      ch-=200;
    }
  }
  background(bgh,200,200);
  fill(ch,200,200);
  ellipse(width/2,x+450,300,300);
  a++;
}

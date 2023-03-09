int corner=0; // 0 tl, 1 tr, 2 bl, 3 br
float a;

void setup(){
  size(600,600);
  fill(0);
  stroke(255,0,255);
}

void draw(){
  background(0);
  generateSq(1);
  
}

void generateSq(int spd){
  
  if(a==180){
    corner++;
    a=-180;
    if(corner>=4){
      corner=0;
    }
  }
  
  pushMatrix();
  translate(corner==0||corner==2?250:300,corner==0||corner==1?250:300);
  rotate(radians(a));
  rect(corner==0||corner==2?-50:50,corner==0||corner==1?-50:50,50,50);
  popMatrix();
  a++;
}

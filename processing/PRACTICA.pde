class Linea {
  float h;
  float wid;
  float f,a;
  boolean cw=true;;
  
  Linea(float h_, float wid_, float f_){
    h = h_;
    wid = wid_;
    f = f_;
  }
  
  void show(){
    if(cw){
      a+=0.5;
    } else {
      a-=0.5;
    }
    if((a+f)<-10){
      cw=true;
    } else if((a+f)>10){
      cw=false;
    }
    
    pushMatrix();
    translate(width/2,h);
    rotate(radians(a+f));
    rect(0,0,400,1);
    popMatrix();
  }
}

float a,h,f;
int i;
ArrayList<Linea> lineas;

void setup(){
  size(600,800);
  noStroke();
  fill(255);
  rectMode(CENTER);
  
  lineas = new ArrayList<Linea>();
  for(h=100,i=0;h<=700;h+=20,i++){
    lineas.add(new Linea(h,400,f));
    f-=2;
  }
}

void draw(){
  background(0);
  
  for(i=0;i<lineas.size();i++){
    lineas.get(i).show();
  }
  a++;
  f=0;
}
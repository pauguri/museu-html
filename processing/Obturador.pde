class Pieza {
  int x, y;
  float v;
  
  Pieza(int posX, int posY){
    x=posX;
    y=posY;
  }
  
  boolean move(boolean opening){
    if(opening){
      if(v<100){
        v+=0.5;
      } else {
        return true;
      }
    } else {
      if(v>0){
        v-=0.5;
      } else {
        return true;
      }
    }
    return false;
  }
  
  void render(){
    translate(v,0);
    strokeWeight(2);
    stroke(0);
    fill(255);
    triangle(x,y,x-43,y+100,x+43,y+100);
  }
}

ArrayList<Pieza> piezas = new ArrayList<Pieza>();
boolean b = false, done = true, opening = true;
int bgc = 0;

void setup() {
  size(600, 800);
  piezas.add(new Pieza(0, 0));
}

void draw() {
  background(0);

  if (mousePressed && done) {
    b=true;
    if(done){
      opening=!opening;
    }
    done=false;
  }
  
  if(!done){
    if(opening && bgc <=255){
      bgc+=10;
    } else if (bgc >=0) {
      bgc-=10;
    }
  }
  
    pushMatrix();
    translate(width/2, height/2);
    for (int i=0; i<360; i+=45) {
      pushMatrix();
      rotate(radians(i));
      if(b){
      done = piezas.get(0).move(opening);
      }
      piezas.get(0).render();
      popMatrix();
    }
    noFill();
    stroke(255);
    strokeWeight(20);
    ellipse(0, 0,200,200);

    popMatrix();
}

void mousePressed(){
  
}

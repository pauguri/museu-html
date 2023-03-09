class Bola {
  int r, d, a=0;
  float m;
  color c;

  Bola(int radio, int dist, float multi, color col) {
    r=radio;
    d=dist;
    m=multi;
    c=col;
  }
  
  void move(){
    pushMatrix();
    translate(width/2,height/2);
    rotate(radians(a));
    noFill();
    stroke(c);
    strokeWeight(5);
    ellipse(0,d,r,r);
    popMatrix();
    a+=m;
  }

}


ArrayList<Bola> bolas = new ArrayList<Bola>();

void setup() {
  size(1280,720);
}

void draw() {
  background(0);

  bolas.add(new Bola(50, 200, 1, 255));
  bolas.add(new Bola(60, 200, 2, 220));
  bolas.add(new Bola(70, 200, 3, 175));
  bolas.add(new Bola(80, 200, 4, 125));
  bolas.add(new Bola(90, 200, 5, 75));
  bolas.add(new Bola(100, 200, 6, 40));
  bolas.get(0).move();
  bolas.get(1).move();
  bolas.get(2).move();
  bolas.get(3).move();
  bolas.get(4).move();
  bolas.get(5).move();
}

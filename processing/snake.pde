class Manzana{
  int x=0,y=0,jump=20;
  Manzana(){
    x=0;
    y=0;
  }
  
  void create(){
    x = floor(random(40))*20-20;
    y = floor(random(40))*20-20;
  }
  
  void display(){
    ellipse(x,y,jump,jump);
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
}

class Cuerpo{
  int x, y, jump=20, spd=20;
  int movex=1,movey=0,timer=0,lastx=0,lasty=0;
  
  Cuerpo(int i, int j){
    x=i;
    y=j;
  }
  
  void move(int childx, int childy){
    if(timer>=spd){
      x+=(jump*movex);
      y+=(jump*movey);
      if(x<0){
        x=width-jump;
      } else if(x>width-jump){
        x=0;
      }
      if(y<0){
        y=height-jump;
      } else if(y>width-jump){
        y=0;
      }
      
      timer=0;
    }
    timer++;
  }
  
  void chgdir(char d){
    switch(d){
      case 'w':
        movex=0;
        movey=movex==0&&movey==1?1:-1;
        break;
      case 's':
        movex=0;
        movey=movex==0&&movey==-1?-1:1;
        break;
      case 'a':
        movex=movey==0&&movex==1?1:-1;
        movey=0;
        break;
      case 'd':
        movex=movey==0&&movex==-1?-1:1;
        movey=0;
        break;
      default:
        break;
    }
  }
  
  void display(){
    rect(x,y,jump,jump);
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  int getDirX(){
    return movex;
  }
  
  int getDirY(){
    return movey;
  }
  
  int getLastX(){
    return lastx;
  }
  
  int getLastY(){
    return lasty;
  }
  
  void setDir(int dirx, int diry){
    movex=dirx;
    movey=diry;
  }
}


ArrayList<Cuerpo> cuerpos;
Manzana man = new Manzana();
int jump = 20;
boolean needsCreating=true;

void setup(){
  size(800,800);
  noStroke();
  colorMode(HSB);
  ellipseMode(CORNER);
  cuerpos= new ArrayList<Cuerpo>();
  
  cuerpos.add(new Cuerpo(0,0));
}

void draw(){
  background(0);

  if(needsCreating){
    man.create();
    needsCreating=false;
  }
  
  man.display();
  
  for (int i = cuerpos.size()-1; i >= 0; i--) { 
    Cuerpo cuerpo = cuerpos.get(i);
    cuerpo.move();
    cuerpo.display();
  }
  
  if(man.getX()==cuerpos.get(0).getX() && man.getY()==cuerpos.get(0).getY()){
    needsCreating=true;
    
    Cuerpo lastCuerpo = cuerpos.get(cuerpos.size()-1);
    int dirx=lastCuerpo.getDirX();
    int diry=lastCuerpo.getDirY();
    
    int newX=lastCuerpo.getX() + jump*dirx*-1;
    int newY=lastCuerpo.getY() + jump*diry*-1;
    
    cuerpos.add(new Cuerpo(newX,newY));
    cuerpos.get(cuerpos.size()-1).setDir(dirx,diry);
  }
}

void keyPressed(){
  for (int i = cuerpos.size()-1; i >= 0; i--) { 
    Cuerpo cuerpo = cuerpos.get(i);
    cuerpo.chgdir(key);
  }
}

color sandCol = color(255,255,0);
color waterCol = color(0,0,200);
color black = color(0);
color aux;
int x,y,timer;

void setup(){
  size(1280,720);
  noStroke();
  background(0);
}

void draw(){
  loadPixels();
  
  if(timer>0){
    timer--;
  }
  
  if(mousePressed==true){
    x = constrain(mouseX,10,width-11);
    y = constrain(mouseY,10,height-11);
    if(mouseButton==LEFT){
      
      
        for(int i=x-10;i<=x+10;i++){
          for(int j=y-10;j<=y+10;j++){
            if(pixels[j*width+i]==black){
              pixels[j*width+i]=sandCol;
            }
          }
        }       
      
    
    } else if(mouseButton==RIGHT){
      for(int i=x-10;i<=x+10;i++){
        for(int j=y-10;j<=y+10;j++){
          if(pixels[j*width+i]==black){
            pixels[j*width+i]=waterCol;
          }
        }
      }
    } else if(mouseButton==CENTER){
      for(int i=x-10;i<=x+10;i++){
        for(int j=y-10;j<=y+10;j++){
          if(pixels[j*width+i]!=black){
            pixels[j*width+i]=black;
          }
        }
      }
  }
  }
  
  for(int i=width*height-width*2-1;i>=0;i--){
    if(pixels[i]==sandCol){
      if((pixels[i+width]==black || pixels[i+width]==waterCol) && (pixels[i+width*2]==black || pixels[i+width*2]==waterCol)){
        aux=pixels[i+width*2];
        pixels[i+width*2]=sandCol;
        pixels[i]=aux;
      } else if(pixels[i+width]==black || pixels[i+width]==waterCol){
        aux=pixels[i+width];
        pixels[i+width]=sandCol;
        pixels[i]=aux;
      } else if(pixels[i+width-1]==black || pixels[i+width-1]==waterCol){
        aux=pixels[i+width-1];
        pixels[i+width-1]=sandCol;
        pixels[i]=aux;
      } else if(pixels[i+width+1]==black || pixels[i+width+1]==waterCol){
        aux=pixels[i+width+1];
        pixels[i+width+1]=sandCol;
        pixels[i]=aux;
      }
    }
    
    if(pixels[i]==waterCol){
      if(pixels[i+width]==black && pixels[i+width*2]==black){
        aux=pixels[i+width*2];
        pixels[i+width*2]=waterCol;
        pixels[i]=aux;
      } else if(pixels[i+width]==black){
        aux=pixels[i+width];
        pixels[i+width]=waterCol;
        pixels[i]=aux;
      } else if(pixels[i+width-1]==black){
        aux=pixels[i+width-1];
        pixels[i+width-1]=waterCol;
        pixels[i]=aux;
      } else if(pixels[i+width+1]==black){
        aux=pixels[i+width+1];
        pixels[i+width+1]=waterCol;
        pixels[i]=aux;
      }
      else if(i>0 && i <height*width-1){
        if(pixels[i-1]==black){
          if(pixels[i+1]==black){
            int rand = int(random(10)%2);
            aux=pixels[rand==1?(i+1):(i-1)];
            pixels[rand==1?(i+1):(i-1)]=waterCol;
            pixels[i]=aux;
          } else {
            aux=pixels[i-1];
            pixels[i-1]=waterCol;
            pixels[i]=aux;
          }
        } else if(pixels[i+1]==black){
          aux=pixels[i+1];
          pixels[i+1]=waterCol;
          pixels[i]=aux;
        }
      }
    }
  }
  
  updatePixels();
}

void mouseClicked(){
  loadPixels();
  if(timer>0){
        for(int i=0;i<width*height;i++){
          pixels[i]=black;
        }
      } else {
        timer=10;
      }
  updatePixels();
}

DraggableRect brightnessdrag, contrastdrag, rdrag, bdrag, gdrag;
//fileOpenBtn fileopen;
DragBar brightnessbar, contrastbar, rbar, bbar, gbar;

boolean dragbrightness, dragcontrast, dragr, dragb, dragg;

String imgPath;
PImage myimg;

float r, g, b;

void setup(){
  size(1300,750);
  
  dragbrightness = false;
  dragcontrast = false;
  dragr = false;
  dragb = false;
  dragg = false;
  
  Position initbar = new Position(15,0);
  brightnessbar = new DragBar(750, initbar, color(24,24,255));
  
  Position initcontrastbar = new Position(50,0);
  contrastbar = new DragBar(750, initcontrastbar, color(24,24,255));
  
  Position initrbar = new Position(85,0);
  rbar = new DragBar(750, initrbar, color(24,24,255));
  
  Position initgbar = new Position(120,0);
  gbar = new DragBar(750, initgbar, color(24,24,255));
  
  Position initbbar = new Position(155,0);
  bbar = new DragBar(750, initbbar, color(24,24,255));
  
  //Position initfileOpen = new Position(280,0);
  //fileopen = new fileOpenBtn(20,20,initfileOpen,color(255, 255, 128));
  
  Position initdragpos = new Position(5,375);
  brightnessdrag = new DraggableRect(15, 30,initdragpos,color(255), 750);
  
  Position initdragcontrast = new Position(40,375);
  contrastdrag = new DraggableRect(15,30, initdragcontrast, color(0), 750);
  
  Position initdragr = new Position(75,375);
  rdrag = new DraggableRect(15,30, initdragr, color(255,0,0), 750);
  
  Position initdragg = new Position(110,375);
  gdrag = new DraggableRect(15,30, initdragg, color(0,255,0), 750);
  
  Position initdragb = new Position(145,375);
  bdrag = new DraggableRect(15,30, initdragb, color(0,0,255), 750);
  
  imgPath = "surreal.jpg";
  myimg = loadImage(imgPath);
  
  image(myimg, 250,20);
  loadPixels();

  /*
  initbrightnessbar.change(30,0);
  initdragpos.change(30,0);
  contrastbar = new DragBar(280, initbrightnessbar, color(230, 247, 255));
  contrastdrag = new ContrastDrag(15, 30, initdragpos, color(0, 153, 153), 0);
  */
  
}
void draw(){
  fill(255);
  rect(0,0,1300,750);
  
  image(myimg,200,20);
  
  //fileopen.render();
  loadPixels();
  int i = 0;
  float bright = brightnessdrag.getScale();
  float contrast = contrastdrag.getScale();
  float rmod = rdrag.getScale();
  float gmod = gdrag.getScale();
  float bmod = bdrag.getScale();
  while(i < pixels.length){
    float[]rgbvals = new float[3];
    rgbvals[0] = (red(pixels[i])) * rmod;
    rgbvals[1] = (green(pixels[i])) * gmod;
    rgbvals[2] = (blue (pixels[i])) * bmod;
    for(int cval = 0; cval < rgbvals.length; cval++){
      if(rgbvals[cval] > 125){
        rgbvals[cval] *= contrast;
      }else{
        rgbvals[cval] /= contrast;
      }
    }
    color newColor = color(rgbvals[0] * bright, rgbvals[1] * bright, rgbvals[2] * bright); 
    pixels[i] = newColor;   
    i += 1;        
  }
  
  updatePixels();
  
  hover(brightnessdrag, dragbrightness, color(255));
  hover(contrastdrag, dragcontrast, color(0));
  hover(rdrag, dragr, color(255,0,0));
  hover(gdrag, dragg, color(0,255,0));
  hover(bdrag, dragb, color(0,0,255));
  
  brightnessbar.render();
  brightnessdrag.render();
  
  contrastbar.render();
  contrastdrag.render();
  
  rbar.render();
  rdrag.render();       
  
  gbar.render();
  gdrag.render();
  
  bbar.render();
  bdrag.render();
  
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  }
}

void hover(DraggableRect dragrect, boolean mouseover, color defaultcolor){
   if(mouseover){
    dragrect.setY(mouseY,0,735);
  }else{
    if(dragrect.mouseOver()){
       dragrect.changeColor(defaultcolor + color(10,10,10));
    }else{
      dragrect.changeColor(defaultcolor);
    }
  }
}

boolean dragged(DraggableRect dragrect, DragBar bar){
  if(dragrect.mouseOver() && mouseY < 735 && mouseY > 0){
    return true;
  }else if(bar.mouseOver()){
    dragrect.setY(mouseY, 0, 735);
    return false;
  }else{
    return false;
  }
}

void mousePressed(){
  dragbrightness = dragged(brightnessdrag, brightnessbar);
  dragcontrast = dragged(contrastdrag, contrastbar);
  dragr = dragged(rdrag, rbar);
  dragg = dragged(gdrag, gbar);
  dragb = dragged(bdrag, bbar);
}

void mouseReleased(){
   dragbrightness = false; 
   dragcontrast = false;
   dragr = false;
   dragg = false;
   dragb = false;
}

void keyPressed(){
  brightnessdrag.setY(random(0,750), 0, 735);
  contrastdrag.setY(random(0,750), 0, 735);
  rdrag.setY(random(0,750), 0, 735);
  gdrag.setY(random(0,750), 0, 735);
  bdrag.setY(random(0,750), 0, 735);
}
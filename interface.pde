public class DraggableRect{
   private float height;
   private float width;
   private color fill;
   private float screenOrigin;
   private float scale;
   public Position position;
   public DraggableRect(){}
   public DraggableRect(int height, int width, Position position, color fill, float screenHeight){
     this.height = height;
     this.width = width;
     this.fill = fill;
     this.screenOrigin = screenHeight;
     this.position = position;
   }
   public void render(){
     fill(this.fill);
     rect(this.position.getX(), this.position.getY(), this.width, this.height);
     fill(256);
   }
   public float getWidth(){return this.width;}
   public float getHeight(){return this.height;}
   public void setWidth(int width){this.width = width;}
   public void setHeight(int height){this.height = height;}
   public void changePos(Position position){
     this.position = position;
   }
   public void setX(float x){this.position.setX(x);}
   public void setY(float y, float bLimit, float uLimit){
     if(y < uLimit && y > bLimit){
       this.position.setY(y);
     }  
   }
   public void changeColor(color fill){ this.fill = fill; }
   public color getColor(){ return this.fill; }
   public boolean mouseOver(){
      return (mouseX > this.position.getX() && mouseX < this.position.getX() + this.getWidth()) && (mouseY > this.position.getY()-5 && mouseY < this.position.getY() + this.getHeight());
   }
   public void setScale(float scale){ this.scale = scale; }
   public float getScale(){
     try{
       this.scale = (this.screenOrigin / this.position.getY()) * 0.5;
     }catch(ArithmeticException e){
       this.scale = (this.screenOrigin / 0.1) * 0.5;
     }
     return this.scale;
   }
}

public class DragBar{
  private int height;
  public int width = 10;
  private Position position;
  private color fill;
  public DragBar(int height, Position position, color fill){
    this.height = height;
    this.position = position;
    this.fill = fill;
  }
  public int getHeight(){ return this.height; }
  public void setHeight(int height){
    this.height = height;
  }
  public void setPosition(Position position){
    this.position = position;
  }
  public void render(){
    fill(this.fill);
    rect(this.position.getX(), this.position.getY(),this.width,this.height);
    fill(256);
  }
  public boolean mouseOver(){
    return (mouseX > this.position.getX() && mouseX < this.position.getX() + 10) && (mouseY > this.position.getY()-5 && mouseY < this.position.getY() + this.getHeight());
  }
}

public class fileOpenBtn{
  private float height;
  private float width;
  private color fill;
  public Position position;
  public fileOpenBtn(float height, float width, Position position, color fill){
    this.height = height;
    this.width = width;
    this.fill = fill;
  }
  public float getHeight(){return this.height;}
  public float getWidth(){return this.width;}
  public void setColor(color fill){this.fill = fill;}
  public void render(){
    fill(this.fill);
    rect(this.position.getX(), this.position.getY(), this.width, this.height);
    fill(256);
  }
  public boolean mouseOver(){
    return (mouseX > this.position.getX() && mouseX < this.position.getX() + 10) && (mouseY > this.position.getY()-5 && mouseY < this.position.getY() + this.getHeight());
  }
}
/*
public class BrightnessDrag extends DraggableRect {
  private float brightness;
  public BrightnessDrag(int height, int width, Position position, color fill, float screenHeight){
    super(height, width, position, fill, screenHeight);
    this.brightness = (super.screenOrigin / super.position.getY()) * 0.5;
  }
  public void changeBrightness(float brightness){
    this.brightness = brightness;
  }
  public float getBrightness(){
    try{
      this.brightness = (super.screenOrigin / super.position.getY()) * 0.5;
    }catch(ArithmeticException e){
      this.brightness = (super.screenOrigin / 0.1) * 0.5;
    }
    return this.brightness;
  }
}

public class ContrastDrag extends DraggableRect {
  private float contrast;
  public ContrastDrag(int height, int width, Position position, color fill, float screenHeight){
    super(height, width, position, fill, screenHeight);
    this.contrast = (super.screenOrigin / super.position.getY()) * 0.5;
  }
  public void changeContrast(float contrast){
    this.contrast = contrast;
  }
  public float getContrast(){
    this.contrast=  (super.screenOrigin / super.position.getY()) * 0.5;
    return this.contrast;
  }
}

public class TempDrag extends DraggableRect {
  private Temperature temp;
  public TempDrag(int height, int width, Position position, color fill, float screenHeight){
    super(height, width, position, fill, screenHeight);
    this.temp = new Temperature(1,1);
  }
  public void changeTemp(float hot, float cold){
    this.temp.hot = hot;
    this.temp.cold = cold;
  }
  public Temperature getTemp(){
    return this.temp;
  }
}

class Temperature{
  public float hot;
  public float cold;
  public Temperature(float hot, float cold){
    this.hot = hot;
    this.cold = cold;
  }
}
*/
class Position{
  private float x;
  private float y;
  public Position(float x, float y){
    this.x = x;
    this.y = y;
  }
  public float getX(){ return this.x;}
  public float getY(){ return this.y;}
  public void setX(float x){ this.x = x;}
  public void setY(float y){ this.y = y;}
  public void change(float x, float y){
    this.x += x;
    this.y += y;
  }
  public void addPos(Position addPos){
    this.x += addPos.getX();
    this.y += addPos.getY();
  }
}
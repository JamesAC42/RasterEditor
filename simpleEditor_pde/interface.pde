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
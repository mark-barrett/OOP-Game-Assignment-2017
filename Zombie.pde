class Zombie extends GameObject
{
  PVector pos;
  float theta;
  PShape shape;
  int health;
  float speed;
  
  Zombie(float x, float y, float speed)
  {
    pos = new PVector(x, y);
    this.speed = speed;
    this.health = 100;
    create();
    
  }
  
  void create()
  {
    shape = createShape(GROUP);
    
    // Make two shapes
    PShape head = createShape(ELLIPSE, 0, 0, 50, 50);
    head.setFill(color(37, 142, 42));
    PShape arm = createShape(RECT, -35, 0, 15, 50, 7);
    arm.setFill(color(37, 142, 42));
    PShape arm2 = createShape(RECT, 20, 0, 15, 50, 7);
    arm2.setFill(color(37, 142, 42));
    PShape headWound = createShape();
    headWound.beginShape();
    headWound.vertex(15, 5);
    headWound.vertex(0,0);
    headWound.vertex(-5, -10);
    headWound.vertex(7, -20);
    headWound.endShape();
    headWound.setStroke(color(144, 25, 28));
    headWound.setFill(color(37, 142, 42));
    headWound.strokeWeight(5);
    PShape sleeve1 = createShape(RECT, -35, 0, 15, 15);
    PShape sleeve2 = createShape(RECT, 20, 0, 15, 15);
    sleeve1.setFill(color(235, 205, 164));
    sleeve2.setFill(color(235, 205, 164));
    
    shape.addChild(head);
    shape.addChild(arm);
    shape.addChild(arm2);
    shape.addChild(headWound);
    shape.addChild(sleeve1);
    shape.addChild(sleeve2);
  }
  
  void render()
  {
    
    shape(shape, pos.x, pos.y);
    update();
    
  }
  
  void update()
  {
    pos.x = lerp(pos.x, player1.pos.x, 0.005);
    pos.y = lerp(pos.y, player1.pos.y, 0.005);
    
  }
  
  
}
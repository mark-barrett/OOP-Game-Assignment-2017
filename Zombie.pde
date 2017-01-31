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
    head.setFill(color(63, 77, 22));
    PShape arm = createShape(RECT, -35, 0, 15, 50, 7);
    arm.setFill(color(63, 77, 22));
    PShape arm2 = createShape(RECT, 20, 0, 15, 50, 7);
    arm2.setFill(color(63, 77, 22));
    PShape headWound = createShape(TRIANGLE, 0, -50, -15, -25, 15, -25);
    headWound.setFill(color(231, 89, 126));
    PShape sleeve1 = createShape(RECT, -35, 0, 15, 15);
    PShape sleeve2 = createShape(RECT, 20, 0, 15, 15);
    sleeve1.setFill(color(235, 205, 164));
    sleeve2.setFill(color(235, 205, 164));
    
  }
  
  void render()
  {
    
    shape(shape, 0, 0);
    
  }
  
  void update()
  {
    
  }
  
  
}
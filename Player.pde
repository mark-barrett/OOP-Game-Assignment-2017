class Player extends GameObject
{
  PShape shape;
  char up, down, left, right, fire, reload;
  int health;
  int ammo;
  
  //Constructor
  Player(float x, float y, float size, char up, char down, char left, char right, char fire)
  {
    //Players intial position and size
    pos= new PVector(x, y);
    this.size = size;
    
    //Controls
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.fire = fire;
    this.health = 100;
    this.ammo = 100;
  }
  
  //Creates the player
  void create()
  {
    shape = createShape(GROUP);
    
    stroke(0);
    strokeWeight(3);
    fill(210, 177, 136);
    // Make two shapes
    PShape head = createShape(ELLIPSE, 0, 0, 50, 50);
    PShape arm1 = createShape(RECT, -35, 0, 15, 50, 7);
    PShape arm2 = createShape(RECT, 20, 0, 15, 50, 7);
    fill(0, 255, 0);
    PShape sleeve1 = createShape(RECT, -35, 0, 15, 15);
    PShape sleeve2 = createShape(RECT, 20, 0, 15, 15);
    
    // Add the two "child" shapes to the parent group
    shape.addChild(head);
    shape.addChild(arm1);
    shape.addChild(arm2);
    shape.addChild(sleeve1);
    shape.addChild(sleeve2);
  }
  
  //Renders the player to the screen
  void render()
  {
    // Draw the group
    translate(width/2, height/2);
    shape(shape);
  }
  
  //Updates parameters used for movements, firing, health etc
  void update()
  {
    
  }
}
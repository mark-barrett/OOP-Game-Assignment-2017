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
    
    
    // Make two shapes
    PShape head = createShape(ELLIPSE, 0, 0, 50, 50);
    PShape body = createShape(RECT, 0, 50, 50, 100);
    
    // Add the two "child" shapes to the parent group
    shape.addChild(head);
    shape.addChild(body);
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
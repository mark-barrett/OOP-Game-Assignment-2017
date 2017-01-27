class Player extends GameObject
{
  PShape shape;
  float theta;
  char up, down, left, right, fire, reload;
  int health;
  float power;
  int score;
  boolean speedPowerUp;
  
  //Constructor
  Player(float x, float y, float theta, float size, char up, char down, char left, char right, char fire)
  {
    //Players intial position and size
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.size = size;
    this.theta = theta;
    
    //Controls
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.fire = fire;
    this.health = 100;
    this.power = 2;
    this.score = 1000;
    this.speedPowerUp = false;
    create();
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
    pushMatrix();
    translate(pos.x, pos.y);
    // Draw the group
    rotate(theta);
    shape(shape, 0, 0);
    popMatrix();
  }
  
  //Updates parameters used for movements, firing, health etc
  void update()
  {
    forward.x = -sin(theta);
    forward.y = cos(theta);
    
    if(checkKey(up))
    {
      if(pos.x > width/2-450 && pos.x < (width/2-500) + 950)
      {
        if(pos.y > 120 && pos.y < 530) 
        {
          pos.add(PVector.mult(forward, power));
        }
      }
      
      if(pos.x < width/2-450)
      {
        pos.x += 1;
      }
      if(pos.x > (width/2-500) + 950)
      {
        pos.x -= 1;
      }
      
      if(pos.y < 120)
      {
        pos.y += 1;
      }
      
      if(pos.y > 530)
      {
        pos.y -= 1;
      }
    }
    if (checkKey(left))
    {
      theta -= 0.1f;   
    }
    if (checkKey(right))
    {
      theta += 0.1f;
    }
  }
}
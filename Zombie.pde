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
    forward = new PVector(0, -1);
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
    
    //If outside the room, move the zombie to the bottom of the screen where the barriers are
    if(pos.x < width/2-450 || pos.x > (width/2-500) + 950)
    {
      pos.y = lerp(pos.y, height-50, 0.005);
    }
    
    //If the zombie is at the bottom of the room get them to go through barrier 1
    if(pos.y > height-90)
    {
      pos.x = lerp(pos.x, barrier1.pos.x, 0.005);
    }
    
    //If the zombie is anywhere in front of the barrier, move them inside.
    if(pos.x < (barrier1.pos.x+100))
    {
      if(barrier1.damage > 0)
      {
        barrier1.damage -= 0.3;
      }
      else {
        pos.y = lerp(pos.y, barrier1.pos.y-100, 0.005);
      }
      println(barrier1.damage);
    }
    
    //If the zombie is inside, lerp to the players position
    if(pos.x > width/2-450 && pos.x < (width/2-500) + 950)
    {
      if(pos.y > 75 && pos.y < 575)
      {
        pos.x = lerp(pos.x, player1.pos.x, 0.005);
        pos.y = lerp(pos.y, player1.pos.y, 0.005);
      }
    }
    
    /* Loop through game objects and checking to see if a zombie is in the range of another.
    If it is then move it */
      //Check where zombies are.
  for(int i=gameObjects.size()-1; i >= 0; i--)
  {
    GameObject go = gameObjects.get(i);
    if(go instanceof Zombie) {
      Zombie z = (Zombie) go; //If it is indeed a player you can cast it
      
      if(pos.x < z.pos.x && pos.x > z.pos.x - 80) {
        pos.x--;
      }
      if(pos.x > z.pos.x && pos.x < z.pos.x + 80) {
        pos.x++;
      }

    }
  }
        
    
  }
  
  
}
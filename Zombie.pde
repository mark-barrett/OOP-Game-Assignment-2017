class Zombie extends GameObject
{
  PVector pos;
  float theta;
  PShape shape;
  int health;
  float speed;
  float random;
  int barrier;
  
  Zombie(float x, float y, float speed)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.speed = speed;
    this.health = 100;
    this.theta = 0;
    this.random = random(0,2);
    this.barrier = (int)random(2);
    create();
  }
  
  void create()
  {
    shape = createShape(GROUP);
    // Make two shapes
    PShape head = createShape(ELLIPSE, 0, 0, 50, 50);
    head.setFill(color(37, 142, 42));
    PShape arm = createShape(RECT, -35, 0, 15, -50, 7);
    arm.setFill(color(37, 142, 42));
    PShape arm2 = createShape(RECT, 20, 0, 15, -50, 7);
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
    PShape sleeve1 = createShape(RECT, -35, 0, 15, -15);
    PShape sleeve2 = createShape(RECT, 20, 0, 15, -15);
    sleeve1.setFill(color(235, 205, 164));
    sleeve2.setFill(color(235, 205, 164));
    
    shape.addChild(head);
    shape.addChild(arm);
    shape.addChild(arm2);
    shape.addChild(headWound);
    shape.addChild(sleeve1);
    shape.addChild(sleeve2);
    
       if(this.random > 0 && this.random <= 1)
   {
     zombieSound1.play();
   }
   if(this.random > 1 && this.random <= 2)
   {
     zombieSound2.play();
   }
   if(this.random > 2)
   {
     zombieSound3.play();
   }

   
  }
  
  void render()
  {
    if(this.health > 0)
    {
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(theta);
      shape(shape, 0, 0);
      fill(0, 255, 0);
      rect(-25, 30, health/2, 7);
      popMatrix();
    }
    update();
  }
  
  void update()
  {
    if(easterEgg.play == false)
    {
    forward.x = -sin(theta);
    forward.y = cos(theta);

    if(health < 0)
    {
      level.aliveZombies--;
      gameObjects.remove(this);
    }
    
    //If the zombie is in any other place apart form the gaps
    if(pos.x < barrier1.pos.x || pos.x > barrier1.pos.x + 150 && pos.x < barrier2.pos.x || pos.x < barrier2.pos.x + 150)
    {
      //If the zombie is against the wall
      if(pos.y < 650)
      {
        pos.y += 0.5;
      }
      if(pos.y < barrier1.pos.y)
      {
       pos.y -= 0.5; 
      }
      
    }
    /* Move towards player */
    if(pos.x > width/2-500 && pos.x < (width/2-500) + 1000 && pos.y > 75 && pos.y < 575)
    {
        theta = atan2(player1.pos.y - pos.y, player1.pos.x - pos.x) + HALF_PI;
        forward = new PVector(sin(theta), -cos(theta));    
        forward.normalize();
        pos.add(PVector.mult(forward, speed));
    }
    else {
       /* Move towards barrier 0 */
        if(this.barrier == 0)
        {
           theta = atan2(barrier1.pos.y - pos.y, barrier1.pos.x+50 - pos.x) + HALF_PI;
           forward = new PVector(sin(theta), -cos(theta));    
           forward.normalize();
           pos.add(PVector.mult(forward, speed));
        }
        else if(this.barrier == 1)
        {
           theta = atan2(barrier2.pos.y - pos.y, barrier2.pos.x+50 - pos.x) + HALF_PI;
           forward = new PVector(sin(theta), -cos(theta));    
           forward.normalize();
           pos.add(PVector.mult(forward, speed));
        }
    }
   
    
    
    /* Loop through game objects and checking to see if a zombie is in the range of another.
    If it is then move it */
      //Check where zombies are.
  for(int i=gameObjects.size()-1; i >= 0; i--)
  {
    GameObject go = gameObjects.get(i);
    if(go instanceof Bullet) {
     Bullet b = (Bullet) go;
     if(b.pos.x > pos.x-50 && b.pos.x < pos.x + 50)
     {
       if(b.pos.y > pos.y-50 && b.pos.y < pos.y + 50)
       {
        health -= 10; 
        player1.score += 10;
        gameObjects.remove(b);
        PVector bp = PVector.add(pos, PVector.mult(forward, 40));
        Blood blood = new Blood(bp.x, bp.y, theta, 20, 0.1);
        gameObjects.add(blood);      
        
       }
    }
    }
    
    //Check if the zombie hits another zombie
    if(go instanceof Zombie) {
      Zombie z = (Zombie) go;
      //Collosions with each other
      if(dist(pos.x, pos.y, z.pos.x, z.pos.y) < 50)
      {

      }

    }
  }
    }
    else if(easterEgg.play == true) {

    }
    
  }
  
 } 
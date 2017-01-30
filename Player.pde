class Player extends GameObject
{
  PShape notHoldingGun;
  PShape holdingGun;
  float theta;
  char up, down, left, right, fire, reload;
  int health;
  float power;
  int score;
  boolean speedPowerUp;
  float ammo;
  float fireRate = 1.8;
  float colttoPass = 1.0 / fireRate;
  float mp40toPass = 1.0/5;
  float elapsed = colttoPass;
  int activeGun;
  
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
    this.power = 3;
    this.score = 3000;
    this.speedPowerUp = false;
    this.ammo = 20;
    this.fire = 'e';
    this.activeGun = 0;
    create();
  }
  
  //Creates the player
  void create()
  {
    notHoldingGun = createShape(GROUP);
    
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
    notHoldingGun.addChild(head);
    notHoldingGun.addChild(arm1);
    notHoldingGun.addChild(arm2);
    notHoldingGun.addChild(sleeve1);
    notHoldingGun.addChild(sleeve2);
    
    holdingGun = createShape(GROUP);
    
    stroke(0);
    strokeWeight(3);
    fill(210, 177, 136);
    
    // Make two shapes
    PShape head2 = createShape(ELLIPSE, 0, 0, 50, 50);
    PShape arm12 = createShape();
    arm12.beginShape();
    arm12.vertex(-40, 0);
    arm12.vertex(-10, 50);
    arm12.vertex(0, 50);
    arm12.vertex(-25, 0);
    arm12.endShape(CLOSE);
    
    PShape arm22 = createShape();
    arm22.beginShape();
    arm22.vertex(25, 0);
    arm22.vertex(0, 50);
    arm22.vertex(10, 50);
    arm22.vertex(40, 0);
    arm22.endShape(CLOSE);
    
    fill(0, 255, 0);
    PShape sleeve12 = createShape(RECT, -35, 0, 10, 10);
    PShape sleeve22 = createShape(RECT, 25, 0, 10, 10);
    
    // Add the two "child" shapes to the parent group
    holdingGun.addChild(head2);
    holdingGun.addChild(arm12);
    holdingGun.addChild(arm22);
    holdingGun.addChild(sleeve12);
    holdingGun.addChild(sleeve22);
    
  }
  
  //Renders the player to the screen
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    // Draw the group
    rotate(theta);
    
    if(colt.bought == true)
    {
      shape(holdingGun, 0, 0);
    }
    else if(mp40.bought == true)
    {
      shape(holdingGun, 0, 0);
    }
    else
    {
      shape(notHoldingGun, 0, 0);
    }
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
    
    if(checkKey('r'))
    {  
      if(colt.bought == true && mp40.bought == true)
      {
        if(player1.activeGun == 1)
        {
          player1.activeGun = 2;
          ammo = mp40.ammo;
        }
        else if(player1.activeGun == 2) {
          player1.activeGun = 1;
          ammo = colt.ammo;
        }
      }
    }
    
    println(player1.activeGun);
    
    //If the m1190 is to be fired
    if(checkKey(fire) && elapsed > colttoPass && player1.activeGun == 1 && colt.bought == true)
    {
      if(colt.ammo > 0)
      {
        PVector bp = PVector.add(pos, PVector.mult(forward, 40));
        Bullet b = new Bullet(bp.x, bp.y, theta, 20, 5);
        gameObjects.add(b);
        elapsed = 0;
        pistolFire.play();
        colt.ammo--;
      }
      else if(colt.ammo == 0)
      {
        emptyGunShot.play();
      }
    }
    
    //If the mp40 is to be fired
    if(checkKey(fire) && elapsed > mp40toPass && player1.activeGun == 2 && mp40.bought == true)
    {
      if(mp40.ammo > 0)
      {
        PVector bp = PVector.add(pos, PVector.mult(forward, 40));
        Bullet b = new Bullet(bp.x, bp.y, theta, 20, 5);
        gameObjects.add(b);
        elapsed = 0;
        pistolFire.play();
        mp40.ammo--;
      }
      else if(mp40.ammo == 0)
      {
        emptyGunShot.play();
      }
    }
    elapsed += timeDelta;
  }
}
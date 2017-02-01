class Barrier extends GameObject
{
  PShape fullStrength;
  PShape halfStrength;
  PShape lowStrength;
  float damage;
  char buyKey;
  boolean bought;
  
  Barrier(float x, float y)
  {
    pos = new PVector(x, y);
    this.damage = 60;
    this.buyKey = 'q';
    this.bought = false;
    create();
  }
  
  void create()
  {
    //Full strength barrier
    fullStrength = createShape();
    fullStrength.beginShape();
    fullStrength.vertex(0,0);
    fullStrength.vertex(150, 6);
    fullStrength.vertex(150, -15);
    fullStrength.vertex(100, -6);
    fullStrength.vertex(0, -15);
    fullStrength.endShape(CLOSE);
    fullStrength.setFill(color(172, 115, 57));
    
    //Half strength barrier
    halfStrength = createShape();
    halfStrength.beginShape();
    halfStrength.vertex(0, 0);
    halfStrength.vertex(100, -3);
    halfStrength.vertex(150, 4);
    halfStrength.vertex(150, -10);
    halfStrength.vertex(100, -6);
    halfStrength.vertex(0, -10);
    halfStrength.endShape(CLOSE);
    halfStrength.setFill(color(172, 115, 57));
    
    //Low strength barrier
    lowStrength = createShape();
    lowStrength.beginShape();
    lowStrength.vertex(0, 0);
    lowStrength.vertex(100, -6);
    lowStrength.vertex(150, -6);
    lowStrength.vertex(150, -2);
    lowStrength.vertex(0, -6);
    lowStrength.endShape(CLOSE);
    lowStrength.setFill(color(172, 115, 57));
    
  }
  
  void render()
  {
    if(damage > 40)
    {
      shape(fullStrength, pos.x, pos.y);
    }
    else if(damage < 60 && damage > 20)
    {
      shape(halfStrength, pos.x, pos.y);
    }
    else if(damage < 40 && damage > 0)
    {
      shape(lowStrength, pos.x, pos.y);
    }
    update();
  }
  
  void update()
  {
    if(player1.pos.x > pos.x && player1.pos.x < pos.x+150)
    {
      if(player1.pos.y > pos.y-50 && player1.pos.y < pos.y)
      {
        if(this.damage < 60)
        {
         textSize(30);
         fill(255, 255, 0);
         text("Press Q to rebuild barrier", width/2-130, height/2); 
         
         if(bought == false)
         {
           if (checkKey(this.buyKey))
           {
               player1.score += 100;
               this.damage += 20;
               this.bought = true;
               spendMoney.play();
               hammer.play();
           }
         }
        }
      }

    }
    if(frameCount % 120 == 0 && this.bought == true)
    {
     this.bought = false; 
    }
    
    
  }
  
}
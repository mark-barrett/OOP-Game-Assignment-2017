class Barrier extends GameObject
{
  PShape fullStrength;
  PShape halfStrength;
  PShape lowStrength;
  float damage;
  
  Barrier(float x, float y)
  {
    super.pos.x = x;
    super.pos.y = y;
    this.damage = 100;
    create();
  }
  
  void create()
  {
    //Full strength barrier
    fullStrength.beginShape();
    fullStrength.vertex(0,0);
    fullStrength.vertex(150, 4);
    fullStrength.vertex(150, -10);
    fullStrength.vertex(100, -6);
    fullStrength.vertex(0, -10);
    fullStrength.endShape(CLOSE);
    fullStrength.setFill(color(172, 115, 57));
    
    //Half strength barrier
    halfStrength.beginShape();
    halfStrength.vertex(0, 0);
    halfStrength.vertex(100, -30);
    halfStrength.vertex(150, 4);
    halfStrength.vertex(150, -10);
    halfStrength.vertex(100, -6);
    halfStrength.vertex(0, -10);
    halfStrength.endShape(CLOSE);
    halfStrength.setFill(color(172, 115, 57));
    
    //Low strength barrier
    lowStrength.beginShape();
    lowStrength.vertex(0, 0);
    lowStrength.vertex(100, -2);
    lowStrength.vertex(150, -3);
    lowStrength.vertex(150, -6);
    lowStrength.vertex(0, -6);
    lowStrength.setFill(color(172, 115, 57));
    
  }
  
  void render()
  {
    if(damage > 66)
    {
      shape(fullStrength, super.pos.x, super.pos.y);
    }
    else if(damage < 66 && damage > 33)
    {
      shape(halfStrength, super.pos.x, super.pos.y);
    }
    else if(damage < 33 && damage > 1)
    {
      shape(lowStrength, super.pos.x, super.pos.y);
    }
  }
  
  void update()
  {
    
  }
  
}
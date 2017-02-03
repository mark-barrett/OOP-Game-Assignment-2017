class Bullet extends GameObject
{
  float timeToLive;
  float theta;
  float alive;
  float speed = 3;
  boolean active;
  
  Bullet(float x, float y, float theta, float size, float timeToLive)
  {
    pos = new PVector(x, y);
    forward = new PVector(0,1);
    this.theta = theta;
    this.size = size;
    this.timeToLive = timeToLive;
    this.alive = 0;
    this.active = true;
  }
  
  void render()
  {
    if(active == true)
    {
      pushMatrix();
      translate((pos.x+(forward.x*30))-5, pos.y+(forward.y*30));
      rotate(theta);
      fill(156, 156, 156);
      rect(0, 0, 4, 6);
      popMatrix();
      update(); 
    }
  }
  
  void update()
  {
    forward.x = -sin(theta);
    forward.y = cos(theta);
    pos.add(PVector.mult(PVector.mult(forward, speed), 5));
  }
  
  

}
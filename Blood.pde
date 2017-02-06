class Blood extends GameObject
{
  float timeToLive;
  float theta;
  float alive;
  float speed = 3;
  boolean active;
  float elapsed;
  float splatHeight;
  float splatWidth;
  
  
  Blood(float x, float y, float theta, float size, float timeToLive)
  {
    pos = new PVector(x, y);
    forward = new PVector(0,1);
    this.theta = theta;
    this.size = size;
    this.timeToLive = timeToLive;
    this.alive = 0;
    this.active = true;
    this.elapsed = 0;
    this.splatHeight = random(10, 60);
    this.splatWidth = random(3, 50);
  }
  
  void render()
  {
    pushMatrix();
    translate((pos.x+(forward.x*30))-5, pos.y+(forward.y*30));
    rotate(theta);
    fill(255, 0, 0);
    noStroke();
    ellipse(0, 0, this.splatWidth, this.splatHeight);
    popMatrix();
    if(elapsed < timeToLive) {
    update(); 
    }
    elapsed += timeDelta;
    
    if(elapsed > 10)
    {
      gameObjects.remove(this);
    }
    
  }
  
  void update()
  {
    forward.x = -sin(theta);
    forward.y = cos(theta);
    pos.add(PVector.mult(PVector.mult(forward, speed), 5));
  }
  
  

}
class Nuke
{
  PShape shape;
  PShape tail;
  PShape body;
  PVector pos;
  boolean used;
  
  Nuke()
  {
    pos = new PVector(random(width/2-400, (width/2-500)+800), random(120, 500));
    shape = createShape(GROUP);
    
    tail = createShape();
    tail.beginShape();
    tail.vertex(0, 0);
    tail.vertex(-20, -20);
    tail.vertex(-20, 20);
    tail.endShape(CLOSE);
    
    tail.setFill(color(255, 255, 0));
    body = createShape(ELLIPSE, 40, 0, 80, 30);
    body.setFill(color(255, 255, 0));
    
    shape.addChild(tail);
    shape.addChild(body);
    this.used = false;
  }
  
  void render()
  {
    shape(shape, this.pos.x, this.pos.y);
    update();
  }
  
  void update()
  {
    if(dist(pos.x, pos.y, player1.pos.x, player1.pos.y) < 80 && this.used == false)
    {
      this.used = true;
      
      //Loop through the gameObjects deleting zombies and creating explosions.
      for(int i = 0; i<gameObjects.size(); i++)
      {
         GameObject go = gameObjects.get(i);
         if(go instanceof Zombie) {
          Zombie z = (Zombie) go;
          level.aliveZombies--;
          gameObjects.remove(z);
          player1.score += 100;
         }
      }
      bomb.play();
      this.used = true;
    }
  }
}
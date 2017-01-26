class PowerUp extends GameObject
{
  PShape shape;
  float price;
  char buyKey;
  boolean bought;
  
  PowerUp(float price, char buyKey, color boxColour, color panelColour)
  {
    this.price = price;
    this.buyKey = buyKey;
    this.bought = false;
    create(boxColour, panelColour);
  }
  
  void create(color boxColour, color panelColour)
  {
    shape = createShape(GROUP);
    
    strokeWeight(2);
    //Creating the perk shape
    fill(boxColour);
    PShape box = createShape(RECT, 0, 0, 150, 35, 2);
    fill(panelColour);
    PShape frontLeft = createShape(RECT, 5, 35, 67.5, 10);
    PShape frontRight = createShape(RECT, 77.5, 35, 67.5, 10);
   
    shape.addChild(box);
    shape.addChild(frontLeft);
    shape.addChild(frontRight);
  }
  
  void render(String name, float posx, float posy)
  {
    shape(shape, posx, posy);
    //Speed Cola
    fill(255);
    textFont(perkFont);
    textSize(30);
    text(name, posx+20, posy+25);
    textFont(zombieFont);
  }
  
  void update()
  {
    
  }
  
}
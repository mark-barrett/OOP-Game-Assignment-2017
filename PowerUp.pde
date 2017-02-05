class PowerUp extends GameObject
{
  PShape shape;
  float price;
  char buyKey;
  boolean bought;
  String name;
  
  PowerUp(float price, char buyKey, color boxColour, color panelColour, String name)
  {
    this.price = price;
    this.buyKey = buyKey;
    this.bought = false;
    this.name = name;
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
    
    if(name == "Double Tap")
    {
      PShape frontLeft = createShape(RECT, 5, -10, 67.5, 10);
      PShape frontRight = createShape(RECT, 77.5, -10, 67.5, 10);
      shape.addChild(frontLeft);
      shape.addChild(frontRight);
    }
    else 
    {
      PShape frontLeft = createShape(RECT, 5, 35, 67.5, 10);
      PShape frontRight = createShape(RECT, 77.5, 35, 67.5, 10);
      shape.addChild(frontLeft);
      shape.addChild(frontRight);
    }
    shape.addChild(box);
  }
  
  void render(String name, float posx, float posy)
  {
    shape(shape, posx, posy);
    //Speed Cola
    fill(255);
    textFont(perkFont);
    if(this.name == "Double Tap")
    {
    textSize(15);
    }
    else {
      textSize(30);
    }
    text(name, posx+20, posy+25);
    textFont(zombieFont);
  }
  
  void update()
  {
    
  }
  
}
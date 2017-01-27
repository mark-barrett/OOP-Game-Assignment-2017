class Colt extends Gun
{
  PShape shape;
  
  Colt(float price, char buyKey)
  {
    super(price, buyKey);
    create();
  }
  
  void create()
  {
    shape = createShape(GROUP);
    
    strokeWeight(2);
    //Creating the perk shape
    fill(153, 153, 153);
    PShape gun = createShape(RECT, 0, 0, 10, 50);
    fill(153, 102, 51);
    PShape crossHair = createShape(RECT, 3, 3, 3, 10);
   
    shape.addChild(gun);
    shape.addChild(crossHair);

  }
  
  void render()
  {
    if(super.bought == true)
    {
      pushMatrix();
      rotate(player1.theta/100);
      shape(shape, player1.pos.x-5, player1.pos.y+20);
      popMatrix();
    }
  }
}
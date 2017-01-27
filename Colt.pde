class Colt extends Gun
{
  PShape shape;
  
  Colt(float price, char buyKey)
  {
    super(price, buyKey);
    create();
    super.bought = false;
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
      translate(player1.pos.x, player1.pos.y);
      rotate(player1.theta);
      shape(shape, -5, 30);
      popMatrix();
    }
    update();
  }
  
  //Check for purchase
  void update()
  {
    if(player1.pos.y > height/2-20 && player1.pos.y < height/2-20 + 42)
    {
      println("hey");
    }
    
  }
}
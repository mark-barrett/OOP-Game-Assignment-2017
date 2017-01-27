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
    if(player1.pos.y > height/2-25 && player1.pos.y < height/2-20 + 47)
    {
      if(player1.pos.x > 1050 && player1.pos.x < 1133)
      {
        textSize(30);
        fill(255, 255, 0);
        if(this.bought == false)
        {
          text("Press Q to buy Colt M1911 [Cost: 1000]", width/2-200, height/2);
          if (checkKey(super.buyKey))
          {
            if(player1.score >= 1000)
            {
            player1.score -= super.price;
            this.bought = true;
            spendMoney.play();
            reload.play();
            }
          }
        }
        else {
          text("Press Q to buy Ammo [Cost: 500]", width/2-200, height/2);
        }
      }
    }
    
  }
}
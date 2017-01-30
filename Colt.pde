class Colt extends Gun
{
  PShape shape;
  boolean bought;
  float ammo;
  
  Colt(float price, char buyKey)
  {
    super(price, buyKey);
    create();
    this.bought = false;
    this.ammo = 20;
  }
  
  void create()
  {
    shape = createShape(GROUP);
    
    strokeWeight(2);
    //Creating the gun shape
    fill(153, 153, 153);
    PShape gun = createShape(RECT, 0, 0, 10, 50);
    fill(153, 102, 51);
    PShape crossHair = createShape(RECT, 3, 3, 3, 10);
   
    shape.addChild(gun);
    shape.addChild(crossHair);

  }
  
  void render()
  {
    if(this.bought == true && player1.activeGun == 1)
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
    textFont(zombieFont);
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
            player1.activeGun = 1;
            this.bought = true;
            spendMoney.play();
            reload.play();
            player1.ammo = ammo;
            }
          }
        }
        else {
          text("Press Q to buy Ammo [Cost: 500]", width/2-200, height/2);
          if (checkKey(super.buyKey))
          {
            if(player1.score >= 500 && player1.ammo == 0)
            {
             player1.score -= 500;
             ammo += 20;
             spendMoney.play();
             reload.play();
            }
          }
        }
      }
    }
    
  }
}
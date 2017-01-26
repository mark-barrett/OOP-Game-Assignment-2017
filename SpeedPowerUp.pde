class SpeedPowerUp extends GameObject implements PowerUp {
  
  PShape shape;
  float price;
  char buyKey;
  boolean bought;
  
  SpeedPowerUp(float price, char buyKey)
  {
    this.price = price;
    this.buyKey = buyKey;
    this.bought = false;
    create();
  }
  
  void applyTo(Player p)
  {
    p.speedPowerUp = true;
    p.score -= this.price;
  }
  
  void create()
  {
    shape = createShape(GROUP);
    
    strokeWeight(2);
    //Creating the perk shape
    fill(151, 82, 0);
    PShape box = createShape(RECT, 0, 0, 150, 35, 2);
    fill(186, 192, 140);
    PShape frontLeft = createShape(RECT, 5, 35, 67.5, 10);
    PShape frontRight = createShape(RECT, 77.5, 35, 67.5, 10);
   
    shape.addChild(box);
    shape.addChild(frontLeft);
    shape.addChild(frontRight);
  }
  
  void render()
  {
    shape(shape, 250, 80);
    //Speed Cola
    fill(255);
    textFont(perkFont);
    textSize(30);
    text("Stamin-up", 270, 105);
    textFont(zombieFont);
  }
  
  void update()
  {
    if(player1.pos.x > 250 && player1.pos.x < 400)
    {
      if(player1.pos.y > 80 && player1.pos.y < 180)
      {
        textSize(30);
        fill(255, 255, 0);
        text("Press Q to buy Stamin-up [Cost: 500]", width/2-200, height/2);
      }
    }
    
    if(bought == false)
    {
      if (checkKey(buyKey))
      {
        if(player1.score >= 500)
        {
          player1.score -= 500;
          bought = true;
          spendMoney.play();
          player1.power += 4;
        }
      }
    }
    else if(bought == true)
    {
      fill(151, 82, 0);
      rect(10, 500, 50, 50);
      fill(255);
      textSize(40);
      text("S", 20, 500);
    }
  }
}
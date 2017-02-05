class DoubleTapPowerUp extends PowerUp
{
  boolean bought;
  
  DoubleTapPowerUp(float price, char buyKey, color boxColour, color panelColour, String name)
  {
    super(price, buyKey, boxColour, panelColour, name);
    this.bought = false;
  }
  
  void render()
  {
    super.render("Double Tap Root Beer", width/2-75, 535);
  }
  
  void update()
  {
    if(player1.pos.x > width/2-75 && player1.pos.x < (width/2-75+150))
    {
      if(player1.pos.y > 490 && player1.pos.y < 545)
      {
        textSize(30);
        fill(255, 255, 0);
        text("Press Q to buy Double Tap Root Beer [Cost: 2000]", width/2-200, height/2);
        if(this.bought == false)
        {
          if (checkKey(super.buyKey))
          {
            if(player1.score >= 2000)
            {
            player1.score -= super.price;
            this.bought = true;
            spendMoney.play();
            player1.mp40toPass = 1.0/10;
            perk.play();
            }
          }
        }
      }
    }
    if(this.bought == true)
    {
      fill(0, 153, 255);
      rect(10, 440, 50, 50);
      fill(255);
      textFont(perkFont);
      textSize(40);
      text("D", 25, 480);
      textFont(zombieFont);
    }
  }
}
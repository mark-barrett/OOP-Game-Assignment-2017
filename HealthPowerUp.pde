class HealthPowerUp extends PowerUp
{
  boolean bought;
  
  HealthPowerUp(float price, char buyKey, color boxColour, color panelColour, String name)
  {
    super(price, buyKey, boxColour, panelColour, name);
    this.bought = false;
  }
  
  void render()
  {
    super.render("Juggernog", 875, 80);
  }
  
  void update()
  {
    if(player1.pos.x > 875 && player1.pos.x < 1025)
    {
      if(player1.pos.y > 80 && player1.pos.y < 180)
      {
        textSize(30);
        fill(255, 255, 0);
        text("Press Q to buy Juggernog [Cost: 500]", width/2-200, height/2);
        if(this.bought == false)
        {
          if (checkKey(super.buyKey))
          {
            if(player1.score >= 500)
            {
            player1.score -= super.price;
            this.bought = true;
            spendMoney.play();
            player1.health += 100;
            perk.play();
            }
          }
        }
      }
    }
    if(this.bought == true)
    {
      fill(204, 204, 0);
      rect(10, 500, 50, 50);
      fill(255);
      textFont(perkFont);
      textSize(40);
      text("J", 25, 535);
      textFont(zombieFont);
    }
  }
}
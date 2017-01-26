class SpeedPowerUp extends PowerUp {
  
  SpeedPowerUp(float price, char buyKey, color boxColour, color panelColour)
  {
    super(price, buyKey, boxColour, panelColour);
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
    
    if(super.bought == false)
    {
      if (checkKey(super.buyKey))
      {
        if(player1.score >= 500)
        {
          player1.score -= 500;
          super.bought = true;
          spendMoney.play();
          player1.power += 4;
        }
      }
    }
    else if(super.bought == true)
    {
      fill(151, 82, 0);
      rect(10, 500, 50, 50);
      fill(255);
      textFont(perkFont);
      textSize(40);
      text("S", 25, 535);
      textFont(zombieFont);
    }
  }
}
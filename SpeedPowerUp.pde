class SpeedPowerUp extends PowerUp 
{
  boolean bought;
  
  SpeedPowerUp(float price, char buyKey, color boxColour, color panelColour, String name)
  {
    super(price, buyKey, boxColour, panelColour, name);
    this.bought = false;
  }
  
  void render()
  {
    super.render("Stamin-up", 250, 80);
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
        
    //Check only if it is not bought
    if(this.bought == false)
    {
      //If the key is pressed
      if (checkKey(super.buyKey))
      {
        //Check the player has enough money
        if(player1.score >= 500)
        {
          //Deducted money
          player1.score -= super.price;
          //Say they have bought it
          this.bought = true;
          //Play sound
          spendMoney.play();
          //Give perk
          player1.power += 4;
          perk.play();
        }
      }
    }
    }
    }
    if(this.bought == true)
    {
      fill(151, 82, 0);
      rect(75, 500, 50, 50);
      fill(255);
      textFont(perkFont);
      textSize(40);
      text("S", 88, 535);
      textFont(zombieFont);
    }
  }
}
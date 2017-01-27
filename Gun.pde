class Gun extends GameObject
{
  float price;
  char buyKey;
  boolean bought;
  
  Gun(float price, char buyKey)
  {
    this.price = price;
    this.buyKey = buyKey;
    this.bought = true;
  }
  
  void update()
  {
  }
  
  void render()
  {
  }
  
}
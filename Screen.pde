class Screen
{
  //Number corrosponding to particular screen.
  int screen;
  
  //Parameterised constructor. When the object is created the particular screen is set.
  Screen(int screen) {
    this.screen = screen;
  }
  
  //Draw the screen
  void render()
  {
    //If the loading screen is to be displayed
    if(this.screen == 1) {
      
    }
    
    //If the menu is to be displayed
    if(this.screen == 2) {
      background(0);
      stroke(255);
      textSize(100);
      fill(255, 0, 0);
      text("R",480,200);
      text("O",560,200);
      text("F",660,200);
      text("L",740,200);
      textSize(30);
      text("Ripped Off Frontal Lobe", 500, 240);
      
      fill(0);
      strokeWeight(4);
      stroke(255, 0, 0);
      rect(490, 280, 285, 60);
      fill(255, 0, 0);
      textSize(40);
      text("New Game", 555, 323);
      
      
      //Credit text
      textSize(20);
      text("By Mark Barrett", 1130, 620);
    }
    
  }
}
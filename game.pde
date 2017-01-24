void setup()
{
  size(1280,650, P3D);
  
  //Create fonts
  PFont zombieFont;
  zombieFont = createFont("Remains.ttf", 100);
  textFont(zombieFont);
}

//Start by instialising the screen to the menu
Screen screen = new Screen(1);

void draw()
{
  //Keep drawing the screen
  screen.render();
}
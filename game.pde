void setup()
{
  size(1280,650, P3D);
  
  //Create fonts
  PFont zombieFont;
  zombieFont = createFont("Remains.ttf", 100);
  textFont(zombieFont);
  
  //Creating sounds
  buttonPressSound = new SoundFile(this, "buttonPress.mp3");
  
  //Create player(s)
  player1 = new Player(200, 200, 20, 20, 'w', 's', 'a', 'd', 'e');
  gameObjects.add(player1);
  
}

import processing.sound.*;

//Start by instialising the screen to the menu
Screen screen = new Screen(3);

//Declaring sounds
SoundFile buttonPressSound;

Player player1;

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

boolean[] keys = new boolean[1000];

void draw()
{
  //Keep drawing the screen
  screen.render();
  player1.render();
  player1.update();
}

void mousePressed()
{
  //If the new game button is pressed
  if(mouseX > 490 && mouseX < 775 && screen.screen == 2)
  {
    if(mouseY > 280 && mouseY < 340 && screen.screen == 2)
    {
      buttonPressSound.play();
      screen.screen = 3;
    }
  }
  
  //If the load game button is pressed
  if(mouseX > 490 && mouseX < 775 && screen.screen == 2)
  {
    if(mouseY > 360 && mouseY < 420 && screen.screen == 2)
    {
      buttonPressSound.play();
    }
  }
}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}
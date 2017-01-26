void setup()
{
  size(1280,650, P3D);
  
  //Create fonts
  zombieFont = createFont("Remains.ttf", 100);
  perkFont = createFont("AirstreamNF.ttf", 25);
  defaultFont = createFont("arial.ttf", 25);
  textFont(zombieFont);
  
  //Creating sounds
  buttonPressSound = new SoundFile(this, "buttonPress.mp3");
  spendMoney = new SoundFile(this, "spendMoney.mp3");
  
  //Create player(s)
  player1 = new Player(width/2, height/2+100, 20, 20, 'w', 's', 'a', 'd', 'e');
  gameObjects.add(player1);
  
  //Create perks
  speed = new SpeedPowerUp(200, 'q', color(151, 82, 0), color(186, 192, 140));
  gameObjects.add(speed);
  
}

import processing.sound.*;

//Start by instialising the screen to the menu
Screen screen = new Screen(3);

//Declaring sounds
SoundFile buttonPressSound;
SoundFile spendMoney;

//Player
Player player1;

//Perks
SpeedPowerUp speed;

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

//Fonts
PFont zombieFont;
PFont perkFont;
PFont defaultFont;

boolean[] keys = new boolean[1000];

void draw()
{
  //Keep drawing the screen
  screen.render();
  
  if(screen.screen == 3) {
    player1.render();
    player1.update();
    speed.render();
    speed.update();
  }
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
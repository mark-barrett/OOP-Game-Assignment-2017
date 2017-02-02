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
  reload = new SoundFile(this, "reload.mp3");
  pistolFire = new SoundFile(this, "pistolFire.mp3");
  emptyGunShot = new SoundFile(this, "emptyGunShot.wav");
  mp40reload = new SoundFile(this, "mp40reload.wav");
  mp40fire = new SoundFile(this, "mp40fire.wav");
  ambience = new SoundFile(this, "ambience.wav");
  hammer = new SoundFile(this, "hammer.wav");
  
  //Create player(s)
  player1 = new Player(width/2, height/2+100, 20, 20, 'w', 's', 'a', 'd', 'e');
  gameObjects.add(player1);
  
  //Create perks
  speed = new SpeedPowerUp(500, 'q', color(151, 82, 0), color(186, 192, 140));
  gameObjects.add(speed);
  
  health = new HealthPowerUp(500, 'q', color(204, 204, 0), color(186, 192, 140));
  gameObjects.add(health);
  
  //Guns
  colt = new Colt(1000, 'q');
  gameObjects.add(colt);
  
  mp40 = new MP40(2000, 'q');
  gameObjects.add(mp40);
  
  //Barriers
  barrier1 = new Barrier(width/2-300, 560);
  gameObjects.add(barrier1);
  barrier2 = new Barrier(width/2+150, 560);
  gameObjects.add(barrier2);
  
  //Zombies
  zombie1 = new Zombie(width/2+200, height, 0.5);
  gameObjects.add(zombie1);
  
  zombie2 = new Zombie(width/2+250, height, 0.5);
  gameObjects.add(zombie2);
  
  zombie3 = new Zombie(width/2+300, height, 0.5);
  gameObjects.add(zombie3);
  
  
}

import processing.sound.*;

//Start by instialising the screen to the menu
Screen screen = new Screen(3);

//Declaring sounds
SoundFile buttonPressSound;
SoundFile spendMoney;
SoundFile reload;
SoundFile pistolFire;
SoundFile emptyGunShot;
SoundFile mp40reload;
SoundFile mp40fire;
SoundFile ambience;
SoundFile hammer;

//Player
Player player1;

//Perks
SpeedPowerUp speed;
HealthPowerUp health;

//Guns
Colt colt;
MP40 mp40;

//Barriers
Barrier barrier1;
Barrier barrier2;

//Zombies
Zombie zombie1;
Zombie zombie2;
Zombie zombie3;

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

//Fonts
PFont zombieFont;
PFont perkFont;
PFont defaultFont;

boolean[] keys = new boolean[1000];

float timeDelta = 1.0f / 60.00f;

void draw()
{
  //Keep drawing the screen
  screen.render();
  
  if(screen.screen == 3) {
    player1.render();
    player1.update();
    speed.render();
    speed.update();
    health.render();
    health.update();
    colt.render();
    mp40.render();
    barrier1.render();
    barrier2.render();
    zombie1.render();
    zombie2.render();
    zombie3.render();
  }
  println("MP40:"+mp40.ammo);
  println("Colt:"+colt.ammo);
  
  //Render bullets
  for(int i=gameObjects.size()-1; i >= 0; i--)
  {
    GameObject go = gameObjects.get(i);
    if(go instanceof Bullet) {
      Bullet b = (Bullet) go; //If it is indeed a player you can cast it
      b.render();
      if(b.pos.x < 170 || b.pos.x > 1100 || b.pos.y < 110 || b.pos.y > 550)
      {
        gameObjects.remove(b);
      }
    }
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
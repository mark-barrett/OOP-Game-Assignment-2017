class Screen
{
  boolean playSound;
  //Number corrosponding to particular screen.
  int screen;
  float transparency;
  PShape s;
  
  //Parameterised constructor. When the object is created the particular screen is set.
  Screen(int screen) {
    this.screen = screen;
    this.transparency = 255;
    this.playSound = false;
    
  

  }
  
  //Draw the screen
  void render()
  {
    println(screen);
    //If the loading screen is to be displayed
    if(this.screen == 1) {
      if(playSound == false)
      {
        ambience.play();
        this.playSound = true;
      }
      background(0);
      fill(0);
      stroke(0);
      stroke(255, 0, 0);
      fill(255, 0, 0);
      textAlign(LEFT);
      textSize(40);
      text ("Loading " + int((frameCount%301) / 3) + "%", width/2-95, height/2-15);
      rect(530, height/2-2, 204, 24);
      fill(0);
      int fillX = ((frameCount%301) / 3 * 2);
      rect(730, height/2, fillX-200, 20);
      if(frameCount%301 == 0)
      {
        this.screen = 2;
      }
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
      rect(490, 360, 285, 60);
      fill(255, 0, 0);
      textSize(40);
      text("New Game", 555, 323);
      text("Load Game", 550, 405);
      
      //If the mouse is over the new game button
      if(mouseX > 490 && mouseX < 775 && this.screen == 2)
      {
        if(mouseY > 280 && mouseY < 340 && this.screen == 2)
        {
          fill(255, 0, 0);
          rect(490, 280, 287, 62);
          fill(0);
          text("New Game", 555, 323);
          fill(255, 0, 0);
        }
      }
      
      //If the mouse is over the load game button
      if(mouseX > 490 && mouseX < 775 && this.screen == 2)
      {
        if(mouseY > 360 && mouseY < 420 && this.screen == 2)
        {
          fill(255, 0, 0);
          rect(490, 360, 287, 62);
          fill(0);
          text("Load Game", 550, 405);
          fill(255, 0, 0);
        }
      }
      
      //Credit text
      textSize(20);
      text("By Mark Barrett", 1130, 620);
    }
    
    //Level screen. Middle
    if(this.screen == 3) {
      round = 1;
      
      if(playSound == true)
      {
        ambience.stop();
        playSound = false;
      }
      
      if(this.transparency > 0) {
        this.transparency -= 1;
      }{
      background(85, 63, 42);
      strokeWeight(10);
      stroke(0);
      strokeCap(SQUARE);
      fill(179,179,179);
      //Top room
      rect(width/2-150, -10, 300, 85);
      //Main Room
      rect(width/2-500, 75, 1000, 500);
      //Top Door
      fill(85, 63, 42);
      noStroke();
      rect(width/2-75, 60, 150, 30);
      
      //Colt on wall
      strokeWeight(2);
      stroke(0);
      textSize(10);
      textFont(defaultFont);
      fill(153, 153, 153);
      rect(1123, height/2-20, 10, 42);
      fill(0);
      text("M1911", 1060, height/2+10);
      
      //MP40 on wall
      fill(153, 153, 153);
      rect(150, height/2-30, 10, 70, 2);
      fill(0);
      text("MP40", 165, height/2+10);
      textFont(zombieFont);

      //Score
      fill(255, 0, 0, 150);
      rect(1150, 500, 125, 40);
      textSize(35);
      fill(255);
      text(player1.score, 1180, 532);
      
      //Ammo
      textSize(28);
      fill(255, 0, 0, 150);
      rect(1150, 550, 125, 40);
      fill(255);
      
      //Gaps for zombies to come through
      fill(0);
      stroke(0);
      rect(width/2-300, 560, 150, 30);
      rect(width/2+150, 560, 150, 30);
      fill(255);
      
      if(player1.activeGun == 1) {
        text("Ammo: "+round(colt.ammo), width/2+512, height-70);
      }
      if(player1.activeGun == 2) {
        text("Ammo: "+round(mp40.ammo), width/2+512, height-70);
      }
      
      fill(0, 0, 0, this.transparency);
      rect(0, 0, 1280, 650);
      fill(255, 0, 0, this.transparency);
      
      if(player1.activeGun == 1)
      { 
        fill(153, 153, 153);
        rect(width/2-50, height-59, 50, 50);
        textFont(defaultFont);
        textSize(19);
        fill(0);
        text("M1911", width/2-49, height-30);
      }
      else if(player1.activeGun == 2)
      {
        fill(153, 153, 153);
        rect(width/2-50, height-59, 50, 50);
        textFont(defaultFont);
        textSize(19);
        fill(0);
        text("MP40", width/2-49, height-30);
      }
    }
          fill(0, 34, 102);
       rect(width/2-500+20, 95, 30, 30);
       textFont(defaultFont);
       fill(255);
       text("S", width/2-500+28, 120);
  } 
  if(screen == 4)
  {
    
    for(int i = 0; i<gameObjects.size(); i++)
    {
      GameObject go = gameObjects.get(i);
      
      if(go instanceof Zombie)
      {
        Zombie z = (Zombie) go;
        gameObjects.remove(z);
      }
    }
    fill(0);
    stroke(0);
    rect(0,0, width, height);
    fill(255, 0, 0);
    textSize(50);
    text("Game Over", width/2-100, 200);
    text("Your Score: "+player1.score, width/2-160, height/2-30);
    text("You reached level: "+level.levelCounter, width/2-180, height/2-80);
      
      fill(0);
      stroke(255, 0, 0);
      rect(490, 360, 285, 60);
      textSize(40);
      fill(255, 0, 0);
      text("Main Menu", 550, 405);
      //If the mouse is over the load game button
      if(mouseX > 490 && mouseX < 775 && this.screen == 4)
      {
        if(mouseY > 360 && mouseY < 420 && this.screen == 4)
        {
          fill(255, 0, 0);
          rect(490, 360, 287, 62);
          fill(0);
          text("Main Menu", 550, 405);
          fill(255, 0, 0);
          if(mousePressed && this.screen == 4)
          {
            this.screen = 1;
          }
        }
      }
 
    
  }
  if(screen == 5)
  {
    table = loadTable("saves/saveGame.csv", "header, csv");
    for(TableRow row : table.rows())
    {
      int levelCounter = row.getInt("Level Counter");
      float amount = row.getFloat("Amount");
      float level1 = row.getFloat("Level");
      String juggernog = row.getString("Juggernog");
      String doubleTap1 = row.getString("Double Tap");
      String staminUp = row.getString("Stamin Up");
      String mp401 = row.getString("MP40");
      String colt1 = row.getString("Colt");
      
      if(juggernog == "true") { health.bought = true; }
      if(doubleTap1 == "true") { doubleTap.bought = true; }
      if(staminUp == "true") { speed.bought = true; }
      if(mp401 == "true") { mp40.bought = true; }
      if(colt1 == "true") { colt.bought = true; }
      
      
      level.levelCounter = levelCounter;
      level.amount = amount;
      level.level = level1;
      
    }
    println("Amount: "+level.amount);
    level.finishedLevel = false;
    player1.health = 100;
    stroke(0);
    strokeWeight(2);

    this.screen = 3;
  }
  }
}
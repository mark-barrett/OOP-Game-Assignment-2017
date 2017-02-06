class Level
{
  float level;
  float toPass;
  boolean finishedLevel;
  float amount;
  float aliveZombies;
  float elapsed;
  boolean finishedLevelSpawn;
  int levelCounter;
  boolean nukeAwarded;
  
  Level()
  {
    finishedLevel = false;
    nukeAwarded = false;
    level = 1;
    amount = 5;
    this.aliveZombies = 0;
    this.finishedLevelSpawn = false;
    this.levelCounter = 1;
  }
  
  void start()
  {
    if(finishedLevel == false)
    {
      aliveZombies = amount;
      for(int i = 0; i<amount; i++)
      {
        Zombie z = new Zombie(random(width/2-400, width/2+400), height-50, level);
        gameObjects.add(z);
      }
      finishedLevel = true;
    }
    check();
    textSize(30);
    fill(255, 0, 0);
    text("Level: "+levelCounter, width/2-620, height-75);
    
    if(levelCounter % 4 == 0 && nuke.used == false)
    {
      nuke.render();
    }
  }
  
  void check()
  {
    println("Alive Zombies:"+aliveZombies);
    if(aliveZombies == 0)
    {
      elapsed += timeDelta;
      println("Elapsed"+elapsed);
      if(elapsed > 6)
      {
        finishedLevel = false;
        level += 0.1;
        amount += 3;
        finishedLevelSpawn = true;
        levelCounter++;
      }
      if(finishedLevelSpawn == true)
      {
        elapsed = 0;
        finishedLevelSpawn = false;
      }
    }
  }
}
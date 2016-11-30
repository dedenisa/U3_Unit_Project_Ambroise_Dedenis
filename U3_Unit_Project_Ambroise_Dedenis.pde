PImage trumpImg;
PImage spaceshipImg;
PImage laserImg;
PImage moneyImg;
Player2 spaceship;
Player1 trump;
Laser laser;
Money money;
ArrayList<Laser> lasers;
ArrayList<Money> moneys;
boolean _left, _right, _s, _a, _d, _shootdown;

void setup()
{
  fullScreen();
  background(0);
  trumpImg = loadImage("trump.png");
  trump = new Player1(trumpImg, width-100, 0 + 50);
  spaceshipImg = loadImage("spaceship.png");
  spaceship = new Player2(spaceshipImg, 100, height - 50);
  laserImg = loadImage ("lasers.png");
  laser = new Laser(laserImg, -30, -30);
  lasers = new ArrayList<Laser>();
  moneyImg = loadImage  ("money.png");
  moneys = new ArrayList<Money>();
}

void draw()
{
  background(0);
  trump.Draw();
  spaceship.Draw();
  spaceship.Update();
  trump.Update();
  for (int i=0; i <lasers.size(); i++)
  {
    lasers.get(i).Update();
    lasers.get(i).Draw();
  }
  for (int i=0; i<moneys.size(); i++)
  {
    moneys.get(i).Update();
    moneys.get(i).Draw();
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      _left = true;
    }
    if (keyCode == RIGHT)
    {
      _right = true;
    }
    if (keyCode == DOWN)
    {
      _shootdown = true;
    }
  }
  if (key == 'a')
  {
    _a = true;
  }
  if (key == 'd')
  {
    _d = true;
  }
  if (key == 's')
  {
    _s = true;
  }
}

void keyReleased()
{
  if (key == 's')
  {
    Laser temp = new Laser(laserImg, spaceship._x, spaceship._y);
    lasers.add(temp);
    _s = true;
  }
  if (key == CODED)
  {
    if (keyCode == DOWN)
    {
      Money temp = new Money(moneyImg, trump._x, trump._y);
      moneys.add(temp);
      _shootdown = true;
    }
    if (keyCode == LEFT)
    {
      _left = false;
    }
    if (keyCode == RIGHT)
    {
      _right = false;
    }
    if (keyCode == DOWN)
    {
      _shootdown = false;
    }
  }
  if (key == 'a')
  {
    _a = false;
  }
  if (key == 'd')
  {
    _d = false;
  }
  if (key == ' ')
  {
    _s = false;
  }
}

void checkcollision()
{
}
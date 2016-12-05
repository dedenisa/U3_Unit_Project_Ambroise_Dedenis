int time;
int wait = 1000;
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
boolean _left, _right, _shootup, _a, _d, _shootdown;
boolean _trumpfire, _spaceshipfire;

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
  time = millis();
  _trumpfire = true;
  _spaceshipfire = true;
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
  checkcollision();

  if (millis() - time >= wait)
  {
    println ("tick");
    time = millis();
    _trumpfire = true;
    _spaceshipfire = true;
  }
  textSize(20);
  text("Trump lives =" + trump._lives, 100, 100);

  textSize(20);
  text("Spaceship lives =" + spaceship._lives, width - 250, height - 125);

  if (trump._lives < 1)
  {
    background(255, 0, 0);
  }

  if (spaceship._lives < 1)
  {
    background(255, 0, 255);
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
    _shootup = true;
  }
}

void keyReleased()
{
  if (_spaceshipfire == true)
  {
    if (key == 's')
    {
      Laser temp = new Laser(laserImg, spaceship._x, spaceship._y);
      lasers.add(temp);
      _shootup = true;
      _spaceshipfire = false;
    }
  }
  if (key == CODED)
  {
    if (_trumpfire == true)
    {
      if (keyCode == DOWN)
      {
        Money temp = new Money(moneyImg, trump._x, trump._y);
        moneys.add(temp);
        _shootdown = true;
        _trumpfire = false;
      }
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
    _shootup = false;
  }
}

void checkcollision()
{

  for (int i=moneys.size()-1; i > 0; i--)
  {
    if (spaceship._x < moneys.get(i)._x + 50 &&
      spaceship._x + 100 > moneys.get(i)._x &&
      spaceship._y < moneys.get(i)._y + 50 &&
      100 + spaceship._y > moneys.get(i)._y)
    {
      moneys.remove(i);
      spaceship._lives -= 1;
    }
  }

  for (int i=lasers.size()-1; i > 0; i--)
  {
    if (trump._x < lasers.get(i)._x + 50 &&
      trump._x + 100 > lasers.get(i)._x &&
      trump._y < lasers.get(i)._y + 50 &&
      100 + trump._y > lasers.get(i)._y)
    {
      lasers.remove(i);
      trump._lives -= 1;
    }
  }

  for (int i=lasers.size()-1; i > 0; i--)
  {
    for (int m = moneys.size()-1; m > 0; m--)
    {
      if (moneys.get(m)._x < lasers.get(i)._x + 50 &&
        moneys.get(m)._x + 100 > lasers.get(i)._x &&
        moneys.get(m)._y < lasers.get(i)._y + 50 &&
        100 + moneys.get(m)._y > lasers.get(i)._y)
      {
        moneys.remove(m);
        lasers.remove(i);
        break;
      }
    }
  }
}
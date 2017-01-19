/*
I was inspired to make this project due to the election of Donald Trump. So I wanted to make something interacting with Doanld Trump involved. So I came up with a game where its Donald Trump
 against an Alien. My game is basiclly like the really old game called Galga. In this game, you have to play with 2 players. As you know one player is trump and one player is the Alien.
 The ALien uses the keys a (left) and d (right) to move and to shoot w. Donal Trump uses the key left and right to move and the key down to shoot. My game will be using makey makw]
 ey.
 */

int time;
int wait = 500;
int trumpAmmo = 50;
int spaceshipAmmo = 50;

PImage trumpImg;
PImage spaceshipImg;
PImage laserImg;
PImage moneyImg;

Player2 spaceship;
Player1 trump;
Laser laser;
Money money;

Explosion explosion;

ArrayList<Laser> lasers;
ArrayList<Money> moneys;

boolean _left, _right, _shootup, _a, _d, _shootdown;
boolean _gameovertrump, _gameoverspaceship;
boolean _trumpfire, _spaceshipfire;

void setup()
{
  fullScreen();

  background(0);

  trumpImg = loadImage("trump.png");
  trump = new Player1(trumpImg, width-100, 0 + 50);
  _trumpfire = true;

  spaceshipImg = loadImage("spaceship.png");
  spaceship = new Player2(spaceshipImg, 100, height - 50);
  _spaceshipfire = true;

  laserImg = loadImage ("lasers.png");
  laser = new Laser(laserImg, -30, -30);
  lasers = new ArrayList<Laser>();

  moneyImg = loadImage  ("money.png");
  moneys = new ArrayList<Money>();

  time = millis();
}

void draw()
{
  background(0);

  trump.Draw();
  trump.Update();

  spaceship.Draw();
  spaceship.Update();

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
    println ("shoot");
    time = millis();
    _trumpfire = true;
    _spaceshipfire = true;
  }

  if (_gameovertrump == false)
  {
    textSize(20);
    text("Trump lives =" + trump._lives, 100, 100);
    text("Spaceship Ammo =" + trumpAmmo, 100, 125);
  }

  if (_gameoverspaceship == false)
  {
    textSize(20);
    text("Spaceship lives =" + spaceship._lives, width - 250, height - 125);
    text("Spaceship Ammo =" + spaceshipAmmo, width - 250, height - 100);
  }

  if (trump._lives < 1)
  {
    if (_gameovertrump == false)
    {
      explosion = new Explosion(trump._x, trump._y);
    }
    explosion.Draw();

    _gameovertrump = true;
  }

  if (spaceship._lives < 1)
  {
    if (_gameoverspaceship == false)
    {
      explosion = new Explosion(spaceship._x, spaceship._y);
    }
    _gameoverspaceship = true;

    explosion.Draw();
  }
}

void keyPressed()
{
  if (_gameoverspaceship == false && _gameovertrump == false)
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
      if (_trumpfire == true)
      {
        if (keyCode == DOWN && trumpAmmo > 0)
        {
          Money temp = new Money(moneyImg, trump._x, trump._y);
          moneys.add(temp);
          _shootdown = true;
          _trumpfire = false;
          trumpAmmo -= 1;
        }
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
    if (_spaceshipfire == true)
    {
      if (key == 'w' && spaceshipAmmo > 0)
      {
        Laser temp = new Laser(laserImg, spaceship._x, spaceship._y);
        lasers.add(temp);
        _shootup = true;
        _spaceshipfire = false;
        spaceshipAmmo -= 1;
      }
    }
  }
}

void keyReleased()
{
  if (key == CODED)  
  {
    if (keyCode == LEFT)
    {
      _left = false;
    }
    if (keyCode == RIGHT)
    {
      _right = false;
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
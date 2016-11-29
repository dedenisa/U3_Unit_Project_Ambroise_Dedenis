PImage trumpImg;
PImage spaceshipImg;
PImage laserImg;
Player2 spaceship;
Player1 trump;
Laser laser;
ArrayList<Laser> lasers;
boolean _left, _right, _shoot, _a, _d;

void setup()
{
  fullScreen();
  background(0);
  trumpImg = loadImage("trump.png");
  trump = new Player1(trumpImg, 100, 0 + 50);
  spaceshipImg = loadImage("spaceship.png");
  spaceship = new Player2(spaceshipImg, 100, height - 50);
  laserImg = loadImage ("lasers.png");
  laser = new Laser(laserImg, -30, -30);
  lasers = new ArrayList<Laser>();
}

void draw()
{
  background(0);
  trump.Draw();
  spaceship.Draw();
  trump.keypressed();
  spaceship.keypressed();
  for (int i=0; i <lasers.size(); i++)
  {
    lasers.get(i).Update();
    lasers.get(i).Draw();
  }
}

void keyReleased()
{
  if (key == ' ')
  {
    Laser temp = new Laser(laserImg, spaceship._x, spaceship._y);
    lasers.add(temp);
    _shoot = false;
  }
}
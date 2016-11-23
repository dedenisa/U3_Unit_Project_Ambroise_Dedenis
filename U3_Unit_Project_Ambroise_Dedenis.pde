PImage trumpImg;
PImage spaceshipImg;
PImage laserImg;
Player2 spaceship;
Player1 trump;
Lasers laser;
ArrayList<Lasers> lasers;

void setup()
{
  fullScreen();
  background(0);
  trumpImg = loadImage("trump.png");
  trump = new Player1(trumpImg, 100, 0 + 50);
  spaceshipImg = loadImage("spaceship.png");
  spaceship = new Player2(spaceshipImg, 100, height - 50);
  laserImg = loadImage ("lasers.png");
  laser = new Lasers(laserImg, -30, -30);
  lasers = new ArrayList<Lasers>();
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
    Lasers temp = new Lasers(laserImg, spaceship._x, spaceship._y);
    lasers.add(temp);
  }
}
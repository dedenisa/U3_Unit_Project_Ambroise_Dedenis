class Player2
{
  PImage _spaceship;
  float _x;
  float _y; 

  Player2(PImage spaceship, float x, float y)
  {
    _spaceship = spaceship;
    _x = x;
    _y = y;
  }
  public void Draw()
  {
    imageMode(CENTER);
    image(spaceshipImg, _x, _y, 100, 100);
  }
  public void keypressed()
  {
    if (key == 'a')
    {
      _x = _x - 5;
    }
    if (key == 'd')
    {
      _x = _x + 5;
    }
  }
}
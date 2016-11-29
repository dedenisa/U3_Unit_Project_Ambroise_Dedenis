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
    if (keyPressed)
    {
      println(keyCode);
      if (key == 'a')
      {
        _a = true;
      }
      if (key == 'd')
      {
        _d = true;
      }
    }
    if (_a == true)
    {
      _x = _x - 5;
    }
    if (_d == true)
    {
      _x = _x + 5;
    }
    imageMode(CENTER);
    image(spaceshipImg, _x, _y, 100, 100);
  }
  public void keypressed()
  {
    if (key == 'a')
    {
      _a = false;
    }
    if (key == 'd')
    {
      _d = false;
    }
  }
  public void keyreleased()
  {
    if (key == 'a')
    {
      _a = false;
    }
    if (key == 'd')
    {
      _d = false;
    }
  }
}
class Player2
{
  PImage _spaceship;
  float _x;
  float _y; 
  int _lives = 3;

  Player2(PImage spaceship, float x, float y)
  {
    _spaceship = spaceship;
    _x = x;
    _y = y;
  }
  public void Draw()
  {
    if (spaceship._x > width)
    {
      spaceship._x = 1;
    }

    if (spaceship._x < 0)
    {
      spaceship._x = width;
    } 

    if (_gameoverspaceship == false)
    {
      imageMode(CENTER);
      image(spaceshipImg, _x, _y, 100, 100);
    }
  }
  void Update()
  {
    if (_a)
    {
      _x = _x - 7.5;
    }
    if (_d)
    {
      _x = _x + 7.5;
    }
  }
}
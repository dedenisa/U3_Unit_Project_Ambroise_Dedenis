class Player1
{
  PImage _trump;
  float _x;
  float _y;
  int _lives = 3;

  Player1(PImage trump, float x, float y)
  {
    _trump = trump;
    _x = x;
    _y = y;
  }
  public void Draw()
  {
    if (trump._x > width)
    {
      trump._x = 1;
    }

    if (trump._x < 0)
    {
      trump._x = width;
    }

    if (_gameovertrump == false)
    {
      imageMode(CENTER);
      image(trumpImg, _x, _y, 100, 100);
    }
  }
  void Update()
  {
    if (_left)
    {
      _x = _x - 7.5;
    }
    if (_right)
    {
      _x = _x + 7.5;
    }
  }
}
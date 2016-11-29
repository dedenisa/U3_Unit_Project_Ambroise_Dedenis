class Player1
{
  PImage _trump;
  float _x;
  float _y;

  Player1(PImage trump, float x, float y)
  {
    _trump = trump;
    _x = x;
    _y = y;
  }
  public void Draw()
  {
    if (keyPressed)
    {
      println(keyCode);
      if (keyCode == LEFT)
      {
        _left = true;
      }
      if (key == 'd')
      {
        _right = true;
      }
    }
    if (_left == true)
    {
      _x = _x - 5;
    }
    if (_right == true)
    {
      _x = _x + 5;
    }
    imageMode(CENTER);
    image(trumpImg, _x, _y, 100, 100);
  }
  public void keypressed()
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
  }
  public void keyreleased()
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
  }
}
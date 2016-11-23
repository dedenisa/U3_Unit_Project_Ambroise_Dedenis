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
    imageMode(CENTER);
    image(trumpImg, _x, _y, 100, 100);
  }
  public void keypressed()
  {
    if (key == CODED)
    {
      if (keyCode == LEFT)
      {
        _x = _x - 5;
      }
      if (keyCode == RIGHT)
      {
        _x = _x + 5;
      }
    }
  }
}
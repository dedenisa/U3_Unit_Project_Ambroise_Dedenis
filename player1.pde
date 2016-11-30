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
  void Update()
  {
    if (_left)
    {
      _x = _x - 5;
    }
    if (_right)
    {
      _x = _x + 5;
    }
  }
}
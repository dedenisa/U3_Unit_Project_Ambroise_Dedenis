class Money
{
  PImage _money;
  float _x;
  float _y;

  Money(PImage money, float x, float y)
  {
    _money = money;
    _x = x;
    _y = y;
  }
  public void Draw()
  {
    imageMode(CENTER);
    image(moneyImg, _x, _y, 50, 50);
  }
  public void shootLaser()
  {
    _x = trump._x;
    _y = trump._y;
  }
  void Update()
  {
    _y = _y + 15;
  }
}
class Laser
{
  PImage _laser;
  float _x;
  float _y;

  Laser(PImage laser, float x, float y)
  {
    _laser = laser;
    _x = x;
    _y = y;
  }
  public void Draw()
  {
    imageMode(CENTER);
    image(laserImg, _x, _y, 50, 50);
  }
  public void shootLaser()
  {
    _x = spaceship._x;
    _y = spaceship._y;
  }
  void Update()
  {
    _y = _y - 5;
  }
}
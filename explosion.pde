class Explosion
{
  float _x;
  float _y;

  Explosion(float x, float y)
  {
    _x = x;
    _y = y;
  }
  public void Draw()
  {
    for (int i = 0; i < 10; i++)
    {
      fill(random(255), 255, 255, 255);
      ellipse(ellipseX[i], ellipseY[i], 1, 1);
      ellipseX[i] = ellipseX[i] + (int) random(-3, 3);
      ellipseY[i] = ellipseY[i] + (int) random(-3, 3);
      noStroke();
    }
  }
}
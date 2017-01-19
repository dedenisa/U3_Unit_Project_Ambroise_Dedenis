class Explosion
{
  float _x;
  float _y;
  color[] colors = {color(255, 0, 4), color(225, 129, 3), color(144, 83, 22), color(152, 8, 27), color(254, 255, 0), color(188, 113, 38)};
  int [] ellipseX = new int [1000];
  int [] ellipseY = new int [1000];

  float a = random(0, height);
  float b = random(0, width);

  Explosion(float x, float y)
  {
    _x = x;
    _y = y;

    for (int i = 0; i < 1000; i++)
    {
      ellipseX [i] = (int) random(width);
      ellipseY [i] = (int) _y;
    }
  }
  public void Draw()
  {
    if ( _gameoverspaceship == true)
    {
      for (int i = 0; i < 1000; i++)                       
      {
        fill(colors[(int)random(6)]);
        ellipse(ellipseX[i], ellipseY[i], 20, 20);
        ellipseX[i] = ellipseX[i] + (int) random(0, 0);
        ellipseY[i] = ellipseY[i] + (int) random(-20, 0);
        noStroke();
      }
    }
    if ( _gameovertrump == true)
    {
      for (int i = 0; i < 1000; i++)                       
      {
        fill(colors[(int)random(6)]);
        ellipse(ellipseX[i], ellipseY[i], 20, 20);
        ellipseX[i] = ellipseX[i] + (int) random(0, 0);
        ellipseY[i] = ellipseY[i] + (int) random(0, 20);
        noStroke();
      }
    }
  }
}
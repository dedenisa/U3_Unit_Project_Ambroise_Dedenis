class Explosion
{
  float _x;
  float _y;
  color[] colors = {color(#FA080C), color(#FA9D08), color(#F54A0C), color(#FA0D64), color(#FCF505), color(#FC7D05), color(#2D1EE3), color(#24AA2E), 
    color(#12B1CB), color(#5D0D0D), color(#9226DB), color(#F205FF), color(#05DCFF), color(#84AF27), color(#FF911A), color(#521AFF), color(#FF2403)};
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
        fill(colors[(int)random(17)]);
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
        fill(colors[(int)random(17)]);
        ellipse(ellipseX[i], ellipseY[i], 20, 20);
        ellipseX[i] = ellipseX[i] + (int) random(0, 0);
        ellipseY[i] = ellipseY[i] + (int) random(0, 20);
        noStroke();
      }
    }
  }
}
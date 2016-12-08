class Explosion
{
  float _x;
  float _y;
  color[] colors = {color(#FA080C), color(#FA9D08), color(#F54A0C), color(#FA0D64), color(#FCF505), color(#FC7D05), color(#2D1EE3), color(#24AA2E), color(#12B1CB)};
  int [] ellipseX = new int [500];
  int [] ellipseY = new int [500];

  int [] Xellipse = new int [500];
  int [] Yellipse = new int [500];


  Explosion(float x, float y)
  {
    _x = x;
    _y = y;

    for (int i = 0; i < 500; i++)
    {
      ellipseX [i] = (int) random (spaceship._x, width - 50);
      ellipseY [i] = (int) random (0, height -50);
    }

    for (int i = 0; i < 500; i++)
    {
      Xellipse [i] = (int) random (trump._x, width - 50);
      Yellipse [i] = (int) random (0, height -50);
    }
  }
  public void Draw()
  {
    if ( _gameoverspaceship == true)
    {
      for (int i = 0; i < 500; i++)
      {
        fill(colors[(int)random(9)]);
        ellipse(ellipseX[i], ellipseY[i], 10, 10);
        ellipseX[i] = ellipseX[i] + (int) random(-3, 3);
        ellipseY[i] = ellipseY[i] + (int) random(-3, 3);
        noStroke();
        {
        }
      }

      if ( _gameovertrump == true)
      {
        for (int i = 0; i < 500; i++)
        {
          fill(colors[(int)random(9)]);
          ellipse(Xellipse[i], Yellipse[i], 10, 10);
          Xellipse[i] = Xellipse[i] + (int) random(-3, 3);
          Yellipse[i] = Yellipse[i] + (int) random(-3, 3);
          noStroke();
          {
          }
        }
      }
    }  
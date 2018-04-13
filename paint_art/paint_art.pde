

void setup()
{
  img = loadImage("win.png");
  background(#FAFAFA);
  size(600, 600);

  stroke(0, 0, 0);
  strokeWeight(lineThicknes);

  fill(255, 255, 255);
  rect(0, 0, 599, 55);
}
PImage img;
float t = 0;
int lineThicknes;
color c = #FAFAFA;
int strokeRadius = 15;
float n = noise(t);
float V =(strokeRadius);
boolean pic = false;
void keyReleased() {
  if (int(keyCode) == 38) //up
  {
    if (strokeRadius < 200)
    {
      strokeRadius = strokeRadius + 25;
    } else
    {
      strokeRadius = 200;
    }
  }

  if (int(keyCode) == 40) //down
  {
    if (strokeRadius >= 50)
    {
      strokeRadius = strokeRadius - 25;
    } else
    {
      strokeRadius = 25;
    }
  }
}

void draw()
{

  stroke(0, 0, 0);
  strokeWeight(3);

  fill(255, 255, 255);
  rect(0, 0, 599, 55);

  int xCoordinate;
  int baseXCoordinate = 1;
  int Interval = 52;
  boolean shifted = false;
  int yCoordinate;
  int baseYCoordinate = 1;
  int yShift = 0;

  int swatches = 0;
  int totalSwatches = 7;
  int[] colors = new int[totalSwatches];
  colors[0] = #E80918;
  colors[1] = #F5810C;
  colors[2] = #F5DE0C;
  colors[3] = #0D8B1A;
  colors[4] = #0F34BF;
  colors[5] = #701B93;
  colors[6] = #FAFAFA;

  int Rectangle = 53;

  //  Perlin noise
  float n = noise(t);
  float x = map(n, 0, 1, 40, 50);
  t += 0.1;



  stroke(0, 0, 0);
  strokeWeight(3);

  image(img, 368, 3, width/5, height/12);


  for (swatches = 0; swatches < totalSwatches; swatches++)
  {
    xCoordinate = baseXCoordinate + (swatches)*Interval;
    if (shifted == false)
    {
      yCoordinate = baseYCoordinate + yShift;
      shifted = true;
    } else
    {
      yCoordinate = baseYCoordinate;
      shifted = false;
    }

    fill(colors[swatches]);
    rect(xCoordinate, yCoordinate, Rectangle, Rectangle);
  }
}

void mousePressed() {
  {
    if ((mouseY<55)&&(mouseX<370)) //if the mouse is in the top bar
    {    
      c = get(mouseX, mouseY); //getting the colour form the top bar
      println(mouseX, mouseY);
      pic = false;
    }
  }
  if ((mouseY<55)&&(mouseX>370)&&(mouseX<488))
  {
    pic = true;
  }
}

void mouseDragged () {

  noStroke();

  if ((mouseY>55)&&(pic==true)) {
    image(img, mouseX, mouseY, width/5, height/12);
  } else if ((mouseY>55)&&(pic==false)) {
    fill(c);
    ellipse(mouseX, mouseY, strokeRadius, 20 );
  }
}

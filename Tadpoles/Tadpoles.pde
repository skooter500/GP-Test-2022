void setup()
{
  size(800, 800);
  smooth();
  colorMode(HSB);
  jc = new Tadpole();
}



Tadpole jc;

float pingpongMap(float a, float b, float c, float d, float e)
{
  float range1 = c - b;
  float range2 = e-d;
  if (range1 == 0)
  {
    return d;
  }

  if (range2 == 0)
  {
    return d;
  }

  float howFar = a - b;

  float howMany = floor(howFar / range1);
  float fraction = (howFar - (howMany * range1)) / range1;
  //println(a + " howMany" + howMany + " fraction: " + fraction);
  //println(range2 + " " + fraction);
  if (howMany % 2 == 0)
  {
    return d + (fraction * range2);
  } else
  {
    return e - (fraction * range2);
  }
}

float wrap(float f, float w)
{
  if (f >= 0.0)
  {
    f = f % w;
  } else
  {
    f = w - (-f % w);
  }
  return f;
}

String[] nameCombos = {"Safe", "Milk", "Strictly", "Personal", "Trout", "Mask", "Replica", "Lick", "My", "Decals", "Off", "Baby", "Mirror", "Man", "Spotlight", "Kid", "Clear", "Spot", "Unconditionally", "Guaranteed", "Bluejeans", "Moonbeams", "Shiny", "Beast", "Bat", "Chain", "Puller", "Doc", "Radar", "Station", "Ice", "Cream", "Crow", "Bat", "Chain", "Puller"};

void keyPressed()
{
  if (key == ' ')
  {
    jc.randomise();
  }
}

void draw()
{
  background(0);
  jc.render(width / 2, height / 2);
}

void setup()
{
  size(800, 800);
  smooth();
  colorMode(HSB);
  jc = new Tadpole();
}

Tadpole jc;

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

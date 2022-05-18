import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus




void setup()
{
  size(800, 1000);
  smooth();
  jc = new Tadpole();
  
  MidiBus.list();
  
  myBus = new MidiBus(this, 1, 4);
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);

  println(value);
  if (number == 10)
  {
    jc.c1 = lerp(jc.c1, map(value * 2.0f, 0, 127, 0, 255), 0.1f);
  }
  
  if (number == 114)
  {
    jc.cw = lerp(jc.cw, map(value * 2.0f, 0, 127, 0, 255), 0.1f);
  }
  if (number == 74)
  {
    jc.fatness = lerp(jc.fatness, map(value, 0, 127, 0, 5), 0.2f);
  }
  
  if (number== 18)
  {
    speed = map(value, 0, 127, 0, 0.1f);
  }
  
  if (number == 71)
  {
    jc.length = (int) map(value, 0, 127, 0, 15);
  }
   if (number == 19)
  {
    jc.alpha = (int) map(value, 0, 127, 0, 255);
  }
}

float speed = 1.0f;



Tadpole jc;

float pingpongmap(float a, float b, float c, float d, float e)
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


void draw() {
  colorMode(RGB);
  blendMode(SUBTRACT);
  fill(255, 3);
  rect(0, 0, width, height);
  blendMode(BLEND);
  colorMode(HSB);
  jc.render(width / 2, height / 1.8f);
}

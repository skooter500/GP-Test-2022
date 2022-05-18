class Tadpole
{
  int length = 5;


  String name = "";
  float w = 50;

  int limbs = 1;
  int eyes = 2;
  char gender = 'h';
  float r = w * 0.5f;
  float eyeRadius = w * 0.1f;
  int c;

  public Tadpole(int length, String name, int limbs, int eyes, char gender) {
    this.length = length;
    this.name = name;
    this.limbs = limbs;
    this.eyes = eyes;
    this.gender = gender;
  }
  
  public Tadpole()
  {
    randomise();
  }
  
  public void randomise()
  {
    length = (int) random(1, 10);
    limbs = (int) random(0, 5);
    eyes = (int) random(0, 9);
    
    char[] genders = {'m','f', 'h', 'n'}; 
    gender = genders[(int)random(0, genders.length)];
    
    c = (int) random(0, 255);
    
    int nameLength = (int)random(1,5);
    name = "";
    for(int i = 0 ; i < nameLength ; i ++)
    {
      name += nameCombos[(int)random(0, nameCombos.length)] + " ";
    }
    name = name.substring(0, name.length() - 1);
  }

  public void render(float cx, float cy)
  {

    float half = w * length * 0.5f;
    stroke(c, 255, 255);
    strokeWeight(2);
    pushMatrix();
    translate(cx, cy);
    translate(0, - half);
    noFill();
    float hw = w / 2;

    textSize(36);
    textAlign(CENTER, CENTER);
    fill(c, 255, 255);
    text(name, 0, -w * 3);
    noFill();
    for (int i = 0; i < length; i ++)
    {
      float y = i * w;
      float f = 0.5f;
      float w1 = sin(map(i, 0, length-1, f, PI - f)) * w; 
      ellipse(0, y, w1 * 2f, w);
      if (limbs > 0 && i > 0)
      {
        line(-w1, y, - w1 - w1, y);
        line(w1, y, w1 * 2, y);
      }
      drawEyes(eyes, w1, w);
    }

    drawGenitals();

    popMatrix();
  }

  private void drawGenitals()
  {
    switch (gender)
    {
    case 'm':
      {
        float y1 =  (length * w) - r;
        line(0, y1, 0, y1 + r);
        circle(0, y1 + r + eyeRadius, eyeRadius * 2.0f);
      }
      break;
    case 'f':
      {
        float y =  ((length - 1) * w);
        circle(0, y, eyeRadius * 4.0f);
      }
      break;
    case 'h':
      {
        float y1 =  (length * w) - r;
        line(0, y1, 0, y1 + r);
        circle(0, y1 + r + eyeRadius, eyeRadius * 2.0f);

        float y =  ((length - 1) * w);
        circle(0, y, eyeRadius * 4.0f);
      }
      break;
    }
  }

  void drawEyes(int numEyes, float hw, float hh)
  {
    float offs = 180.0f / (float)numEyes;
    for(int i = 0 ; i < numEyes ; i ++)
    {
      float angle = map(i, 0, numEyes, -90, 90) + (offs * 0.5f);
      float stalkLength = r + (sin(map(i, 0 , numEyes-1, 0, PI)) * r);
      drawEye(angle, stalkLength, hw, hh);
    }
  }

  private void drawEye(float angle, float stalkLength, float headW, float headH)
  {
    float x1 = sin(radians(angle)) * (headW);
    float y1 = - cos(radians(angle)) * (headH);

    float x2 = sin(radians(angle)) * (headW + stalkLength);
    float y2 = - cos(radians(angle)) * (headH + stalkLength);
    float ex = sin(radians(angle)) * (headW + stalkLength + eyeRadius);
    float ey = - cos(radians(angle)) * (headH + stalkLength + eyeRadius);
    circle(ex, ey, eyeRadius * 2.0f);
    line(x1, y1, x2, y2);
  }
}

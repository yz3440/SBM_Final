ControlP5 cp5;

boolean guiToggle;

float normalOffset = 0, centerOffset = 5;


float lerpFactor = 0.2;

float flashFactor = 0.45;

void setupGui() {
  guiToggle = true;

  int sliderW = 100;
  int sliderH = 15;
  int startX = 10;
  int startY = 35;
  int spacing = 20;

  cp5 = new ControlP5( this );

  //cp5.addToggle("displayLines")
  //  .setPosition(10, startY+spacing*1)
  //  .setSize(sliderW, sliderH)
  //  .setValue(false);
  //cp5.addToggle("displayNet")
  //  .setPosition(10, startY+spacing*3)
  //  .setSize(sliderW, sliderH)
  //  .setValue(false);

  cp5.addSlider("thresholdMin")
    .setPosition(10, startY+spacing*11)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(0)
    ; 

  cp5.addSlider("thresholdMax")
    .setPosition(10, startY+spacing*12)
    .setSize(sliderW, sliderH)
    .setRange(1, 4499)
    .setValue(4499)
    ; 

  //cp5.addSlider("numOfLinesDisplay")
  //  .setPosition(10, startY+spacing*14)
  //  .setSize(sliderW, sliderH)
  //  .setRange(0, 10)
  //  .setValue(0)
  //  ;  
  //cp5.addSlider("numOfNetsDisplay")
  //  .setPosition(10, startY+spacing*15)
  //  .setSize(sliderW, sliderH)
  //  .setRange(1, 10)
  //  .setValue(1)
  //  ;
  //cp5.addSlider("normalOffset")
  //  .setPosition(10, startY+spacing*17)
  //  .setSize(sliderW, sliderH)
  //  .setRange(-50, 50)
  //  .setValue(0)
  //  ;
  //cp5.addSlider("centerOffset")
  //  .setPosition(10, startY+spacing*18)
  //  .setSize(sliderW, sliderH)
  //  .setRange(-50, 50)
  //  .setValue(0)
  //  ;

  //cp5.addSlider("flashFactor")
  //  .setPosition(10, startY+spacing*20)
  //  .setSize(sliderW, sliderH)
  //  .setRange(0.45, 1)
  //  .setValue(0)
  //  ;

  cp5.setAutoDraw(false);
}

void drawGui() {
  hint(DISABLE_DEPTH_TEST);
  cp5.draw();
}

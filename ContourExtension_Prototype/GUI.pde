import controlP5.*;
import java.util.*;

ControlP5 cp5;

boolean guiToggle;

boolean displayNet;
boolean displayNetVertices;

boolean displayBody;
boolean displayBodyVertices;

boolean displayBodyToNet;

float normalOffset;
float centerOffset;

void setupGui() {
  guiToggle = true;

  int sliderW = 100;
  int sliderH = 15;
  int startX = 10;
  int startY = 35;
  int spacing = 20;

  cp5 = new ControlP5( this );

  cp5.addToggle("displayNet")
    .setPosition(startX, startY+spacing*1)
    .setSize(sliderW, sliderH)
    .setValue(true)
    ;
  cp5.addToggle("displayNetVertices")
    .setPosition(startX, startY+spacing*3)
    .setSize(sliderW, sliderH)
    .setValue(false)
    ;
  cp5.addToggle("displayBody")
    .setPosition(startX, startY+spacing*5)
    .setSize(sliderW, sliderH)
    .setValue(false)
    ;
  cp5.addToggle("displayBodyVertices")
    .setPosition(startX, startY+spacing*7)
    .setSize(sliderW, sliderH)
    .setValue(false)
    ;
  cp5.addToggle("displayBodyToNet")
    .setPosition(startX, startY+spacing*9)
    .setSize(sliderW, sliderH)
    .setValue(false)
    ;
  cp5 = new ControlP5( this );
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
  cp5.addSlider("normalOffset")
    .setPosition(10, startY+spacing*13)
    .setSize(sliderW, sliderH)
    .setRange(10, 50)
    .setValue(20)
    ;
  cp5.addSlider("centerOffset")
    .setPosition(10, startY+spacing*14)
    .setSize(sliderW, sliderH)
    .setRange(10, 50)
    .setValue(20)
    ;
  cp5.setAutoDraw(false);
}

void drawGui() {
  hint(DISABLE_DEPTH_TEST);
  cp5.draw();
}

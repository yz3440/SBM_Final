import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import gab.opencv.*;
import controlP5.*;

OpenCV opencv;

Kinect2 kinect2;
PImage depthImg;

int thresholdMin = 0;
int thresholdMax = 4499;

ArrayList<Contour> contours;

void setupKinect() {
  kinect2 = new Kinect2(this);
  kinect2.initDepth();
  kinect2.initDevice();

  depthImg = new PImage(kinect2.depthWidth, kinect2.depthHeight, ARGB);
  image(depthImg, 0, 0);
  opencv = new OpenCV(this, depthImg);
  print("depthImg: ");
  println(depthImg);
  
  
}

void runKinect() {
  background(0);

  int[] rawDepth = kinect2.getRawDepth();
  depthImg.loadPixels();
  for (int i=0; i < rawDepth.length; i++) {
    int depth = rawDepth[i];

    if (depth >= thresholdMin
      && depth <= thresholdMax
      && depth != 0) {

      //float w = map(depth, thresholdMin, thresholdMax, 255, 100);

      depthImg.pixels[i] = color(255,0);
    } else {
      depthImg.pixels[i] = color(0, 0);
    }
  }
  depthImg.updatePixels();

  opencv.loadImage(depthImg);
  opencv.gray();
  opencv.threshold(50);
  opencv.erode();
  opencv.dilate();
  opencv.dilate();
  opencv.erode();
  contours = opencv.findContours();

  image(kinect2.getDepthImage(), 0, 0);
  //image(depthImg, 0, 0);
  image(opencv.getOutput(), 0, 0);

  noFill();
  
  int index = 0;
  for (Contour c : contours) {    
    float r = map(index, 0, contours.size(), 255, 0);
    float b = map(index, 0, contours.size(), 0, 255);
    stroke(r, 0, b);
    
    c.draw();   
    index++;
  }
  fill(255);
  text(frameRate, 10, 20);
}

import gab.opencv.*;
import processing.video.*;

Capture video;
OpenCV opencv;
ArrayList<Contour> contours;
 float [] X= new float[3000];

float [] rR= new float[3000];
int R;
float [] gG= new float[3000];
int G;
float b[] = new float[3000];
int B;

void setup() {
  size(960, 480);
     
  strokeWeight(3); 
  opencv = new OpenCV(this, 640, 480);
  video = new Capture(this, 640, 480);
  video.start();
  for (int i=0; i<X.length; i++){
    
    rR[i]=random(0,255);   
    gG[i]=random(0,255);
    b[i]=random(0,255);
    
       }
}



void draw() {
background(0);  
  if (video.available() == true) {
    video.read();
  
  }  

  opencv.loadImage(video);
  opencv.useColor(HSB);
  opencv.setGray(opencv.getH());
  opencv.inRange(10, 1000);
  opencv.erode();
 opencv.erode();
  opencv.erode();
  opencv.erode();
 contours = opencv.findContours(true, true); 
 for (int f=0; f<contours.size(); f++) {
    fill(rR[f],gG[f],b[f]);
        stroke(rR[f],gG[f],b[f]);
   if (contours.get(f).area() > 100) {
     contours.get(f).draw();
      if (contours.get(f).containsPoint(int(240/1), int(180/1))) {
      int r = (frameCount % 100) * (100 - (frameCount % 100)) ;
      ellipse(240, 180, r, r);
    }
   }
   
  }

}
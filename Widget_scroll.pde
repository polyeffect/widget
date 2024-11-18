import processing.sound.*;
import controlP5.*;

SoundFile soundfile;
ControlP5 cp5;

PImage rect1;
PImage rect2;
PImage musicWidget;

// mouse scroll
boolean isLocked = false;
float pos, npos;

// sound
Boolean isPlay = false;

void setup() {
  size(360, 800);
  background(255);
  
  soundfile = new SoundFile(this, "PerfectNight.mp3");
  
  cp5 = new ControlP5(this);
  
  cp5.addButton("playBtn")
     .setPosition(71,241)
     .setImage(loadImage("play_circle.png"))
     .updateSize();
  
  rect1 = loadImage("Rectangle_1.png");
  rect2 = loadImage("Rectangle_2.png");
  musicWidget = loadImage("Music_Widget.png");
}

void draw() {
  background(255);
  
  npos = constrain(npos, -800, 0);
  pos += (npos - pos) * 0.1;
  
  pushMatrix();
  translate(0, int(pos));
  
  image(rect1, 20, 20);
  image(musicWidget, 20, 190);
  image(rect2, 190, 190);
  
  for (int i = 0; i < 7; i++) {
    image(rect1, 20, i * 170 + 360);
  }
  
  cp5.getController("playBtn").setPosition(71,241 + pos);
  
  popMatrix();
}


// Mouse Scroll
void mousePressed() {
  isLocked = true;
}

void mouseDragged(MouseEvent event) {
  if (isLocked) {
    npos += (mouseY - pmouseY) * 1.5;
  }
}

void mouseReleased() {
  isLocked = false;
}

// Sound Play
public void playBtn() {
  println("click btn");
  
  if (isPlay) {
    soundfile.pause();
    cp5.getController("playBtn").setImage(loadImage("play_circle.png"));
  } else {
    soundfile.play();
    cp5.getController("playBtn").setImage(loadImage("pause_circle.png"));
  }
  
  isPlay = !isPlay;
}

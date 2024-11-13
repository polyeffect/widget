import processing.sound.*;
import controlP5.*;

SoundFile soundfile;
ControlP5 cp5;

int bgColor = color(182, 65, 215);
PImage widgetMusic;
PImage[] playImg = new PImage[3];
PImage[] pauseImg = new PImage[3];

Boolean isPlay = false;

void setup() {
  size(360, 800);
  background(bgColor);
  
  soundfile = new SoundFile(this, "PerfectNight.mp3");
  
  for (int i = 0; i < 3; i++) {
     playImg[i] = loadImage("play_circle.png");
     pauseImg[i] = loadImage("pause_circle.png");
  }
  
  cp5 = new ControlP5(this);
  
  cp5.addButton("playBtn")
     .setPosition(70,70)
     .setImages(playImg)
     .updateSize();
  
  widgetMusic = loadImage("widget_music.png");
}

void draw() {
  image(widgetMusic, 15, 15);
}

void setButton() {
  
}

public void playBtn() {
  println("click btn");
  
  if (isPlay) {
    soundfile.pause();
    cp5.getController("playBtn").setImages(playImg);
  } else {
    soundfile.play();
    cp5.getController("playBtn").setImages(pauseImg);
  }
  
  isPlay = !isPlay;
}

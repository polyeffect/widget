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

// text
PFont ef;
PFont kf, kfb;

CColor ccolor;

void setup() {
  size(360, 800);
  background(255);

  soundfile = new SoundFile(this, "PerfectNight.mp3");

  cp5 = new ControlP5(this);

  cp5.addButton("playBtn")
    .setPosition(71, 241)
    .setImage(loadImage("play_circle.png"))
    .updateSize();

  rect1 = loadImage("Rectangle_1.png");
  rect2 = loadImage("Rectangle_2.png");
  musicWidget = loadImage("Music_Widget.png");

  // text
  ef = createFont("Arial", 16, true);
  kf = createFont("NotoSansKR-Regular.ttf", 48, true);
  kfb = createFont("NanumMyeongjo-Bold.ttf", 16, true);

  // cp5 text buttton
  cp5.addButton("textButton")
    .setValue(10)
    .setPosition(40, 380)
    .setSize(100, 50)
    .setId(1);

  ControlFont font = new ControlFont(kfb, 16);

  cp5.getController("textButton")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setText("버튼스")
    .setSize(24);

  // cp5 color
  ccolor = new CColor();
  ccolor.setBackground(color(0, 100, 50))
    .setForeground(color(100, 0, 50))
    .setActive(color(127, 64, 32));
  ;
  cp5.setColor(ccolor);
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

  cp5.getController("playBtn").setPosition(71, 241 + pos);
  cp5.getController("textButton").setPosition(40, 380 + pos);

  // text
  // english default font
  textFont(ef, 16);
  fill(0);
  text("Hello Strings!", 214, 226);

  // korean embedded
  textFont(kf, 16);
  text("안녕하세요,\n영화배우\n한석귭니다.", 214, 256);

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

// Text Button
public void textButton(int value) {
  println("text button pressed." + value);
}

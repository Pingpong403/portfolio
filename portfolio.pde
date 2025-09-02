// CUSTOM MOUSE CLICKING TOOL
boolean mouseChoose = false;
void mouseReleased() {
  mouseChoose = true;
  clicked = false;
  // set to false at the end of drawing phase
}

// CUSTOM KEY CONTROL TOOL
boolean keyReady = true;
void keyReleased() {
  keyReady = true;
  // set to false when a key is pressed
}

// Constants
int SCREEN_WIDTH = 1200; //1500
int SCREEN_HEIGHT = 800; //1000

// WindowHelper stuff
WindowHelper wh;

// TimeHelper stuff
TimeHelper th;

// KeyboardHelper stuff
KeyboardHelper kh;

// Button stuff
ArrayList<Button> buttons;
Button inputModeButton;
Button generateWordButton;
Button rewindTimeButton;

// Slider stuff
ArrayList<Slider> sliders;
Slider rSlider;
Slider gSlider;
Slider bSlider;
Slider aSlider;
Slider dummySlider;
Slider selectedSlider;
boolean sliderPicked = false;

// Square stuff
int squareR;
int squareG;
int squareB;
int squareA;

// Word stuff
String displayWord = "";

// Misc
boolean clicked = false;
boolean typing = false;
boolean rewinding = false;
int timeOfRewind = 0;
ArrayList<Integer> times;
ArrayList<String> labels;
boolean paused = false;
boolean focusPaused = false;

void settings() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup() {
  wh = new WindowHelper();
  
  th = new TimeHelper();
  th.generateTimestamp("Start");
  times = th.getTimes();
  labels = th.getLabels();
  
  kh = new KeyboardHelper();
  
  squareR = (int)random(256);
  squareG = (int)random(256);
  squareB = (int)random(256);
  squareA = (int)random(256);
  
  buttons = new ArrayList<Button>();
  inputModeButton = new Button(new Position(20, 20), "Write", 150, 40);
  generateWordButton = new Button(new Position(20, 80), "Get Word", 150, 40);
  rewindTimeButton = new Button(new Position(20, 140), "Rewind", 150, 40);
  buttons.add(inputModeButton);
  buttons.add(generateWordButton);
  buttons.add(rewindTimeButton);
  
  sliders = new ArrayList<Slider>();
  rSlider = new Slider(new Position(SCREEN_WIDTH / 2 - 45, SCREEN_HEIGHT / 2 + 100), "R", 200, (float)squareR / 255.0);
  gSlider = new Slider(new Position(SCREEN_WIDTH / 2 - 15, SCREEN_HEIGHT / 2 + 100), "G", 200, (float)squareG / 255.0);
  bSlider = new Slider(new Position(SCREEN_WIDTH / 2 + 15, SCREEN_HEIGHT / 2 + 100), "B", 200, (float)squareB / 255.0);
  aSlider = new Slider(new Position(SCREEN_WIDTH / 2 + 45, SCREEN_HEIGHT / 2 + 100), "A", 200, (float)squareA / 255.0);
  sliders.add(rSlider);
  sliders.add(gSlider);
  sliders.add(bSlider);
  sliders.add(aSlider);
  dummySlider = new Slider();
  selectedSlider = dummySlider;
}

void draw() {
  focusPaused = !wh.isFocused();
  
  // DRAW EVERYTHING
  if (rewinding) background(220, 255, 220); else background(255);
  
  th.drawFPS(SCREEN_WIDTH);
  th.drawTimeline(20, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 20);
  noStroke();
  fill(squareR, squareG, squareB, squareA);
  rectMode(CENTER);
  rect(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 400, 400);
  fill(255);
  rect(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 - 20, 150, 280);
  for (Button button : buttons) {
    button.display();
  }
  for (Slider slider : sliders) {
    slider.display();
  }
  noStroke();
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text(displayWord, SCREEN_WIDTH / 2, 40);
  
  // INTERACT WITH EVERYTHING
  
  if (!rewinding && !(paused || focusPaused)) {
    // For single-frame events
    if (mousePressed && !clicked) {
      clicked = true;
    }
    // For general mouse presses
    if (mousePressed) {
      for (Button button : buttons) {
        if (button.isMouseWithin()) {
          button.press();
        }
        else {
          button.unpress();
        }
      }
      if (!sliderPicked) {
        for (Slider slider : sliders) {
          if (slider.isMouseWithin()) {
            selectedSlider = slider;
          }
        }
        sliderPicked = true;
      }
      else {
        if (selectedSlider == rSlider) {
          rSlider.calcRatio();
          int squareRBefore = squareR;
          squareR = (int)(rSlider.getRatio() * 255);
          th.generateTimestamp("r:" + String.valueOf(squareRBefore) + "->" + String.valueOf(squareR));
        }
        else if (selectedSlider == gSlider) {
          gSlider.calcRatio();
          int squareGBefore = squareG;
          squareG = (int)(gSlider.getRatio() * 255);
          th.generateTimestamp("g:" + String.valueOf(squareGBefore) + "->" + String.valueOf(squareG));
        }
        else if (selectedSlider == bSlider) {
          bSlider.calcRatio();
          int squareBBefore = squareB;
          squareB = (int)(bSlider.getRatio() * 255);
          th.generateTimestamp("b:" + String.valueOf(squareBBefore) + "->" + String.valueOf(squareB));
        }
        else if (selectedSlider == aSlider) {
          aSlider.calcRatio();
          int squareABefore = squareA;
          squareA = (int)(aSlider.getRatio() * 255);
          th.generateTimestamp("a:" + String.valueOf(squareABefore) + "->" + String.valueOf(squareA));
        }
      }
    }
    else {
      for (Button button : buttons) {
        button.unpress();
      }
    }
    if (mouseChoose) {
      if (inputModeButton.isMouseWithin()) {
        if (typing) {
          inputModeButton.setText("Write");
          th.generateTimestamp("fn");
        }
        else {
          inputModeButton.setText("Function");
          th.generateTimestamp("wt");
        }
        typing = !typing;
      }
      if (generateWordButton.isMouseWithin()) {
        String word = "";
        ArrayList<String> inputs = th.getLabels();
        ArrayList<String> wordReversed = new ArrayList<String>();
        for (int i = inputs.size() - 1; i >= 0; i--) {
          if (inputs.get(i).length() == 1) {
            wordReversed.add(inputs.get(i));
          }
          else if (inputs.get(i) == "gw") {
            break;
          }
        }
        // undo reverse
        for (int i = wordReversed.size() - 1; i >= 0; i--) {
          word += wordReversed.get(i);
        }
        displayWord = word.trim();
        th.generateTimestamp("gw");
      }
      if (rewindTimeButton.isMouseWithin()) {
        times = th.getTimes();
        labels = th.getLabels();
        timeOfRewind = frameCount;
        rewinding = true;
      }
      for (Button button : buttons) {
        button.unpress();
      }
      selectedSlider = dummySlider;
      sliderPicked = false;
    }
    
    // For single-frame key presses
    if (keyPressed && keyReady) {
      if (typing) {
        th.generateTimestamp(kh.charToStr(key, true, true));
      }
      else {
        if (key == 'd') {
          th.generateTimestamp("de");
          th.deactivate();
        }
        if (key == 'r') {
          th.reactivate();
          th.generateTimestamp("re");
        }
        if (key == 'p' || key == 'P') {
          paused = true;
        }
      }
      keyReady = false;
    }
    
    // For general key presses
    if (keyPressed) {
      
    }
  }
  // paused
  else if (paused || focusPaused) {
    rectMode(CENTER);
    stroke(0, 70);
    strokeWeight(100);
    fill(255, 70);
    rect(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, SCREEN_WIDTH, SCREEN_HEIGHT);
    noStroke();
    fill(0, 70);
    textAlign(CENTER);
    textSize(200);
    text("PAUSED", SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 50);
    if (keyPressed && keyReady && (key == 'p' || key == 'P')) {
      paused = false;
      keyReady = false;
    }
    frameCount--;
  }
  // rewinding
  else {
    // User can still pause
    if (keyPressed && keyReady && (key == 'p' || key == 'P')) {
      paused = true;
      keyReady = false;
    }
    for (Button button : buttons) {
      button.unpress();
    }
    // We have hit the genesis
    if (frameCount <= 1) {
      rewinding = false;
      frameCount = 0;
      timeOfRewind = 0;
      displayWord = "";
      th = new TimeHelper();
      th.generateTimestamp("Start");
    }
    // We are done with actions, waiting for the genesis
    else if (times.get(times.size() - 1) == 0) {
      frameCount -= 2;
    }
    // We have actions to rewind
    else {
      // If this condition fails, it means we aren't at the right time for the next action
      if (frameCount == times.get(times.size() - 1)) {
        String label = labels.get(labels.size() - 1);
        if (label.length() == 1) {
          if (displayWord != "") {
            displayWord = displayWord.substring(0, displayWord.length() - 1);
          }
        }
        else if (label.length() == 2) {
          switch (label) {
            case "wt":
              inputModeButton.press();
              inputModeButton.setText("Write");
              break;
            case "fn":
              inputModeButton.press();
              inputModeButton.setText("Function");
              break;
            case "de":
              th.reactivate();
              break;
            case "re":
              th.deactivate();
              break;
            case "gw":
              String word = "";
              ArrayList<String> inputs = th.getLabels();
              ArrayList<String> wordReversed = new ArrayList<String>();
              for (int i = inputs.size() - 1; i >= 0; i--) {
                if (inputs.get(i).length() == 1) {
                  wordReversed.add(inputs.get(i));
                }
                else if (inputs.get(i) == "gw" && wordReversed.size() != 0) {
                  break;
                }
              }
              // undo reverse
              for (int i = wordReversed.size() - 1; i >= 0; i--) {
                word += wordReversed.get(i);
              }
              displayWord = word.trim();
              break;
            default:
              break;
          }
        }
        else if (label.length() > 1) {
          String[] data;
          String[] twoValues;
          switch (label.charAt(0)) {
            case 'r':
              data = split(label, ":");
              twoValues = split(data[1], "->");
              squareR = Integer.valueOf(twoValues[0]);
              rSlider.setRatio((float)squareR / 255);
              break;
            case 'g':
              data = split(label, ":");
              twoValues = split(data[1], "->");
              squareG = Integer.valueOf(twoValues[0]);
              gSlider.setRatio((float)squareG / 255);
              break;
            case 'b':
              data = split(label, ":");
              twoValues = split(data[1], "->");
              squareB = Integer.valueOf(twoValues[0]);
              bSlider.setRatio((float)squareB / 255);
              break;
            case 'a':
              data = split(label, ":");
              twoValues = split(data[1], "->");
              squareA = Integer.valueOf(twoValues[0]);
              aSlider.setRatio((float)squareA / 255);
              break;
            default:
              break;
          }
        }
        // remove label and time
        times.remove(times.size() - 1);
        labels.remove(labels.size() - 1);
        th.removeLast();
      }
      frameCount -= 2;
    }
  }
  
  // END OF DRAW PHASE ITEMS
  mouseChoose = false;
}

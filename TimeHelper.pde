class TimeHelper {
  class Timestamp {
    public int time;
    public String label = "";
    
    public Timestamp() {
      time = 0;
    }
    public Timestamp(int time) {
      this.time = time;
    }
    public Timestamp(int time, String label) {
      this.time = time;
      this.label = label;
    }
  }
  
  private int genesis;
  private ArrayList<Timestamp> timestamps = new ArrayList<Timestamp>();
  private boolean active = true;
  
  public TimeHelper() {
    genesis = 0;
  }
  
  public TimeHelper(int genesis) {
    this.genesis = genesis;
  }
  
  public Timestamp generateTimestamp() {
    if (active) {
      Timestamp newTimestamp = new Timestamp(frameCount - genesis);
      timestamps.add(newTimestamp);
      return newTimestamp;
    }
    return new Timestamp();
  }
  public Timestamp generateTimestamp(int time) {
    if (active) {
      Timestamp newTimestamp = new Timestamp(time);
      timestamps.add(newTimestamp);
      return newTimestamp;
    }
    return new Timestamp();
  }
  public Timestamp generateTimestamp(String label) {
    if (active) {
      Timestamp newTimestamp = new Timestamp(frameCount - genesis, label);
      timestamps.add(newTimestamp);
      return newTimestamp;
    }
    return new Timestamp();
  }
  public Timestamp generateTimestamp(int time, String label) {
    if (active) {
      Timestamp newTimestamp = new Timestamp(time, label);
      timestamps.add(newTimestamp);
      return newTimestamp;
    }
    return new Timestamp();
  }
  
  public ArrayList<Integer> getTimes() {
    ArrayList<Integer> times = new ArrayList<Integer>();
    for (Timestamp timestamp : timestamps) {
      times.add(timestamp.time);
    }
    return times;
  }
  
  public ArrayList<String> getLabels() {
    ArrayList<String> labels = new ArrayList<String>();
    for (Timestamp timestamp : timestamps) {
      labels.add(timestamp.label);
    }
    return labels;
  }
  
  public void drawTimeline(int startX, int endX, int y) {
    int referenceFrame = active ? frameCount - genesis : timestamps.get(timestamps.size() - 1).time;
    int w = endX - startX;
    stroke(0);
    strokeWeight(2);
    noFill();
    line(startX, y, endX, y);
    
    for (Timestamp ts : timestamps) {
      if (ts.label.length() <= 5) {
        int offset = startX + (int)((float)ts.time / referenceFrame * w);
        stroke(0);
        strokeWeight(2);
        noFill();
        line(offset, y - 10, offset, y + 10);
        textSize(w * 0.02027);
        textAlign(CENTER);
        fill(0);
        noStroke();
        text(ts.label, offset, y - 30);
        }
    }
  }
  
  public void drawFPS(int screenwidth) {
    float ratio = 30.0 / 1000.0;
    textSize(ratio * screenwidth);
    textAlign(RIGHT);
    fill(0, 255, 0);
    text((int)frameRate, SCREEN_WIDTH - 10, ratio * SCREEN_WIDTH);
  }
  
  public void deactivate() { active = false; }
  public void reactivate() { active = true;  }
  
  public void removeLast() {
    timestamps.remove(timestamps.size() - 1);
  }
}

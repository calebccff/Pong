HashMap<Character, Boolean> keys = new HashMap<Character, Boolean>();
char[] controls = {'W', 'S', 'I', 'K'};

void keyPressed() {
  if (keys.get(key) != null) {
    keys.put(key, true);
  }
}

void keyReleased() {
  if (keys.get(key) != null) {
    keys.put(key, false);
  }
}

void mousePressed() {
  ball = new Ball(0);
}
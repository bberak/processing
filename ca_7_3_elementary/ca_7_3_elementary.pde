import java.util.Map;

HashMap<String,Integer> rules = new HashMap<String,Integer>();
int[] cells;
int gen = 0;
int square = 5;

void setup() {
  size(800, 600);
  background(255);
  noStroke();
  
  cells = new int[width / square];
  cells[cells.length / 2] = 1;
  
  rules.put("000", 0);
  rules.put("001", 1);
  rules.put("010", 0);
  rules.put("011", 1);
  rules.put("100", 1);
  rules.put("101", 0);
  rules.put("110", 1);
  rules.put("111", 0);
}


void update() {
  if (gen*square > height)
    return;
    
  int[] temp = new int[cells.length];
  for (int i = 1; i < cells.length-1; i++) {
    int left = cells[i-1]; 
    int middle = cells[i];
    int right = cells[i+1];
    int newstate = rules.get("" + left + middle + right);
    temp[i] = newstate;
  }
  
  cells = temp;
  gen++;
}

void draw() {
  for (int i = 0; i < cells.length; i++) {
    if (cells[i] == 1) fill(0);
    else fill(255);
    rect(i*square,gen*square,square,square);
  }
  update();
}

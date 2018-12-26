// list of points 
Star[] stars;
 
// USED IN ROTATE
float angle;
 
PShape s; 
 
void setup() {
  size(1920, 1020, P3D);
  PFont font;
  font = createFont("Palatino-Roman-48.vlw", 11);
  loadData();
 
  strokeWeight(1);
  stroke(255);
 
  s=createShape(GROUP); 
  PShape temp; 
 
  for (int i = 0; i < stars.length - 1; i++) {
    for (int j = i + 1; j < stars.length; j++) {
      temp=createShape(); 
      temp.beginShape(LINES);
      temp.stroke( random(256), random(256), random(256) );
      temp.vertex(stars[i].x, stars[i].y, stars[i].z);
      temp.vertex(stars[j].x, stars[j].y, stars[j].z);
      temp.endShape();
      s.addChild(temp);
    }
  }
  stars=null;
}
 
void draw() {
 
  background(0); // black 
  lights();
  move();
  shape(s, 0, 0); 
 
  // TO SAVE FRAMES
  //saveFrame("tsne/####.png");
}
 
// LOAD TABLE DATA
void loadData() {
 
  Table table;
 
  int an = 1000;
 
  table = loadTable("c_0000.csv", "header");
  stars = new Star[table.getRowCount()]; 
 
  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
 
    float x = row.getFloat("x")*an;
    float y = row.getFloat("y")*an-600;
    float z = row.getFloat("z")*350;
 
    String id = row.getString("id");
 
    stars[i] = new Star(x, y, z, id);
  }
} 
 
// ROTATE
void move() {
  //translate(width>>2, height/2);
  translate(500, 400);
  rotateY(angle += .002);
}
 
// ====================================================================
// STAR
 
class Star {
  float x, y, z;
 
  String id;
 
  Star(float x_, float y_, float z_, 
    String id_) {
    x = x_;
    y = y_;
    z = z_;
    id = id_;
  }
}//class 
//
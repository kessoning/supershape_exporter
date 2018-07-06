/* SUPERSHAPE EXPORTER
** .superformula is a custom software to export supershapes in OBJ format, and it is based on the 
** supershape by Paul Bourke. The main formula was first proposed by Johan Gielis around 2000, suggesting that the formula 
** can be used to describe many complex shapes and curves that are found in nature.
**
** It was inspired by Coding Challenge #26: 3D Supershapes
** https://youtu.be/akM4wMZIBWg
*/

void setup() {
  size(1280, 720, P3D);
  smooth(8);

  hint(DISABLE_DEPTH_TEST);
  
  cp5 = new ControlP5(this);

  cam = new PeasyCam(this, 1000);

  points = new PVector[total+1][total+1];
  ppoints = new PVector[total+1][total+1];

  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 
    cameraZ/100.0, cameraZ*10000.0);

  init();
  makeGUI();
}

void draw() {
  update();

  background(0);

  view();
  
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
}

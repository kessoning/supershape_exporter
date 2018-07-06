void init() {
  m1 = int(random(10));
  n11 = random(100);
  n12 = random(100);
  n13 = random(100);
  m2 = int(random(10));
  n21 = random(100);
  n22 = random(100);
  n23 = random(100);

  float r = 400;

  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, 0, PI);

    for (int j = 0; j < total; j++) {
      float lon = map(j, 0, total, 0, TWO_PI);

      float x = r * sin(lat) * cos(lon);
      float y = r * sin(lat) * sin(lon);
      float z = r * cos(lat);

      ppoints[i][j] = new PVector(x, y, z);
      points[i][j] = new PVector(0, 0, 0);
    }
  }
}

void update() {
  float r = 200;

  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, -HALF_PI, HALF_PI);

    float r2 = supershape(lat, m1, n11, n12, n13);

    for (int j = 0; j < total; j++) {
      float lon = map(j, 0, total-1, -PI, PI);

      float r1 = supershape(lon, m2, n21, n22, n23);

      ppoints[i][j].x = r * r1 * cos(lon) * r2 * cos(lat);
      ppoints[i][j].y = r * r1 * sin(lon) * r2 * cos(lat);
      ppoints[i][j].z = r * r2 * sin(lat);

      PVector dir = PVector.sub(ppoints[i][j], points[i][j]);
      PVector vel = PVector.div(dir, 7);
      points[i][j].add(vel);
    }
  }
}

void exportOBJ() {
  MeshExport pg = (MeshExport) createGraphics(10, 10, "nervoussystem.obj.OBJExport", "supershape.obj");
  pg.setColor(true);
  pg.beginDraw();
  pg.pushMatrix();

  pg.fill(222, 25, 25, 100);
  pg.stroke(255, 50);

  for (int i = 0; i < total; i++) {
    pg.beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total; j++) {
      PVector p1 = points[i][j];
      PVector p2 = points[i+1][j];
      pg.vertex(p1.x, p1.y, p1.z);
      pg.vertex(p2.x, p2.y, p2.z);
    }
    pg.endShape();
  }  

  pg.popMatrix();

  pg.endDraw();
  pg.dispose();
}

void view() {
  pushMatrix();

  fill(222, 25, 25, 100);
  stroke(255, 50);

  for (int i = 0; i < total; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total; j++) {
      PVector p1 = points[i][j];
      PVector p2 = points[i+1][j];
      vertex(p1.x, p1.y, p1.z);
      vertex(p2.x, p2.y, p2.z);
    }
    endShape();
  }  

  popMatrix();
}

float supershape(float theta, float m, float n1, float n2, float n3) {
  float t1 = abs((1/a) * cos(m * theta / 4));
  t1 = pow(t1, n2);

  float t2 = abs((1/b) * sin(m * theta / 4));
  t2 = pow(t2, n3);

  float t3 = t1 + t2;
  float r = pow(t3, -1 / n1);

  return r;
} 

void random() {
  m1 = int(random(10));
  n11 = random(100);
  n12 = random(100);
  n13 = random(100);
  m2 = int(random(10));
  n21 = random(100);
  n22 = random(100);
  n23 = random(100);

  cp5.getController("M1").setValue(m1);
  cp5.getController("N1_1").setValue(n11);
  cp5.getController("N1_2").setValue(n12);
  cp5.getController("N1_3").setValue(n13);

  cp5.getController("M2").setValue(m2);
  cp5.getController("N2_1").setValue(n21);
  cp5.getController("N2_2").setValue(n22);
  cp5.getController("N2_3").setValue(n23);
}

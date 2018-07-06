void makeGUI() {
  Group g1 = cp5.addGroup("controls")
    .setBackgroundColor(color(0, 64))
    .setBackgroundHeight(280)
    .setBackgroundColor(50)
    .setHeight(15)
    ;

  cp5.addSlider("M1")
    .setPosition(10, 10)
    .setSize(100, 15)
    .setRange(0, 10)
    .setValue(m1)
    .plugTo(this, "m1")
    .moveTo(g1)
    ;

  cp5.addSlider("N1_1")
    .setPosition(10, 35)
    .setSize(100, 15)
    .setRange(0, 100)
    .setValue(m1)
    .plugTo(this, "n11")
    .moveTo(g1)
    ;

  cp5.addSlider("N1_2")
    .setPosition(10, 60)
    .setSize(100, 15)
    .setRange(0, 100)
    .setValue(m1)
    .plugTo(this, "n12")
    .moveTo(g1)
    ;

  cp5.addSlider("N1_3")
    .setPosition(10, 85)
    .setSize(100, 15)
    .setRange(0, 100)
    .setValue(m1)
    .plugTo(this, "n13")
    .moveTo(g1)
    ;

  cp5.addSlider("M2")
    .setPosition(10, 110)
    .setSize(100, 15)
    .setRange(0, 10)
    .setValue(m1)
    .plugTo(this, "m2")
    .moveTo(g1)
    ;

  cp5.addSlider("N2_1")
    .setPosition(10, 135)
    .setSize(100, 15)
    .setRange(0, 100)
    .setValue(m1)
    .plugTo(this, "n21")
    .moveTo(g1)
    ;

  cp5.addSlider("N2_2")
    .setPosition(10, 160)
    .setSize(100, 15)
    .setRange(0, 100)
    .setValue(m1)
    .plugTo(this, "n22")
    .moveTo(g1)
    ;

  cp5.addSlider("N2_3")
    .setPosition(10, 185)
    .setSize(100, 15)
    .setRange(0, 100)
    .setValue(m1)
    .plugTo(this, "n23")
    .moveTo(g1)
    ;

  cp5.addBang("random")
    .setPosition(10, 210)
    .setSize(15, 15)
    .moveTo(g1)
    ;

  cp5.addBang("exportOBJ")
    .setPosition(10, 235)
    .setSize(15, 15)
    .moveTo(g1)
    ;

  // create a new accordion
  accordion = cp5.addAccordion("acc")
    .setPosition(10, 10)
    .setWidth(200)
    .addItem(g1)
    ;

  cp5.getController("random").getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(20).setPaddingY(15);
  cp5.getController("exportOBJ").getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(20).setPaddingY(15);


  cp5.setAutoDraw(false);
}

// Ivan de Wergifosse 20091388

// Digital Frenchie
// Please see ReadMe for full instructions and details.

import javax.swing.JOptionPane;

//Declaring global variables so they're not locked to a single method.

String str=JOptionPane.showInputDialog("Name your dog:\n\n(Limit 5 Characters)\n\n");
String s=str.substring(0,Math.min(str.length(),5));
int mouseClicked; // To count the number of times the Frenchie's nose is booped.

void setup() {
  size(1000,1000);
  noStroke();
  JOptionPane.showMessageDialog(null,"Your dogs name is:\n\n"+s);
}

void draw(){
  background(#298fca);
  hand();
  tag();
  dog();
}

// Drawing a dog tag to display a custom name for the dog as provided by the user through JOptionPane.
// Text size and number of characters limited to ensure all names will fit on the tag.

void tag(){
  fill(#c0c0c0); // Silver
  rect(400,875,200,80);
  int x=400;
  int y=875;
  for(int i=0;i<2;i++){
    ellipse(x,y,50,50);
    for(int j=0;j<2;j++){
      ellipse(x,y+(j*75),50,50);
    }
    x+=200;
  }
  fill(0); // Black
  PFont font=createFont("CASTELAR.TTF",32);
  textFont(font);
  textAlign(CENTER); 
  text(s.toUpperCase(),width/2,930); // Displays the chosen name.
}

// Changing the mouse cursor to a hand to indicate the interactive field for the dog.

void hand(){
    if ((mouseX>250)&&(mouseX<750)&&(mouseY>350)&&(mouseY<850)) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

// Drawing the dog.

void dog(){
  ears();
  fill(40); // Dark grey
  ellipse(500,600,500,500);
  // Putting in the reactions for the dog depending on user interaction, see "Read_Me" for instructions.
  if ((mouseX>400)&&(mouseX<600)&&(mouseY>615)&&(mouseY<680)&&mousePressed&&(mouseButton==RIGHT)) {
    mouthOpen("Woof!");
    mouseClicked++;  // Counter to show how annoyed it is
    eyesOpen();  // Always watching
  } else if ((mouseX>250)&&(mouseX<750)&&
    (mouseY>350)&&(mouseY<850)&&mousePressed&&(mouseButton==LEFT)){
    mouseDragged(true);  // Pet the puppy!
    fill(0);  // Black
    eyesClosed(); 
  } else {
    mouthClosed(); 
    eyesOpen(); 
  }  
  // Jowls
  fill(40); // Dark Grey
  stroke(0); // Black
  strokeWeight(5);
  arc(width/2,745, 280, 270, PI-PI*0.25, PI+PI*0.5, PIE);
  arc(width/2,745,280,270,PI+PI/2,PI+PI*1.25,PIE);
  line(width/2,745,width/2,765);
  // Nose
  fill(20); // Very Dark Grey
  arc(width/2,675,210,130,PI*1.15,PI*1.85,PIE);
  // Nostrils
  for (int i=0;i<2;i++) {
    fill(0);
    ellipse((width/2-25)+50*i,640,30,30);
  }
  noStroke();
}

// Use of a mouseDragged method to simulate petting the dog, making it happy.

void mouseDragged(boolean a){
  mouthOpen();
  // Dogs loves pets, so here's a heart
  fill(255,0,0);
  triangle(500,350,355,125,645,124);
  ellipse(425,100,150,150);
  ellipse(575,100,150,150);
  rect(425,100,200,50);
}

void eyesClosed(){
  for(int i=0;i<2;i++) {
  curve(250+200*i,700,350+200*i,530,450+200*i,530,500+200*i,700);
  }
}

// The dogs mouth changes between three different states depending on interaction, so bespoke methods were written to limit lengthy reitteration of code for each state change.

// The basic state

void mouthClosed() {
  ellipse(width/2,730,250,250);
  fill(#eea9b8);
  ellipse(width/2,745,50,80); //tongue
  fill(40);
}

// Mouth hanging open in happyness

void mouthOpen() {
  ellipse(width/2,740,200,260);
  fill(#eeb4b4);
  ellipse(width/2,740,170,230);
  stroke(0);
  teeth();
  //tongue
  strokeWeight(5);
  fill(#eea9b8);
  ellipse(width/2,745,100,250);
  line(width/2,745,width/2,820);
  noStroke();
}

// The ferocious bark of a tiny dog

void mouthOpen(String bark) {
  ellipse(width/2,740,200,260);
  fill(#eeb4b4);
  ellipse(width/2,740,170,230);
  stroke(0);
  strokeWeight(5);
  fill(#eea9b8);
  //tongue
  ellipse(width/2,745,100,200);
  line(width/2,745,width/2,820);
  teeth();
  fill(0);
  noStroke();
  PFont fontBark=createFont("SHOWG.TTF",100);
  textFont(fontBark);
  text(bark,width/2,200);
  println(s+" annoyance level: "+mouseClicked);
}

// Eight lines of code that are used in two different places, so bespoke method created for ease and speed. Loop not used due to variability in placement.

void teeth() {
  fill(255);
  strokeWeight(3);
  arc(490,850,15,30,PI-PI*0.06,PI*2.11,OPEN);
  arc(475,845,15,30,PI-PI*0.01,PI*2.18,OPEN);
  arc(460,835,15,40,PI,PI*2.2,OPEN);
  arc(510,850,15,30,PI-PI*0.11,PI*2.06,OPEN);
  arc(525,845,15,30,PI-PI*0.18,PI*2.01,OPEN);
  arc(540,835,15,40,PI-PI*0.2,PI*2,OPEN);
}

// The famous large ears of the Frenchie

void ears() {
  for (int i=0;i<2;i++) {
  fill(40);
  ellipse(300+400*i,400,150,300);
  fill(#bd838c);
  ellipse(300+400*i,400,120,270);
  }  
}

// Eyes that follow the cursor in the dog's anticipation of attention. 

void eyesOpen() {
  for (int i=0;i<2;i++) {
    fill(255);
    ellipse(400+200*i,550,120,75);
    float curiox = map(mouseX,0,width,375,425);
    float curioy = map(mouseY,0,height,540,560);
    iris(curiox+200*i,curioy);
  }
}

void iris(float x,float y) {
    fill(#542a0e);
    ellipse(x,y,45,45);
    fill(0);
    ellipse(x,y,20,20);
}

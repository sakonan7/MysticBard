import ddf.minim.*;

//Plays background music and victory music
AudioPlayer player;
Minim minim;

//plays instrument sounds
AudioPlayer player2;
Minim minim2;

//defeat and victory music
AudioPlayer player3;
Minim minim3;

//plays player damaged sounds
AudioPlayer player4;
Minim minim4;

static final int FADE = 2500;

//images
PImage background;
//
//
PImage musicNote1;
PImage musicNote2;
PImage musicNote3;
//
PImage foe1;
PImage foe2;
PImage foe3;
PImage foe4;
PImage foe5;
PImage foetutorial;
PImage foeT2;
PImage foeT3;
PImage foeWhite;
PImage foeRed;

PImage village;
PImage monsters;
PImage loss;
PImage violinAttack;
PImage tutorial;

PImage bard;

PImage violin;
PImage violinUse;
PImage trombone;
PImage tromboneUse;
PImage tromboneUse2;
PImage shieldUse;
PImage tromboneGauge;
PImage violinGauge;
PImage shieldGauge;
PImage tromboneD;
PImage violinD;
PImage shieldD;
PImage tromboneS;
PImage violinNS;

PImage tromboneFirst;
PImage tromboneSecond;
PImage shielding;
PImage nonAttack;
PImage attack;

PImage HP;
PImage HPdamage;

PImage tutorialV;

//Foe sizes
float foe1SizeX;
float foe1SizeY;
//float foe1SizeX;
float foe2SizeX;
float foe2SizeY;
float foe3SizeX;
float foe3SizeY;
float foe4SizeX;
float foe4SizeY;
float foe5SizeX;
float foe5SizeY;
//monster coordinates
float foe1CoordX;
float foe1CoordY;
float foe2CoordX;
float foe2CoordY;
float foe3CoordX;
float foe3CoordY;
float foe4CoordX;
float foe4CoordY;
float foe5CoordX;
float foe5CoordY;

float foetutorialSizeX;
float foetutorialSizeY;
float foetutorialX;
float foetutorialY;

float foeT2SizeX;
float foeT2SizeY;
float foeT2X;
float foeT2Y;

float foeT3SizeX;
float foeT3SizeY;
float foeT3X;
float foeT3Y;

//Foe HP
int foe1HP = 150;
int foe2HP = 150;
int foe3HP = 150;
int foe4HP = 150;
int foe5HP = 150;
int foeTHP = 150;
int foeT2HP = 150;
int foeT3HP = 150;
int playerHP = 100;

int damage = 10;
int tromboneDamage = 0;//15
//int big damage
float HPbar = 600;

//original values are constants
int currentHP = playerHP;
float originalHPbar = 600; //draw and mouseprssed are like loops, can't make
//it HPbar because HPbar's value keeps changing
int currentHPX = 550; //to move the HP bar right to simulate HP
int originalHPX = 550;

//consider multiplying bars and boxes by 1.1 and adding a little to make a multiple of ten
//set these as zero and their drained as true
//and their X's in the right place
//Need the right place to add + 5 to their replenish
float violinBar = 0;
float tromboneBar = 0;

float shieldBar = 190;
float originalWeaponBar = 190; //based on length when its selected
float currentViolinBar = 190;
float currentTromboneBar = 190;
float originalShieldBar = 190;
float currentShieldBar = 190;
int currentViolinBarX = 465;//need separate X for each weapon 465
int originalViolinBarX = 275;
int currentTromboneBarX = 225;
int originalTromboneBarX = 35;
int currentShieldBarX; //initiating it in setup instead because height and
//width may not be defined yet
int originalShieldBarX;
//start with both being drained halfway
boolean violinDrained = true;
boolean tromboneDrained = true;
boolean shieldDrained = false;

boolean monsterViolin = false;
boolean monsterTrombone = false;


//Foe Still alive
//set all foes except foe1 to false
//make foes only alive when the level is 
boolean foe1Alive = true;
boolean foe2Alive = true;
boolean foe3Alive = true;
boolean foe4Alive = true;
boolean foe5Alive = true;

boolean foeTAlive = true;
boolean foeT2Alive = true;
boolean foeT3Alive = true;
boolean playerAlive = true; //Get rid of HP Bar
boolean playerDead = false; //Game Over screen

boolean playerTDead = false;

boolean tutorialStage = false;
boolean stage1 = false;


//create multiple countdowns to trigger enemy attack and enemy attack animation


//int foe1interval = int(random(5, 10)); //random is a float
int foe1interval = 5;
int foe1t = 0;
String foe1time = "005";
//for some reason all intervals need to be 3
int foe1whiteint = 3;
int foe1whitet = 0;
String foe1whitetime = "003";
int foe1flashint = 3;
int foe1flasht = 0;
String foe1flashtime = "003";
//need a second flash for before red
int foe1flash2int = 3;
int foe1flash2t = 0;
String foe1flash2time = "003";
int foe1redint = 3;
int foe1redt = 0;
String foe1redtime = "003";
//int foe2interval = 5;
//int foe2t = 0;
//String foe2time = "005";

int foe2interval = 10;
int foe2t = 0;
String foe2time = "005";
int foe2whiteint = 3;
int foe2whitet = 0;
String foe2whitetime = "003";
int foe2flashint = 3;
int foe2flasht = 0;
String foe2flashtime = "003";
//need a second flash for before red
int foe2flash2int = 3;
int foe2flash2t = 0;
String foe2flash2time = "003";
int foe2redint = 3;
int foe2redt = 0;
String foe2redtime = "003";

//Start at random and then every attack is every 10 seconds
int foeTinterval = int(random(5, 8));
int foeTt = 0;
String foeTtime = "005";
int foeTwhiteint = 3;
int foeTwhitet = 0;
String foeTwhitetime = "003";
int foeTflashint = 3;
int foeTflasht = 0;
String foeTflashtime = "003";
//need a second flash for before red
int foeTflash2int = 3;
int foeTflash2t = 0;
String foeTflash2time = "003";
int foeTredint = 3;
int foeTredt = 0;
String foeTredtime = "003";

//recharge out of start is 10, 15
//slow start up
boolean warmUp = true;

boolean shield = false;
int shieldInterval = 3;
int shieldt = 0;
String shieldtime = "003";

int shieldReplenish = 5;
int shieldReplenisht = 0;
String shieldReplenishtime = "005";

int violinReplenish = int(millis()/1000) + 10;
int violinReplenisht = 0;
String violinReplenishtime = "010";

int tromboneReplenish = int(millis()/1000) + 15;
int tromboneReplenisht = 0;
String tromboneReplenishtime = "015";

boolean firstBlast = true;
boolean secondBlast = false;

//to play attacked anaimation multiple times
boolean playerAttacked = false;
boolean attackBlocked = false;
boolean shieldbroken = false;
boolean foe1Attack = false;
boolean foe2Attack = false;
boolean foe3Attack = false;
boolean foe4Attack = false;
boolean foe5Attack = false;

boolean foeTAttack = false;

//flinching
boolean foe1attacked = false;
boolean foe1Interupt = false;
boolean foe2attacked = false;
boolean foe2Interupt = false;
boolean foe3attacked = false;
boolean foe3Interupt = false;
boolean foe4attacked = false;
boolean foe4Interupt = false;
boolean foe5attacked = false;
boolean foe5Interupt = false;

//foeT2 and foeT3 don't 
//Because They don't attack
boolean foeTattacked = false;
boolean foeTInterupt = false;

boolean foeTdisapp = false;
boolean foeT2disapp = false;
boolean foeT3disapp = false;

//mouse
int cursorX;
int cursorY;

//Tutorial messages
boolean message1 = false;
boolean message2 = false;
boolean message3 = false;
boolean message4 = false;
boolean message5 = false;
boolean message6 = false;
boolean messageViolin = false;
boolean messageTrombone = false;
boolean messageTrombone2 = false;
boolean messageShield = false;
boolean messageShield2 = false;
boolean messageAttacked = false;
boolean messageInterupt = false;
boolean messageLast = true;
boolean messageOver = false;

boolean victory = false;
boolean tutorialVictory = false;
boolean tutorialConclude = false;

PFont Font1;
PFont Font2;
PFont Font3;

PImage treasure;
PImage death;

String weapon;

      //HP
color c1 = color(#F1F200);
color c2 = color(#A1FF00); //green
color c3 = #ADFF00; //lighter green
color c4 = #7C0000; //red
      //(int x, int y, float w, float h, color c1, color c2, 3 or 2)

void setup() {
  size(1100, 900);
  //size(1100, 800);
  Font1 = createFont("TimesNewRomanPSMT-48", 33);
  Font2 = createFont("TimesNewRomanPS-ItalicMT-48", 50);
  Font3 = createFont("TimesNewRomanPS-ItalicMT-48", 40);
  
  background = loadImage("forestcurrent.png");
  //fill(#000000);//do fill before making the rectangle
  //rect(0, height - 250, width, 250);
  
  musicNote1 = loadImage("note1.png");
  musicNote2 = loadImage("note2.png");
  musicNote3 = loadImage("note5.png");
  
  foe1 = loadImage("goblin.png");
  foe2 = loadImage("goblin.png");
  foe3 = loadImage("goblin.png");
  foe4 = loadImage("goblin.png");
  foe5 = loadImage("goblin.png");
  foetutorial = loadImage("goblin.png");
  foeT2 = loadImage("goblin.png");
  foeT3 = loadImage("goblin.png");
  
  foeWhite = loadImage("goblinwhite.png");
  foeRed = loadImage("goblinred.png");
  
  treasure = loadImage("Treasure.png");
  
  village = loadImage("village.png");
  monsters = loadImage("monsters2.png");
  loss = loadImage("Loss.png");
  violinAttack = loadImage("violinAttack.png");
  violinUse = loadImage("violinUse.png");
  tutorial = loadImage("tutorial.png");
  
  violin = loadImage("violinPic.png");
  
  trombone = loadImage("trombonePic.png");
  
  bard = loadImage("village3.png");
  
  tromboneGauge = loadImage("trombone.png");
  violinGauge = loadImage("violin.png");
  shieldGauge = loadImage("shield.png");
  tromboneD = loadImage("tromboneDepleted.png");
  violinD = loadImage("violinD.png");
  shieldD = loadImage("shieldDepleted.png");
  
  violinNS = loadImage("violinNS.png");
  tromboneS = loadImage("tromboneSelect.png");
  
  tromboneUse = loadImage("trombone1st.png");
  tromboneUse2 = loadImage("trombone2nd.png");
  tromboneFirst = loadImage("tromboneAttack.png");
  tromboneSecond = loadImage("secondTrombone.png");

  shielding = loadImage("shielding.png");
  shieldUse = loadImage("shieldDeplete.png");
  
  nonAttack = loadImage("nonAttack.png");
  attack = loadImage("Attack.png");
  
  HP = loadImage("HP.png");
  HPdamage = loadImage("damage.png");
  
  tutorialV = loadImage("victory.jpg");
  
  //control background music here
  
  //minim = new Minim(this);
  //player = minim.loadFile("OST.mp3", 500);
  //player.play();
  //-20 adjusts the sound, adjust higher for higher sound
  //player.shiftGain(player.getGain(),-15,FADE);
  //player.loop();
  
  foe1SizeX = 125 * 1.1;
  foe1SizeY = 200 * 1.1;
  foe1CoordX = 390 - 60;
  foe1CoordY = height - 380 - 25 - 20;
  foe2SizeX = 125 * 1.1;
  foe2SizeY = 200 * 1.1;
  //left most enemy
  foe2CoordX = 180 - 60;
  foe2CoordY = height - 400 - 75 - 20;
  foe3SizeX = 125 * 1.1;
  foe3SizeY = 200 * 1.1;
  foe3CoordX = 600 - 60;
  foe3CoordY = height - 430 - 20;
  
  foetutorialSizeX = 125 * 1.1;
  foetutorialSizeY = 200 * 1.1;
  foetutorialX = width/2 - 100;
  foetutorialY = height - 380 - 50;
  
  foeT2SizeX = 125 * 1.1;
  foeT2SizeY = 200 * 1.1;
  foeT2X = width/2 - 230 - 50;
  foeT2Y = height - 380 - 130 - 50;

  foeT3SizeX = 125 * 1.1;
  foeT3SizeY = 200 * 1.1;
  foeT3X = width/2 + 30 + 50;
  foeT3Y = height - 380 - 130 - 50;  
  
  foe4SizeX = 125 * 1.1;
  foe4SizeY = 200 * 1.1;
  foe4CoordX = 800 - 60;
  foe4CoordY = height - 370 - 75 - 20;

  foe5SizeX = 125 * 1.1;
  foe5SizeY = 200 * 1.1;
  foe5CoordX = 950 - 60;
  foe5CoordY = height - 450 - 75 - 20;
  
  weapon = "Violin";

  currentShieldBarX = width - 225;
  originalShieldBarX = width - 225; 
  
      //HP
      c1 = color(#F1F200);
      c2 = color(#A1FF00); //green
      c3 = #ADFF00; //lighter green
      c4 = #7C0000; //red
      //(int x, int y, float w, float h, color c1, color c2, 3 or 2)  
  
  frameRate(30);
}
//can be used to make permanent changes like an HP Bar
//basically the drawing is being looped over and over but the values are changing
void draw() {
  //adjust framerate so that the objects can be seen
  //-50
  //image(background, 0, 190, width, height);
  image(background, 0, 0, width, height);
  //image(background, -70, -70, width * 1.065, height * 1.09);
  //add +2 to the height so when it shakes, there is something on the bottom
  String clickRight = "Click Right to Continue";
  String clickLeft = "Click Left to Go Back";
  String clickSkip = "S to Skip";
  if (tutorialVictory == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Victory" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Congratulations!!" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF);
    text("You have defeated your first enemy! But the battle has just begun", 50, 210);
    
    //image(tromboneD, 160, 250, 244, 156);
    //800//593
    image(tutorialV, 230, 250, 625, 463);
    text("The true challenge is yet to come", 50, 772); 
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);   
    
    //Thank you for playing
    //Bard
    //stay tuned for more updates
    //see you next time boolean
    //Music
    //
    //Click Righ to go back to the title screen
    //takes you back to the beginning
  }
  if (tutorialConclude == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Tutorial End" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Thank You For Playing" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF);
    text("Stay tuned for more updates", 50, 210);
    
    //image(tromboneD, 160, 250, 244, 156);
    //800//593
    image(tutorialV, 230, 250, 625, 463);
    fill(#FFF300);
    textFont(Font1);
    //text("\n" + "\n" + "Click Right to Proceed", width - 375, height - 165);
    text("\n" + "\n" + "Click Right for Music Credits", width - 465, height - 165);     
  }
  if (victory == true) {
    fill(#0035FF);
    stroke(#98FFFC);
    strokeWeight(3);
    rect(50, 50, width - 100, height - 100, 9);
    //image();
    image(treasure, width/2, height/2, 400, 300);
    
    //Text
    textSize(50);
    fill(#FFFFFF);
    text("Hurrah!!" + 
    "\n" + "You have successfully protected" + "\n" + "the Village!!", 70, height - height + 120);
    fill(#FFF300);

  }
  //death message
  if (playerDead == true) {
    fill(#0035FF);
    stroke(#98FFFC);
    strokeWeight(3);
    rect(50, 50, width - 100, height - 100, 9);
    //image();
    //Text
    textSize(50);
    fill(#FFFFFF);
    text("GAME OVER" + 
    "\n" + "You were defeated and the village" + "\n" + "was overrun by monsters.", 70, height - height + 120);
    fill(#FFF300);
    //indicator to clickRight to continue
    //Click left to start over
    //reset values
  } 
  
  //tutorial messages
  //wrap this in an if statement messageOer = false so I can cancel it with
  //a button press
  //make text smaller and pictures larger
  if (message1 == true) {
    //Mystic Bard
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    //Text
    textSize(50);
    fill(#FFFFFF);
    //only need to do stroke once
    stroke(#98FFFC);
    strokeWeight(3);
    textFont(Font2);
    text("Mystic Bard" + "\n", 50, height - height + 90);
    //decrease font to 40 for next line
    //shrink font here
    
    //text 30
    textSize(25);
    textFont(Font1);
    text("Monsters of the Green Dragon have come from the forest to " + 
    "\n" + "attack the Village.", 50, height - height + 150);
    fill(#FFF300);
    text("\n" + "\n" + clickRight, width - 385, height - 165);
    //move up and increase
    image(village, 325, 235, 438, 313);
    image(monsters, 325, 528, 438, 244);
    
  }
  if (message2 == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Mystic Bard" + "\n", 50, height - height + 90);    
    //Text
    textSize(25);
    textFont(Font1);
    fill(#FFFFFF);
    text("As the Guardian, The Mystic Bard " + "protect the people from"
    + "\n" + "the forces of evil!", 50, height - height + 150);
    fill(#FFF300);
    text("\n" + "\n" + clickRight, width - 385, height - 165);   
    text("\n" + "\n" + clickLeft, 50, height - 165);
    
    image(bard, 220, 235, 660, 540);
  }
  if (message3 == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Mystic Bard" + "\n", 50, height - height + 90);    
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFFFFF);
    text("First, test out your skills!", 50, height - height + 150);
    
    image(tutorial, 220, 195, 646, 528);
    
    //tap S to skip tutorial
    //20 below tutorial
    
    fill(#FFF300);
    
    text("Tap S to Skip Tutorial", width - 715, 778);
    text("\n" + "\n" + clickRight + " To Tutorial", width - 550, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);
  }  
  if (message4 == true) {
    //tutorial,
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Weapons" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF);
    //at the start of the fight, your weapons will be depleted and you
    //will have to wait for a small warmup period before being able to attack
    
    //When your weapon bars are depleted, they will replenish overtime
    //and completely refill after a set time
    //switch between weapons by pressing w for violin and a for trombone
    text("As the Mystic Bard, you have an array of weapons" +
    ", starting with the " + "\n" + "Violin, Trombone and Shield", 50, height - height + 210);
    //height 240
    image(tromboneGauge, 160, 300, 244, 156);
    image(violinGauge, 434, 300, 244, 156);
    image(shieldGauge, 708, 300, 244, 156);
    text("During the start of the fight, you will default to the Violin", 50, 516);
    //image //depleted //reuse same X coordinates for 
    image(tromboneD, 160, 556, 244, 156);
    image(violinD, 434, 556, 244, 156);
    image(shieldD, 708, 556, 244, 156);    
    text("Each time you use a weapon, it will deplete until it can't be used", 50, 772);
    fill(#FFF300);
    textSize(35);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165); 
    text("\n" + "\n" + clickLeft, 50, height - 165);
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }
  if (message5 == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);

    
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Weapons" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF); 
    text("Each time you use a weapon, it will deplete until it can't be used", 50, 210);    
    //move up
    image(tromboneD, 160, 250, 244, 156);
    image(violinD, 434, 250, 244, 156);
    image(shieldD, 708, 250, 244, 156);    
    text("At the start of the fight, your weapons will be depleted and you will"
    + "\n" + "need to wait for a small warmup period before fighting", 50, 466);
    //height 240
    image(tromboneGauge, 160, 558, 244, 156);
    image(violinGauge, 434, 558, 244, 156);
    image(shieldGauge, 708, 558, 244, 156);
    text("When your weapon bars are depleted, they will replenish overtime", 50, 772);  
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);   
    text("\n" + "\n" + clickLeft, 50, height - 165);
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }
  if (message6 == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Weapons" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF);    
    //During the fight, your equipped weapon will be
    text("During the fight, your equipped weapon will be represented by the"
    + "\n" + "gold ring, which will shift to the selected weapon", 50, 210);    
    image(tromboneGauge, 160, 300, 244, 156);
    image(violinGauge, 434, 300, 244, 156);
    image(shieldGauge, 708, 300, 244, 156);
    //press w to switch to trombone and a to switch to violin
    text("Press W to switch to Trombone and A to switch to Violin", 50, 516);
    //image //depleted //reuse same X coordinates for 
    image(tromboneS, 160, 556, 244, 156);
    image(violinNS, 434, 556, 244, 156);
    image(shieldGauge, 708, 556, 244, 156);     
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);   
    text("\n" + "\n" + clickLeft, 50, height - 165);  
  }
  if (messageViolin == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Violin" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF); 
    //The Violin is a fast, single target hitting weapon that replenoshes fast
    //left click on a single target to attack them    
    text("The Violin is a fast, single target hitting weapon that replenishes fast"
    + "\n" + "Left click on a single target to attack it", 50, height - height + 210);
    //height 240
    //image(tromboneGauge, 160, 300, 244, 156);
    //image(violinGauge, 434, 300, 244, 156);
    //image(shieldGauge, 708, 300, 244, 156);
    image(violinAttack, 303, 450, 188, 246);
    image(violinUse, 573, 500, 244, 156);
 
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }    
  if (messageTrombone == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);    
    
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Trombone" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF); 
    text("The Trombone is a slow, multi-hitting weapon that replenishes slowly"
    + "\n" + "Left click on an enemy or on an area between several to attack", 50, height - height + 210);

    image(tromboneFirst, 155, 325, 461, 248);
    image(tromboneUse, 631, 375, 244, 156);
    text("The Trombone has armor piercing qualities. Use it on certain foes to"
    + "\n" + "break their guard", 50, 652);    
    //The first blast will hit every foe but the second blast will
    //only hit enemies in the area around the mouse point
 
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);  
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }
  if (messageTrombone2 == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Trombone" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF); 
    text("The first blast will hit every foe, but the second blast will only hit"
    + "\n" + "enemies in the area around the mouse point", 50, 210);
    image(tromboneFirst, 155, 305, 424, 228);
    image(tromboneUse, 594, 345, 244, 156);
    image(tromboneSecond, 155, 543, 258, 228);
    image(tromboneUse2, 594, 583, 244, 156);
 
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }
  if (messageShield == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Shield" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF); 
    text("Produce a barrier that will Shield against all attacks for two seconds"
    + "\n" + "Right click anywhere to Shield", 50, 210);
    //shield //shield gauge
    //text
    //15/155
    //use trombone y-size
    //use same x-size
    image(shielding, 155, 325, 461, 316); 
    image(shieldUse, 631, 408, 244, 156);
    //shield 
    //image(tromboneFirst, 155, 325, 461, 248);
    //image(tromboneUse, 631, 375, 244, 156); 
    //image(shieldGauge, 708, 556, 244, 156);
    text("But beware, right clicking again will extend the Shield time but"
    + "\n" + "drain your Shield gauge faster", 50, 719); 
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  } 
  if (messageShield2 == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Shield" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF);
    //Also, if you attack before the shield goes down, you will cancel
    //the shield
    //Produce a barrier that will Shield against all attacks for two seconds
    //Right click to Shield
    text("If you attack before the Shield ends, you will cancel the Shield", 50, 210);
    //83
    //1.5 times smaller
    image(shielding, 175, 250, 411, 282); 
    image(shieldUse, 601, 323, 244, 156);
    //15
    image(violinAttack, 292, 542, 176, 231);
    
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }  
  if (messageAttacked == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Combat" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF);
    text("Foes will attack in intervals of 5 seconds, indicated by their flashing"
    + "\n" + "But at the start, they will attack in intervals of 5 to 8 seconds", 50, 210);
    //83
    //1.5 times smaller
    //image(shielding, 175, 250, 411, 282); 
    //image(shieldUse, 601, 323, 244, 156);
    //15
    //image(violinAttack, 290, 542, 178, 231);
    image(nonAttack, 140, 350, 188, 246);
    image(attack, 343, 350, 188, 246);
    image(HP, 566, 403, 401, 67);
    image(HPdamage, 566, 478, 401, 67);
    
    //enemy not flashing //enemy flashing
    //HP bar regular
    //HP bar goes down
    
    //Each attack will lower your HP, at the top right
    text("Each attack will lower your HP, shown at the top right"
    + "\n" + "In the tutorial, only one foe will attack", 50, 719); 
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }  
  if (messageInterupt == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Combat" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF);
    text("But attacking a foe before it finishes flashing will interupt its attack", 50, 210);
    //83
    //15
    image(attack, 205, 300, 188, 246);
    image(violinAttack, 408, 300, 188, 246);
    image(nonAttack, 611, 300, 188, 246);
    //image(HP, 566, 403, 401, 67);
    //image(HPdamage, 566, 478, 401, 67);
    
    //enemy not flashing //enemy flashing
    //HP bar regular
    //HP bar goes down
    
    //Each attack will lower your HP, at the top right
    text("But you have to get the timing just right", 50, 656); 
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }  
  if (messageLast == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textSize(50);
    textFont(Font2);
    fill(#FFFFFF);
    
    stroke(#98FFFC);
    strokeWeight(3);
    textFont(Font2);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Conclusion" + "\n", 50, height - height + 150);
    //Text
    textSize(35);
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);
    text("Now that the tutorial is over, unleash your power!", 50, 210);
    //83
    //15
    image(tutorial, 220, 245, 646, 528);
    
    //Each attack will lower your HP, at the top right
    fill(#FFF300);
    textFont(Font1);
    //proceed to battle
    text("\n" + "\n" + "Click Right to Proceed", width - 375, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }  
    //stroke(#98FFFC);
    //strokeWeight(3);    
    //image(attack, 70, 548, 170, 219);
  //enemy flash
  //attack
  //enemy not flash
    
//explain battle system here
//HP
//foes flashing to attack

//make fill = gray?
  
  
  //maybe make else into else if (playerAlive) and later stageOne == true
  //and make else if (playerDead, produce the death messages)
  //test to see if game still runs
  //fix stroke
  //else if playerAlive && (stageOne = true||tutorialStage = true)
  else if (playerAlive && (stage1 == true || tutorialStage == true)){
         //try setting the values of the bars = 0 and their X's the furthest
         //and boolean that they are drained
         //then add the times to their replenish
  
      //got rid of this if statement because whole will be based on player being Alive

        //works because the values of currentHPX and HPbar keep changing
        //so it keeps getting produced again and again
    setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
        //currentHP is calculated in mousePressed instead
        //HP bar determines length of bar
    if (currentHP == playerHP + damage) {
      currentHP = playerHP;
      setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
    }  
        //weapons bar
        //try generating the values with regular size here
        //determine what gets drained based on violined boolean
        //then decide on a multiplier to make each window bigger
        
        //do all gradients here so color isn't messed up
    setGradient(currentShieldBarX, height-105, shieldBar, 15, c3, c4, 2);
    setGradient(currentViolinBarX, height-105, violinBar, 15, c3, c4, 2); //Violin
    setGradient(currentTromboneBarX, height-105, tromboneBar, 15, c3, c4, 2);
        
    stroke(#9B9B9B); //gray
    strokeWeight(3);
    noFill();
    textSize(20);
  
        //Don't gotta adjust the location of shield
    text("   Shield", width - 227, height - 115);
    rect(width - 240, height - 140, 220, 120, 7); //don't gotta adjust the
        //size or location of shield
        
    text("   Violin", 268, height - 115);
    rect(260, height - 140, 220, 120, 7); //don't gotta adjust the
        
    text("   Trombone", 33, height - 115);
    rect(20, height - 140, 220, 120, 7);
        
    strokeWeight(10);
    point(277, height - 122); //violin
    point(37, height - 122); //trombone
    point(width - 223, height - 122);
    strokeWeight(3);
        
        //ring around selected weapon
        //more golden, li
        //glitch, if I press W first by accident, can't switch seemingly
    if (weapon == "Violin") {
      stroke(#FFCE46);
          //#FFCE46
          //FFD443
      rect(252, height - 148, 235, 135, 8);          
    }
    if (weapon == "Trombone") {
      stroke(#FFCE46);
          //stroke(#FFB443);
          
      rect(13, height - 148, 235, 135, 8);
          //println("switched");
    }   
    if (warmUp == true) {
      violinReplenish = int(millis()/1000) + 5;
      tromboneReplenish = int(millis()/1000) + 10;
      foeTinterval = int(millis()/1000) + int(random(5,8));
      warmUp = false;
    }
        
    if (violinDrained == true) {
          //for some reason time starts 9 seconds too soon
          //try setting the values before
      violinReplenisht = violinReplenish-int(millis()/1000);
      violinReplenishtime = nf(violinReplenisht , 3);
      if(violinReplenisht == 0){
        violinBar = originalWeaponBar;
        currentViolinBarX = originalViolinBarX; 
        violinDrained = false;
      }

      //text(violinReplenishtime, width/2, height - 200);
    }
    if (tromboneDrained == true) {
      tromboneReplenisht = tromboneReplenish-int(millis()/1000);
      tromboneReplenishtime = nf(tromboneReplenisht , 3);

      if(tromboneReplenisht == 0){
        tromboneBar = originalWeaponBar;
        currentTromboneBarX = originalTromboneBarX; 
        tromboneDrained = false;
      }

      //text(tromboneReplenishtime, width/2, height - 200);
    }        
        
        //int millis keeps getting bigger
        //might be getting affected by the countdown
        
    if(shieldDrained == true && shield == false) {
          //Replenish is the interval
      //println("replenish");
          //shieldReplenish +=shieldReplenish;
      shieldReplenisht = shieldReplenish - int(millis()/1000);
      shieldReplenishtime = nf(shieldReplenisht, 3);
          //temp1 = shieldReplenish;
          //temp2 = shieldReplenisht;
      //text(shieldReplenisht, width/2, height - 200);
          //I think the timer goes to fast for this
      if(shieldReplenisht > 0) {
        shieldBar += originalShieldBar/5;
        currentShieldBarX -= originalShieldBarX;
      }
      else if (shieldReplenisht == 0) {
        shieldBar = originalShieldBar;
        currentShieldBarX = originalShieldBarX;
        shieldReplenish += 5;
        shieldDrained = false;
      }
    
    }
      
      //boolean for playerAttacked, reset boolean after damage is deducted
      //need to ensure multiple foes can attack too
      //so program too foes to attack at the same time
      //foe2Attack
      //may need to program one screen to happen a few second after
      //or give booleans for each monster attacking
      
      //trying overlaying a damage screen here
      //use booleans to determine which enemies will show up
      //doesn't work, have to do it from where the foe is being displayed
    if (playerAttacked == true) {
        //enemy damaged animation
        //gonna need a countdown for this too
        //not properly overlaying damaged screen over 
        //draw the enemies and background then the red screen
        //wait, i did
        //-30
      image(background, 0, -40, width, height);
        //use if cases to display foes
      if (tutorialStage == true) {
        //make it so when playerAttacked == true, foes disapp
        //try that with shield too
        //foeT2disapp = true;
        //foeT3disapp = true;
          //println(foeT2disapp);
        //println("disapp");
        if (foeTAlive == true) {
          image(foetutorial, foetutorialX, foetutorialY - 30, foetutorialSizeX, foetutorialSizeY);
        }
        if (foeT2Alive == true) {
          image(foeT2, foeT2X, foeT2Y - 30, foeT2SizeX, foeT2SizeY);
        }
        if (foeT3Alive == true) {
          image(foeT3, foeT3X, foeT3Y - 30, foeT3SizeX, foeT3SizeY);
        }
      }
                 
        //red filter
      fill(117,0,0,155);
      stroke(#FFFFFF);
          
      rect(0, 1, 1099, 898);        

      playerHP -= damage;
      HPbar = HPbar - originalHPbar/10;
      //reduce HPX here and transfer to currentHPX
      currentHPX = currentHPX + originalHPX/10;
        
        //try using the original values of the bars and shifting them up
      setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
 
      setGradient(currentShieldBarX, height-105, shieldBar, 15, c3, c4, 2);
      setGradient(currentViolinBarX, height-105, violinBar, 15, c3, c4, 2); //Violin
      setGradient(currentTromboneBarX, height-105, tromboneBar, 15, c3, c4, 2);
        
      stroke(#9B9B9B);
      strokeWeight(3);
      noFill();
      textSize(20);
  
        //Don't gotta adjust the location of shield
      text("   Shield", width - 227, height - 115);
      rect(width - 240, height - 140, 220, 120, 7); //don't gotta adjust the
        //size or location of shield
        
      text("   Violin", 268, height - 115);
      rect(260, height - 140, 220, 120, 7); //don't gotta adjust the
        
      text("   Trombone", 33, height - 115);
      rect(20, height - 140, 220, 120, 7);
        
      strokeWeight(10);
      point(277, height - 122); //violin
      point(37, height - 122); //trombone
      point(width - 223, height - 122);
      strokeWeight(3);
        
      //ring around selected weapon
      //more golden, li
      //glitch, if I press W first by accident, can't switch seemingly
      if (weapon == "Violin") {
        stroke(#FFCE46);
          //#FFCE46
          //FFD443
        rect(252, height - 148, 235, 135, 8);          
      }
      if (weapon == "Trombone") {
        stroke(#FFCE46);
          //stroke(#FFB443);
          
        rect(13, height - 148, 235, 135, 8);
          //println("switched");
      }        
                     
      //minim4 = new Minim(this);
      //player4 = minim4.loadFile("axepunch.mp3", 500);
      //player4.play();
      //player4.shiftGain(player4.getGain(), 0,FADE); 
        //playerDamaged = false;
        
        //resetting values for whether foe attacked
      println(damage);
      if (foe1Attack == true) {
        foe1Attack = false;
      }
      if (foe2Attack == true) {
        foe2Attack = false;
      }
      if (foe3Attack == true) {
        foe3Attack = false;
      }
      if (foe4Attack == true) {
        foe4Attack = false;
      }
      if (foe5Attack == true) {
        foe5Attack = false;
      }
      if (foeTAttack == true) {
        foeTAttack = false;
        println("reset");
      }        
        //if (tutorialStage == true) {
          //foeTdisapp = false;
          //foeT2disapp = false;
         // foeT3disapp = false;
        //}
      playerAttacked = false;
    }
      //maybe make case else if playerAttacked == false, bring back foes
    else if (playerAttacked == false) {
      foeTdisapp = false;
      foeT2disapp = false;
      foeT3disapp = false;
    }
            
      //only works once and some of the timers aren't displayed
      //put print messages to see what is playing and isn't
      //red filter isn't appearing
      //animations aren't playing
      //attacker
      //96
    if (foeTAttack == true) {
        //maybe do animation here
        //feed from foe boolean
        //why does it keep looping here?
        
      stroke(#FFFFFF);
        
      foeTwhitet = foeTwhiteint-int(millis()/1000);
      foeTwhitetime = nf(foeTwhitet , 3);
        //display in white
      text(foeTwhitetime, width/2, height - 50);  
        //not even playing this part
      if (foeTwhitet > 0) {
        image(foeWhite, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
      }
      else if (foeTwhitet <= 0) {
        foeTflasht = foeTflashint - int(millis()/1000);
        foeTflashtime = nf(foeTflasht, 3);
        text(foeTflashtime, width/2, height - 100);
        //println("white");
        if (foeTflasht > 0) {
          image(foetutorial, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
        }
        else if (foeTflasht <= 0) {
            //foe1Red = true;
          foeTredt = foeTredint-int(millis()/1000);
          foeTredtime = nf(foeTredt , 3);
          text(foeTredtime, width/2, height - 150);
          //println("flash");
            //red skipped?
          if (foeTredt > 0) {
            image(foeRed, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
            //println("red");
          }
          else if (foeTredt <= 0) {
             //another flash
            foeTflash2t = foeTflash2int - int(millis()/1000);
            foeTflash2time = nf(foeTflash2t, 3);
            text(foeTflash2time, width/2, height - 200);
            //println("red");

            if (foeTflash2t > 0) {
                              //this image plays the whole time
              image(foetutorial, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
                                //enemy interupt here
                                //8w
              if (foeTattacked == true) {
                println("Interupted");

                foeTAttack = false;
                foeTInterupt = true;
                foeTdisapp = false;
              }
            }
            else if (foeTflash2t <= 0 && foeTInterupt == false) {
              //println("flash2");
              if (shield == true) {
                foeTAttack = false;
                attackBlocked = true;
                
                  //trying puting green filter here
                foeTinterval = int(millis()/1000) + 5;
                foeTwhiteint = int(millis()/1000) + 3; //maybe feed more
                foeTflashint = int(millis()/1000) + 3;
                foeTredint = int(millis()/1000) + 3; //maybe feed more
                foeTflash2int = int(millis()/1000) + 3;
              }
              else if (shield == false) {
                  //image(foe1, foe1CoordX, foe1CoordY - 30, foe1SizeX, foe1SizeY);
                
                playerAttacked = true;
                println("hit"); //not playing at all                  
                    
                foeTinterval = int(millis()/1000) + 5;
                    //do I still need these
                    //yes and making them all 3 
                foeTwhiteint = int(millis()/1000) + 3; //maybe feed more
                foeTflashint = int(millis()/1000) + 3;
                foeTredint = int(millis()/1000) + 3; //maybe feed more
                foeTflash2int = int(millis()/1000) + 3;
              }                 
            }
          }                  
        }
      }        
        //playerAttacked = true;
        //replenish here
        //replenish in foe1Alive == true if attack shielded
      if (foeTInterupt == true) {
        foeTInterupt = false;
        foeTattacked = false; //need to include this
        foeTinterval = int(millis()/1000) + 5;
          //do I still need these
                    //yes and making them all 3 
        foeTwhiteint = int(millis()/1000) + 3; //maybe feed more
        foeTflashint = int(millis()/1000) + 3;
        foeTredint = int(millis()/1000) + 3; //maybe feed more
        foeTflash2int = int(millis()/1000) + 3;
        println("refilled");
        println(foeTInterupt);
      }
    }      

    if (foe3Attack == true) {
      playerAttacked = true;
    }
    if (foe4Attack == true) {
      playerAttacked = true;
    }
    if (foe5Attack == true) {
      playerAttacked = true;
    }

      //shield case
    if (shield == true) {
          //need to place everything here
          //weapon bars show over screen
          //move screen once
          //last variable controls trasparency, lower the more transparent

          //fill(97, 183,0,190); //milkier  
          //fill(55, 100, 0);
          //test multiple times to see if this works
          //use attackBlocked boolean to determine

          //maybe some bugs with violin when certain places are clicked
          //shieldInterval fed during click
          //minim4 = new Minim(this);
          //player4 = minim4.loadFile("electric.mp3", 500);
          //player4.play();
          //originally -30
          //player4.shiftGain(player4.getGain(), -30,FADE);
      shieldt = shieldInterval - int(millis()/1000);
      shieldtime = nf(shieldt, 3);
      text(shieldtime, width/2, height - 200);
      if (shieldt > 0) {
        if (attackBlocked == false) {
          fill(70, 100, 0, 190); //darker
          //image(background, 0, 0, width, height);
          if (tutorialStage == true) {
            foeTdisapp = true;
            foeT2disapp = true;
            foeT3disapp = true;
            if (foeTAlive == true) {
              image(foetutorial, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
            }
            if (foeT2Alive == true) {
              image(foeT2, foeT2X, foeT2Y, foeT2SizeX, foeT2SizeY);
            }
            if (foeT3Alive == true) {
              image(foeT3, foeT3X, foeT3Y, foeT3SizeX, foeT3SizeY);
            }
          }              
              //problem not fixed after removing foes
          rect(0, 0, 1100, 900);              
          setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
       
          setGradient(currentShieldBarX, height-105, shieldBar, 15, c3, c4, 2);
          setGradient(currentViolinBarX, height-105, violinBar, 15, c3, c4, 2); //Violin
          setGradient(currentTromboneBarX, height-105, tromboneBar, 15, c3, c4, 2);
        
          stroke(#9B9B9B);
          strokeWeight(3);
          noFill();
          textSize(20);
  
              //Don't gotta adjust the location of shield
          text("   Shield", width - 227, height - 115);
          rect(width - 240, height - 140, 220, 120, 7); //don't gotta adjust the
             //size or location of shield
        
          text("   Violin", 268, height - 115);
          rect(260, height - 140, 220, 120, 7); //don't gotta adjust the
        
          text("   Trombone", 33, height - 115);
          rect(20, height - 140, 220, 120, 7);
        
          strokeWeight(10);
          point(277, height - 122); //violin
          point(37, height - 122); //trombone
          point(width - 223, height - 122);
          strokeWeight(3);
        
              //ring around selected weapon
              //more golden, li
              //glitch, if I press W first by accident, can't switch seemingly
          if (weapon == "Violin") {
            stroke(#FFCE46);
              //#FFCE46
              //FFD443
            rect(252, height - 148, 235, 135, 8);          
          }
          if (weapon == "Trombone") {
            stroke(#FFCE46);
                //stroke(#FFB443);
            rect(13, height - 148, 235, 135, 8);
                //println("switched");
          }
        }
                      //if cases determine if there's screen shake
        if(attackBlocked == true) {
          fill(70, 100, 0, 190); //darker
          image(background, 0, -20, width, height);
              //generate foes based onstage
          if (tutorialStage == true) {
            foeTdisapp = true;
            foeT2disapp = true;
            foeT3disapp = true;                
            if (foeTAlive == true) {
              image(foetutorial, foetutorialX, foetutorialY - 20, foetutorialSizeX, foetutorialSizeY);
            }
            if (foeT2Alive == true) {
              image(foeT2, foeT2X, foeT2Y - 20, foeT2SizeX, foeT2SizeY);
            }
            if (foeT3Alive == true) {
              image(foeT3, foeT3X, foeT3Y - 20, foeT3SizeX, foeT3SizeY);
            }
          }
              //image(foe2, foe2CoordX, foe2CoordY - 20, foe2SizeX, foe2SizeY);
              //image(foe1, foe1CoordX, foe1CoordY - 20, foe1SizeX, foe1SizeY);
              //image(foe3, foe3CoordX, foe3CoordY - 20, foe3SizeX, foe3SizeY);
              //image(foe4, foe4CoordX, foe4CoordY - 20, foe4SizeX, foe4SizeY);
              //image(foe5, foe5CoordX, foe5CoordY - 20, foe5SizeX, foe5SizeY);  
          rect(0, 0, 1100, 900);
          setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
          setGradient(currentShieldBarX, height-105, shieldBar, 15, c3, c4, 2);
          setGradient(currentViolinBarX, height-105, violinBar, 15, c3, c4, 2); //Violin
          setGradient(currentTromboneBarX, height-105, tromboneBar, 15, c3, c4, 2);
        
          stroke(#9B9B9B);
          strokeWeight(3);
          noFill();
          textSize(20);
              
          text("   Shield", width - 227, height - 115);
          rect(width - 240, height - 140, 220, 120, 7); //don't gotta adjust the
              //size or location of shield
        
          text("   Violin", 268, height - 115);
          rect(260, height - 140, 220, 120, 7); //don't gotta adjust the
        
          text("   Trombone", 33, height - 115);
          rect(20, height - 140, 220, 120, 7);
        
          strokeWeight(10);
          point(277, height - 122); //violin
          point(37, height - 122); //trombone
          point(width - 223, height - 122);
          strokeWeight(3);
        
              //ring around selected weapon
              //more golden, li
              //glitch, if I press W first by accident, can't switch seemingly
          if (weapon == "Violin") {
            stroke(#FFCE46);
                //#FFCE46
                //FFD443
          
            rect(252, height - 148, 235, 135, 8);          
          }
          if (weapon == "Trombone") {
            stroke(#FFCE46);
                //stroke(#FFB443);
          
            rect(13, height - 148, 235, 135, 8);
                //println("switched");
          }   
              
              //minim4 = new Minim(this);
              //player4 = minim4.loadFile("axepunch.mp3", 300);
             // player4.play();
              //player4.shiftGain(player4.getGain(), -30,FADE);              
              
          attackBlocked = false;
        }
            //triggers attack block and multiple blocks
        if (foe1Attack == true) {
          attackBlocked = true;
        }
        if (foe2Attack == true) {
          attackBlocked = true;
        }
        if (foe3Attack == true) {
          attackBlocked = true;
        }
        if (foe4Attack == true) {
          attackBlocked = true;
        }
        if (foe5Attack == true) {
          attackBlocked = true;
        }
        if (foeTAttack == true) {
          attackBlocked = true;
        }
   
       } 
          //replenish interval here
       if (shieldt == 0) {
            //shieldInterval += 3; //do I still need tothis then since shieldInterval
             //will always be greater than init
         shield = false;
            //println("Yes2");
            //println(shieldInterval);
       }
          //need this to trigger after all is said and done
          
          //foeTdisapp = false;
          //foeT2disapp = false;
          //foeT3disapp = false;
    }
      //shield is false for 
      //need to see if this conflicts with the other if shield
      //maybe this is interfering
      //maybe make it shield == false && playerAttacked == false;
      //removing this code did nothing
      //the disapp's are being undone
      //&& playerAttacked == false
    else if (shield == false) {
      if (tutorialStage == true) {
        foeTdisapp = false;
        foeT2disapp = false;
        foeT3disapp = false;          
      }
    }
     
      //feeding white and red animations
      //put enemy countdowns above foes to ensure time don't change
      //can attack simultaenously, but glitches after second foe attacks
      //stage boolean wra decide which enemies will spawn
      //
      //encase all five foes in if (stage1 == true)
    if (tutorialStage == true) {
        //put all tutorial stuff here
        //outside of
        //programming attack here
        //violin
        
        //attacking
        //95
        //maybe make it so when playerAttacked, make foes disappear
        //then use an else statement to bring back monsters
      if(foeTAlive == true) {
          //stroke(#00D7FF);
          //rect(foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
          //stroke(#FFF700);
          //rect(foetutorialX - 140, foetutorialY - 140, foetutorialSizeX + 280, foetutorialSizeY + 280);
          //noFill();
          //image(foetutorial, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
          
          //works except for playerAttacked
          //need to check the values of these individually, maybe foeTAttack is cancelled
          //early
          //for multiple foes attacking, gonna need to consider what to do with
          //FoeAttack
          //checked playerAttacked to see if booleans are resolved
          //enemies also reappear too fast
          //use booleans to determine whether they disappear or not
        if (foeTdisapp == false) {
          image(foetutorial, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
        } 
        if (foeTAttack == false) {
            //foe1interval is always 0
            //feed white and red here?
            //trying not to loop
          foeTt = foeTinterval-int(millis()/1000);
          foeTtime = nf(foeTt , 3);
          text(foe1time, width/2, height - 50);
            //too fast
            //make a case where this regular image only plays if playerAttacked == false
            //if foeTdisappear == false
            //if equals to false in other parts
            //try less than zero
            
          if(foeTt <= 0){
              //know what these values are and how they are working
              //leading to negative values
              //only playing white
            foeTwhiteint += 3; //only works for 3 for some reason
            foeTflashint += 4;
            foeTredint += 5; //higher is causing problems
            foeTflash2int += 6;
              
            foeTdisapp = true;
            println(foeTdisapp + " foeT"); //needs to work because this has to disappear
            //before attack animations
            foeTAttack = true;
          }
            //if case where if playerAttacked, enemy adjusted
            //may not need to do that for shield == false then
            //only the red filter part
            //for if another enemy attacks

        } 
        if (playerAttacked == true) {
          foeTdisapp = true;
        }

      }   
      if(foeT2Alive == true) {
          //stroke(#00D7FF);
          //rect(foeT2X, foeT2Y, foeT2SizeX, foeT2SizeY);
          //stroke(#FFF700);
          //rect(foeT2X - 140, foeT2Y - 140, foeT2SizeX + 280, foeT2SizeY + 280);
          //noFill();  
        if (foeT2disapp == false) {
          image(foeT2, foeT2X, foeT2Y, foeT2SizeX, foeT2SizeY);
        }
        if (playerAttacked == true) {
          foeT2disapp = true;
        }

      }
      if(foeT3Alive == true) {
          //stroke(#00D7FF);
          //rect(foeT3X, foeT3Y, foeT3SizeX, foeT3SizeY);
          //stroke(#FFF700);
          //rect(foeT3X - 140, foeT3Y - 140, foeT3SizeX + 280, foeT3SizeY + 280);
          //noFill();
        if (foeT3disapp == false) {
          image(foeT3, foeT3X, foeT3Y, foeT3SizeX, foeT3SizeY);
        } 
        if (playerAttacked == true) {
          foeT3disapp = true;
        }
      
      }        
    }
    else if (stage1 == true) {
      if(foe1Alive == true) {
          //rect(foe1CoordX, foe1CoordY, foe1SizeX, foe1SizeY);
          //stroke(#00D7FF);
          //noFill();
        
          //run continuously
          //test foe attacking multiple times and with a randomized start time
          //foe1interval = int(millis()/1000) + 10;
        if (foe1Attack == false) {
            //foe1interval is always 0
            //feed white and red here?
            //trying not to loop
          foe1t = foe1interval-int(millis()/1000);
          foe1time = nf(foe1t , 3);
            //text(foe1time, width/2, height - 200);
            //too fast
            //make a case where this regular image only plays if playerAttacked == false
          if (foe1t > 0) {
            image(foe1, foe1CoordX, foe1CoordY, foe1SizeX, foe1SizeY);
          }
            //try less than zero
          if(foe1t == 0){
              //enemy attack animation
              //feed these values back after foe1attack
              //feed values here first?
              //look back at shieldReplenish
              //error, when I use monsterViolin it stays == true
              
                //gonna need timer for flashing
               //foe1White = false; //reset value
               //foe1interval+=5; //need this
               //if foered, can cancel with attack
               //move enemy blocked here
               //this code works, so might as well do it
               //if might be making the program slow
               //need to feed foe1white and foe1red
               //need bo9oleans to feed the values
               //foe1white +=3
               //foe1white = true
               //if foe1white == true
               //try a good old fashioned countdown
              //foe1White = true;
              
              //for some reason has to be either 3 and 4
              //only issue is it goes too slow lol
            foe1whiteint += 3; //only works for 3 for some reason
            foe1flashint += 4;
            foe1redint += 5; //higher is causing problems
            foe1flash2int += 6;
            foe1Attack = true;
          }
            //if case where if playerAttacked, enemy adjusted
            //may not need to do that for shield == false then
            //only the red filter part
            //for if another enemy attacks
          if (playerAttacked && foe1t > 0) {
            image(foe1, foe1CoordX, foe1CoordY - 30, foe1SizeX, foe1SizeY);
                //println("played");
            fill(117,0,0,155);
            stroke(#FFFFFF);
            rect(0, 1, 1099, 898);               
          }
        }
          //overlaying a green filter on foe
        if(shield == true && attackBlocked == false) {
            //merge this rectangle with the other rectangle
          fill(70, 100, 0, 190);
          noStroke();
          rect(foe1CoordX, foe1CoordY, foe1SizeX, foe1SizeY);
        }
      }
        //foe2 is screwing
        //maybe test with the other foes to see if the same problem happens
        //test for foe2, see if it works out
        //still lagging behind, playing afterwards
      if (foe2Alive == true) {
          //rect(foe2CoordX, foe2CoordY, foe2SizeX, foe2SizeY);
          //stroke(#00D7FF);
          //noFill();
        image(foe2, foe2CoordX, foe2CoordY, foe2SizeX, foe2SizeY);
      }
      if(foe3Alive == true) {
          //rect(foe3CoordX, foe3CoordY, foe3SizeX, foe3SizeY);
          //stroke(#00D7FF);
          //noFill();
        image(foe3, foe3CoordX, foe3CoordY, foe3SizeX, foe3SizeY);           
      }
      if(foe4Alive == true) {
          //rect(foe4CoordX, foe4CoordY, foe4SizeX, foe4SizeY);
          //stroke(#00D7FF);
          //noFill();        
        image(foe4, foe4CoordX, foe4CoordY, foe4SizeX, foe4SizeY);
      } 
      if(foe5Alive == true) {
          //rect(foe5CoordX, foe5CoordY, foe5SizeX, foe5SizeY);
          //stroke(#00D7FF);
          //noFill();        
        image(foe5, foe5CoordX, foe5CoordY, foe5SizeX, foe5SizeY);
      }        
    }
  }
}
void keyPressed () {
  //glitch when you press a or w if you already have that weapon selected
  if (key == 's' || key == 'S' && tutorialStage == false && messageOver == false) {
    //worked fine yesterday
    message1 = false;
    message2 = false;
    message3 = false;
    message4 = false;
    message5 = false;
    message6 = false;
    messageViolin = false;
    messageTrombone = false;
    messageTrombone2 = false;
    messageShield = false;
    messageShield2 = false;
    messageAttacked = false;
    messageInterupt = false;
    messageLast = false;
    messageOver = true;
    tutorialStage = true;
    println("skipped");
  }  
  //trying removing the weapon!=
  if ((key == 'w' || key == 'W')) {
    weapon = "Violin";
    println("Violin");
  }
  if (key == 'a' || key == 'A') {
    weapon = "Trombone";
    println("Trombone");
  }
}  
void mousePressed () {
  //old #F0C2ED
  
  color damageWave = #DEA3DA;
  //regular gradient
  
  //Playing the tutorial messages
  //only determine booleans
  if (messageOver == false) {
    if (mouseButton == RIGHT && message1 == true) {
      message1 = false;
      message2 = true;
    }
    else if (mouseButton == RIGHT && message2 == true) {
      message2 = false;
      message3 = true;
    }
    else if (mouseButton == LEFT && message2 == true) {
      message2 = false;
      message1 = true;
    }
   //clicking through messages
   //if (mouseButton == LEFT && message1 == false && message2 == true) {
     //message1 = true;
   //}
   //clicking right skips right to fight
    else if (mouseButton == RIGHT && message3 == true) {
      message3 = false;
      message4 = true;
    }
    else if (mouseButton == LEFT && message3 == true) {
      message3 = false;
      message2 = true;
    }    
    else if (mouseButton == RIGHT && message4 == true) {
      message4 = false;
      message5 = true;
    }
    else if (mouseButton == LEFT && message4 == true) {
      message4 = false;
      message3 = true;
    }    
    else if (mouseButton == RIGHT && message5 == true) {
      message5 = false;
      message6 = true;
    }
    else if (mouseButton == LEFT && message5 == true) {
      message5 = false;
      message4 = true;
    }
    else if (mouseButton == RIGHT && message6 == true) {
      message6 = false;
      messageViolin = true;
    }
    else if (mouseButton == LEFT && message6 == true) {
      message6 = false;
      message5 = true;
    }    
    else if (mouseButton == RIGHT && messageViolin == true) {
      messageViolin = false;
      messageTrombone = true;
    }
    else if (mouseButton == LEFT && messageViolin == true) {
      messageViolin = false;
      message6 = true;
    }    
    else if (mouseButton == RIGHT && messageTrombone == true) {
      messageTrombone = false;
      messageTrombone2 = true;
    }
    else if (mouseButton == LEFT && messageTrombone == true) {
      messageTrombone = false;
      messageViolin = true;
    }    
    else if (mouseButton == RIGHT && messageTrombone2 == true) {
      messageTrombone2 = false;
      messageShield = true;
    }  
    else if (mouseButton == LEFT && messageTrombone2 == true) {
      messageTrombone2 = false;
      messageTrombone = true;
    }    
    else if (mouseButton == RIGHT && messageShield == true) {
      messageShield = false;
      messageShield2 = true;
    }  
    else if (mouseButton == LEFT && messageShield == true) {
      messageShield = false;
      messageTrombone2 = true;
    }
    else if (mouseButton == RIGHT && messageShield2 == true) {
      messageShield2 = false;
      messageAttacked = true;
    }  
    else if (mouseButton == LEFT && messageShield2 == true) {
      messageShield2 = false;
      messageShield = true;
    }
    else if (mouseButton == RIGHT && messageAttacked == true) {
      messageAttacked = false;
      messageInterupt = true;
    }  
    else if (mouseButton == LEFT && messageAttacked == true) {
      messageAttacked = false;
      messageShield2 = true;
    }
    else if (mouseButton == RIGHT && messageInterupt == true) {
      messageInterupt = false;
      messageLast = true;
    }  
    else if (mouseButton == LEFT && messageInterupt == true) {
      messageInterupt = false;
      messageAttacked = true;
    }     
    else if (mouseButton == RIGHT && messageLast == true) {
      messageLast = false;
      tutorialVictory = true;
      //messageOver = true;
      //tutorialStage = true;
      //println("over");
    }  
    else if (mouseButton == LEFT && messageLast == true) {
      messageLast = false;
      messageInterupt = true;
    }
    
    else if (mouseButton == RIGHT && tutorialVictory == true) {
      tutorialVictory = false;
      tutorialConclude = true;
    }  
    else if (mouseButton == LEFT && tutorialVictory == true) {
      tutorialVictory = false;
      messageLast = true;
    }    
    else if (mouseButton == RIGHT && tutorialConclude == true) {
      tutorialConclude = false;
      messageOver = true;
      tutorialStage = true;
      println("over");
    }  
    else if (mouseButton == LEFT && tutorialConclude == true) {
      tutorialConclude = false;
      tutorialVictory = true;
    }    
    //make new click Right when battle is won
    //choice to restart game from start
  }
   
  //main game
  //add that message 1, 2, 3 and 4 have to be false
  //create right click here
  //works if level1 or level 2 or level 3 are true
  //shield = false  so barrier can't be spammed
  else if (messageOver == true && playerAlive == true) {
    if (mouseButton == RIGHT && shieldDrained == false && shield == false) {
    //light milky green and no screenshake
      println(monsterViolin + " violin");
      if ((mouseX <= width && mouseX > 0) && (mouseY <= height && mouseY > 0)) {
        shieldInterval = int(millis()/1000) + 2; //one action, feeds next countdown before
        //it begins
        shieldBar -= originalShieldBar/2;
        //shift right
        currentShieldBarX += originalShieldBar/2;
        shield = true;
        if (shieldBar == 0) {
          shieldDrained = true;
          println(0);
          //add to shieldreplenish here
          shieldReplenish = int(millis()/1000) + 5 + 3; //feeding value so that when
          //countdown starts, it's always a count of 5 top 0
        }

      }
    }
    else if (mouseButton == RIGHT && shieldDrained == false && shield == true) {
    //light milky green and no screenshake
    
      if ((mouseX <= width && mouseX > 0) && (mouseY <= height && mouseY > 0)) {
        shieldInterval = int(millis()/1000) + 2; //one action, feeds next countdown before
        //it begins
        shieldBar -= originalShieldBar/2;
        //shift right
        currentShieldBarX += originalShieldBar/2;
        if (shieldBar == 0) {
          shieldDrained = true;
          println(0);
          //add to shieldreplenish here
          shieldReplenish = int(millis()/1000) + 5 + 3; //feeding value so that when
          //countdown starts, it's always a count of 5 top 0
        }

      }
    }
    //testing replenishing
    //maybe make this else if and as long as playerAlive = true
    else if (mouseButton == LEFT) {
    
      cursorX = mouseX;
      cursorY = mouseY;
    
    //Enemy attack overlay an image of the monster flashing red and with white edges
    //twice
    //fill(117,0,0,155);
    
      //wrap code in if for violin
      //if weapon Trombone
      //280
      if (weapon == "Trombone") {   
        //music symbols above all foes
        //all foes in shot
        //recut first Trumpet
        //put booleans for stage1 and tutorial
        if (tromboneBar > 0 && tromboneDrained == false) {
          tromboneBar -= originalWeaponBar/2;
          currentTromboneBarX += originalWeaponBar/2;  
          //program animations here
          //program them only to make foe spasm if foe is still alive
          //make damge and notes appear based on whether they're damaged or not
          //7w
          if (monsterTrombone == true) {
            monsterTrombone = false; //reset
            //if case
            if (firstBlast == true) {
              minim2 = new Minim(this);
              player2 = minim2.loadFile("firstTrumpet.mp3", 500);
              player2.play();
              player2.shiftGain(player2.getGain(), -30,FADE);
              firstBlast = false;
              secondBlast = true;
            }
            else if (secondBlast == true) {
              minim2 = new Minim(this);
              player2 = minim2.loadFile("secondTrumpet.mp3", 500);
              player2.play();
              player2.shiftGain(player2.getGain(), -30,FADE);
              firstBlast = true;
              secondBlast = false;
            }
            
            //gonna need to do an or for all the other foes
            //not even running
            if (foeTattacked == true) {
              println("play");
              foeTattacked = false;
            }
            if (shield == true) {
              shield = false;
              //shieldInterval += 3; //i think the way millis works is that in increases over time
              //also need to add cases for if the countdown jasn't ended yet
              //if if shieldt = 1, add only 2 and if shieldt = 2, add only one
              if (shieldt == 1) {
                shieldInterval += 2;
              }
            }            
            
            if (tromboneBar == 0) {
              tromboneDrained = true;
              tromboneReplenish = int(millis()/1000) + 15;
              //println("zero");
            }            
          }
          //tutorial stuff
          if (tutorialStage == true) {
            //if (firstBlast == true)
            //if (secondBlast == true)
            if (firstBlast == true) {
              if ((mouseX <= width && mouseX >= 0) && (mouseY <= height && mouseY >= 0)) {
                textSize(32);
                image(background, 0, -20, width, height);
                //create if cases only when foes are alive
                if (foeTAlive == true) {
                  image(foetutorial, foetutorialX - 10, foetutorialY - 60, foetutorialSizeX * 1.1, foetutorialSizeY * 1.1);
                  image(musicNote2, foetutorialX + 5, foetutorialY - 60, 100, 100);
                  text("  " + 15, foetutorialX + foetutorialSizeX/5, foetutorialY - 60);
                  foeTHP -= 15;
                }
                if (foeT2Alive == true) {
                  image(foeT2, foeT2X - 10, foeT2Y - 60, foeT2SizeX * 1.1, foeT2SizeY * 1.1);
                  image(musicNote2, foeT2X + 5, foeT2Y - 60, 100, 100);
                  text("  " + 15, foeT2X + foeT2SizeX/5, foeT2Y - 60);
                  foeT2HP -= 15;
                }
                if (foeT3Alive == true) {
                  image(foeT3, foeT3X - 10, foeT3Y - 60, foeT3SizeX * 1.1, foeT3SizeY * 1.1);
                  image(musicNote2, foeT3X + 5, foeT3Y - 60, 100, 100);
                  text("  " + 15, foeT3X + foeT3SizeX/5, foeT3Y - 60);
                  foeT3HP -= 15;
                }

                //sound waves
                noFill();
                strokeWeight(7);
                //make new shades
                stroke(#FFC246);
                ellipse(cursorX, cursorY, width/2 + 250, width/2 + 240);
                ellipse(cursorX, cursorY, width/2 + 120, width/2 + 110);
                ellipse(cursorX, cursorY, width/2 - 10, width/2);
                ellipse(cursorX, cursorY, width/2 - 140, width/2 - 150);
                //2.5
                image(trombone, cursorX - 40, cursorY - 15, 100, 40);

                fill(#E505FF);
              
                setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
          
                setGradient(currentShieldBarX, height-105, shieldBar, 15, c3, c4, 2);
                setGradient(currentViolinBarX, height-105, violinBar, 15, c3, c4, 2); //Violin
                setGradient(currentTromboneBarX, height-105, tromboneBar, 15, c3, c4, 2);
        
                stroke(#9B9B9B);
                strokeWeight(3);
                noFill();
                textSize(20);
  
                //Don't gotta adjust the location of shield
                text("   Shield", width - 227, height - 115);
                rect(width - 240, height - 140, 220, 120, 7); //don't gotta adjust the
                //size or location of shield
        
                text("   Violin", 268, height - 115);
                rect(260, height - 140, 220, 120, 7); //don't gotta adjust the
        
                text("   Trombone", 33, height - 115);
                rect(20, height - 140, 220, 120, 7);
        
                strokeWeight(10);
                point(277, height - 122); //violin
                point(37, height - 122); //trombone
                point(width - 223, height - 122);
                strokeWeight(3);
                //golden ring
                stroke(#FFCE46);
                //stroke(#FFB443);
          
                rect(13, height - 148, 235, 135, 8);
                foeTattacked = true;
                monsterTrombone = true;
              }              
            }
            if (secondBlast == true) {
              //tremor
              if (mouseX <= foetutorialSizeX + foetutorialX + 140 && mouseX >= foetutorialX - 140
              && (mouseY <= foetutorialSizeY + foetutorialY + 140 && mouseY >= foetutorialY - 140) && foeTAlive) { 
              //damage spasm
                image(foetutorial, foetutorialX - 10, foetutorialY - 60, foetutorialSizeX * 1.1, foetutorialSizeY * 1.1);

                //Music Notes
                image(musicNote2, foetutorialX + 5, foetutorialY - 60, 100, 100);

                //sound waves
                noFill();
                strokeWeight(7);
                //make new shades
                stroke(#FFC246);
                ellipse(cursorX, cursorY, 280, 280);
                ellipse(cursorX, cursorY , 200, 200);
                ellipse(cursorX, cursorY , 120, 120);
                ellipse(cursorX, cursorY , 60, 60);
                
                image(trombone, cursorX - 40, cursorY - 15, 100, 40);
      
                foeTHP -= 10;
                textSize(32);
                //make text bolder
                text("  " + 10, foetutorialX + foetutorialSizeX/5, foetutorialY - 60);
                
                fill(#E505FF);

                foeTattacked = true;
                monsterTrombone = true;
              }
              if (mouseX <= foeT2SizeX + foeT2X + 140 && mouseX >= foeT2X - 140
              && (mouseY <= foeT2SizeY + foeT2Y + 140 && mouseY >= foeT2Y - 140) && foeT2Alive) { 
              //damage spasm
                
                image(foeT2, foeT2X - 10, foeT2Y - 60, foeT2SizeX * 1.1, foeT2SizeY * 1.1);
          
                //Music Notes
                image(musicNote2, foeT2X + 5, foeT2Y - 60, 100, 100);

                //sound waves
                noFill();
                strokeWeight(7);
                //make new shades
                stroke(#FFC246);
                ellipse(cursorX, cursorY, 280, 280);
                ellipse(cursorX, cursorY , 200, 200);
                ellipse(cursorX, cursorY , 120, 120);
                ellipse(cursorX, cursorY , 60, 60);
                //length 10
                image(trombone, cursorX - 40, cursorY - 15, 100, 40);
      
                foeT2HP -= 10;
                textSize(32);
                //make text bolder
                text("  " + 10, foeT2X + foeT2SizeX/5, foeT2Y - 60);
                
                fill(#E505FF);

                monsterTrombone = true;
              }
              if (mouseX <= foeT3SizeX + foeT3X + 140 && mouseX >= foeT3X - 140
              && (mouseY <= foeT3SizeY + foeT3Y + 140 && mouseY >= foeT3Y - 140) && foeT3Alive) { 
              //damage spasm
                
                image(foeT3, foeT3X - 10, foeT3Y - 60, foeT3SizeX * 1.1, foeT3SizeY * 1.1);
          
                //Music Notes
                image(musicNote2, foeT3X + 5, foeT3Y - 60, 100, 100);

                //sound waves
                noFill();
                strokeWeight(7);
                //make new shades
                stroke(#FFC246);
                ellipse(cursorX, cursorY, 280, 280);
                ellipse(cursorX, cursorY , 200, 200);
                ellipse(cursorX, cursorY , 120, 120);
                ellipse(cursorX, cursorY , 60, 60);
                
                image(trombone, cursorX - 40, cursorY - 15, 100, 40);
      
                foeT3HP -= 10;
                textSize(32);
                //make text bolder
                text("  " + 10, foeT3X + foeT3SizeX/5, foeT3Y - 60);
                
                fill(#E505FF);
              
                monsterTrombone = true;
              }              
            }
     
          }
        }

      }
      if (weapon == "Violin") {
      //everything to the right of the coordinate but not past the size
      //height = top of screen
      //if case, if violinBar != 0, can attack
        //do I reall need this
        //for draining properly properly
        if (violinBar > 0 && violinDrained == false) {
          violinBar -= originalWeaponBar/10;
          currentViolinBarX += originalWeaponBar/10;
          
        //create a boolean for whenever a monster is attacked and then drain meter
        //and reset boolean
        //could do this for anycase where something that applies to all happens
        //ie music
        //use violin cancel 
        //9w
          if (monsterViolin == true) {

            monsterViolin = false; //reset
            //gonna need to do an or for all the other foes
            //code, use or for all cases if a foe is interupted or not interupted
            //works because violin is single target
            if (foe1attacked == false) {
              minim2 = new Minim(this);
              player2 = minim2.loadFile("violin.mp3", 500);
              player2.play();
              player2.shiftGain(player2.getGain(), -30,FADE);
              //println(foe1HP); //nothing printing
            }
            if (foeTattacked == true) {
              //println("play");
              foeTattacked = false;
            }            
            if (foe1attacked == true) {
              //println("play");
              foe1attacked = false;
            }
            if (shield == true) {
              shield = false;
              //shieldInterval += 3; //i think the way millis works is that in increases over time
              //also need to add cases for if the countdown jasn't ended yet
              //if if shieldt = 1, add only 2 and if shieldt = 2, add only one
              if (shieldt == 1) {
                shieldInterval += 2;
              }
            }

            if (violinBar == 0) {
              violinDrained = true;
              violinReplenish = int(millis()/1000) + 10;
            }
          }
          //use stages here to determine where the hit boxes are
          //if tutorialStage == true
          if (tutorialStage == true) {
            if (mouseX <= foetutorialSizeX + foetutorialX && mouseX >= foetutorialX
            && (mouseY <= foetutorialSizeY + foetutorialY && mouseY >= foetutorialY) && foeTAlive) { 
            //damage spasm
              image(foetutorial, foetutorialX - 15, foetutorialY - 30, foetutorialSizeX * 1.2, foetutorialSizeY * 1.2);
          
            //Music Notes
              image(musicNote1, foetutorialX + foetutorialSizeX/5, foetutorialY - foetutorialY/10, 100, 100);
      
            //sound waves
              noFill();
              strokeWeight(5);
            //make new shades
              stroke(damageWave);
              ellipse(cursorX, cursorY, 140, 140);
              ellipse(cursorX, cursorY , 100, 100);
              ellipse(cursorX, cursorY , 50, 50);
              //9.3
              image(violin, cursorX, cursorY - 20, 46.5, 50);
      
              foeTHP -= damage;
              textSize(32);
              //make text bolder
              text("  " + damage, foetutorialX + foetutorialSizeX/4, foetutorialY - foetutorialY/11);
              fill(#E505FF);
              //maybe do this if flash2 didn't reach zero yet
              foeTattacked = true;
              monsterViolin = true;
            }
            if (mouseX <= foeT2SizeX + foeT2X && mouseX >= foeT2X
            && (mouseY <= foeT2SizeY + foeT2Y && mouseY >= foeT2Y) && foeT2Alive) { 
            //damage spasm
              image(foeT2, foeT2X - 15, foeT2Y - 30, foeT2SizeX * 1.2, foeT2SizeY * 1.2);
          
            //Music Notes
              image(musicNote1, foeT2X + foeT2SizeX/5, foeT2Y - foeT2Y/10, 100, 100);
      
            //sound waves
              noFill();
              strokeWeight(5);
            //make new shades
              stroke(damageWave);
              ellipse(cursorX, cursorY, 140, 140);
              ellipse(cursorX, cursorY , 100, 100);
              ellipse(cursorX, cursorY , 50, 50);
              
              image(violin, cursorX, cursorY - 20, 46.5, 50);
              
              foeT2HP -= damage;
              textSize(32);
              //make text bolder
              text("  " + damage, foeT2X + foeT2SizeX/4, foeT2Y - foeT2Y/11);
              fill(#E505FF);
              monsterViolin = true;
            } 
            if (mouseX <= foeT3SizeX + foeT3X && mouseX >= foeT3X
            && (mouseY <= foeT3SizeY + foeT3Y && mouseY >= foeT3Y) && foeT3Alive) { 
            //damage spasm
              image(foeT3, foeT3X - 15, foeT3Y - 30, foeT3SizeX * 1.2, foeT3SizeY * 1.2);
          
            //Music Notes
              image(musicNote1, foeT3X + foeT3SizeX/5, foeT3Y - foeT3Y/10, 100, 100);
      
            //sound waves
              noFill();
              strokeWeight(5);
            //make new shades
              stroke(damageWave);
              ellipse(cursorX, cursorY, 140, 140);
              ellipse(cursorX, cursorY , 100, 100);
              ellipse(cursorX, cursorY , 50, 50);
              
              image(violin, cursorX, cursorY - 20, 46.5, 50);
      
              foeT3HP -= damage;
              textSize(32);
              //make text bolder
              text("  " + damage, foeT3X + foeT3SizeX/4, foeT3Y - foeT3Y/11);
              fill(#E505FF);
              monsterViolin = true;
            }            
          }
          
          //for stage1
          if (stage1 == true) {
            if (mouseX <= foe1SizeX + foe1CoordX && mouseX >= foe1CoordX
            && (mouseY <= foe1SizeY + foe1CoordY && mouseY >= foe1CoordY) && foe1Alive) { 
            //damage spasm
              image(foe1, foe1CoordX - 10, foe1CoordY - 40, foe1SizeX * 1.1, foe1SizeY * 1.1);
          
          //Music Notes
              image(musicNote1, foe1CoordX + foe1SizeX/5, foe1CoordY - foe1CoordY/10, 100, 100);
      
          //sound waves
              noFill();
              strokeWeight(5);
          //make new shades
              stroke(damageWave);
              ellipse(cursorX, cursorY, 140, 140);
              ellipse(cursorX, cursorY , 100, 100);
              ellipse(cursorX, cursorY , 50, 50);
      
              foe1HP -= damage;
              textSize(32);
              //make text bolder
              text("  " + damage, foe1CoordX + foe1SizeX/4, foe1CoordY - foe1CoordY/11);
              fill(#E505FF);
            //maybe do this if flash2 didn't reach zero yet
              foe1attacked = true;
              monsterViolin = true;
            }
          //foe2
            if (mouseX <= foe2SizeX + foe2CoordX && mouseX >= foe2CoordX
            && (mouseY <= foe2SizeY + foe2CoordY && mouseY >= foe2CoordY) && foe2Alive) {

              image(foe2, foe2CoordX - 10, foe2CoordY - 40, foe2SizeX * 1.1, foe2SizeY * 1.1);
          
            //Music Notes
              image(musicNote1, foe2CoordX + foe2SizeX/5, foe2CoordY - foe2CoordY/10, 100, 100);
      
            //sound waves
              noFill();
              strokeWeight(5);
              stroke(damageWave);
              ellipse(cursorX, cursorY, 140, 140);
              ellipse(cursorX, cursorY , 100, 100);
              ellipse(cursorX, cursorY , 50, 50);
      
              foe2HP -= damage;
              textSize(32);
              text("  " + damage, foe2CoordX + foe2SizeX/4, foe2CoordY - foe2CoordY/11);
              fill(#E505FF);
              monsterViolin = true;
            }
          //foe3
            if (mouseX <= foe3SizeX + foe3CoordX && mouseX >= foe3CoordX
            && (mouseY <= foe3SizeY + foe3CoordY && mouseY >= foe3CoordY) && foe3Alive) {
          
          //accidentally got rid of enemy spasm
              image(foe3, foe3CoordX - 10, foe3CoordY - 40, foe3SizeX * 1.1, foe3SizeY * 1.1);
              image(musicNote1, foe3CoordX + foe3SizeX/5, foe3CoordY - foe3CoordY/10, 100, 100);
            //sound waves
              noFill();
              strokeWeight(5);
              stroke(damageWave);
              ellipse(cursorX, cursorY, 140, 140);
              ellipse(cursorX, cursorY , 100, 100);
              ellipse(cursorX, cursorY , 50, 50);
          
              foe3HP -= damage;
              textSize(32);
              text("  " + damage, foe3CoordX + foe3SizeX/4, foe3CoordY - foe3CoordY/11);
              fill(#E505FF);
              monsterViolin = true;
            }
          //foe4
            if (mouseX <= foe4SizeX + foe4CoordX && mouseX >= foe4CoordX
            && (mouseY <= foe4SizeY + foe4CoordY && mouseY >= foe4CoordY) && foe4Alive) {
          
            //accidentally got rid of enemy spasm
              image(foe4, foe4CoordX - 10, foe4CoordY - 40, foe4SizeX * 1.1, foe4SizeY * 1.1);
              image(musicNote1, foe4CoordX + foe4SizeX/5, foe4CoordY - foe4CoordY/10, 100, 100);
            //sound waves
              noFill();
              strokeWeight(5);
              stroke(damageWave);
              ellipse(cursorX, cursorY, 140, 140);
              ellipse(cursorX, cursorY , 100, 100);
              ellipse(cursorX, cursorY , 50, 50);
          
              foe4HP -= damage;
              textSize(32);
              text("  " + damage, foe4CoordX + foe4SizeX/4, foe4CoordY - foe4CoordY/11);
              fill(#E505FF);
              monsterViolin = true;
            }
          //foe5
            if (mouseX <= foe5SizeX + foe5CoordX && mouseX >= foe5CoordX
            && (mouseY <= foe5SizeY + foe5CoordY && mouseY >= foe5CoordY) && foe5Alive) {
          
            //accidentally got rid of enemy spasm
              image(foe5, foe5CoordX - 10, foe5CoordY - 40, foe5SizeX * 1.1, foe5SizeY * 1.1);
              image(musicNote1, foe5CoordX + foe5SizeX/5, foe5CoordY - foe5CoordY/10, 100, 100);
            //sound waves
              noFill();
              strokeWeight(5);
              stroke(damageWave);
              ellipse(cursorX, cursorY, 140, 140);
              ellipse(cursorX, cursorY , 100, 100);
              ellipse(cursorX, cursorY , 50, 50);
          
              foe5HP -= damage;
              textSize(32);
              text("  " + damage, foe5CoordX + foe5SizeX/4, foe5CoordY - foe5CoordY/11);
              fill(#E505FF);
              monsterViolin = true;
            }            
          }
        }
      }
      if(foe1HP <= 0) {
        foe1Alive = false;
      }
      if(foe2HP <= 0) {
        foe2Alive = false;
      }
      if(foe3HP <= 0) {
        foe3Alive = false;
      }
      if (foe4HP <= 0) {
        foe4Alive = false;
      }  
      if (foe5HP <= 0) {
        foe5Alive = false;
      }
      if (foeTHP <= 0) {
        foeTAlive = false;
      }
      if (foeT2HP <= 0) {
        foeT2Alive = false;
      }
      if (foeT3HP <= 0) {
        foeT3Alive = false;
      }      
      //death messages
      //if playerHP <= 0 && stageTutorial == true
      //if foeTAlive == false && playerAlive == true;
      if (foeTAlive == false && foeT2Alive == false && foeT3Alive == false && playerAlive == true) {
        tutorialVictory = true;
        playerAlive = false; //get rid of HPbar and Die button
      //minim.stop();

        minim3 = new Minim(this);
        player3 = minim3.loadFile("Victory.mp3", 1000);
        player3.play();    
        player3.shiftGain(player3.getGain(),-10,FADE);
        player3.loop();      
      }      
        
      if (playerHP <= 0 && stage1 == true) {
        playerAlive = false;
        playerDead = true;
      //set foes not alive either to get rid of them from the screen
      //foe1Alive = false;
      //foe2Alive = false;
      //foe3Alive = false;
      //foe4Alive = false;
      //foe5Alive = false;
      //minim.stop();
      
      //Game Over music
        minim3 = new Minim(this);
        player3 = minim3.loadFile("death.mp3", 1000);
        player3.play();    
        player3.shiftGain(player3.getGain(),-15,FADE);
        player3.loop();
      }
      
    //play music if win
    //use stage wrap to determine what determines victory
      if (foe2Alive == false && foe1Alive == false && foe3Alive == false && 
        foe4Alive == false && foe5Alive == false && playerAlive == true) {
        victory = true;
        playerAlive =false; //get rid of HPbar and Die button
      //minim.stop();

        minim3 = new Minim(this);
        player3 = minim3.loadFile("Victory.mp3", 1000);
        player3.play();    
        player3.shiftGain(player3.getGain(),-10,FADE);
        player3.loop();      
      }  
    }
  }


}
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == 3) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
  else if (axis == 2) { //Horizontal gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}
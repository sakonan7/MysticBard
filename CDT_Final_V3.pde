import ddf.minim.*;

AudioPlayer player;
Minim minim;

AudioPlayer player2;
Minim minim2;

AudioPlayer player3;
Minim minim3;

AudioPlayer player4;
Minim minim4;

static final int FADE = 2200;

PImage background;

PImage musicNote1;
PImage musicNote2;
PImage musicNote3;

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
PImage bardEnd;

PImage tutorialD;

PImage title;

PImage violinUI;

float foe1SizeX;
float foe1SizeY;
float foe2SizeX;
float foe2SizeY;
float foe3SizeX;
float foe3SizeY;
float foe4SizeX;
float foe4SizeY;
float foe5SizeX;
float foe5SizeY;
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
float HPbar = 600;

int currentHP = playerHP;
float originalHPbar = 600; 
int currentHPX = 550; 
int originalHPX = 550;

float violinBar = 0;
float tromboneBar = 0;

float shieldBar = 190;
float originalWeaponBar = 190;
float currentViolinBar = 190;
float currentTromboneBar = 190;
float originalShieldBar = 190;
float currentShieldBar = 190;
int currentViolinBarX = 465;
int originalViolinBarX = 275;
int currentTromboneBarX = 225;
int originalTromboneBarX = 35;
int currentShieldBarX;
int originalShieldBarX;
boolean violinDrained = true;
boolean tromboneDrained = true;
boolean shieldDrained = false;

boolean monsterViolin = false;
boolean monsterTrombone = false;

boolean foe1Alive = true;
boolean foe2Alive = true;
boolean foe3Alive = true;
boolean foe4Alive = true;
boolean foe5Alive = true;

boolean foeTAlive = true;
boolean foeT2Alive = true;
boolean foeT3Alive = true;
boolean playerAlive = true;
boolean playerDead = false;

boolean playerTDead = false;

boolean tutorialStage = false;
boolean stage1 = false;

int foe1interval = 5;
int foe1t = 0;
String foe1time = "005";
int foe1whiteint = 3;
int foe1whitet = 0;
String foe1whitetime = "003";
int foe1flashint = 3;
int foe1flasht = 0;
String foe1flashtime = "003";
int foe1flash2int = 3;
int foe1flash2t = 0;
String foe1flash2time = "003";
int foe1redint = 3;
int foe1redt = 0;
String foe1redtime = "003";

int foe2interval = 10;
int foe2t = 0;
String foe2time = "005";
int foe2whiteint = 3;
int foe2whitet = 0;
String foe2whitetime = "003";
int foe2flashint = 3;
int foe2flasht = 0;
String foe2flashtime = "003";
int foe2flash2int = 3;
int foe2flash2t = 0;
String foe2flash2time = "003";
int foe2redint = 3;
int foe2redt = 0;
String foe2redtime = "003";

int foeTinterval = int(random(5, 8));
int foeTt = 0;
String foeTtime = "005";
int foeTwhiteint = 3;
int foeTwhitet = 0;
String foeTwhitetime = "003";
int foeTflashint = 3;
int foeTflasht = 0;
String foeTflashtime = "003";
int foeTflash2int = 3;
int foeTflash2t = 0;
String foeTflash2time = "003";
int foeTredint = 3;
int foeTredt = 0;
String foeTredtime = "003";
boolean foeTFlash = false;

boolean warmUp = true;
boolean firstAttack = true;

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

boolean playerAttacked = false;
boolean attackBlocked = false;
boolean shieldbroken = false;
boolean foe1Attack = false;
boolean foe2Attack = false;
boolean foe3Attack = false;
boolean foe4Attack = false;
boolean foe5Attack = false;

boolean foeTAttack = false;

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

boolean foeTattacked = false;
boolean foeTInterupt = false;

boolean foeTdisapp = false;
boolean foeT2disapp = false;
boolean foeT3disapp = false;

int cursorX;
int cursorY;

boolean titlePage = true;
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
boolean messageLast = false;
boolean messageOver = false;

boolean victory = false;

boolean tutorialVictory = false;

boolean tutorialVictoryPage = false;
boolean tutorialConclude = false;
boolean musicCredits = false;

boolean redDead = false;
boolean redDeadPage = false;

boolean tutorialDead = false;
boolean tutorialRestart = false;

PFont Font1;
PFont Font2;
PFont Font3;

PImage treasure;
PImage death;

String weapon;

color c1 = color(#F1F200);
color c2 = color(#A1FF00);
color c3 = #ADFF00; 
color c4 = #7C0000; 

void setup() {
  size(1100, 900);
  Font1 = createFont("TimesNewRomanPSMT-48", 33);
  Font2 = createFont("TimesNewRomanPS-ItalicMT-48", 50);
  Font3 = createFont("TimesNewRomanPS-ItalicMT-48", 40);
  
  background = loadImage("forestcurrent.png");
  
  musicNote1 = loadImage("note1.png");
  musicNote2 = loadImage("note2.png");
  
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
  
  
  village = loadImage("village.png");
  monsters = loadImage("monsters2.png");
  //loss = loadImage("Loss.png");
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
  bardEnd = loadImage("bardEnd.png");
  tutorialD = loadImage("tutorialDead.png");
  title = loadImage("titlePage.png");
  
  violinUI = loadImage("violinUI.png");
  
  
  minim = new Minim(this);
  player = minim.loadFile("Title Theme.mp3", 800);
  player.play();
  //-15 adjusts the sound, adjust higher for higher sound
  player.shiftGain(player.getGain(),-15,FADE);
  player.loop();
  
  minim2 = new Minim(this);
  minim3 = new Minim(this);
  minim4 = new Minim(this);
  
  foe1SizeX = 125 * 1.1;
  foe1SizeY = 200 * 1.1;
  foe1CoordX = 390 - 60;
  foe1CoordY = height - 380 - 25 - 20;
  foe2SizeX = 125 * 1.1;
  foe2SizeY = 200 * 1.1;
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
  
  c1 = color(#F1F200);
  c2 = color(#A1FF00); 
  c3 = #ADFF00; 
  c4 = #7C0000; 
  frameRate(30);
}
void draw() {
  image(background, 0, 0, width, height);
  String clickRight = "Click Right to Continue";
  String clickLeft = "Click Left to Go Back";
  String clickSkip = "S to Skip";

  if (tutorialVictoryPage == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textFont(Font2);
    fill(#FFFFFF);
    
    stroke(#98FFFC);
    strokeWeight(3);
    textFont(Font2);
    
    text("Victory" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Congratulations!!" + "\n", 50, height - height + 150);
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);
    text("You have defeated your first enemy! But the battle has just begun", 50, 210);
    
    image(tutorialV, 230, 250, 625, 463);
    text("The true challenge is yet to come", 50, 772); 
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);   
  }
  if (tutorialConclude == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Thank You For Playing" + "\n", 50, height - height + 90);     
    textFont(Font1);
    fill(#FFFFFF);
    text("Stay Tuned For More Updates" + "\n", 50, height - height + 150);
    
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);
    
    image(bardEnd, 180, 190, 742, 590);
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + "Click Right for Music Credits", width - 465, height - 165);     
  }
  if (musicCredits == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    
    textFont(Font2);
    fill(#FFFFFF);
    text("Music" + "\n", 470, 285);     
    textFont(Font1);
    fill(#FFFFFF);
    ///Title Theme
    text("Title Theme (Final Fantasy I) by Nobuo Uematsu", 200, 345);
    text("Reclamation (Fire Emblem: Shadow Dragon)", 225, 395);
    text("by Yuka Tsujiyoko", 410, 445);
    text("Battle 1 (Final Fantasy IV) by Nobuo Uematsu", 220, 495);
    text("Victory (Final Fantasy VII) by Nobuo Uematsu", 220, 545);
    text("Dead Music (Final Fantasy I) by Nobuo Uematsu", 200, 595);

    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);
    
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + "Click Right to Go to Title Screen", width - 520, height - 165);
  }  
  if (victory == true) {
    fill(#0035FF);
    stroke(#98FFFC);
    strokeWeight(3);
    rect(50, 50, width - 100, height - 100, 9);
    
    stroke(#98FFFC);
    strokeWeight(3);
    textFont(Font2);

    image(treasure, width/2, height/2, 400, 300);

    fill(#FFFFFF);
    text("Hurrah!!" + 
    "\n" + "You have successfully protected" + "\n" + "the Village!!", 70, height - height + 120);
    fill(#FFF300);

  }
  if (redDeadPage == true) {
    
    setGradient(currentShieldBarX, height-105, shieldBar, 15, c3, c4, 2);
    setGradient(currentViolinBarX, height-105, violinBar, 15, c3, c4, 2); //Violin
    setGradient(currentTromboneBarX, height-105, tromboneBar, 15, c3, c4, 2);
        
    stroke(#9B9B9B); 
    strokeWeight(3);
    noFill();
  
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
    
    if (weapon == "Violin") {
      stroke(#FFCE46);
      rect(252, height - 148, 235, 135, 8);          
    }
    if (weapon == "Trombone") {
      stroke(#FFCE46);
      rect(13, height - 148, 235, 135, 8);
    }     
    if (tutorialStage == true) {
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
    fill(117,0,0,175);   
    rect(0, 1, 1100, 900); 
    
    textFont(Font2);
    fill(#FFF300);
    text("You Died", 440, 430);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 365, height - 135);    
    
  }
  if (playerDead == true) {
    fill(#0035FF);
    stroke(#98FFFC);
    strokeWeight(3);
    rect(50, 50, width - 100, height - 100, 9);

    fill(#FFFFFF);
    
    stroke(#98FFFC);
    strokeWeight(3);
    textFont(Font2);
    
    text("GAME OVER" + 
    "\n" + "You were defeated and the village" + "\n" + "was overrun by monsters.", 70, height - height + 120);
    fill(#FFF300);
    //indicator to clickRight to continue
    //Click left to start over
    //reset values
  } 
  if (tutorialDead == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textFont(Font2);
    fill(#FFFFFF);
    
    stroke(#98FFFC);
    strokeWeight(3);
    textFont(Font2);
    
    text("Game Over" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("You Died", 50, height - height + 150);

    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);
    text("You were defeated. Don't worry, you're just getting started!", 50, 210);

    image(tutorialD, 180, 230, 478, 563);
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + "Click Right to Try Again", width - 390, height - 165);
  }  
  if (tutorialRestart == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textFont(Font2);
    fill(#FFFFFF);
    
    stroke(#98FFFC);
    strokeWeight(3);
    textFont(Font2);
    
    text("Game Over" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("You Died", 50, height - height + 150);
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);
    text("You were defeated. Don't worry, you're just getting started!", 50, 210);
    
    image(tutorialD, 180, 230, 478, 563);
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + "Click Right to Restart", width - 360, height - 165);
  }  
  if (titlePage == true) {
    image(title, 0, 0, 1100, 900);
    stroke(#98FFFC);
    strokeWeight(3);
    textFont(Font2);   
  }
  if (message1 == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);

    fill(#FFFFFF);
    stroke(#98FFFC);
    strokeWeight(3);
    textFont(Font2);
    
    text("Mystic Bard" + "\n", 50, height - height + 90);

    textFont(Font1);
    text("Monsters of the Green Dragon have come from the forest to " + 
    "\n" + "attack the Village.", 50, height - height + 150);
    fill(#FFF300);
    text("\n" + "\n" + clickRight, width - 385, height - 165);
    image(village, 325, 235, 438, 313);
    image(monsters, 325, 528, 438, 244);
  }
  if (message2 == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Mystic Bard" + "\n", 50, height - height + 90);   
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

    textFont(Font2);
    fill(#FFFFFF);
    text("Mystic Bard" + "\n", 50, height - height + 90);  
    textFont(Font1);
    fill(#FFFFFF);
    text("First, test out your skills!", 50, height - height + 150);
    
    image(tutorial, 220, 195, 646, 528);
    
    fill(#FFF300);
    
    text("Tap S to Skip Tutorial", width - 715, 778);
    text("\n" + "\n" + clickRight + " To Tutorial", width - 550, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);
  }  
  if (message4 == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Weapons" + "\n", 50, height - height + 150);
    textFont(Font1);
    fill(#FFF300);
    //text(leftClick, 50, height - height + 70); 
    fill(#FFFFFF);
    text("As the Mystic Bard, you have an array of weapons" +
    ", starting with the " + "\n" + "Violin, Trombone and Shield", 50, height - height + 210);

    image(tromboneGauge, 160, 300, 244, 156);
    image(violinGauge, 434, 300, 244, 156);
    image(shieldGauge, 708, 300, 244, 156);
    text("During the start of the fight, you will default to the Violin", 50, 516);

    image(tromboneD, 160, 556, 244, 156);
    image(violinD, 434, 556, 244, 156);
    image(shieldD, 708, 556, 244, 156);    
    text("Each time you use a weapon, it will deplete until it can't be used", 50, 772);
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165); 
    text("\n" + "\n" + clickLeft, 50, height - 165);
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }
  if (message5 == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    
    textFont(Font2);
    fill(#FFFFFF);

    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Weapons" + "\n", 50, height - height + 150);
    
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF); 
    text("Each time you use a weapon, it will deplete until it can't be used", 50, 210);    

    image(tromboneD, 160, 250, 244, 156);
    image(violinD, 434, 250, 244, 156);
    image(shieldD, 708, 250, 244, 156);    
    text("At the start of the fight, your weapons will be depleted and you will"
    + "\n" + "need to wait for a small warmup period before fighting", 50, 466);

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
    
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Weapons" + "\n", 50, height - height + 150);
    
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);    
    text("During the fight, your equipped weapon will be represented by the"
    + "\n" + "gold ring, which will shift to the selected weapon", 50, 210);    
    image(tromboneGauge, 160, 300, 244, 156);
    image(violinGauge, 434, 300, 244, 156);
    image(shieldGauge, 708, 300, 244, 156);
    text("Press W to switch to Trombone and A to switch to Violin", 50, 516);
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
    
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Violin" + "\n", 50, height - height + 150);
    
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);   
    text("The Violin is a fast, single target hitting weapon that replenishes fast"
    + "\n" + "Left click on a single target to attack it", 50, height - height + 210);

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
    
    textFont(Font2);
    fill(#FFFFFF);    
    
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Trombone" + "\n", 50, height - height + 150);
    //Text
    
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF); 
    text("The Trombone is a slow, multi-hitting weapon that replenishes slowly"
    + "\n" + "Left click on an enemy or on an area between several to attack", 50, height - height + 210);

    image(tromboneFirst, 155, 325, 461, 248);
    image(tromboneUse, 631, 375, 244, 156);
    text("The Trombone has armor piercing qualities. Use it on certain foes to"
    + "\n" + "break their guard", 50, 652);    
 
    fill(#FFF300);
    textFont(Font1);
    text("\n" + "\n" + clickRight, width - 385, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);  
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }
  if (messageTrombone2 == true) {
    fill(#000096);
    rect(25, 25, width - 50, height - 50);
    
    textFont(Font2);
    fill(#FFFFFF);
    
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Trombone" + "\n", 50, height - height + 150);
    
    textFont(Font1);
    fill(#FFF300);
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
    
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Shield" + "\n", 50, height - height + 150);
    
    textFont(Font1);
    fill(#FFF300); 
    fill(#FFFFFF); 
    text("Produce a barrier that will Shield against all attacks for two seconds"
    + "\n" + "Right click anywhere to Shield", 50, 210);
    image(shielding, 155, 325, 461, 316); 
    image(shieldUse, 631, 418, 244, 156);
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
    
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Shield" + "\n", 50, height - height + 150);
    
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);
    text("If you attack before the Shield ends, you will cancel the Shield", 50, 210);

    image(shielding, 175, 250, 411, 282); 
    image(shieldUse, 601, 323, 244, 156);
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
    
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Combat" + "\n", 50, height - height + 150);
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);
    text("Foes will attack in intervals of 5 seconds, indicated by their flashing"
    + "\n" + "But at the start, they will attack in intervals of 5 to 8 seconds", 50, 210);

    image(nonAttack, 140, 350, 188, 246);
    image(attack, 343, 350, 188, 246);
    image(HP, 566, 403, 401, 67);
    image(HPdamage, 566, 478, 401, 67);
    
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
    
    textFont(Font2);
    fill(#FFFFFF);
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Combat" + "\n", 50, height - height + 150);
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);
    text("But attacking a foe before it finishes flashing will interupt its attack", 50, 210);

    image(attack, 205, 300, 188, 246);
    image(violinAttack, 408, 300, 188, 246);
    image(nonAttack, 611, 300, 188, 246);

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
    
    textFont(Font2);
    fill(#FFFFFF);
    
    text("Battle" + "\n", 50, height - height + 90);     
    textFont(Font3);
    fill(#FFFFFF);
    text("Conclusion" + "\n", 50, height - height + 150);
    textFont(Font1);
    fill(#FFF300);
    fill(#FFFFFF);
    text("Now that the tutorial is over, unleash your power!", 50, 210);

    image(tutorial, 220, 245, 646, 528);
    fill(#FFF300);
    textFont(Font1);
    //proceed to battle
    text("\n" + "\n" + "Click Right to Proceed", width - 375, height - 165);
    text("\n" + "\n" + clickLeft, 50, height - 165);
    text("\n" + "\n" + clickSkip, width - 625, height - 165);
  }  
  
  else if (playerAlive && (stage1 == true || tutorialStage == true)){
    setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
    if (currentHP == playerHP + damage) {
      currentHP = playerHP;
      setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
    }   
    image(violinUI, 251, height - 156, 240, 156);
    image(tromboneD, 7, height - 157, 244, 156);
    image(shieldD, width - 253, height - 157, 244, 156);
        
    setGradient(currentShieldBarX, height-105, shieldBar, 15, c3, c4, 2);
    setGradient(currentViolinBarX, height-105, violinBar, 15, c3, c4, 2);
    setGradient(currentTromboneBarX, height-105, tromboneBar, 15, c3, c4, 2);

    strokeWeight(3);
    noFill();
        
    strokeWeight(10);
    strokeWeight(3);
    if (weapon == "Violin") {
      stroke(#FFCE46);
      rect(252, height - 148, 235, 135, 8);          
    }
    if (weapon == "Trombone") {
      stroke(#FFCE46);
      rect(13, height - 148, 235, 135, 8);
    }   
    if (warmUp == true) {
      violinDrained = true;
      tromboneDrained = true;
      violinReplenish = int(millis()/1000) + 5;
      tromboneReplenish = int(millis()/1000) + 10;
      foeTinterval = int(millis()/1000) + int(random(5,8));
      
      warmUp = false;
    }
        
    if (violinDrained == true) {
      violinReplenisht = violinReplenish-int(millis()/1000);
      if(violinReplenisht == 0){
        violinBar = originalWeaponBar;
        currentViolinBarX = originalViolinBarX; 
        violinDrained = false;
      }

    }
    if (tromboneDrained == true) {
      tromboneReplenisht = tromboneReplenish-int(millis()/1000);

      if(tromboneReplenisht == 0){
        tromboneBar = originalWeaponBar;
        currentTromboneBarX = originalTromboneBarX; 
        tromboneDrained = false;
      }

    }        
        
    if(shieldDrained == true && shield == false) {
      shieldReplenisht = shieldReplenish - int(millis()/1000);
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
      
    if (playerAttacked == true) {
      image(background, 0, -40, width, height);
      if (tutorialStage == true) {
        foeT2disapp = true;
        foeT3disapp = true;
        image(foetutorial, foetutorialX, foetutorialY - 30, foetutorialSizeX, foetutorialSizeY);
        image(foeT2, foeT2X, foeT2Y - 30, foeT2SizeX, foeT2SizeY);
        image(foeT3, foeT3X, foeT3Y - 30, foeT3SizeX, foeT3SizeY);
      }
      fill(117,0,0,145);
      stroke(#FFFFFF);

      image(violinUI, 251, height - 156, 240, 156);
      image(tromboneD, 7, height - 157, 244, 156);
      image(shieldD, width - 253, height - 157, 244, 156);          
      rect(0, 1, 1099, 898);        

      playerHP -= 10;
      HPbar = HPbar - originalHPbar/10;
      currentHPX = currentHPX + originalHPX/10;
        
      setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
 
      setGradient(currentShieldBarX, height-105, shieldBar, 15, c3, c4, 2);
      setGradient(currentViolinBarX, height-105, violinBar, 15, c3, c4, 2); 
      setGradient(currentTromboneBarX, height-105, tromboneBar, 15, c3, c4, 2);
        
      strokeWeight(3);
      noFill();

      strokeWeight(3);
      if (weapon == "Violin") {
        stroke(#FFCE46);
        rect(252, height - 148, 235, 135, 8);          
      }
      if (weapon == "Trombone") {
        stroke(#FFCE46);
        rect(13, height - 148, 235, 135, 8);
      }        
                     
      player4 = minim4.loadFile("axepunch.mp3", 500);
      player4.play();
      player4.shiftGain(player4.getGain(), 0,FADE); 
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
        foeTdisapp = false;
        foeT2disapp = false;
        foeT3disapp = false;        
        foeTAlive = true;
        foeT2Alive = true;
        foeT3Alive = true;
      }    
      playerAttacked = false;
      if (playerHP <= 0 && tutorialStage == true) {
        playerAlive = false;
        redDead = true;
        redDeadPage = true;
        minim.stop();
      }    
    }
    if (foeTAttack == true) {  
      foeTAlive = false;  
      foeTwhitet = foeTwhiteint-int(millis()/1000); 
      if (foeTHP > 0) {
        if (foeTwhitet > 0) {
          image(foeWhite, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
        }
        else if (foeTwhitet <= 0) {
          foeTflasht = foeTflashint - int(millis()/1000);
          if (foeTflasht > 0) {
            image(foetutorial, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
          }
          else if (foeTflasht <= 0) {
            foeTredt = foeTredint-int(millis()/1000);
            if (foeTredt > 0) {
              image(foeRed, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
            }
            else if (foeTredt <= 0) {
              foeTflash2t = foeTflash2int - int(millis()/1000);
              if (foeTflash2t > 0) {
                image(foetutorial, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
                foeTFlash = true;
              }
              else if (foeTflash2t <= 0 && foeTInterupt == false) {
                if (shield == true) {
                  foeTAttack = false;
                  attackBlocked = true;
                
                  foeTinterval = int(millis()/1000) + 5;
                  foeTwhiteint = int(millis()/1000) + 3; 
                  foeTflashint = int(millis()/1000) + 3;
                  foeTredint = int(millis()/1000) + 3; 
                  foeTflash2int = int(millis()/1000) + 3;
                }
                else if (shield == false) {
                
                  playerAttacked = true;
                  foeT2Alive = false;
                  foeT3Alive = false;                 
                    
                  foeTinterval = int(millis()/1000) + 5;
                  foeTwhiteint = int(millis()/1000) + 3;
                  foeTflashint = int(millis()/1000) + 3;
                  foeTredint = int(millis()/1000) + 3;
                  foeTflash2int = int(millis()/1000) + 3;
                } 
                foeTFlash = false;
              }
            }                  
          }
        }        
      }
      else if (foeTHP <= 0) {
        foeTAttack = false;
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

    if (shield == true) {
      shieldt = shieldInterval - int(millis()/1000);
      if (shieldt > 0) {
        if (attackBlocked == false) {
          fill(70, 100, 0, 190);
          if (tutorialStage == true) {
            foeTdisapp = true;
            foeT2disapp = true;
            foeT3disapp = true;
            if (foeTHP > 0) {
              image(foetutorial, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
            }
            if (foeT2HP > 0) {
              image(foeT2, foeT2X, foeT2Y, foeT2SizeX, foeT2SizeY);
            }
            if (foeT3HP > 0) {
              image(foeT3, foeT3X, foeT3Y, foeT3SizeX, foeT3SizeY);
            }
          }              
          image(violinUI, 251, height - 156, 240, 156);
          image(tromboneD, 7, height - 157, 244, 156);
          image(shieldD, width - 253, height - 157, 244, 156);              
              
          rect(0, 0, 1100, 900);              
          setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
                   
       
          setGradient(currentShieldBarX, height-105, shieldBar, 15, c3, c4, 2);
          setGradient(currentViolinBarX, height-105, violinBar, 15, c3, c4, 2); 
          setGradient(currentTromboneBarX, height-105, tromboneBar, 15, c3, c4, 2);
        
          strokeWeight(3);
          noFill();
  
          strokeWeight(3);
        
          if (weapon == "Violin") {
            stroke(#FFCE46);
            rect(252, height - 148, 235, 135, 8);          
          }
          if (weapon == "Trombone") {
            stroke(#FFCE46);
            rect(13, height - 148, 235, 135, 8);
          }
        }
        if(attackBlocked == true) {
          fill(70, 100, 0, 190);
          image(background, 0, -15, width, height);
          if (tutorialStage == true) {
            foeTdisapp = true;
            foeT2disapp = true;
            foeT3disapp = true;                
            if (foeTHP > 0) {
              image(foetutorial, foetutorialX, foetutorialY - 20, foetutorialSizeX, foetutorialSizeY);
            }
            if (foeT2HP > 0) {
              image(foeT2, foeT2X, foeT2Y - 20, foeT2SizeX, foeT2SizeY);
            }
            if (foeT3HP > 0) {
              image(foeT3, foeT3X, foeT3Y - 20, foeT3SizeX, foeT3SizeY);
            }
          } 
          image(violinUI, 251, height - 156, 240, 156);
          image(tromboneD, 7, height - 157, 244, 156);
          image(shieldD, width - 253, height - 157, 244, 156);              
              
          rect(0, 0, 1100, 900);
          setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
    
          
          setGradient(currentShieldBarX, height-105, shieldBar, 15, c3, c4, 2);
          setGradient(currentViolinBarX, height-105, violinBar, 15, c3, c4, 2);
          setGradient(currentTromboneBarX, height-105, tromboneBar, 15, c3, c4, 2);
        
          strokeWeight(3);
          noFill();
              
          strokeWeight(3);
        
          if (weapon == "Violin") {
            stroke(#FFCE46);
            rect(252, height - 148, 235, 135, 8);          
          }
          if (weapon == "Trombone") {
            stroke(#FFCE46);
            rect(13, height - 148, 235, 135, 8);
          }                
             
          attackBlocked = false;
        }
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
        if (foeTFlash == true) {
          attackBlocked = true;
        }
   
       } 
       if (shieldt == 0) {
         shield = false;
         if (foeTHP > 0) {
           foeTAlive = true;
         }            
       }
    }
    else if (shield == false) {
      if (tutorialStage == true) {
        foeTdisapp = false;
        foeT2disapp = false;
        foeT3disapp = false;
      }
    }
    if (tutorialStage == true) {
      if(foeTAlive == true) {  
        if (foeTdisapp == false) {
          image(foetutorial, foetutorialX, foetutorialY, foetutorialSizeX, foetutorialSizeY);
        } 

        if (foeTAttack == false && foeTHP > 0) {
          foeTt = foeTinterval-int(millis()/1000);
            
          if(foeTt <= 0){
            if (firstAttack == true) {
               foeTwhiteint = int(millis()/1000) + 1;
               foeTflashint = int(millis()/1000) + 2;
               foeTredint = int(millis()/1000) + 3;
               foeTflash2int = int(millis()/1000) + 4;              
               
            }
            else if (firstAttack == false) {
              foeTwhiteint += 3;
              foeTflashint += 4;
              foeTredint += 5;
              foeTflash2int += 6;              
            }           
              
            foeTdisapp = true;
            foeTAttack = true;
            foeTAlive = false;
            firstAttack = false;
          }
        }

      }   
      if(foeT2Alive == true) {
        if (foeT2disapp == false) {
          image(foeT2, foeT2X, foeT2Y, foeT2SizeX, foeT2SizeY);
        }

      }
      if(foeT3Alive == true) {
        if (foeT3disapp == false) {
          image(foeT3, foeT3X, foeT3Y, foeT3SizeX, foeT3SizeY);
        } 
      
      }        
    }
    else if (stage1 == true) {
      if(foe1Alive == true) {
        if (foe1Attack == false) {
          foe1t = foe1interval-int(millis()/1000);
          if (foe1t > 0) {
            image(foe1, foe1CoordX, foe1CoordY, foe1SizeX, foe1SizeY);
          }
          if(foe1t == 0){
            foe1whiteint += 3;
            foe1flashint += 4;
            foe1redint += 5;
            foe1flash2int += 6;
            foe1Attack = true;
          }
          if (playerAttacked && foe1t > 0) {
            image(foe1, foe1CoordX, foe1CoordY - 30, foe1SizeX, foe1SizeY);
            fill(117,0,0,155);
            stroke(#FFFFFF);
            rect(0, 1, 1099, 898);               
          }
        }
        if(shield == true && attackBlocked == false) {
          fill(70, 100, 0, 190);
          noStroke();
          rect(foe1CoordX, foe1CoordY, foe1SizeX, foe1SizeY);
        }
      }
      if (foe2Alive == true) {
        image(foe2, foe2CoordX, foe2CoordY, foe2SizeX, foe2SizeY);
      }
      if(foe3Alive == true) {
        image(foe3, foe3CoordX, foe3CoordY, foe3SizeX, foe3SizeY);           
      }
      if(foe4Alive == true) {
        image(foe4, foe4CoordX, foe4CoordY, foe4SizeX, foe4SizeY);
      } 
      if(foe5Alive == true) {    
        image(foe5, foe5CoordX, foe5CoordY, foe5SizeX, foe5SizeY);
      }        
    }
  }
}
void keyPressed () {
  if ((key == 's' || key == 'S') && (titlePage == false && messageOver == false)) {
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
    minim.stop();
    player = minim.loadFile("Battle.mp3", 800);
    player.play();
    player.shiftGain(player.getGain(),-15,FADE);
    player.loop();
  }  
  if ((key == 'w' || key == 'W')) {
    weapon = "Violin";
  }
  if (key == 'a' || key == 'A') {
    weapon = "Trombone";
  }
}  
void mousePressed () {
  color damageWave = #DEA3DA;
  if (messageOver == false) {
    if (mouseButton == RIGHT && titlePage == true) {
      titlePage = false;
      message1 = true;
      minim.stop();
      player = minim.loadFile("Intro and Tutorial.mp3", 700);
      player.play();
      player.shiftGain(player.getGain(),-15,FADE);
      player.loop();      
    }
    else if (mouseButton == RIGHT && message1 == true) {
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
      messageOver = true;
      tutorialStage = true;
      minim.stop();
      player = minim.loadFile("Battle.mp3", 800);
      player.play();
      player.shiftGain(player.getGain(),-15,FADE);
      player.loop();      
    }  
    else if (mouseButton == LEFT && messageLast == true) {
      messageLast = false;
      messageInterupt = true;
    }   
  }
   
  else if (messageOver == true && playerAlive == true) {    
    if (mouseButton == RIGHT && shieldDrained == false && shield == false) {
      player4 = minim4.loadFile("shielding.mp3", 600);
      player4.play();
      if ((mouseX <= width && mouseX > 0) && (mouseY <= height && mouseY > 0)) {
        shieldInterval = int(millis()/1000) + 2;

        shieldBar -= originalShieldBar/2;

        currentShieldBarX += originalShieldBar/2;
        shield = true;
        if (shieldBar == 0) {
          shieldDrained = true;
          shieldReplenish = int(millis()/1000) + 5 + 3;
        }

      }
    }
    else if (mouseButton == RIGHT && shieldDrained == false && shield == true) {
      player4 = minim4.loadFile("shielding.mp3", 600);
      player4.play();    
      if ((mouseX <= width && mouseX > 0) && (mouseY <= height && mouseY > 0)) {
        shieldInterval = int(millis()/1000) + 2;
        shieldBar -= originalShieldBar/2;
        currentShieldBarX += originalShieldBar/2;
        if (shieldBar == 0) {
          shieldDrained = true;
          shieldReplenish = int(millis()/1000) + 5 + 3;
        }

      }
    }
    else if (mouseButton == LEFT) {
    
      cursorX = mouseX;
      cursorY = mouseY;
      
      if (weapon == "Trombone") {   
        if (tromboneBar > 0 && tromboneDrained == false) {
          tromboneBar -= originalWeaponBar/2;
          currentTromboneBarX += originalWeaponBar/2; 
          if (monsterTrombone == true) {
            monsterTrombone = false; 
            if (firstBlast == true) {
              firstBlast = false;
              secondBlast = true;
            }
            else if (secondBlast == true) {
              firstBlast = true;
              secondBlast = false;
            }

            if (shield == true) {
              shield = false;
              if (shieldt == 1) {
                shieldInterval += 2;
              }
            }            
            
            if (tromboneBar == 0) {
              tromboneDrained = true;
              tromboneReplenish = int(millis()/1000) + 15;
            }            
          }
          if (tutorialStage == true) {
            if (firstBlast == true) {
              if ((mouseX <= width && mouseX >= 0) && (mouseY <= height && mouseY >= 0)) {
                textSize(32);
                image(background, 0, -15, width, height);
                if (foeTHP > 0) {
                  image(foetutorial, foetutorialX - 10, foetutorialY - 60, foetutorialSizeX * 1.1, foetutorialSizeY * 1.1);
                  image(musicNote2, foetutorialX + 5, foetutorialY - 60, 100, 100);
                  text("  " + 15, foetutorialX + foetutorialSizeX/5, foetutorialY - 60);
                  foeTHP -= 15;
                }
                if (foeTHP > 0) {
                  image(foeT2, foeT2X - 10, foeT2Y - 60, foeT2SizeX * 1.1, foeT2SizeY * 1.1);
                  image(musicNote2, foeT2X + 5, foeT2Y - 60, 100, 100);
                  text("  " + 15, foeT2X + foeT2SizeX/5, foeT2Y - 60);
                  foeT2HP -= 15;
                }
                if (foeT3HP > 0) {
                  image(foeT3, foeT3X - 10, foeT3Y - 60, foeT3SizeX * 1.1, foeT3SizeY * 1.1);
                  image(musicNote2, foeT3X + 5, foeT3Y - 60, 100, 100);
                  text("  " + 15, foeT3X + foeT3SizeX/5, foeT3Y - 60);
                  foeT3HP -= 15;
                }

                noFill();
                strokeWeight(7);
                stroke(#FFC246);
                ellipse(cursorX, cursorY, width/2 + 250, width/2 + 240);
                ellipse(cursorX, cursorY, width/2 + 120, width/2 + 110);
                ellipse(cursorX, cursorY, width/2 - 10, width/2);
                ellipse(cursorX, cursorY, width/2 - 140, width/2 - 150);
                image(trombone, cursorX - 40, cursorY - 15, 100, 40);

                fill(#E505FF);
                image(violinUI, 251, height - 156, 240, 156);
                image(tromboneD, 7, height - 157, 244, 156);
                image(shieldD, width - 253, height - 157, 244, 156);                
              
                setGradient(currentHPX, 50, HPbar, 40, c2, c1, 3);
          
                setGradient(currentShieldBarX, height-105, shieldBar, 15, c3, c4, 2);
                setGradient(currentViolinBarX, height-105, violinBar, 15, c3, c4, 2); //Violin
                setGradient(currentTromboneBarX, height-105, tromboneBar, 15, c3, c4, 2);

                strokeWeight(3);
                stroke(#FFCE46);
          
                rect(13, height - 148, 235, 135, 8);
                foeTattacked = true;
                monsterTrombone = true;
                player2 = minim2.loadFile("firstTrumpet.mp3", 500);
                player2.play();
                player2.shiftGain(player2.getGain(), -30,FADE); 
                if (foeTFlash == true && foeTattacked == true) {
                  foeTAttack = false;
                  foeTAlive = true;
                  foeTInterupt = true; 
                  foeTFlash = false;
                  foeTinterval = int(millis()/1000) + 5;
                  
                  foeTwhiteint = int(millis()/1000) + 3; 
                  foeTflashint = int(millis()/1000) + 3;
                  foeTredint = int(millis()/1000) + 3; 
                  foeTflash2int = int(millis()/1000) + 3;              
             
                }        

                if (foeTInterupt == true) {
                  foeTInterupt = false;
                  foeTattacked = false;       
                }                
              }              
            }
            if (secondBlast == true) {
              if (mouseX <= foetutorialSizeX + foetutorialX + 140 && mouseX >= foetutorialX - 140
              && (mouseY <= foetutorialSizeY + foetutorialY + 140 && mouseY >= foetutorialY - 140) && foeTHP > 0) { 

                image(foetutorial, foetutorialX - 10, foetutorialY - 60, foetutorialSizeX * 1.1, foetutorialSizeY * 1.1);

                image(musicNote2, foetutorialX + 5, foetutorialY - 60, 100, 100);

                noFill();
                strokeWeight(7);
                stroke(#FFC246);
                ellipse(cursorX, cursorY, 280, 280);
                ellipse(cursorX, cursorY , 200, 200);
                ellipse(cursorX, cursorY , 120, 120);
                ellipse(cursorX, cursorY , 60, 60);
                
                image(trombone, cursorX - 40, cursorY - 15, 100, 40);
      
                foeTHP -= 10;
                text("  " + 10, foetutorialX + foetutorialSizeX/5, foetutorialY - 60);
                
                fill(#E505FF);

                foeTattacked = true;
                monsterTrombone = true;
                player2 = minim2.loadFile("secondTrumpet.mp3", 500);
                player2.play();
                player2.shiftGain(player2.getGain(), -30,FADE); 
                if (foeTFlash == true && foeTattacked == true) {
                  foeTAttack = false;
                  foeTAlive = true;
                  foeTInterupt = true;
                  foeTFlash = false;
                  foeTinterval = int(millis()/1000) + 5;
                  foeTwhiteint = int(millis()/1000) + 3; 
                  foeTflashint = int(millis()/1000) + 3;
                  foeTredint = int(millis()/1000) + 3; 
                  foeTflash2int = int(millis()/1000) + 3;              
             
                }        

                if (foeTInterupt == true) {
                  foeTInterupt = false;
                  foeTattacked = false;      
                }                
              }
              if (mouseX <= foeT2SizeX + foeT2X + 140 && mouseX >= foeT2X - 140
              && (mouseY <= foeT2SizeY + foeT2Y + 140 && mouseY >= foeT2Y - 140) && foeT2HP > 0) { 
                
                image(foeT2, foeT2X - 10, foeT2Y - 60, foeT2SizeX * 1.1, foeT2SizeY * 1.1);
          
                image(musicNote2, foeT2X + 5, foeT2Y - 60, 100, 100);

                noFill();
                strokeWeight(7);
                stroke(#FFC246);
                ellipse(cursorX, cursorY, 280, 280);
                ellipse(cursorX, cursorY , 200, 200);
                ellipse(cursorX, cursorY , 120, 120);
                ellipse(cursorX, cursorY , 60, 60);
                image(trombone, cursorX - 40, cursorY - 15, 100, 40);
      
                foeT2HP -= 10;
                text("  " + 10, foeT2X + foeT2SizeX/5, foeT2Y - 60);
                
                fill(#E505FF);

                monsterTrombone = true;
                player2 = minim2.loadFile("secondTrumpet.mp3", 500);
                player2.play();
                player2.shiftGain(player2.getGain(), -30,FADE);                
              }
              if (mouseX <= foeT3SizeX + foeT3X + 140 && mouseX >= foeT3X - 140
              && (mouseY <= foeT3SizeY + foeT3Y + 140 && mouseY >= foeT3Y - 140) && foeT3HP > 0) { 

                image(foeT3, foeT3X - 10, foeT3Y - 60, foeT3SizeX * 1.1, foeT3SizeY * 1.1);
          
                image(musicNote2, foeT3X + 5, foeT3Y - 60, 100, 100);

                noFill();
                strokeWeight(7);
                stroke(#FFC246);
                ellipse(cursorX, cursorY, 280, 280);
                ellipse(cursorX, cursorY , 200, 200);
                ellipse(cursorX, cursorY , 120, 120);
                ellipse(cursorX, cursorY , 60, 60);
                
                image(trombone, cursorX - 40, cursorY - 15, 100, 40);
      
                foeT3HP -= 10;
                text("  " + 10, foeT3X + foeT3SizeX/5, foeT3Y - 60);
                
                fill(#E505FF);
              
                monsterTrombone = true;
                player2 = minim2.loadFile("secondTrumpet.mp3", 500);
                player2.play();
                player2.shiftGain(player2.getGain(), -30,FADE);                
              }              
            }
     
          }
        }

      }
      if (weapon == "Violin") {
        if (violinBar > 0 && violinDrained == false) {
          violinBar -= originalWeaponBar/10;
          currentViolinBarX += originalWeaponBar/10;
          
          if (monsterViolin == true) {
            monsterViolin = false;
            if (shield == true) {
              shield = false;
              if (shieldt == 1) {
                shieldInterval += 2;
              }
            }

            if (violinBar == 0) {
              violinDrained = true;
              violinReplenish = int(millis()/1000) + 10;
            }
          }
          if (tutorialStage == true) {
            if (mouseX <= foetutorialSizeX + foetutorialX && mouseX >= foetutorialX
            && (mouseY <= foetutorialSizeY + foetutorialY && mouseY >= foetutorialY) && foeTHP > 0) { 

              image(foetutorial, foetutorialX - 15, foetutorialY - 30, foetutorialSizeX * 1.2, foetutorialSizeY * 1.2);
          
              image(musicNote1, foetutorialX + foetutorialSizeX/5, foetutorialY - foetutorialY/10, 100, 100);
      
              noFill();
              strokeWeight(5);
              stroke(damageWave);
              ellipse(cursorX, cursorY, 140, 140);
              ellipse(cursorX, cursorY , 100, 100);
              ellipse(cursorX, cursorY , 50, 50);
              image(violin, cursorX, cursorY - 20, 46.5, 50);
      
              foeTHP -= damage;
              text("  " + damage, foetutorialX + foetutorialSizeX/4, foetutorialY - foetutorialY/11);
              fill(#E505FF);
              foeTattacked = true;
              monsterViolin = true;
              
              if (foeTFlash == true && foeTattacked == true) {
                foeTAttack = false;
                foeTAlive = true;
                foeTInterupt = true; 
                foeTFlash = false;
                foeTinterval = int(millis()/1000) + 5;
                foeTwhiteint = int(millis()/1000) + 3; 
                foeTflashint = int(millis()/1000) + 3;
                foeTredint = int(millis()/1000) + 3; 
                foeTflash2int = int(millis()/1000) + 3;   
                player2 = minim2.loadFile("violinFlinch.mp3", 500);
                player2.play();            
              }        
              else if (foeTFlash == false) {
                player2 = minim2.loadFile("violin.mp3", 400);
                player2.play();
              }
              if (foeTInterupt == true) {
                foeTInterupt = false;
                foeTattacked = false;     
              }              
            }
            if (mouseX <= foeT2SizeX + foeT2X && mouseX >= foeT2X
            && (mouseY <= foeT2SizeY + foeT2Y && mouseY >= foeT2Y) && foeT2HP > 0) { 

              image(foeT2, foeT2X - 15, foeT2Y - 30, foeT2SizeX * 1.2, foeT2SizeY * 1.2);
          
              image(musicNote1, foeT2X + foeT2SizeX/5, foeT2Y - foeT2Y/10, 100, 100);
      
              noFill();
              strokeWeight(5);
              stroke(damageWave);
              ellipse(cursorX, cursorY, 140, 140);
              ellipse(cursorX, cursorY , 100, 100);
              ellipse(cursorX, cursorY , 50, 50);
              
              image(violin, cursorX, cursorY - 20, 46.5, 50);
              
              foeT2HP -= damage;
              text("  " + damage, foeT2X + foeT2SizeX/4, foeT2Y - foeT2Y/11);
              fill(#E505FF);
              monsterViolin = true;
              player2 = minim2.loadFile("violin.mp3", 400);
              player2.play();              
            } 
            if (mouseX <= foeT3SizeX + foeT3X && mouseX >= foeT3X
            && (mouseY <= foeT3SizeY + foeT3Y && mouseY >= foeT3Y) && foeT3HP > 0) { 

              image(foeT3, foeT3X - 15, foeT3Y - 30, foeT3SizeX * 1.2, foeT3SizeY * 1.2);
          
              image(musicNote1, foeT3X + foeT3SizeX/5, foeT3Y - foeT3Y/10, 100, 100);
      
              noFill();
              strokeWeight(5);
              stroke(damageWave);
              ellipse(cursorX, cursorY, 140, 140);
              ellipse(cursorX, cursorY , 100, 100);
              ellipse(cursorX, cursorY , 50, 50);
              
              image(violin, cursorX, cursorY - 20, 46.5, 50);
      
              foeT3HP -= damage;
              text("  " + damage, foeT3X + foeT3SizeX/4, foeT3Y - foeT3Y/11);
              fill(#E505FF);
              monsterViolin = true;
              player2 = minim2.loadFile("violin.mp3", 400);
              player2.play();              
            }            
          }
          //stage1  
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
      if (foeTHP <= 0 && foeT2HP <= 0 && foeT3HP <= 0 && playerAlive == true) {
        tutorialVictory = true;
        tutorialVictoryPage = true;
        tutorialStage = false;
        playerAlive = false; 
        minim.stop();

        player3 = minim3.loadFile("Victory.mp3", 800);
        player3.play();    
        player3.shiftGain(player3.getGain(),-15,FADE);
        player3.loop();          
      }      
      
      if (foe2Alive == false && foe1Alive == false && foe3Alive == false && 
        foe4Alive == false && foe5Alive == false && playerAlive == true) {
        victory = true;
        playerAlive =false; 
        player3 = minim3.loadFile("Victory.mp3", 800);
        player3.play();    
        player3.shiftGain(player3.getGain(),-15,FADE);
        player3.loop();      
      }
      
    }
  }
  else if (tutorialVictory == true) {
    if (mouseButton == RIGHT && tutorialVictoryPage == true) {
      tutorialVictoryPage = false;
      tutorialConclude = true;
    }    
    else if (mouseButton == RIGHT && tutorialConclude == true) {
      tutorialConclude = false;
      musicCredits = true;
    }  
    else if (mouseButton == LEFT && tutorialConclude == true) {
      tutorialConclude = false;
      tutorialVictoryPage = true;
    }   
    else if (mouseButton == RIGHT && musicCredits == true) {
      musicCredits = false;
      tutorialVictory = false;
      warmUp = true;
      firstAttack = true; 
      playerHP = 100;
      currentHP = playerHP;
      HPbar = originalHPbar;
      currentHPX = originalHPX;
      foeTHP = 150;
      foeT2HP = 150;
      foeT3HP = 150;
      violinBar = 0;
      tromboneBar = 0;
      currentViolinBarX = 465;
      currentTromboneBarX = 225;
      shieldBar = 190;
      currentShieldBarX = originalShieldBarX;
      shieldDrained = false;
      foeTAlive = true;
      foeT2Alive = true;
      foeT3Alive = true;
      playerAlive = true;
      
      titlePage = true;
      minim3.stop(); 
      messageOver = false;
      player = minim.loadFile("Title Theme.mp3", 800);
      player.play();
      player.shiftGain(player.getGain(),-15,FADE);
      player.loop();      
    }    
    else if (mouseButton == LEFT && musicCredits == true) {
      musicCredits = false;
      tutorialConclude = true;
    }         

  }
  else if (redDead == true) {
    if (mouseButton == RIGHT && redDeadPage == true) {
      redDeadPage = false;
      tutorialDead = true;
      player3 = minim3.loadFile("death.mp3", 800);
      player3.play();    
      player3.shiftGain(player3.getGain(),-15,FADE);
      player3.loop();       
    }
    else if (mouseButton == RIGHT && tutorialDead == true) {
      tutorialDead = false;
      tutorialRestart = true;
    }
    else if (mouseButton == RIGHT && tutorialRestart == true) {
      warmUp = true;
      firstAttack = true;
      playerHP = 100;
      currentHP = playerHP;
      HPbar = originalHPbar;
      currentHPX = originalHPX;
      foeTHP = 150;
      foeT2HP = 150;
      foeT3HP = 150;
      violinBar = 0;
      tromboneBar = 0;
      currentViolinBarX = 465;
      currentTromboneBarX = 225;
      shieldBar = 190;
      currentShieldBarX = originalShieldBarX;
      shieldDrained = false;
      foeTAlive = true;
      foeT2Alive = true;
      foeT3Alive = true;
      playerAlive = true;
      tutorialRestart = false;
      redDead = false;
      minim3.stop();
      
      player = minim.loadFile("Battle.mp3", 800);
      player.play();
      player.shiftGain(player.getGain(),-15,FADE);
      player.loop();      
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
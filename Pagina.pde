class Pagina{
  Button botoes[]=new Button[1];
  int qtdButtons=0;
  
  TextBox textBoxs[]=new TextBox[1];
  int qtdTextBoxs=0;
  
  Image images[]=new Image[1];
  int qtdImages=0;
  
  Text texts[]=new Text[1];
  int qtdTexts=0;
  
  color backgroundColor=0;
  PImage backgroundImage;
  
  int sizeX=0, sizeY=0;
  
  boolean passingButton=false, passingTextBox=false;
  
  String clickingObject="-";
    
  String Pagina(){  
     drawBackground();
     
     executeButtons(); 
     executeTextBoxs(); 
     executeImages();
     executeTexts();
     
     if(!passingButton && !passingTextBox) cursor(ARROW);
           
     return clickingObject;
  }
  
  String returnText(String nameTextBox){
    for(int c1=0; c1<qtdTextBoxs; c1++){
      if(textBoxs[c1].nameTextBox==nameTextBox) return textBoxs[c1].text; 
    }
    
    return "-";
  }
  
  void executeTexts(){
    for(int c1=0; c1<qtdTexts; c1++) texts[c1].Text();
  }
  
  void executeImages(){
    for(int c1=0; c1<qtdImages; c1++) images[c1].Image();
  }
  
  void executeButtons(){
    passingButton=false;
    clickingObject="-";
    
    for(int c1=0; c1<qtdButtons; c1++){
      int buttonAnswer=botoes[c1].Button();
      switch(buttonAnswer){
        case 10:
          passingButton=true;
        break;
        case 11:
          passingButton=true;
          clickingObject=botoes[c1].nameButton;
        break;
      }
    }
  }
  
  void executeTextBoxs(){
    passingTextBox=false;
    
    for(int c1=0; c1<qtdTextBoxs; c1++){
      int textBoxAnswer=textBoxs[c1].TextBox();
      
      switch(textBoxAnswer){
        case 1:
          clickingObject=textBoxs[c1].nameTextBox;
        break;
        case 10:
          passingTextBox=true;
        break;
        case 11:
          passingTextBox=true;
          clickingObject=textBoxs[c1].nameTextBox;
        break;
      }
    }
  }
  
  void drawBackground(){
    if(backgroundColor==-1) image(backgroundImage, 0, 0, sizeX, sizeY);
    else background(backgroundColor);
  }
  
  void defineBackground(color backgroundColor){
    this.backgroundColor=backgroundColor;
  }
  
  void defineBackground(String backgroundImage){
    this.backgroundImage=loadImage(backgroundImage);
    backgroundColor=-1;
  }
  
  void defineSize(int sizeX, int sizeY){
    this.sizeX=sizeX;
    this.sizeY=sizeY;
  }
  
  void defineButton(String nameButton, int posX, int posY, int sizeX, int sizeY, String form, color fillColor, String cursor, String passingAction){
    botoes=(Button[]) expand(botoes);
    botoes[qtdButtons]= new Button();
    
    botoes[qtdButtons].defineName(nameButton);
    
    botoes[qtdButtons].sizeButton(sizeX, sizeY);
    botoes[qtdButtons].posButton(posX, posY);
    
    botoes[qtdButtons].defineForm(form);
    
    botoes[qtdButtons].defineFillColor(fillColor);
    
    botoes[qtdButtons].defineCursor(cursor);
    
    botoes[qtdButtons].definePassinAction(passingAction);
    
    qtdButtons++;
  }
  
  void defineTextBox(String nameTextBox, int posX, int posY, int sizeX, int sizeY, String form, color fillColor, String cursor, String textFont, int textSize, String passingAction){
    textBoxs=(TextBox[]) expand(textBoxs);
    textBoxs[qtdTextBoxs]= new TextBox();
    
    textBoxs[qtdTextBoxs].defineName(nameTextBox);
    
    textBoxs[qtdTextBoxs].sizeTextBox(sizeX, sizeY);
    textBoxs[qtdTextBoxs].posTextBox(posX, posY);
    
    textBoxs[qtdTextBoxs].defineForm(form);
    
    textBoxs[qtdTextBoxs].defineFillColor(fillColor);
    
    textBoxs[qtdTextBoxs].defineCursor(cursor);
    
    textBoxs[qtdTextBoxs].defineTextFont(textFont, textSize);
    
    textBoxs[qtdTextBoxs].definePassinAction(passingAction);
        
    qtdTextBoxs++;
  }
  
  void defineImage(String imageName, int posX, int posY, int sizeX, int sizeY, String imageString){
    images=(Image[]) expand(images);
    images[qtdImages]= new Image();
    
    images[qtdImages].defineName(imageName);
    
    images[qtdImages].definePosition(posX, posY);
      
    images[qtdImages].defineSize(sizeX, sizeY);
    
    images[qtdImages].defineImage(imageString);
    
    qtdImages++;
  }
  
  void defineText(String textName, int posX, int posY, String fontString, int sizeText, color colorText, String text){
    texts=(Text[]) expand(texts);
    texts[qtdTexts]= new Text();
    
    texts[qtdTexts].defineName(textName);
    
    texts[qtdTexts].definePosition(posX, posY);
    
    texts[qtdTexts].defineFont(fontString, sizeText);
    
    texts[qtdTexts].defineColor(colorText);
    
    texts[qtdTexts].defineText(text);
    
    qtdTexts++;     
  }
}

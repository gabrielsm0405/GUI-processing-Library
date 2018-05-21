class TextBox{  
  String text="";
  
  String nameTextBox="";
  
  float sizeX=0, sizeY=0, curSizeX=0, curSizeY=0;
  float posX=0, posY=0;
  
  String form="rect";
  PImage imageForm;
  
  int fillColor=255, curFillColor=255;
  int colorText=0;
    
  String cursor="TEXT";
  
  int passingTextBox=0, writingText=0;
  
  PFont textFont;
  
  String passingAction="noAction";
  
  PImage imageAction;
  
  int TextBox(){
    verifyTextBox();
    
    drawCursor();
    
    drawTextBox();
    
    if(writingText==1) changeText();
    
    return 10*passingTextBox+writingText;
  }
  
  int textCursorCurPosition=0;
  void changeText(){
    int letter=keyboardEvents[0].process();
    
    if(letter>=32 && letter<=126 && textWidth(text+str((char)letter))<=sizeX){
      String textFirstPart=text.substring(0, textCursorCurPosition), textSecondPart=text.substring(textCursorCurPosition, text.length());
      
      textFirstPart+=str((char)letter);
      
      text=textFirstPart+textSecondPart;
      textCursorCurPosition++;
    }
    else{
      switch(letter){
        case 8:
          if(textCursorCurPosition>0){
            text=text.substring(0, textCursorCurPosition-1)+text.substring(textCursorCurPosition, text.length());
            textCursorCurPosition--;
          }
        break;
      }
    }
    
    makeTextCursor();
  }
  
  long t1=0;
  float textCursorPositions[]= new float[1000];
  void makeTextCursor(){
    String textFirstPart=text.substring(0, textCursorCurPosition);
    textCursorPositions[textCursorCurPosition]=posX+textWidth(textFirstPart);
    
    if(millis()-t1<=500){      
      rectMode(CENTER);
     
      rect(textCursorPositions[textCursorCurPosition]-curSizeX/2, posY, 1, textAscent());
      
      rectMode(CORNER);
    }
    else if(millis()-t1>=1000) t1=millis();
    
    switch(keyboardEvents[1].process()){
       case 37:
         if(textCursorCurPosition>0) textCursorCurPosition--;
       break;
       case 39:
         if(textCursorCurPosition<text.length()) textCursorCurPosition++;
       break;
    }
    
    if(passingTextBox==1){
      if(mouseEvents.process()==LEFT){
        int map=ceil((float)(mouseX-(posX-(float)sizeX/2))/((float)textWidth(text)/text.length()));
        
        if(map<0) map=0;
        if(map>text.length()) map=text.length();
        
        textCursorCurPosition=map;
      }
    }
  }
  
  void verifyTextBox(){
    if(mouseX>=posX-curSizeX/2 && mouseX<=posX+curSizeX/2 && mouseY>=posY-curSizeY/2 && mouseY<=posY+curSizeY/2){
      passingTextBox=1;
      
      if(mouseEvents.process()==LEFT) writingText=1;
    }
    else{
        if(mouseEvents.process()!=0) writingText=0;
      
        passingTextBox=0;
    }
    
    if(keyboardEvents[0].process()==10) writingText=0;
  }
  
  int graduateColor=0, graduateSize=0;
  void drawCursor(){
    if(passingTextBox==1){
      switch(cursor){
        case "HAND":
          cursor(HAND);
        break;
        case "TEXT":
          cursor(TEXT);
        break;
        default:
          println("ERROR. CURSOR UNDFINED");
        break;
      }
      
      switch(passingAction){
        case "noAction":
        break;
        case "changeColor":
          curFillColor=fillColor+graduateColor;
          if(graduateColor<100) graduateColor+=5;
        break;
        case "changeSize":
          curSizeX=sizeX+graduateSize;
          curSizeY=sizeY+graduateSize;
          if(graduateSize<10) graduateSize++;
        break;
        default:
          //imagem
        break;
      }
    }
    else{
      switch(passingAction){
        case "noAction":
        break;
        case "changeColor":
          curFillColor=fillColor+graduateColor;
          if(graduateColor>0) graduateColor-=5;
        break;
        case "changeSize":
          curSizeX=sizeX+graduateSize;
          curSizeY=sizeY+graduateSize;
          if(graduateSize>0) graduateSize--;
        break;
        default:
          image(imageAction, posX, posY, curSizeX, curSizeY);
        break;
      } 
    }
  }
  
  void drawTextBox(){
    fill(fillColor);
    
    if(form=="-") image(imageForm, posX, posY, curSizeX, curSizeY);
    else{
      switch(form){
        case "rect":
          rectMode(CENTER);
          rect(posX, posY, curSizeX, curSizeY);
          rectMode(CORNER);
        break;
        case "ellipse":
          ellipseMode(CENTER);
          ellipse(posX, posY, curSizeX, curSizeY);
          ellipseMode(CORNER);
        break;
        case "rect+ellipse":
          rectEllipse();
        break;
        case "noForm":
        break;
        default:
          println("ERROR. FORM UNDFINED");
        break;
      } 
    }
    
    writeText();
  }
  
  void rectEllipse(){
    fill(#9B9999, 250);
    
    ellipseMode(CENTER);
    ellipse(posX-curSizeX/2+3, posY+5, curSizeY, curSizeY);
    rectMode(CENTER);
    rect(posX+3, posY+5, curSizeX, curSizeY);   
    rectMode(CORNER);
    ellipse(posX+curSizeX/2+3, posY+5, curSizeY, curSizeY);
    ellipseMode(CORNER);
    
    fill(fillColor);
    ellipseMode(CENTER);
    ellipse(posX-curSizeX/2, posY, curSizeY, curSizeY);
    rectMode(CENTER);
    rect(posX, posY, curSizeX, curSizeY);   
    rectMode(CORNER);
    ellipse(posX+curSizeX/2, posY, curSizeY, curSizeY);
    ellipseMode(CORNER);
  }
  
  void writeText(){
   fill(colorText);
   
   textFont(textFont);
   
   textAlign(LEFT, CENTER);
    
   text(text, posX-curSizeX/2, posY);
  }
  
  void defineName(String nameTextBox){
    this.nameTextBox=nameTextBox; 
  }
  
  void sizeTextBox(float sizeX, float sizeY){
    this.sizeX=sizeX;
    this.sizeY=sizeY;
    
    this.curSizeX=sizeX;
    this.curSizeY=sizeY;
  }
  
  void posTextBox(float posX, float posY){
   this.posX=posX;
   this.posY=posY;
  }
  
  void defineForm(String form){
    switch(form){
        case "rect":
        case "ellipse":
        case "rect+ellipse":
        case "noForm":
          this.form=form;   
        break;
        default:
          this.form="-";
          
          imageForm=loadImage(form);
        break;
      }
  }
  
  void defineFillColor(int fillColor){
    this.fillColor=fillColor;
    
    this.curFillColor=fillColor;
  }
  
  void defineCursor(String cursor){
    this.cursor=cursor; 
  }
  
  void defineColorText(int colorText){
    this.colorText=colorText;
  }
  
  void defineTextFont(String textFont, int textSize){
    this.textFont=createFont(textFont, textSize);
  }
  
  void definePassinAction(String passingAction){
    switch(passingAction){
      case "changeColor":
      case "changeSize":
      case "noAction":
        this.passingAction=passingAction;
      break;
      default:
        imageAction=loadImage(passingAction);
      break;
    }
  }
}

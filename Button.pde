class Button{
  String nameButton="";
  
  float sizeX=0, sizeY=0, curSizeX=0, curSizeY;
  float posX=0, posY=0;
  
  String form="rect";
  PImage imageForm;
  
  color fillColor=255, curFillColor=255;
  
  String cursor="HAND";
  
  int passingButton=0, clickingButton=0;
  
  String passingAction="noAction";
  
  PImage imageAction;
  
  int Button(){
    verifyButton();
    
    drawCursor();
    
    drawButton();
    
    return 10*passingButton+clickingButton;
  }
  
  void verifyButton(){
    if(mouseX>=posX-curSizeX/2 && mouseX<=posX+curSizeX/2 && mouseY>=posY-curSizeY/2 && mouseY<=posY+curSizeY/2){
      passingButton=1;
      
      if(mouseEvents.process()==LEFT) clickingButton=1;
      else clickingButton=0;
    }
    else{
      passingButton=0;
      clickingButton=0;
    }
  }
  
  int graduateColor=0, graduateSize=0;
  void drawCursor(){
    if(passingButton==1){
      switch(cursor){
        case "HAND":
          cursor(HAND);
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
          image(imageAction, posX, posY, curSizeX, curSizeY);
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
  
  void defineName(String nameButton){
    this.nameButton=nameButton; 
  }
  
  void defineFillColor(color fillColor){
    this.fillColor=fillColor;
    
    this.curFillColor=fillColor;
  }
  
  void defineCursor(String cursor){
    this.cursor=cursor; 
  }
  
  void drawButton(){
    if(form=="-"){
      imageMode(CENTER);
      image(imageForm, posX, posY, curSizeX, curSizeY);
      imageMode(CORNER);
    }
    else{
      switch(form){
        case "rect":
          fill(#9B9999, 250);
          rectMode(CENTER);
          rect(posX+3, posY+5, curSizeX, curSizeY);
          rectMode(CORNER);
          
          fill(curFillColor);
          rectMode(CENTER);
          rect(posX, posY, curSizeX, curSizeY);
          rectMode(CORNER);
        break;
        case "ellipse":
          fill(#9B9999, 250);
          ellipseMode(CENTER);
          ellipse(posX+3, posY+5, curSizeX, curSizeY);
          ellipseMode(CORNER);
          
          fill(curFillColor);
          ellipseMode(CENTER);
          ellipse(posX, posY, curSizeX, curSizeY);
          ellipseMode(CORNER);
        break;
        case "noFomr":
        break;
        default:
          println("ERROR. FORM UNDFINED");
        break;
      } 
    }
  }
  
  void sizeButton(float sizeX, float sizeY){
    this.sizeX=sizeX;
    this.sizeY=sizeY;
    
    this.curSizeX=sizeX;
    this.curSizeY=sizeY;
  }
  
  void posButton(float posX, float posY){
   this.posX=posX;
   this.posY=posY;
  }
  
  void defineForm(String form){
    switch(form){
        case "rect":
        case "ellipse":
        case "noForm":
          this.form=form;   
        break;
        default:
          this.form="-";
          
          imageForm=loadImage(form);
        break;
      }
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

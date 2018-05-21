class Text{
  String textName="";
  
  String text="";
  
  int posX=0, posY=0;
  int textSize=0;
  
  color colorText=0;
  
  PFont font;
  
  void Text(){
    fill(colorText);
    
    textFont(font);
    
    text(text, posX, posY);
  }
  
  void defineName(String textName){
    this.textName=textName;
  }
  
  void definePosition(int posX, int posY){
    this.posX=posX;
    this.posY=posY;
  }
  
  void defineFont(String textFont, int textSize){
    this.font=createFont(textFont, textSize);
  }
  
  void defineColor(color textColor){
    this.colorText=textColor;
  }
  
  void defineText(String text){
    this.text=text; 
  }
}

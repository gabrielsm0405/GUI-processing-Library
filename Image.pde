class Image{
  String imageName="";
  
  int posX=0, posY=0;
  int sizeX=0, sizeY=0;
  
  PImage image;
  
  void Image(){
    image(image, posX, posY, sizeX, sizeY); 
  }
  
  void defineName(String imageName){
    this.imageName=imageName;
  }
  
  void definePosition(int posX, int posY){
    this.posX=posX;
    this.posY=posY;
  }
  
  void defineSize(int sizeX, int sizeY){
    this.sizeX=sizeX;
    this.sizeY=sizeY;
  }
  
  void defineImage(String imageString){
     this.image=loadImage(imageString);
  }
}

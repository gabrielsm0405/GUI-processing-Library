import java.util.Map;

public Event keyboardEvents[] = new Event[2];
public Event mouseEvents = new Event();

void keyPressed(){
  keyboardEvents[0].put(key);
  keyboardEvents[1].put(keyCode);
}

void mousePressed(){
  mouseEvents.put(mouseButton);
}

Pagina intro=new Pagina();
Pagina Idea=new Pagina();
Pagina curPage;

PImage idea;
PFont font;

void setup(){
  size(400, 600);
  noStroke();
  
  keyboardEvents[0]=new Event();
  keyboardEvents[1]=new Event();
  
  defineIntro();
  defineIdea();
  
  curPage=intro;
}

void defineIntro(){
  intro.defineSize(400, 600);
  intro.defineBackground(255);
  
  intro.defineButton("Idea", 150, 150, 50, 50, "data/images/010-creative.png", 0, "HAND", "changeSize");
  intro.defineButton("Ret", 200, 300, 100, 50, "rect", 0, "HAND", "changeSize");
  intro.defineButton("Eli", 100, 100, 100, 50, "ellipse", #4BE81C, "HAND", "changeSize");
  
  intro.defineTextBox("Name", 100, 50, 150, 25, "rect+ellipse", #F2EBEB, "TEXT", "Arial", 15, "changeSize");
  intro.defineTextBox("CPF", 200, 500, 300, 25, "rect+ellipse", #F2EBEB, "TEXT", "Arial", 15, "changeSize");
  
  intro.defineImage("lampada", 300, 300, 50, 50, "data/images/010-creative.png");
  
  intro.defineText("boasVindas", 100, 0, "Arial", 32, 0, "Ola gente");
}

void defineIdea(){
  Idea.defineSize(400, 600);
  Idea.defineBackground("data/images/010-creative.png");
  
  Idea.defineButton("intro", 200, 300, 100, 50, "rect", #E81C1C, "HAND", "changeColor");
}

void draw(){
  
  switch(curPage.Pagina()){
     case "Idea":
       curPage=Idea;
     break;
     case "intro":
       curPage=intro;
     break;
  }
  
  attEvents();
}

void attEvents(){
  mouseEvents.removeOne();
  keyboardEvents[0].removeOne();
  keyboardEvents[1].removeOne();
}

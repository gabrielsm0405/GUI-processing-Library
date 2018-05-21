class Event{
  private class NODE{
    NODE next;
    
    int val;
  }
  
  private class LinkedList{    
    NODE first;
    NODE last;
    
    int qtdEle;
  }
  
  LinkedList queue= new LinkedList();
  
  void put(int event){
    if(queue.qtdEle==0){
      queue.first=new NODE();
      queue.first.val=event;
      
      queue.last=queue.first;
    }
    else{
      NODE auxNode= new NODE();
      auxNode.val=event;
      
      queue.last.next=auxNode;
      
      queue.last=auxNode;
    }
    
    queue.qtdEle++;
  }
  
  int process(){
    if(queue.first!=null) return queue.first.val;
    
    return 0;
  }
  
  void removeOne(){
    if(queue.first!=null){
      queue.first=queue.first.next;
      
      queue.qtdEle--;
      
      if(queue.qtdEle==0) queue.last=null;
    }
  }
}

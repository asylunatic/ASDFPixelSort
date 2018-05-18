class AsendorfBlackSorter extends Sorter{
  
  public AsendorfBlackSorter(PImage img){
    this.img = img;
  }
  
  public int getX(int x, int y){
    return getFirstNotBlackX(x, y);
  }
  
  public int getEndX(int x, int y){
    return getNextBlackX(x, y);
  }
  
  public int getY(int x, int y){
    return getFirstNotBlackY(x, y);
  }
  
  public int getEndY(int x, int y){
    return getNextBlackY(x, y);
  }
      
   
  // black x
  int getFirstNotBlackX(int x, int y) {
    
    while(img.pixels[x + y * img.width] < blackValue) {
      x++;
      if(x >= img.width) 
        return -1;
    }
    
    return x;
  }
  
  int getNextBlackX(int x, int y) {
    x++;
    
    while(img.pixels[x + y * img.width] > blackValue) {
      x++;
      if(x >= img.width) 
        return img.width-1;
    }
    
    return x-1;
  }
  
  // black y
  int getFirstNotBlackY(int x, int y) {
  
    if(y < img.height) {
      while(img.pixels[x + y * img.width] < blackValue) {
        y++;
        if(y >= img.height)
          return -1;
      }
    }
    
    return y;
  }
  
  int getNextBlackY(int x, int y) {
    y++;
  
    if(y < img.height) {
      while(img.pixels[x + y * img.width] > blackValue) {
        y++;
        if(y >= img.height)
          return img.height-1;
      }
    }
    
    return y-1;
  }
  
}

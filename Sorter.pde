abstract class Sorter{
    PImage img;
    // threshold values to determine sorting start and end pixels
    int blackValue = -16000000;
    int brightnessValue = 60;
    int whiteValue = -13000000;
    
        abstract public int getX(int x, int y);
    abstract public int getEndX(int x, int y);
    abstract public int getY(int x, int y);
    abstract public int getEndY(int x, int y);
  
    public void sortRow(int mode, int row) {
    println("sorting rows");
    // current row
    int y = row;
    
    // where to start sorting
    int x = 0;
    
    // where to stop sorting
    int xend = 0;
    while(xend < img.width-1) {
      
      x = getX(x, y);
      xend = getEndX(x, y);
      
      if(x < 0) break;
      
      int sortLength = xend-x;
        
       img = sortPixelRow(x, y, sortLength);
       x = xend+1;
    }
  }
  

  public void sortColumn(int mode, int column) {
    println("sorting cols");
    // current column
    int x = column;
    
    // where to start sorting
    int y = 0;
    
    // where to stop sorting
    int yend = 0;
    
    while(yend < img.height-1) {
      
      y = getY(x, y);
      yend = getEndY(x, y);
          
      if(y < 0) break;
      
      int sortLength = yend-y;
      
      img = sortPixelCol(x, y, sortLength);
      y = yend+1;
     
    }
     
   }
    
    public PImage sortPixelRow(int x, int y, int sortLength){
      color[] unsorted = new color[sortLength];
      color[] sorted = new color[sortLength];
      
      for(int i=0; i<sortLength; i++) {
        unsorted[i] = img.pixels[x + i + y * img.width];
      }
      
      sorted = sort(unsorted);
      
      for(int i=0; i<sortLength; i++) {
        img.pixels[x + i + y * img.width] = sorted[i];      
      }
      return img;
    }
  
    public PImage sortPixelCol(int x, int y, int sortLength){
      color[] unsorted = new color[sortLength];
      color[] sorted = new color[sortLength];
      
      for(int i=0; i<sortLength; i++) {
        unsorted[i] = img.pixels[x + (y+i) * img.width];
      }
      
      sorted = sort(unsorted);
      
      for(int i=0; i<sortLength; i++) {
        img.pixels[x + (y+i) * img.width] = sorted[i];
      }
      return img;
    }
}

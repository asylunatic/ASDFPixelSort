class EdgeRegionSorter extends Sorter{
  
  PImage edges;
  
  public EdgeRegionSorter(PImage img){
    this.img = img;
    this.edges = edges(img);
  }
  
  public int getX(int x, int y){
    return getFirstNotBlackXInEdges(x, y);
  }
  
  public int getEndX(int x, int y){
    int xend = getNextBlackXInEdges(x, y);
    if (xend < img.width-1 && xend > 1){
      xend = getFirstNotBlackXInEdges(xend, y);
    }
   return xend;
  }

  public int getY(int x, int y){
    return getFirstNotBlackYInEdges(x, y);
  }
  
  public int getEndY(int x, int y){
    int yend = getNextBlackYInEdges(x, y);
    if(yend < img.height-1 && yend > 1){
      yend = getFirstNotBlackYInEdges(x, yend);
    }
    return yend;
  }

  int getFirstNotBlackXInEdges(int x, int y) {
    
    while(edges.pixels[x + y * edges.width] < blackValue) {
      x++;
      if(x >= edges.width) 
        return -1;
    }
    
    return x;
  }
  
  int getNextBlackXInEdges(int x, int y) {
    x++;
    
    while(edges.pixels[x + y * edges.width] > blackValue) {
      x++;
      if(x >= edges.width) 
        return edges.width-1;
    }
    
    return x-1;
  }
  
  // black y
  int getFirstNotBlackYInEdges(int x, int y) {
    println("x"+x+"y"+y);
    
    if(y < edges.height) {
      while(edges.pixels[x + y * edges.width] < blackValue) {
        y++;
        if(y >= edges.height)
          return -1;
      }
    }
    
    return y;
  }
  
  int getNextBlackYInEdges(int x, int y) {
    y++;
  
    if(y < edges.height) {
      while(edges.pixels[x + y * img.width] > blackValue) {
        y++;
        if(y >= edges.height)
          return edges.height-1;
      }
    }
    
    return y-1;
  }
  
  PImage edges(PImage img) {
                    
    PImage edgeImg = createImage(img.width, img.height, RGB);
    
    // Initialize and create a new sobel object
    SobelEdgeDetection sobel = new SobelEdgeDetection();
    
    // Performs the edge detection routine, 
    edgeImg = sobel.findEdgesAll(img, 90);
  
    // Remove some noise from the conversion
    edgeImg = sobel.noiseReduction(edgeImg, 1);
    
    return edgeImg;
    //image(edgeImg, width/2, 0); // Draw the new image
  }
}

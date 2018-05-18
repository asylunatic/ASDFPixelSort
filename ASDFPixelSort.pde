/*

 ASDF Pixel Sort
 Kim Asendorf | 2010 | kimasendorf.com
 Forked by Vera Tan Hoveling
 
 sorting modes
 
 0 = black
 1 = brightness
 2 = white
 3 = jitter
 4 = between edges
 
 */

int mode = 4;

// image path is relative to sketch directory
PImage img;
String imgFileName = "sea";
String fileType = "jpg";

int loops = 1;

int row = 0;
int column = 0;

boolean saved = false;
SorterFactory sorterfactory;
Sorter sorter;

void setup() {
  img = loadImage(imgFileName+"."+fileType);
  sorterfactory = new SorterFactory();
  sorter =  sorterfactory.createSorter(img, mode);
  // use only numbers (not variables) for the size() command, Processing 3
  size(1, 1);
  
  // allow resize and update surface to image dimensions
  surface.setResizable(true);
  surface.setSize(img.width, img.height);
  
  // load image onto surface - scale to the available width,height for display
  image(img, 0, 0, width, height);
}


void draw() {
  
  // loop through columns
  while(column < img.width-1) {
    //println("Sorting Column " + column);
    img.loadPixels(); 
    sorter.sortColumn( mode, column);
    column++;
    img.updatePixels();
  }
  
  // loop through rows
  while(row < img.height-1) {
    //println("Sorting Row " + column);
    img.loadPixels(); 
    sorter.sortRow(mode, row);
    row++;
    img.updatePixels();
  }
  
  // load updated image onto surface and scale to fit the display width,height
  image(img, 0, 0, width, height);
  
  if(!saved && frameCount >= loops) {
    
  // save img
    img.save(imgFileName+"_"+mode+".png");
  
    saved = true;
    println("Saved "+frameCount+" Frame(s)");
    
    // exiting here can interrupt file save, wait for user to trigger exit
    println("Click or press any key to exit...");
  }
}

void keyPressed() {
  if(saved)
  {
    System.exit(0);
  }
}

void mouseClicked() {
  if(saved)
  {
    System.exit(0);
  }
}

class SorterFactory{
  
  public SorterFactory(){}
  
  public Sorter createSorter(PImage img, int mode) {
    
    Sorter sorter;
    
    switch(mode){
      case 0: 
        sorter = new AsendorfBlackSorter(img);
        break;
       case 4:
         sorter = new EdgeRegionSorter(img);
         break;
      default:
        println("THIS SHOULD BE AN EXCEPTION");
        sorter = new AsendorfBlackSorter(img);
        break;
      }
      
      return sorter;
      
   }
  
}

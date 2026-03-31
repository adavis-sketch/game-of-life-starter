import java.util.Arrays;

final int SPACING = 20; // each cell's width/height //<>// //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid; // the 2D array to hold 0's and 1's

void setup() {
  size(800, 600); // adjust accordingly, make sure it's a multiple of SPACING
  noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
  grid = new int[height / SPACING][width / SPACING];

  // STEP 1 - Populate initial grid (you may want to use Arrays.toString to check it)
  for (int i = 0; i < grid.length; i++){
    for (int j = 0; j < grid[0].length; j++){
      if (Math.random() < DENSITY){
        grid[i][j] = 1;
      }
      else{
        grid[i][j] = 0;
      }
    }
  }

}

void draw() {
  showGrid(); 
  // STEP 2 - Implement this method so you can see your 2D array
  // grid = calcNextGrid(); // uncomment this after you get showGrid() working
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];

  // your code here

  return nextGrid;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!
  
  // your code here
  // don't check out-of-bounds cells!

  return n;
}

void showGrid() {
  // your code here
  // use square() to represent each cell
  for (int i = 0; i < grid.length; i++){
    for (int j = 0; j < grid[0].length; j++){
      if (grid[i][j] == 0){
        square(j * SPACING, i * SPACING, SPACING);
        fill(0, 0, 0);
      }
      else { 
        square(j * SPACING, i * SPACING, SPACING);
        fill(255, 0, 0);
      }
    }
  }
  

  // use fill(r, g, b) to control color: black for empty, red for filled (or alive)
  // each square (cell) has a width and height of SPACING. 
  // you will need to calculate the x and y position as you loop through the grid

}

import java.util.Arrays;

final int SPACING = 2; // each cell's width/height //<>// //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid;
int[][] age; //Age for the color change as it gets older
boolean isPaused = false; // making a pause button
// the 2D array to hold 0's and 1's

void setup() {
  size(800, 600); // adjust accordingly, make sure it's a multiple of SPACING
  noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
  grid = new int[height / SPACING][width / SPACING];
  age = new int[grid.length][grid[0].length]; // making an age for each cell in the grid, only gonna count the alive ones though


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
  if (!isPaused){ // it will run as long is its not paused
    grid = calcNextGrid();
  }
   // uncomment this after you get showGrid() working
}

// turns out this is all I needed to pause it, it pause from the space bar
void keyPressed() {
  if (key == ' '){
    isPaused = !isPaused;
  }
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];
  int[][] nextAge = new int[grid.length][grid[0].length]; // I'm gonna have it where it will age til its 20 and keep turning redder and then stop there
  // pretty much just copying my next grid for the age
  for (int i = 0; i < grid.length; i++){
    for (int j = 0; j < grid[0].length; j++){
      int neighborSum = countNeighbors(i, j);

      if (grid[i][j] == 1){
        if (neighborSum <= 1 || neighborSum >= 4){
          nextGrid[i][j] = 0;
          nextAge[i][j] = 0;
        }
        else {
          nextGrid[i][j] = 1;
          if (age[i][j] < 20){
            nextAge[i][j] = age[i][j] + 1;
          }
          else {
            nextAge[i][j] = 20;
          }
        }
      }
      else {
        if (neighborSum == 3){
          nextGrid[i][j] = 1;
          nextAge[i][j] = 1;
        }
        else {
          nextGrid[i][j] = 0;
          nextAge[i][j] = 0;
        }
      }
    }
  }
  // your code here
  age = nextAge;
  return nextGrid;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!

  if (y - 1 >= 0){
    if (x - 1 >= 0){
      n += grid[y - 1][x - 1];
    }
    n += grid[y - 1][x];
    if (x + 1 < grid[0].length){
      n += grid[y - 1][x + 1];
    }
  }

  if (x - 1 >= 0){
    n += grid[y][x - 1];
  }
  if (x + 1 < grid[0].length){
    n += grid[y][x + 1];
  }

  if (y + 1 < grid.length){
    if (x - 1 >= 0){
      n += grid[y + 1][x - 1];
    }
    n += grid[y + 1][x];
    if (x + 1 < grid[0].length){
      n += grid[y + 1][x + 1];
    }
  }
  

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
        fill(0, 0, 0);
      }
      else { 
        // slowly changes from pink to red
        int colorChange = 192 - (age[i][j] * 192) / 20;
        fill(255, colorChange, colorChange);
      }
      square(j * SPACING, i * SPACING, SPACING);
    }
  }
  

  // use fill(r, g, b) to control color: black for empty, red for filled (or alive)
  // each square (cell) has a width and height of SPACING. 
  // you will need to calculate the x and y position as you loop through the grid

}

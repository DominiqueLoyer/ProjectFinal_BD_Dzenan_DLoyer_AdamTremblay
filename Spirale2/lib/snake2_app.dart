// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
import 'package:polymer/polymer.dart';

///Global variables

String grid_color="grey"; 


/// Our Polymer `<snake2-app>` element.
@CustomTag('snake2-app')
class Snake2App extends PolymerElement {
   static Map play_grid = new Map();
   static Map snake_id = new Map();
   @observable List grid_corners = new List();
   @observable List grid_top = new List();
   @observable List grid_bottom = new List();
   @observable List grid_left = new List();
   @observable List grid_right = new List();
   @observable int number_of_cells_in_grid = 100;
   @observable double root_z = 0.0;
  
  
  
  /// Constructor used to create instance of MainApp.
  Snake2App.created() : super.created(){
    init();
    main_grid();
  }

  
  

  /**for changing color of one square**/
  void moreApples(MouseEvent event) {
    /**change the color of the grid on mouse click**/
    newApple();
    //print(play_grid);
    main_grid();
  }

  void newApple(){
    var rng = new Random();
    var x =0;
    var new_apple_id=-1;
    new_apple_id = rng.nextInt(number_of_cells_in_grid-1);
    for(x=0;x<100;x++){
      if((play_grid[new_apple_id]==grid_color)){
        play_grid[new_apple_id]='red';
        x=101;
      }else{
        new_apple_id = rng.nextInt(number_of_cells_in_grid-1);
      }
        
    }
      
    //print(new_apple_id);
  }

  /**for changing the whole grid**/
  void switchColors(MouseEvent event){
    /**change the color of the grid on mouse click**/
    var x=0;
    for(x=0;x<100;x++){
      if ((play_grid[x]!='red')&&(play_grid[x]!='green')){
        if (play_grid[x]=='grey'){
          play_grid[x]='brown';
          grid_color='brown';
        }else{
          play_grid[x]='grey';
          grid_color='grey';
        }
      }
    }
    main_grid();
    
  }  
  
  
  /**for reset of the grid**/
    void reset(MouseEvent event){
      init();
      main_grid();
    }
  
  
  /**for initialisation of the grid**/
  void init(){
    var x=0;      /**variable for the for()loops**/
    
    /**clear all lists and maps**/
    play_grid.clear();
    snake_id.clear();
    grid_corners.clear();
    grid_top.clear();
    grid_bottom.clear();
    grid_left.clear();
    grid_right.clear();
    
    /**for when we will put more than 1 grid size**/
    var z = number_of_cells_in_grid;
    print('$z cells');
    /** TODO: show Z in a box from the Index.html to say : Le panneau de jeux est de 100 cases. ou evidement le 100 est la variable z**/
    
    
    /**Define the corners**/    
    root_z = sqrt(z);    
    var top_left = 0;
    var top_right = root_z-1;
    var bottom_left = z-root_z;
    var bottom_right = z-1;
    grid_corners = [top_left,top_right,bottom_left,bottom_right];
    print(grid_corners);
    
    /**Define the sides**/
    for (x=0;x<(root_z);x++){
      grid_top.add(top_left+x);
    }   
    for (x=0;x<(root_z);x++){
      grid_left.add(top_left+(x*root_z));
    }
    for (x=0;x<(root_z);x++){
      grid_right.add(top_right+(x*root_z));
    }
    for (x=0;x<(root_z);x++){
      grid_bottom.add(bottom_left+x);
    }
    print('top $grid_top');
    print(grid_left);
    print(grid_right);
    print(grid_bottom);
    
    /**load the play grid colors**/
        for (x=0;x<z;x++){
          play_grid [x] = grid_color;        
        }
    
    /**Define the snake: randomizer + result-1**/
    var rng = new Random();
    var head_id = rng.nextInt(z-10);  /**to avoid being in the last row**/
    head_id = head_id+5;              /**to avoid being too close to cell #0**/    
    var tail_id =head_id-1;
    snake_id = {0: head_id, 1: tail_id };
    play_grid[head_id]="green";
    play_grid[tail_id]="green";
    print(snake_id);
   
    newApple();
    
    
    print(play_grid);      
  }

  void death(){
    var x=0;
        for(x=0;x<100;x++){
          if ((play_grid[x]!='red')&&(play_grid[x]!='green')){           
              play_grid[x]='white';
          }
        }
        main_grid();
        /**TODO: add game over message and show how long the snake**/
    
  }

  
/**Pour faire grandir le serpent**/  
  void growSnake(var direction){
    switch (direction){
      case 'up':       
        grow(-10);
        return;
      case 'down':
        grow(10);
        return;
      case 'left':
        grow(-1);
        return;
      case 'right':
        grow(1);
        return;
    }
  }
  
void grow(int growth_rate){
  var length=snake_id.length;  
  var x=0;
  
  for(x=length;x>0;x--){
  snake_id[x]=snake_id[x-1]; 
  }
  snake_id[0]=snake_id[0]+growth_rate; 
  for(x=0;x<length;x++){
    play_grid[snake_id[x]]='green';
  }
}  
  
/**Pour faire bouger le serpent**/  
  void moveSnake(var direction){  
    switch (direction){
        case 'up':
          move(-10);
          return;
        case 'down':
          move(10);
          return;
        case 'left':
          move(-1);
          return;
        case 'right':
          move(1);
          return;
      }
    }
  
  void move(int movement){
    var length=snake_id.length;  
    var tail=0;
    var x=0;
    if(length==2){
       play_grid[snake_id[1]]=grid_color;
       snake_id[1]=snake_id[0];
       snake_id[0]=snake_id[0]+movement;           
     }else{
       x=length;
       tail=snake_id[x-1];
       play_grid[tail]=grid_color;
       for(x=length-1;x>0;x--){
       snake_id[x]=snake_id[x-1]; 
       }
       snake_id[0]=snake_id[0]+movement; 
     }
     for(x=0;x<length;x++){
       play_grid[snake_id[x]]='green';
     }
    
  }
  
  
  /**for going up**/
  void moveUp (){
    var h =0;
    h= snake_id[0];
    if ((h-10>=0)){
      if((play_grid[h-10]==grid_color)){ 
        moveSnake('up');
      }
      else if(play_grid[h-10]=='red'){
        growSnake('up');
        newApple();
        main_grid();
      }else if ((play_grid[h-10]=='green')&&(play_grid[h-10]!=snake_id[1])){
        death();
      }
    }else{
      death();
    }   
    main_grid();
  
  }
  
  /**for going left**/
  void moveLeft (){
    var h =0;
    var x=0;
    var leftBorder=false;
    for (x=0;x<grid_left.length;x++) {
      if (snake_id[0]==grid_left[x]){
        leftBorder=true; 
        x=101;
      }
    }
    h= snake_id[0];
    if (leftBorder==false){
      if((play_grid[h-1]==grid_color)){
        moveSnake('left');
      }else if(play_grid[h-1]=='red'){
        growSnake('left');
        newApple();
        main_grid();
      }else if ((play_grid[h-1]=='green')&&(play_grid[h-1]!=snake_id[1])){
        death();
      }
    }else{    
      death();
    }
    main_grid();
  }
  
  /**for going right**/
  void moveRight (){
    var h =0;
    var x=0;
    var rightBorder=false;
    for (x=0;x<grid_right.length;x++) {
      if (snake_id[0]==grid_right[x]){
        rightBorder=true; 
        x=101;
      }
    }
    h= snake_id[0];
    if (rightBorder==false){
      if((play_grid[h+1]==grid_color)){
        moveSnake('right');
      }else if(play_grid[h+1]=='red'){
        growSnake('right');
        newApple();
        main_grid();
      }else if ((play_grid[h+1]=='green')&&(play_grid[h+1]!=snake_id[1])){
        death();
      }
    }else{    
      death();
    }
    main_grid();
  }
  
  /**for going down**/
  void moveDown (){
    var h =0;
    h= snake_id[0];
    if ((h+10>=100)){
      death();
    }else if((play_grid[h+10]==grid_color)){ 
      moveSnake('down');
    }
    else if(play_grid[h+10]=='red'){
      growSnake('down');
      newApple();
      main_grid();
    }else if ((play_grid[h+10]=='green')&&(play_grid[h+10]!=snake_id[1])){
      death();  
    }   
    main_grid();
  }
 
}
 

/**Table Setup **/
//main function.
//late declaration for the div_grid div in the template. Put here for easily find it again


void main_grid() {
   
  Grid grid = new Grid();
  //add the grid - this will cause the grid table element to be built and added to the DOM 
  DivElement _div_grid = new DivElement();
  _div_grid = querySelector ('#view-grid-container');
  addView(grid,_div_grid);
}




//A list of elements
abstract class View {
List<Element> elements;
}



//a generic table that can bind to some data. 
class Grid implements View{ 

  
  TableElement _table;
  List<String> fields;
  List cellItems = new List();
  Map cellMap = new Map();
  
  
  Grid(){
    _table = new Element.tag("table");
        _table.style.borderStyle="solid";
        _table.style.borderWidth="2";
        _table.style.borderSpacing="0";
        _table.style.borderColor="black";
        _table.style.backgroundColor="red"; 
  } 
  
 
  //returns a list of elements to be added to the DOM.
  //implements View interface
  List<Element> get elements { 
    List<Element> result = new List<Element>(); 
    _makeTable();   
    result.add(_table);    
    
    return result;
  }


  //bind the data items into the table.
  _makeTable() {
    var cellMap_length = 0;
    var x = 0;
    var z = 0;
    var c = 0;
    var cell_id = 0;
    double root_cellMap_length = 0.0;
    cellMap = Snake2App.play_grid;
    //print('cellMap');
    //print(cellMap);
    cellMap_length = cellMap.length;
    root_cellMap_length = sqrt(cellMap_length);
    z = root_cellMap_length;
    for (x=0;x<z;x++){
      TableRowElement row = new Element.tag("tr");
      
      for (c=0;c<z;c++){
        TableCellElement cell = new Element.tag("td");
        
        cell_id = x*10+c;
        //print(cell_id);
        cell.style.backgroundColor = cellMap[cell_id];
        //print(cellMap[cell_id]);
        cell.style.height = "15px";
        cell.style.width = "15px";
        cell.style.borderStyle="none";
        cell.style.borderSpacing="0px";
        row.nodes.add(cell);
      }
      _table.nodes.add(row);  
    }
    
  }
} 


//A utility function to add a view to the document, or to other views elements.
void addView(View view, [Element parent]) {
  if (parent == null) {
    parent = document.body;
  }
  if (parent != null){    
    parent.nodes.clear();
  }
  parent.nodes.addAll(view.elements);
}







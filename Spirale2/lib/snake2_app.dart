// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
import 'package:polymer/polymer.dart';

///Global variables
 int colorChange = 0xFFF;
 


/// Our Polymer `<snake2-app>` element.
@CustomTag('snake2-app')
class Snake2App extends PolymerElement {
   @observable String td_bg_color = 'white';
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
  void changeColor(MouseEvent event) {
    /**change the color of the grid on mouse click**/
   
  }


  /**for changing the whole grid**/
  void switchColors(MouseEvent event){
    /**change the color of the grid on mouse click**/
    
    
  }  
  
  
  /**for reset of the grid**/
    void reset(MouseEvent event){
      init();
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
    for (x=0;x<(root_z-2);x++){
      grid_top.add(top_left+x+1);
    }   
    for (x=0;x<(root_z-2);x++){
      grid_left.add(top_left+root_z+(x*root_z));
    }
    for (x=0;x<(root_z-2);x++){
      grid_right.add(top_right+root_z+(x*root_z));
    }
    for (x=0;x<(root_z-2);x++){
      grid_bottom.add(bottom_left+x+1);
    }
    print(grid_top);
    print(grid_left);
    print(grid_right);
    print(grid_bottom);
    
    /**Define the snake: randomizer + result-1**/
    var rng = new Random();
    var head_id = rng.nextInt(z-10);  /**to avoid being in the last row**/
    head_id = head_id+5;              /**to avoid being too close to cell #0**/    
    var tail_id =head_id-1;
    snake_id = {'head': head_id, 'tail': tail_id };
    print(snake_id);
   
    
    
    /**load the play grid colors**/
    for (x=0;x<z;x++){
      play_grid [x] = 'grey';        
    }
    print(play_grid);      
  }

 
}
 

/**Table Setup test**/
//main function.

void main_grid() {
  Grid grid = new Grid();

  //add the grid - this will cause the grid table element to be built and added to the DOM
  addView(grid);
}
//A list of elements
abstract class View {
List<Element> elements;
}

//a generic table that can bind to some data. 
class Grid implements View { 
  TableElement _table;
  List<String> fields;
  List cellItems = new List();
  Map cellMap = new Map();
  
  Grid() {
    _table = new Element.tag("table");
    _table.style.borderStyle="solid";
    _table.style.borderWidth="2";
    _table.style.borderSpacing="0";
    _table.style.borderColor="black";
    _table.style.backgroundColor="red";
    
    fields = new List<String>();
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
    print('cellMap');
    print(cellMap);
    cellMap_length = cellMap.length;
    root_cellMap_length = sqrt(cellMap_length);
    z = root_cellMap_length;
    for (x=0;x<z;x++){
      TableRowElement row = new Element.tag("tr");
      
      for (c=0;c<z;c++){
        TableCellElement cell = new Element.tag("td");
        
        cell_id = x*10+c;
        print(cell_id);
        cell.style.backgroundColor = cellMap[cell_id];
        print(cellMap[cell_id]);
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
  parent.nodes.addAll(view.elements);
}







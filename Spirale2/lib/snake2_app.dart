// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
import 'package:polymer/polymer.dart';

///Global variables
 int colorChange = 0xFFF;
 @observable String td_bg_color = 'white';
 @observable Map play_grid;
 @observable Map snake_id;
 @observable List grid_corners;
 @observable List grid_top;
 @observable List grid_bottom;
 @observable List grid_left;
 @observable List grid_right;
 @observable int number_of_cells_in_grid = 100;
 @observable double root_z = 0.0;


/// Our Polymer `<snake2-app>` element.
@CustomTag('snake2-app')
class Snake2App extends PolymerElement {
  /// Constructor used to create instance of MainApp.
  Snake2App.created() : super.created(){
    init();
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
    
    /**for when we will put more than 1 grid size**/
    var z = number_of_cells_in_grid;
    print(z +' cells');
    /** TODO: show Z in a box from the Index.html to say : Le panneau de jeux est de 100 cases. ou evidement le 100 est la variable z**/
    
    
    /**Define the corners**/    
    root_z = sqrt(z);    
    var top_left = 0;
    var top_right = 0+root_z;
    var bottom_left = z-1;
    var bottom_right = z-1-root_z;
    grid_corners = [top_left,top_right,bottom_left,bottom_right];
    print(grid_corners);
    
    /**Define the sides**/
    for (x=0;x<(root_z-2);x++){
      grid_top.add(top_left+x+1);
    }
    
    for (x=0;x<(root_z-2);x++){
      grid_left.add(top_left+root_z);
    }
    for (x=0;x<(root_z-2);x++){
      grid_right.add(top_right+root_z);
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
  

// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:polymer/polymer.dart';

///Global variable
int colorChange = 0xFFF;



/// Our Polymer `<snake2-app>` element.
@CustomTag('snake2-app')
class Snake2App extends PolymerElement {
  /// Constructor used to create instance of MainApp.
  Snake2App.created() : super.created(){
  }




  /**for changing color of one square**/
  void changeColor(MouseEvent event) {
    /**change the color of the grid on mouse click**/
    document.getElementById('A1').style.backgroundColor = "blue";
  }


  /**for changing the whole grid**/
  void switchColors(MouseEvent event){
    /**change the color of the grid on mouse click**/
    var y = "A";
    for (var x=1;x<11;x++){
      if((document.getElementById("$y$x").style.backgroundColor)== "white"){
        document.getElementById("$y$x").style.backgroundColor = "black";
      }else{
        document.getElementById("$y$x").style.backgroundColor = "white";
      }
    }  
    if (y=="A"){
      y ="B";
      for (var x=1;x<11;x++){  
        if((document.getElementById("$y$x").style.backgroundColor)== "white"){
          document.getElementById("$y$x").style.backgroundColor = "black";
        }else{
          document.getElementById("$y$x").style.backgroundColor = "white";
        }
      }  
    }
    
  }  
  
  
///last bracket for class "Snake2App" 
}


@CustomTag('play-grid')

class PlayGrid {
  String C0 = 'white';
    String C1 = 'white';
    String C2 = 'white';
    String C3 = 'white';
    String C4 = 'white';
    String C5 = 'white';
    String C6 = 'white';
    String C7 = 'white';
    String C8 = 'white';
    String C9 = 'white';
    PlayGrid(this.C0, this.C1,this.C2, this.C3,this.C4, this.C5,this.C6, this.C7,this.C8, this.C9);
  
}


class FullGrid extends PolymerElement {
  @observable String td_bg_color = 'white';
  @observable List play_grid;
  
  FullGrid.created() : super.created() {
    init();
  }
  
  
  
  
  /**for initialisation of the grid**/
  void init(){
    
    
    print(C0+'|'+C1+'|'+C2+'|'+C3+'|'+C4+'|'+C5+'|'+C6+'|'+C7+'|'+C8+'|'+C9);
    
    for (var x=0;x<10;x++){
      play_grid[new PlayGrid('grey','grey','grey','grey','grey','grey','grey','grey','grey','grey')];
      print(C0+'|'+C1+'|'+C2+'|'+C3+'|'+C4+'|'+C5+'|'+C6+'|'+C7+'|'+C8+'|'+C9);
      x++;
      
    } 
  }

  /**for reset of the grid**/
  void reset(MouseEvent event){
    init();
  }

}
  

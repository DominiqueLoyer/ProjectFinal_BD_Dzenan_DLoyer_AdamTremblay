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
    init();
  }


  /**for initialisation of the grid**/
  void init(){
    document.getElementById('A1').style.background = "blue";
    print('arrrg');
    
    /**
    var y = "A";
    for (var x=1;x<11;x++){
      document.getElementById("$y$x").style.backgroundColor = "white";
      x++;
      document.getElementById("$y$x").style.backgroundColor = "black";
      
    }  
    if (y=="A"){
      y ="B";
      for (var x=1;x<11;x++){  
        document.getElementById("$y$x").style.backgroundColor= "black";
        x++;
        document.getElementById("$y$x").style.backgroundColor = "white";
        
      }  
    }**/
  }

  /**for reset of the grid**/
  void reset(MouseEvent event){
    init();
  }


  /**for changing color of one square**/
  void changeColor(MouseEvent event) {
    /**change the color of the grid on mouse click**/
    document.getElementById("A1").style.backgroundColor = "blue";
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

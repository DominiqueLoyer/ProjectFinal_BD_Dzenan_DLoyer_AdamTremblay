
import 'dart:html';

import 'package:chrome/chrome_app.dart' as chrome;

int colorChange = 0xFFF;

/**
 * A `hello world` application for Chrome Apps written in Dart.
 *
 * For more information, see:
 * - http://developer.chrome.com/apps/api_index.html
 * - https://github.com/dart-gde/chrome.dart
 */
void main() {
  init();
  querySelector("#button_blue").onClick.listen(changeColor);
  querySelector("#button_switch").onClick.listen(switchColors);
  querySelector("#button_reset").onClick.listen(reset);
}

/**for initialisation of the grid**/
void init(){
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
  }
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

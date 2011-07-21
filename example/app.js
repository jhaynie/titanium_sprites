// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.

var window = Ti.UI.createWindow();

var s = require('ti.sprite');

var sprite1 = s.createSprite({
   url:'runningcat.png',
   width:512,
   height:256
});

sprite1.startAnimating(0,8,1000);

window.add(sprite1);


var sprite2 = s.createSprite({
   url:'spritesheet16.gif',
   width:16,
   height:16,
   x:0,
   y:3
});

window.add(sprite2);


window.open();



Appcelerator Titanium Sprite Module for iOS
==========================================

This module provides Sprite Sheet functionality for Appcelerator Titanium for iOS.

Usage
-----

Animate a sprite sheet:

~~~
var window = Ti.UI.createWindow();

var s = require('ti.sprite');

var sprite = s.createSprite({
   url:'runningcat.png', 
   width:512, 
   height:256
});

sprite.startAnimating(0,8,1000);

window.add(sprite);

window.open();
~~~

Display a specific image in the sprite sheet. x is the row and y is the column (zero based):


~~~
var window = Ti.UI.createWindow();
var s = require('ti.sprite');

var sprite = s.createSprite({
   url:'spritesheet16.gif',
   width:16,
   height:16,
   x:0,
   y:3
});

window.add(sprite);

window.open();
~~~



This code is licensed under the Apache Public License Version 2. See the LICENSE file.

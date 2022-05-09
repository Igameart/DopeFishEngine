# DopeFish Engine

![image](https://user-images.githubusercontent.com/5240715/167331052-f0d0f805-5b05-4882-bff3-abc54fedfc37.png)


DopeFish is the only full GML Doom/Heretic map loading system for GMS2.3+ (so far as I'm aware)



## What does DopeFish do?
Before we talk about that, let's talk about wads! Wad is a file format created by iD Software in 1993 for DOOM, and stands for "where's all the data". It has sense been used in games like Heretic, Hexen, Strife, Hacx and more! A wad file contains all of the content that makes up a video game, sprites, textures, sound bytes, music, maps, and so on.

## So what does DopeFish do again?
DF reads these wad files, and interprets the data that they contain, the textures, sprites, maps, and so on. It takes this read data and constructs a 3D level and fills it with content, and quite efficiently.

## So it loads Doom maps, why? I can't make money off of a game with Doom Maps!
That's right, you can't sell someone elses content without prior written consent, so don't even try it! But what you can do is use any of the well established wad editing tools that hundreds of thousands of Doom Modders have been using for years to quickly and easily create custom content of your own for your own 3D games, very easily!

Take this scene for example:
![image](https://user-images.githubusercontent.com/5240715/167277554-04a97660-014d-4421-8f42-7cefe9c340df.png)

In just one afternoon I was able to build out this scene using a pretty cool, and free texture pack that I found built just for making maps in the wad format!

## So I can use DopeFish to make my own Doom like FPS?
Yes! But you'll be able to do so much more! DF is not a source port, it's not beholden to the gameplay of the boomer shooters of yesteryore, you are not bound by creed to create only a doomlike clone using DF. Why not a third person action RPG, a racing game, a moody walking simulator?

DF will ship with a handful of example levels and gameplay controllers to get you started on the way to crafting your own 3D game quickly and easily.
![image](https://user-images.githubusercontent.com/5240715/167277570-9c2c436e-aa20-4600-b34a-ce36839fca83.png)

Okay, now that's all out of the way, let's get up to date with the current state of DF.

### May - 07 - 2022
- Improved texture filtering. New texel space antialiasing shader improves texture quality at low screen resolutions for a smoother look.
- wadLab is now available to download. You can finally test any fully self contained wads! ( DopeFish only works with single wads, so you can't load a list of wads and have them all work together, yet ).
- Decorate scripting is now a thing! You can define new things in the decorate scripting language and have them call scripts that you've set up in your project to define all sorts of cool thing behaviors!
- DopeFish source code is now public on github: https://github.com/Igameart/DopeFishEngine (Keep in mind, it's probably a mess, and definitely not production ready!)

### To Do For Release
- Add overrides for Things, Textures, and Sprites ( replace any texture in the map with your own, or replace any enemy with whichever object you choose )
- Improve collision
- Implement multiple example game type controllers
- Mapdef, Animdef - define the environment of each map in your wad, and texture animations
- Implement external info lumps: Define animated textures, switch behaviors, level layouts, and more

### Possible Future Features:
- 3D floors (rooms over rooms)
- Sloped floors/ceilings
- Geometry Normals
- Dynamic Lighting/Shadows

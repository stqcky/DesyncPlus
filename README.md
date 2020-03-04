# DesyncPlus
Lua script for Aimware.net that allows users to customize their anti-aims even more

![image](https://i.imgur.com/ABcy24d.png)

## Base Direction
* State - Works like a tab, switches between configuring the **Standing** and **Moving** state
* Base Value - A base angle, used for **Jitter** and **Switch**
* Minimal Value - Minimal angle, used for **Jitter** and **Switch**
* Maximal Value - Maximal angle, used for **Jitter** and **Switch**
* Type
  * Off
  * Jitter - Rapidly changes the angle to random values between the **Minimal Value** and **Maximal Value**
  * Switch - Rapidly changes the angle back and forth between the **Minimal Value** and **Maximal Value**
  * Static - Sets the angle to **Base Value**

## Rotation
* State - Works like a tab, switches between configuring the **Standing** and **Moving** state
* Minimal Value - Minimal rotation offset, used every **type**
* Maximal Value - Maximal rotation offset, used for **Jitter**, **Cycle** and **Switch**
* Cycle Speed - Changes the speed of the cycle, used for **Cycle**
* Type
  * Off
  * Jitter - Rapidly changes the rotation offset to random values between the **Minimal Value** and **Maximal Value**
  * Cycle - Cycles the rotation offset between the **Minimal Value** and **Maximal Value** at a certain speed (**Cycle Speed**)
  * Switch - Rapidly changes the rotation offset back and forth between the **Minimal Value** and **Maximal Value**
  * Static - Sets the rotation offset to **Minimal Value**
  
## LBY
* State - Works like a tab, switches between configuring the **Standing** and **Moving** state
* Minimal Value - Minimal LBY offset, used for **Jitter**, **Cycle**, **Switch** and **Static**
* Maximal Value - Maximal LBY offset, used for **Jitter**, **Cycle** and **Switch**
* Cycle Speed - Changes the speed of the cycle, used for **Cycle**
* Type
  * Off
  * Jitter - Rapidly changes the LBY offset to random values between the **Minimal Value** and **Maximal Value**
  * Cycle - Cycles the LBY offset between the **Minimal Value** and **Maximal Value** at a certain speed (**Cycle Speed**)
  * Switch - Rapidly changes the LBY offset back and forth between the **Minimal Value** and **Maximal Value**
  * Match - Matches the side of the LBY offset with the rotation offset and sets it to **LBY Value**
  * Opposite - Makes is so the side of the LBY offset is the opposite of the rotation offset and sets it to **LBY Value**
  * Static - Sets the LBY offset to **Minimal Value**
* Lby Value - This is the value that will be used by the **Match** and **Opposite** types


  
## Slow Walk
* Minimal Value - Minimal Speed, used for **Jitter**, **Cycle**, **Switch** and **Static**
* Maximal Value - Maximal Speed, used for **Jitter**, **Cycle** and **Switch**
* Cycle Speed - Changes the speed of the cycle, used for **Cycle**
* Type
  * Off
  * Jitter - Rapidly changes the Speed to random values between the **Minimal Value** and **Maximal Value**
  * Cycle - Cycles the Speed between the **Minimal Value** and **Maximal Value** at a certain speed (**Cycle Speed**)
  * Switch - Rapidly changes the Speed back and forth between the **Minimal Value** and **Maximal Value**
  * Static - Sets the Speed to **Minimal Value**
  
## Fakelag
* Minimal Value - Minimal Factor, used for **Jitter**, **Cycle**, **Switch** and **Static**
* Maximal Value - Maximal Factor, used for **Jitter**, **Cycle** and **Switch**
* Cycle Speed - Changes the speed of the cycle, used for **Cycle**
* Type
  * Off
  * Jitter - Rapidly changes the Factor to random values between the **Minimal Value** and **Maximal Value**
  * Cycle - Cycles the Factor between the **Minimal Value** and **Maximal Value** at a certain speed (**Cycle Speed**)
  * Switch - Rapidly changes the Factor back and forth between the **Minimal Value** and **Maximal Value**
  * Static - Sets the Factor to **Minimal Value**

## Misc
* Master Switch - Enables or disables everything
* Fakelag while standing still - Makes you move a little back and forth to trigger Fakelag


## Manual AA
* Left Button - Changes the **Base Value** to 90 (Facing left)
* Right Button - Changes the **Base Value** to -90 (Facing right)
* Back Button - Changes the **Base Value** to 180 (Facing backwards)


# Desync Plus Tab
![image](https://i.imgur.com/CYMMPL8.png)

## Updater
* Current Version - Version of your current LUA
* Latest Version - Latest version of Desync Plus
* Update - Updates your LUA to the latest one

## Changelog
* Shows the changelog for the latest version

# Video Showcase
* https://www.youtube.com/watch?v=Hqzyb6RCyE0

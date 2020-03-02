# DesyncPlus
Lua script for Aimware.net that allows users to customize their anti-aims even more

![image](https://i.imgur.com/7LG9KM8.png)

## Base Direction
* Base Value - A base angle, used for **Jitter** and **Switch**
* Minimal Value - Minimal angle, used for **Jitter** and **Switch**
* Maximal Value - Maximal angle, used for **Jitter** and **Switch**
* Type
  * Off
  * Jitter - Rapidly changes the angle to random values between the **Minimal Value** and **Maximal Value**
  * Switch - Rapidly changes the angle back and forth between the **Minimal Value** and **Maximal Value**
  * Static - Sets the angle to **Base Value**
* Manual AA Left - Changes the **Base Value** to 90 (Facing left)
* Manual AA Right - Changes the **Base Value** to -90 (Facing right)
* Manual AA Back - Changes the **Base Value** to 180 (Facing backwards)

## Rotation
* Minimal Value - Minimal rotation offset, used every **type**
* Maximal Value - Maximal rotation offset, used for **Jitter**, **Sway** and **Switch**
* Sway Speed - Changes the speed of the sway, used for **Sway**
* Type
  * Off
  * Jitter - Rapidly changes the rotation offset to random values between the **Minimal Value** and **Maximal Value**
  * Sway - Changes the rotation offset to values between the **Minimal Value** and **Maximal Value** at a certain speed (**Sway Speed**)
  * Switch - Rapidly changes the rotation offset back and forth between the **Minimal Value** and **Maximal Value**
  * Static - Sets the rotation offset to **Minimal Value**
  
## LBY
* Minimal Value - Minimal LBY offset, used for **Jitter**, **Sway**, **Switch** and **Static**
* Maximal Value - Maximal LBY offset, used for **Jitter**, **Sway** and **Switch**
* Sway Speed - Changes the speed of the sway, used for **Sway**
* Type
  * Off
  * Jitter - Rapidly changes the LBY offset to random values between the **Minimal Value** and **Maximal Value**
  * Sway - Changes the LBY offset to values between the **Minimal Value** and **Maximal Value** at a certain speed (**Sway Speed**)
  * Switch - Rapidly changes the LBY offset back and forth between the **Minimal Value** and **Maximal Value**
  * Match - Matches the side of the LBY offset with the rotation offset and sets it to **LBY Offset value for Opposite/Match**
  * Opposite - Makes is so the side of the LBY offset is the opposite of the rotation offset and sets it to **LBY Offset value for      Opposite/Match**
  * Static - Sets the LBY offset to **Minimal Value**
* Lby Offset value for Opposite/Match - This is the value that will be used by the **Match** and **Opposite** types
  
## Fakelag
* Minimal Value - Minimal Factor, used for **Jitter**, **Sway**, **Switch** and **Static**
* Maximal Value - Maximal Factor, used for **Jitter**, **Sway** and **Switch**
* Sway Speed - Changes the speed of the sway, used for **Sway**
* Type
  * Off
  * Jitter - Rapidly changes the Factor to random values between the **Minimal Value** and **Maximal Value**
  * Sway - Changes the Factor to values between the **Minimal Value** and **Maximal Value** at a certain speed (**Sway Speed**)
  * Switch - Rapidly changes the Factor back and forth between the **Minimal Value** and **Maximal Value**
  * Static - Sets the Factor to **Minimal Value**
* Fakelag while standing still - Makes you move a little back and forth to trigger the Fakelag

## Misc
* Master Switch - Enables or disables everything

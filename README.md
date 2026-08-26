# Samp-flashlight-system
A simple flashlight system script for SA-MP 

# 🔦 SA-MP Flashlight System

A lightweight and efficient flashlight system script written in **Pawn** for San Andreas Multiplayer (SA-MP). This script allows players to toggle a functional flashlight using both a command and a key press.

## 📋 Features
* **Player Attachment:** Attaches a flashlight object to the player's hand using a cell phone animation stance.
* **Dynamic Lighting:** Spawns and attaches a light object to illuminate the surroundings in front of the player.
* **Automatic Cleanup:** Safely destroys objects and cleans up attachments when a player disconnects or turns off the flashlight.
* **Dual Control:** Can be activated via chat command or game key.

## ⚙️ Dependencies
Make sure you have the following include files in your compiler directory:
* `<a_samp>` (Standard SA-MP include)
* `<zcmd>` (Fast command processor by Zeex)

## 🎮 Usage / Commands
* **/fl** - Toggle the flashlight on or off.

## 📥 Installation
1. Download or clone this repository.
2. Place `flashlight.pwn` into your gamemode or filterscript folder (or include it in your main script).
3. Ensure you have `zcmd.inc` included in your `pawno/include` directory.
4. Compile the script using the Pawn compiler.

## 🖼️ Screenshot
![Flashlight System Demo](https://raw.githubusercontent.com/Adam-Kelvine/Samp-flashlight-system/main/sa-mp-034.png)

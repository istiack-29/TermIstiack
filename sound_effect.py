#!/usr/bin/env python3
import random 
import os 
import time

# Generate a random number to pick a sound
num = random.randint(1, 3)

# Clear screen and show booting message
os.system("clear")
print("\033[1m\033[33m[\033[32m─────────────────Booting Termux Terminal─────────────────\033[33m]\033[0m")
time.sleep(0.5) # A short pause for a professional feel

# Path to your sounds (assuming they are in the Song folder)
# If the files are in the same folder as this script, remove "Song/"
if num == 1:
    os.system("mpv Song/Access-Granted.mp3 --no-video")
elif num == 2:
    os.system("mpv Song/Jarvis2.mp3 --no-video")
else:
    os.system("mpv Song/JARVIS.mp3 --no-video")
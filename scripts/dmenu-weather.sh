#!/bin/sh
    
curl -s wttr.in/Giza?format=1 | grep -o ".[0-9].*" | dmenu -l 1 -p "Weather"
  

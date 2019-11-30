@echo off
echo "Compiling gamemode with OWScript"
REM node "C:\Users\blusc\AppData\Roaming\npm\node_modules\owscript" compile
ows compile
REM cd ./OWScript && python OWScript.py ../src/shop.owpy --save ../dist/shop.ows
echo "--------------------------------"
echo "Project compiled."
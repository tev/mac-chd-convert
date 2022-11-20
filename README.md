# mac-chd-convert
Short script to convert .7z files to .chd  
  
I had some issues with python dependencies using https://github.com/nickheyer/CHDconvert, so I made a shell script that does about the same thing.  
Files must be compressed as .7z or .zip  
Supported disc image formats: cue, iso, gdi  
  
## Setup
This requires 7z and chman. If you don't have them installed, do that with:  
`brew install p7zip`  
`brew install rom-tools`  
  
Put this script somewhere  
In the terminal:
cd to the place you put the script  
Give this script permissions with   
`chmod u+x mac-chd-convert.sh`  

Set up your target directory, it should be a directory of .7z files that contain .cue files.  
Run the script using an absolute path to your target directory, no ~ shortcut.  
  
`./mac-chd-convert.sh /Users/myname/Downloads/DiscImages`  
  
The script will create 2 directories, based on your origial folder name, for example:  
DiscImages_tmp  
DiscImages_out  
  
The _tmp directory is used for uncompressing and coverting each game, it is cleared out after each game is done and deleted when the script is complete.  
The _out directory is where the completed converted chd files are put.  
  
I'm no shell scripting guru, so this script is probably pretty fragile if it hits something unexpected, but it did the trick for me.  

#!/bin/zsh

inputPath=$1
# note -- use an absolute path, no tilde
tempDir="${inputPath}_tmp"
outDir="${inputPath}_out"

if [ -d $tempDir ]
then
    printf "[ Temp directory exists ]"
else
    printf "[ Creating temp directory ]"
    mkdir $tempDir
fi

if [ -d $outDir ]
then
    printf "[ Output directory exists ]"
else
    printf "[ Creating output directory ]"
    mkdir $outDir
fi

printf "[ Scanning $inputPath ... ]"
for file in $1/**/*.(7z|zip)(.)
do
  filename=$file:t
  printf "\n\n\n[ Processing ${filename} ]"
  7z x $file -o$tempDir
  for i in $tempDir/**/*.(cue|iso|gdi)(.); do chdman createcd -i "$i" -o "${i%.*}.chd"; done
  mv $tempDir/**/*.chd(.) $outDir
  rm -rf $tempDir/*
done
rm -rf $tempDir

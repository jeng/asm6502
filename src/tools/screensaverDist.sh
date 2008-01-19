#!/bin/sh

# This script will make a screensaver release that I want to send into
# the xscreensaver project. Jeremy English 13-January-2008

version=0.2
basepath=/home/jhe/src/asm6502
asmpath=$basepath/src/asm/
srcpath=$basepath/src/
toolpath=$basepath/src/tools/
distname=m6502-screensaver
distdir=$basepath/$distname
asmfiles="breakout.asm byterun.asm cellular-30.asm cellular-600.asm crunch6502.asm demoscene.asm dmsc.asm dragon-fractal.asm fullscreenlogo.asm keftal.asm matrix.asm noise.asm random2.asm random.asm random-walk.asm rorschach.asm santa.asm selfmodify.asm sierpinsky.asm spacer.asm wave6502.asm zookeeper.asm"
srcfiles="m6502.c asm6502.c asm6502.h"
toolfiles="m6502.sh"
currentdir=`pwd`

if [ ! -d $distdir ] ; then
    echo "Distribution directory dosen't exists. Creating $distdir"
    mkdir $distdir
fi

echo "Removing contents of $distdir"
rm $distdir/*

for file in $asmfiles ; do
    echo "$asmpath$file -> $distdir/$file"
    cp $asmpath$file $distdir/$file
done

for file in $srcfiles ; do
    echo "$srcpath$file -> $distdir/$file"
    cp $srcpath$file $distdir/$file
done

for file in $toolfiles ; do
    echo "$toolpath$file -> $distdir/$file"
    cp $toolpath$file $distdir/$file
done

cd $basepath
tar -czvf $distname-$version.tgz $distname
rm -Rvf $distname
cd $currentdir
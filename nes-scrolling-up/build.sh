#!/bin/bash
PROJ_NAME="nes-scrolling-up"
PROJ_OBJECT="BUILD/$PROJ_NAME.o"
SOURCE="src/$PROJ_NAME.c"


GENERATED_ASSEMBLY_SOURCE="src/$PROJ_NAME.s"
DESTIN_ASSEMBLY_SOURCE="BUILD/$PROJ_NAME.s"

CRT0_SOURCE="src/crt0.s"
CRT0_ORIGIN="src/crt0.o"
CRT0_OBJECT="BUILD/crt0.o"

ROM_MAPPER="src/nrom_32k_horz.cfg"

PROJ_ARTIFACT="BUILD/$PROJ_NAME.nes"

LABELS="BUILD/labels.txt"

mkdir -p BUILD
rm -f BUILD/*

cc65 -Oirs $SOURCE --add-source

mv $GENERATED_ASSEMBLY_SOURCE $DESTIN_ASSEMBLY_SOURCE

ca65 $CRT0_SOURCE

mv $CRT0_ORIGIN $CRT0_OBJECT

ca65 $DESTIN_ASSEMBLY_SOURCE -g

ld65 -C $ROM_MAPPER -o $PROJ_ARTIFACT $CRT0_OBJECT $PROJ_OBJECT nes.lib -Ln $LABELS


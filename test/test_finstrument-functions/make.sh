#!/bin/bash

gcc -finstrument-functions -g main.c my_debug.c -o instru


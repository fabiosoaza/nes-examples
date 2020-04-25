#!/usr/bin/python3

from optparse import OptionParser
import os

def menu():
    parser = OptionParser()
    parser.add_option("-a", "--run-all-examples",
                     help="run all examples", action="store_true")
    parser.add_option("-i", "--run-it",
                     help="run interactive", action="store_true")                     
                   
    
    (options, args) = parser.parse_args()

    for option in vars(options):
        value =  getattr(options, option)
        if option == 'run_all_examples' and value == True:  
            run_all_examples()      
        elif option == 'run_it' and value == True:  
            run_image()            


def run_image():
    os.system('docker run -it -v $(pwd)/:/tmp/nes-metatiles fabiosoaza/snes-dev-tools:latest bash')    

def run_all_examples():
    os.system('docker-compose up -d')

menu()

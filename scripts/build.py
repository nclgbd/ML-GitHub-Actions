
import argparse
import os
import json

from pytorch_vision_utils.Utilities import clear_dirs
    
    
DATA_DIR = ""
TEST_DIR = ""
MODEL_DIR = ""
MEDIA_DIR = ""
INC_DIR = ""
DIRS = []

                
def build(): 
    with open("parameters.json", "r") as f:
        print("Loading parameters...\n")
        params = dict(json.load(f))
        
        DATA_DIR = params["DATA_DIR"]
        TEST_DIR = params["TEST_DIR"]
        MODEL_DIR = params["MODEL_DIR"]
        MEDIA_DIR = params["MEDIA_DIR"]
        INC_DIR = params["INC_DIR"]
          
    DIRS = [DATA_DIR, TEST_DIR, MODEL_DIR, MEDIA_DIR, INC_DIR]
    
    for dirs in DIRS:
        clear_dirs(dirs)
        print("Creating:", dirs)
        os.makedirs(dirs, exist_ok=True)
        

if __name__=="__main__":
    build()
    
    

import os
import re
import sys
import glob
import shutil
import json

def main():
    # Current dir
    dir = os.path.dirname(__file__)
    path = dir+"\\benchmark_results\\*.json"
    files = glob.glob(path)
    print(files)

    with open(".\\benchmark_results.json","w",encoding="utf-8") as f:
        d = {}
        for file in files:
            name = os.path.basename(file)
            with open(file,"r",encoding="utf-8") as _f:
                _d = json.load(_f)
                _resutls = {}
                for result in _d["results"]:
                    _name = result["benchmark"]
                    _resutls[_name] = "{:.3f} ±{:.3f}".format(result["score"],result["error"])
                d[name] = _resutls
        json.dump(d,f,indent=4,ensure_ascii=False)
                
if __name__ == "__main__":
    main()
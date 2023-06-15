
import os
import re
import sys
import shutil
import json

def main(argv):
    # Current dir
    dir = os.path.dirname(__file__)

    # target dir
    target_dir = argv[1]
    target_dir = target_dir.split("\\")
    unit_name = target_dir[-1]
    work_name = argv[2]\

    # load function file
    path = argv[1] + "\\" + argv[2] +".mcfunction"
    works = []
    conditions = {}
    functions = {}

    print(path)
    with open(path,"r") as f:
        mode = 0
        func_key = ""
        cond_key = ""

        # 文字列によって処理を変える
        for raw in f.read().splitlines():
            # 大区切り
            if re.match("##.*",raw):
                if re.match("##.*(Work|work).*",raw):
                    mode = 1
                elif re.match("##.*(Functions|functions).*",raw):
                    mode = 2
                elif re.match("##.*(Conditions|condition).*",raw):
                    mode = 3
            # 小区切り
            elif re.match("#\s.*",raw):
                if mode == 1:
                    chars = raw.split(" ")
                    works.append([])
                    for char in chars[1:]:
                        works[-1].append(char)
                elif (mode == 2) and (re.match("#\s[a-z]*.*",raw)):
                    func_key = raw[-1]
                    functions[func_key] = []
                elif (mode == 3) and (re.match("#\s[0-9]*.*",raw)):
                    cond_key = raw[-1]
                    conditions[cond_key] = []
            # 文字列
            elif len(raw) > 0:
                if mode == 2:
                    functions[func_key].append(raw)
                elif mode == 3:
                    conditions[cond_key].append(raw)

    # function
    func_dir = ".\\world\\datapacks\\debug\\data\\mch\\functions\\"
    if os.path.isdir(func_dir):
        shutil.rmtree(func_dir)
    os.mkdir(func_dir)
    
    # create main functions
    for key in functions.keys():
        with open(func_dir+key+".mcfunction","w",encoding="utf-8") as f:
            f.write("\n".join(functions[key]))

    # prepare work
    temp_dir = dir+"\\temp\\"
    with open(".\\mch-config.json") as f:
        d = json.load(f)
    for i in range(len(works)):
        work = works[i]
        cond_key = work[0]
        os.mkdir(temp_dir+cond_key)
        # setup
        with open(temp_dir+cond_key+"\\setup.trial.mcfunction","w",encoding="utf-8") as f:
            f.write("\n".join(conditions[cond_key]))
        # config
        funcs = ["mch:"+a for a in work[1:]]
        if i == len(works)-1: funcs.append("debug:baseline")
        d["execute_benchmarks"] = funcs 
        with open(temp_dir+cond_key+"\\mch-config.json","w",encoding="utf-8") as f:
            json.dump(d,f,indent=4)
    
if __name__ == "__main__":
    main(sys.argv)
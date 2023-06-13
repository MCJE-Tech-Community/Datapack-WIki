
import os
import sys
import glob
import json

def main(argv):
    # Current dir
    dir = os.path.dirname(__file__)

    # target dir
    target_dir = argv[1]
    dir_names = target_dir.split("\\")
    print(dir_names[-2],dir_names[-1])
    func_path = "debug:{0}/{1}/".format(dir_names[-2],dir_names[-1])

    # Pass of setup.iteration tag
    setup_tag = "\\world\\datapacks\\debug\\data\\mch\\tags\\functions\\setup.trial.json"

    # Set pass of setup function
    with open(dir+setup_tag,"w") as f:
        if os.path.isfile(target_dir+"\\setup.mcfunction"):
            f.write('{"values":[\"'+func_path+'setup\"]}')
        else:
            f.write('{"values":[]}')

    # config
    with open(".\\mch-config.json") as f:
        d = json.load(f)
    
    # execute functions
    funcs = ["debug:baseline"]
    for f in os.listdir(target_dir):
        if f == "setup.mcfunction":
            continue
        funcs.append(func_path+f.split(".")[0])

    d["execute_benchmarks"] = funcs

    # Rewrite
    with open(".\\mch-config.json","w") as f:
        json.dump(d,f,indent=4)
    
if __name__ == "__main__":
    main(sys.argv)
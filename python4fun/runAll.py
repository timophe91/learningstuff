#!/usr/bin/env python
import sys
import os


def is_comment(s):
    # return true if a line starts with #
    return s.startswith('#')

#run scripts again all targets
def runAll(targets, scripts):
    for t in targets:
        print("\n###### Target: " + t + "")
        for s in scripts:
            print("\n[+] Running: " + s + "")
            os.system(s + " " + t)
    print("##################################################")
    print("###################### END #######################\n")


if __name__ == "__main__":
  if len(sys.argv) != 3: #test for arguments
    print("Usage: " + sys.argv[0] + " <path/to/targets> <path/to/scripts>\n")
    sys.exit(-1)

  print("#################### STARTING ####################")
  print("##################################################")

  try:
    print("Targets File: " + str(sys.argv[1]))
    print("Scripts File: " + str(sys.argv[2]))
    f = open(sys.argv[1], 'r') # parse targets into list, sepearate by new line
    targets = f.readlines()
    targets = [x.strip() for x in targets] #strip e.g. \n
    targets = [i for i in targets if not(is_comment(i))] #remove line starting with # (comments)
    f.close()
    f = open(sys.argv[2], 'r') # parse scripts into list
    scripts = f.readlines()
    scripts = [x.strip() for x in scripts] 
    scripts = [i for i in scripts if not(is_comment(i))]
    runAll(targets, scripts)
  except Exception as e:
    print("An exception occurred\n" + str(e))
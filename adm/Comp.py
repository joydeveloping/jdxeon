#!/usr/bin/env python

'''
Test compilation script.

Usage:
  ./Comp.py -h - print this text
  ./Comp.py <test> <compiler> <options>, where
    <test> - name of C/C++ test,
    <compiler> - compiler name,
    <options> - string of additional options
'''

import sys
import subprocess
import Lib.Debug

#---------------------------------------------------------------------------------------------------
# Globals.
#---------------------------------------------------------------------------------------------------

'''
Directoty with sources.
'''
dir_src_c = "src_c"

'''
Directory with analyze results.
'''
dir_anl = "anl"

#---------------------------------------------------------------------------------------------------
# Functions.
#---------------------------------------------------------------------------------------------------

'''
Print help.
'''
def Print_Help():
    print "Test compilation script."
    print ""
    print "Usage:"
    print "  ./Comp.py -h - print this text"
    print "  ./Comp.py <test> <compiler> <options>, where"
    print "    <test> - name of C/C++ test,"
    print "    <compiler> - compiler name,"
    print "    <options> - string of additional options"

#---------------------------------------------------------------------------------------------------
# Script body.
#---------------------------------------------------------------------------------------------------

# Check at least one argument.
args = len(sys.argv)
Lib.Debug.Check(args > 1, "Comp.py : no arguments given")
arg1 = sys.argv[1]

# Check help.
if (arg1 == "-h"):
    Print_Help()
    exit(0)

# Check exactly 3 arguments.
Lib.Debug.Check(args == 4, "Comp.py : wrong arguments count")
arg_test = sys.argv[1]
arg_comp = sys.argv[2]
arg_opts = sys.argv[3]

# Print information.
print "Compilation : test = %s, comp = %s, opts = %s" % (arg_test, arg_comp, arg_opts)

# Compilation.
cmds = ["cd anl",
        "rm -rf %s" % arg_test,
        "mkdir %s" % arg_test,
        "cd %s" % arg_test,
        "cp ../../src_c/utils/* .",
        "cp ../../src_c/tests/%s/* ." % arg_test,
        "%s *.cpp %s -o %s.out" % (arg_comp, arg_opts, arg_test)]
for cmd in cmds:
    print "  " + cmd
cmd = reduce(lambda x, y: x + " ; " + y, cmds)
subprocess.call(cmd, shell = True)

#---------------------------------------------------------------------------------------------------


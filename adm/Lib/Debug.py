#!/usr/bin/env python

'''
Debug module.
'''

import os.path

#---------------------------------------------------------------------------------------------------
# Globals.
#---------------------------------------------------------------------------------------------------

'''
Debug flag.
'''
Is_Debug = True

#---------------------------------------------------------------------------------------------------
# Functions.
#---------------------------------------------------------------------------------------------------

'''
Check condition.

If condition is not true, function prints the message end program ends.

Arguments:
  cond - condition
  message - message if condition is not true
'''
def Check(cond, message = "condition fault."):
    if (Is_Debug):
        if (not cond):
            print "Error : " + message
            exit()

#---------------------------------------------------------------------------------------------------

'''
Unconditional error.

Arguments:
  message - message of error
'''
def Error(message = "fatal error"):
    Check(False, message)

#---------------------------------------------------------------------------------------------------

'''
Not implemented error.
'''
def Not_Implemented():
    Error("Not implemented!")

#---------------------------------------------------------------------------------------------------

'''
Check file or directory exists.

Arguments:
  path - path
  message - message
'''
def CheckPath(path, message = "no such file or directory"):
    Check(os.path.exists(path), message)

#---------------------------------------------------------------------------------------------------


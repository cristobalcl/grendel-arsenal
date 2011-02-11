#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys 
import optparse


version = "0.0.1" 


def processCommandLine():
  parser = optparse.OptionParser(usage="%prog [options] arg", version="%prog "+version)
  parser.add_option("-v", "--verbose", action="store_true", dest="verbose", default=True)

  (options, args) = parser.parse_args()

  if len(args) != 1:
    parser.error("incorrect number of arguments")

  return (options, args)

  
def main():
  (options, args) = processCommandLine()
  return 0
  

if __name__=="__main__":
  sys.exit(main())

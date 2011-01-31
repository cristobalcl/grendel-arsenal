#!/usr/bin/python

import sys 
import optparse


version = "0.0.1" 
verbose = False
quiet = False


def processCommandLine():
  parser = optparse.OptionParser(usage="%prog [options] arg", version="%prog "+version)
  parser.add_option("-v", "--verbose", action="store_true", dest="verbose")
  parser.add_option("-q", "--quiet", action="store_false", dest="verbose")

  (options, args) = parser.parse_args()

  if len(args) != 1:
    parser.error("incorrect number of arguments")
  if options.verbose:
    verbose = True
  if options.quiet:
    quiet = True

  
def main():
  processCommandLine()
  return 0
  

if __name__=="__main__":
  sys.exit(main())

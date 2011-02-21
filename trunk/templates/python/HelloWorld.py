#!/usr/bin/python
# -*- coding: utf-8 -*-
"""Abstract.

Description.
"""

__author__ = "Cristóbal Carnero Liñán"
__copyright__ = "Copyright 2011, Cristóbal Carnero Liñán"
__credits__ = ["Cristóbal Carnero Liñán", ] # Code writers, bug reporters, suggestions, ...
__license__ = "GPL"
__version__ = "0.0.1"
__maintainer__ = "Cristóbal Carnero Liñán"
__email__ = "grendel.ccl@gmail.com"
__status__ = "Development" # "Prototype", "Development", "Production"

import sys 
import optparse


def processCommandLine():
  parser = optparse.OptionParser(usage="%prog [options] arg", version="%prog "+__version__)
  #parser.add_option("-u", "--url", dest="url", default="http://grendel-arsenal.googlecode.com", help="URL")
  parser.add_option("-v", "--verbose", action="store_true", dest="verbose", default=True)

  (options, args) = parser.parse_args()

  #if len(args) != 1:
  #  parser.error("incorrect number of arguments")

  return (options, args)

  
def main():
  (options, args) = processCommandLine()

  # TODO

  return 0
  

if __name__=="__main__":
  sys.exit(main())

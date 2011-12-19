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
import argparse


def processCommandLine():
	parser = argparse.ArgumentParser(description="sub-o-matic")
	parser.add_argument("input")
	parser.add_argument("output")
	parser.add_argument("-f", "--from", default=0, help="start time (seconds)")
	parser.add_argument("-t", "--to", default=0, help="finish time (seconds)")
	parser.add_argument("-o", "--offset", default=0, help="offset time (seconds)")
	parser.add_argument("-v", "--verbose", action="store_true")

	return parser.parse_args()

  
def main():
	args = processCommandLine()

	# TODO

	return 0
  

if __name__=="__main__":
	sys.exit(main())

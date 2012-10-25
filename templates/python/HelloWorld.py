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
	parser = argparse.ArgumentParser(description="Hello World!")
	parser.add_argument("arg1", help="help for arg1")
	parser.add_argument("arg2", help="help for arg2")
	parser.add_argument("-p", "--param", metavar="PARAM", dest="param", type=int, default=0, required=True, help="help for param")
	parser.add_argument("-v", "--verbose", action="store_true")

	return parser.parse_args()


def main():
	args = processCommandLine()

	# TODO

	return 0


if __name__=="__main__":
	sys.exit(main())

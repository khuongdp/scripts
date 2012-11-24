#!/bin/env python

import sys
import collections

arg_names = ['command', 'param1', 'param2', 'param3', 'param4']
args = dict(zip(arg_names, sys.argv))

Arg_list = collections.namedtuple('Arg_list', arg_names)
args = Arg_list(*(args.get(arg, None) for arg in arg_names))

print args

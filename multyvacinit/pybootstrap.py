#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import pickle

import cloudpickle

if __name__ == "__main__":
    (f, args, kwargs) = pickle.load(sys.stdin)
    res = f(*args, **kwargs)

    cloudpickle.dump(res, open("/tmp/.result", "wb"))

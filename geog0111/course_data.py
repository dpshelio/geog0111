#!/usr/bin/env python
# -*- coding: utf-8 -*-

from pathlib import Path
import numpy as np
import os
try:
  from geog0111.modis import Modis
except:
  from modis import Modis

'''
local download of MNODIS datasets and storage in dbfile
'''

__author__    = "P. Lewis"
__email__     = "p.lewis@ucl.ac.uk"
__date__      = "28 Aug 2020"
__copyright__ = "Copyright 2020 P. Lewis"
__license__   = "GPLv3"

def uk_lai(year=2019):
  kwargs = {
    'tile'      :    ['h17v03', 'h17v04', 'h18v03', 'h18v04'],
    'product'   :    'MCD15A3H',  
    'sds'       :    'Lai_500m',
    'log'       :    f'work/uk_lai_{year}_log.txt',
    'db_file'   :    ['data/database.db',f'work/uk_lai_{year}.db'],
    'local_dir' :    'work',
    'verbose'   :    True
  }
  modis = Modis(**kwargs)
  
  result = modis.get_year(year,step=4)
  return result

def main():
    #for year in [2018, 2019]:
    for year in [2019,2020]:
      uk_lai_data = uk_lai(year)

if __name__ == "__main__":
    main()


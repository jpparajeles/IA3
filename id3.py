__author__ = 'josep'
from dataset import mset

def id3():
    pass

def id3Aux():
    dataS = mset("")
    labels = dataS.getLabels()
    if len(labels) == 1:
        return Node
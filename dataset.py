__author__ = 'josep'
class mset:
    def __init__(self):
        self.inner = dict()
    def parse(self, url):
        pass
    def getLabels(self):
        result = set()
        for key in self.inner.keys():
            for val in self.inner[key]:
                result.add(val)
        return result
    def featureList(self):
        return self.inner.keys()








import copy

class Clonable:
    def clonar(self):
        return copy.deepcopy(self)

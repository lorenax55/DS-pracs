from abc import ABC, abstractmethod
from clonable import Clonable

class Bicicleta(ABC, Clonable):
    
    def __init__(self, ID):
        self._ID = ID
        
    @property
    def ID(self):
        return self._ID
    
    @ID.setter
    def ID(self, value):
        self._ID = value
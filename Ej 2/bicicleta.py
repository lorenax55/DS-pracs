from abc import ABC, abstractmethod

class Bicicleta(ABC):
    
    def __init__(self, ID):
        self._ID = ID
        
    @property
    def ID(self):
        return self._ID
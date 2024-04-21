from abc import ABC
from bicicleta import Bicicleta  # Importa la clase Bicicleta
from clonable import Clonable

class Carrera(ABC, Clonable):
    
    def __init__(self):
        self.bicis = []  # Lista para almacenar objetos Bicicleta
        
    def getBici(self, numBici):
        return self.bicis[numBici]
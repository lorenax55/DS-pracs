from factoria_carrera_bicicleta import FactoriaCarreraYBicicleta
from carrera_montana import CarreraMontana
from bicicleta_montana import BicicletaMontana
import random

class FactoriaMontana(FactoriaCarreraYBicicleta):
    def __init__(self):
        
        self.prototype_bicicleta = BicicletaMontana(ID=0)
        self.prototype_carrera = CarreraMontana()
    
    def crearCarrera(self):
        return self.prototype_carrera.clonar()
    
    def crearBicicleta(self):
        clone = self.prototype_bicicleta.clonar()
        clone.ID = random.randint(0, 10000)  # Asigna un ID aleatorio a la bicicleta clonada
        return clone
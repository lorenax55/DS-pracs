from factoria_carrera_bicicleta import FactoriaCarreraYBicicleta
from carrera_montana import CarreraMontana
from bicicleta_montana import BicicletaMontana
import random

class FactoriaMontana(FactoriaCarreraYBicicleta):
    
    def crearCarrera(self):
        return CarreraMontana()
    
    def crearBicicleta(self):
        bici = BicicletaMontana(ID=random.randint(0, 10000))
        return bici

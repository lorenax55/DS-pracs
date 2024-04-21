from factoria_carrera_bicicleta import FactoriaCarreraYBicicleta
from carrera_carretera import CarreraCarretera
from bicicleta_carretera import BicicletaCarretera
import random
    
class FactoriaCarretera(FactoriaCarreraYBicicleta):
    def __init__(self):
        self.prototype_bicicleta = BicicletaCarretera(ID=0)
        self.prototype_carrera = CarreraCarretera()
    
    def crearCarrera(self):
        return self.prototype_carrera.clonar()
    
    def crearBicicleta(self):
        clone = self.prototype_bicicleta.clonar()
        clone.ID = random.randint(0, 10000)
        return clone
    

from factoria_carrera_bicicleta import FactoriaCarreraYBicicleta
from carrera_carretera import CarreraCarretera
from bicicleta_carretera import BicicletaCarretera
import random

class FactoriaCarretera(FactoriaCarreraYBicicleta):
    
    def crearCarrera(self):
        return CarreraCarretera()
    
    def crearBicicleta(self):
        bici = BicicletaCarretera(ID=random.randint(0, 10000))
        return bici
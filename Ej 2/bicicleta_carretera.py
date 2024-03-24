
from bicicleta import Bicicleta
from clonable import Clonable

class BicicletaCarretera(Bicicleta, Clonable):
    def __init__(self, ID):
        super().__init__(ID)  # Llama al constructor de la clase base con el ID
        self.modalidad = "carretera"
    
    def getModalidad(self):
        return self.modalidad

from bicicleta import Bicicleta

class BicicletaCarretera(Bicicleta):
    def __init__(self, ID):
        super().__init__(ID)  # Llama al constructor de la clase base con el ID
        self.modalidad = "carretera"
    
    def getModalidad(self):
        return self.modalidad
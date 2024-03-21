
from bicicleta import Bicicleta

class BicicletaMontana(Bicicleta):
    def __init__(self, ID):
        super().__init__(ID)  # Llama al constructor de la clase base con el ID
        self.modalidad = "montana"
    
    def getModalidad(self):
        return self.modalidad
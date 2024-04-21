from carrera import Carrera
import math
from clonable import Clonable

class CarreraMontana(Carrera, Clonable):
    def __init__(self):
        super().__init__()  # Llama al constructor de la clase base para inicializar la lista de bicis
        self.modalidad = "montaña"
    
    def getModalidad(self):
        return self.modalidad
    
    def getnumBicis(self):
        return len(self.bicis)
    
    def quitarBicis(self):
        numBicis = self.getnumBicis()
        quitar = math.floor(numBicis * 0.20)  # Calcula el 20% de las bicicletas, redondeado hacia abajo
        # Elimina el 20% de las bicicletas de la lista
        for _ in range(quitar):
            self.bicis.pop(0)  # asumiendo que se desea quitar las bicis del inicio de la lista
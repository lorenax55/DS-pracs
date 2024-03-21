from carrera import Carrera
import math

class CarreraCarretera(Carrera):
    def __init__(self):
        super().__init__()  # Llama al constructor de la clase base para inicializar la lista de bicis
        self.modalidad = "carretera"
    
    def getModalidad(self):
        return self.modalidad
    
    def getnumBicis(self):
        return len(self.bicis)
    
    def quitarBicis(self):
        numBicis = self.getnumBicis()
        quitar = math.floor(numBicis * 0.10)  # Calcula el 10% de las bicicletas, redondeado hacia abajo
        # Elimina el 10% de las bicicletas de la lista
        # Importante: hacerlo de esta manera para evitar problemas al modificar la lista mientras se itera
        for _ in range(quitar):
            self.bicis.pop(0)  # asumiendo que se desea quitar las bicis del inicio de la lista
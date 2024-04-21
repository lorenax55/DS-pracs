from factoria_carretera import FactoriaCarretera
from factoria_montana import FactoriaMontana

def main():
    # Crear las fábricas
    factoria_carretera = FactoriaCarretera()
    factoria_montana = FactoriaMontana()
    
    # Usar la factoría para crear una carrera de carretera y añadir bicicletas
    carrera_carretera = factoria_carretera.crearCarrera()
    for _ in range(5):  # Añadir 5 bicicletas de carretera
        bici_carretera = factoria_carretera.crearBicicleta()
        carrera_carretera.bicis.append(bici_carretera)
    
    # Usar la factoría para crear una carrera de montaña y añadir bicicletas
    carrera_montana = factoria_montana.crearCarrera()
    for _ in range(3):  # Añadir 3 bicicletas de montaña
        bici_montana = factoria_montana.crearBicicleta()
        carrera_montana.bicis.append(bici_montana)
    
    # Mostrar información sobre las carreras y las bicicletas
    print("Carrera de Carretera:")
    for bici in carrera_carretera.bicis:
        print(f"Bicicleta ID: {bici.ID}, Modalidad: {bici.getModalidad()}")
    
    print("\nCarrera de Montaña:")
    for bici in carrera_montana.bicis:
        print(f"Bicicleta ID: {bici.ID}, Modalidad: {bici.getModalidad()}")

if __name__ == "__main__":
    main()

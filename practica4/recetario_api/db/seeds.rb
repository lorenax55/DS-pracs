# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
usuario1 = Usuario.create(nombre: 'Alberto')
usuario2 = Usuario.create(nombre: 'Daniel')
usuario3 = Usuario.create(nombre: 'Maria')

seccion1 = Seccion.create(nombre: 'Dulce', usuario: usuario1)
seccion2 = Seccion.create(nombre: 'Salado', usuario: usuario1)

subseccion1 = Seccion.create(nombre: 'Postres', usuario: usuario1, parent: seccion1)
subseccion2 = Seccion.create(nombre: 'Entrantes', usuario: usuario1, parent: seccion2)

Receta.create(nombre: 'Tarta de Chocolate', ingredientes: 'Chocolate, harina, azúcar', pasos: 'Mezclar y hornear', tiempo_preparacion: 45, usuario: usuario1, seccion: subseccion1)
Receta.create(nombre: 'Ensalada', ingredientes: 'Lechuga, tomate, cebolla', pasos: 'Cortar y mezclar', tiempo_preparacion: 15, usuario: usuario1, seccion: subseccion2)

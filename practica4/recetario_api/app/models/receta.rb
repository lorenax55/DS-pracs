class Receta < ApplicationRecord
  belongs_to :usuario
  belongs_to :seccion

  validates :nombre, presence: true
  validates :pasos, presence: true
  validates :tiempo_preparacion, presence: true
end


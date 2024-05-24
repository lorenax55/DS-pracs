class Usuario < ApplicationRecord
    has_many :recetas
    has_many :secciones
  end
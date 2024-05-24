class Seccion < ApplicationRecord
  belongs_to :usuario
  belongs_to :parent, class_name: 'Seccion', optional: true
  has_many :subsecciones, class_name: 'Seccion', foreign_key: 'parent_id', dependent: :destroy
  has_many :recetas, dependent: :destroy

  validates :nombre, presence: true
end

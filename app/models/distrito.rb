class Distrito < ApplicationRecord
	has_many :comunas
	has_many :diputados
	belongs_to :circunscripcion
end

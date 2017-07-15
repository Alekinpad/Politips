class Distrito < ApplicationRecord
	has_many :comunas
	has_many :diputados
	
end

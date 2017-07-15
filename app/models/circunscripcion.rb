class Circunscripcion < ApplicationRecord
	has_many :distritos
	has_many :senadors
end

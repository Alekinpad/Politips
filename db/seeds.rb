# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

data_file = JSON.parse(open("#{Rails.root}/db/data.json").read)
# loop iteration for JSON data
circ = []
JSON.parse(open("#{Rails.root}/db/data.json").read).each do |stuff|
  comuna = data_file[stuff[0]]
  magnitud_senador = comuna["magnitud_senador"]
  circ << comuna["candidaturas_diputados"][0]["circ"]+','+comuna["candidaturas_diputados"][0]["region"]+','+magnitud_senador[0].to_s #+eval(comuna["magnitud_senador"])
end

# Circunscripcion
Circunscripcion.delete_all
data_array = circ.uniq
data_array.each do |array|
	circ = array.split(",")[0]
	region = array.split(",")[1]
	senMag = array.split(",")[2].to_i
	Circunscripcion.create({"circ":circ,"region":region,"magnitud_senador":senMag})
#	exit
end


# Distrito

Distrito.delete_all
JSON.parse(open("#{Rails.root}/db/data.json").read).each do |stuff|
  comuna = data_file[stuff[0]]
  magnitud_diputado = comuna["magnitud_diputado"][0]
  numero_distrito = comuna["numero_distrito"][0].to_i
	circ = comuna["candidaturas_diputados"][0]["circ"]
	circunscripcion_object = Circunscripcion.find_by({circ: circ})
	distrito = Distrito.new({ numero_distrito: numero_distrito, magnitud_diputado: magnitud_diputado })
	distrito.circunscripcion_id = circunscripcion_object.id
	distrito.save
end

# Senador
Senador.delete_all

JSON.parse(open("#{Rails.root}/db/data.json").read).each do |stuff|
  comuna = data_file[stuff[0]]
  candidatos = comuna["candidaturas_senador"]
  candidatos.each do |candidato|
  	circ = candidato["circ"]
  	nombre_candidato  = candidato["candidato"]
  	partido_candidato  = candidato["partido"]
  	pacto_candidato  = candidato["pacto"]
  	circunscripcion_object = Circunscripcion.find_by({circ: circ})
  	#if not Senador.exists?(:candidato => nombre_candidato)
	senador = Senador.new({ candidato: nombre_candidato, partido: partido_candidato, pacto: pacto_candidato })
  	senador.circunscripcion_id = circunscripcion_object.id
  	senador.save
  	#end
  end
end

# Diputado
Diputado.destroy_all
JSON.parse(open("#{Rails.root}/db/data.json").read).each do |stuff|
  comuna = data_file[stuff[0]]
  numero_distrito = comuna["numero_distrito"][0].to_i
  candidatos = comuna["candidaturas_diputados"]
  distrito_object = Distrito.find_by({numero_distrito: numero_distrito})
  candidatos.each do |candidato|
  	nombre_candidato  = candidato["candidato"]
  	partido_candidato  = candidato["partido"]
  	pacto_candidato  = candidato["pacto"]
  	#if not Diputado.exists?(:candidato => nombre_candidato)
  	diputado = Diputado.new({ candidato: nombre_candidato, partido: partido_candidato, pacto: pacto_candidato })
  	diputado.distrito_id = distrito_object.id
  	diputado.save
  	#end
  end
end

# Comunas
Comuna.delete_all
JSON.parse(open("#{Rails.root}/db/data.json").read).each do |stuff|
  comuna = data_file[stuff[0]]
  nombre_comuna = stuff[0]
  valor_voto_dip = comuna["valor_voto_dip"][0]
  valor_voto_sen = comuna["valor_voto_sen"][0]
  numero_distrito = comuna["numero_distrito"][0].to_i # FIXME: catch here.
  distrito_object = Distrito.find_by({numero_distrito: numero_distrito})
  distrito = Comuna.new({ nombre: nombre_comuna, valor_voto_dip: valor_voto_dip, valor_voto_sen: valor_voto_sen })
  distrito.distrito_id = distrito_object.id
  distrito.save
end

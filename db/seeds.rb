# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
#file = File.read('data.json')
dataFile = JSON.parse(open("#{Rails.root}/db/data.json").read)
# loop iteration for JSON data
circ = []
JSON.parse(open("#{Rails.root}/db/data.json").read).each do |stuff|
  comuna = dataFile[stuff[0]]
  magnitud_senador = comuna["magnitud_senador"]
  circ << comuna["candidaturas_diputados"][0]["circ"]+','+comuna["candidaturas_diputados"][0]["region"]+','+magnitud_senador[0].to_s #+eval(comuna["magnitud_senador"])
end

# Circunscripcion
Circunscripcion.delete_all
dataArray = circ.uniq
dataArray.each do |array|
	circ = array.split(",")[0]
	region = array.split(",")[1]
	senMag = array.split(",")[2].to_i
	#puts circ + " - " + region + " - " + senMag
	Circunscripcion.create({"circ":circ,"region":region,"magnitud_senador":senMag})
#	exit
end


# Distrito

Distrito.delete_all
JSON.parse(open("#{Rails.root}/db/data.json").read).each do |stuff|
  comuna = dataFile[stuff[0]]
  magnitud_diputado = comuna["magnitud_diputado"]
  numero_distrito = comuna["numero_distrito"][0].to_i
	circ = comuna["candidaturas_diputados"][0]["circ"]
	circunscripcionObject = Circunscripcion.find_by({circ: circ})
	distrito = Distrito.new({ numero_distrito: numero_distrito, magnitud_diputado: magnitud_diputado })
	distrito.circunscripcion_id = circunscripcionObject.id
	distrito.save
end

# Senador
Senador.delete_all
JSON.parse(open("#{Rails.root}/db/data.json").read).each do |stuff|
  comuna = dataFile[stuff[0]]
  candidatos = comuna["candidaturas_senador"]
  candidatos.each do |candidato|
  	circ = candidato["circ"]
  	nombreCandidato  = candidato["candidato"]
  	partidoCandidato  = candidato["partido"]
  	pactoCandidato  = candidato["pacto"]
  	circunscripcionObject = Circunscripcion.find_by({circ: circ})
  	senador = Senador.new({ candidato: nombreCandidato, partido: partidoCandidato, pacto: pactoCandidato })
  	senador.circunscripcion_id = circunscripcionObject.id
  	senador.save
  end
end

# Diputado
Diputado.delete_all
JSON.parse(open("#{Rails.root}/db/data.json").read).each do |stuff|
  comuna = dataFile[stuff[0]]
  numero_distrito = comuna["numero_distrito"][0].to_i
  candidatos = comuna["candidaturas_diputados"]
  distritoObject = Distrito.find_by({numero_distrito: numero_distrito})
  candidatos.each do |candidato|
  	nombreCandidato  = candidato["candidato"]
  	partidoCandidato  = candidato["partido"]
  	pactoCandidato  = candidato["pacto"]
  	diputado = Diputado.new({ candidato: nombreCandidato, partido: partidoCandidato, pacto: pactoCandidato })
  	diputado.distrito_id = distritoObject.id
  	diputado.save
  end
end

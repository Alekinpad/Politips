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
  #circ << comuna["candidaturas_senador"][0]["circ"]+','+comuna["candidaturas_senador"][0]["region"]+','+magnitud_senador[0].to_s #+eval(comuna["magnitud_senador"])
end

#print dataFile["Algarrobo"]
#circ = Circuncripcion.create(circ:'II',region:'Region',magnitud_senador:4)
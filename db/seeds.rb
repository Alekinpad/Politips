# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
#file = File.read('data.json')
dataFile = JSON.parse(open("#{Rails.root}/db/db_pretty.json").read)
# loop iteration for JSON data
circ = []
JSON.parse(open("#{Rails.root}/db/data.json").read).each do |stuff|
  comuna = dataFile[stuff[0]]
  #puts comuna["magnitud_senador"]
  circ << comuna["candidaturas_diputados"][0]["circ"]+','+comuna["candidaturas_diputados"][0]["region"]+','#+eval(comuna["magnitud_senador"])
end


# Circuncripcion.delete_all
dataArray = circ.uniq
dataArray.each do |array|
	circ = array.split(",")[0]
	region = array.split(",")[1]
	#senMag = array.split(",")[2]
	puts circ+" - "+ region+ " - " #+ senMag
#	exit
end
#print dataFile["Algarrobo"]
#circ = Circuncripcion.create(circ:'II',region:'Region',magnitud_senador:4)
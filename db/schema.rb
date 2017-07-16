# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170716050533) do

  create_table "circunscripcions", force: :cascade do |t|
    t.string   "circ"
    t.string   "region"
    t.integer  "magnitud_senador"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "comunas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "distrito_id"
    t.float    "valor_voto_dip"
    t.float    "valor_voto_sen"
    t.index ["distrito_id"], name: "index_comunas_on_distrito_id"
  end

  create_table "diputados", force: :cascade do |t|
    t.string   "candidato"
    t.string   "partido"
    t.string   "pacto"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "distrito_id"
    t.index ["distrito_id"], name: "index_diputados_on_distrito_id"
  end

  create_table "distritos", force: :cascade do |t|
    t.integer  "numero_distrito"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "magnitud_diputado"
    t.integer  "circunscripcion_id"
    t.index ["circunscripcion_id"], name: "index_distritos_on_circunscripcion_id"
  end

  create_table "senadors", force: :cascade do |t|
    t.string   "candidato"
    t.string   "partido"
    t.string   "pacto"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "circunscripcion_id"
    t.index ["circunscripcion_id"], name: "index_senadors_on_circunscripcion_id"
  end

end

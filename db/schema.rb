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

ActiveRecord::Schema.define(version: 2020_04_08_202446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cargos", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codmuc"
    t.integer "anocenso"
    t.integer "population"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "companypowers", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.string "responsibleemail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.integer "pipefyid"
    t.integer "listfavoritos", default: [], array: true
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "kind"
    t.bigint "project_id"
    t.bigint "user_normal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "answers", default: [], array: true
    t.integer "statusbloqueio"
    t.decimal "notaavalicacao"
    t.boolean "favorito"
    t.decimal "notapergunta1"
    t.decimal "notapergunta2"
    t.decimal "notapergunta3"
    t.decimal "notapergunta4"
    t.string "comments"
    t.string "pergunta1"
    t.string "pergunta2"
    t.string "pergunta3"
    t.string "pergunta4"
    t.bigint "sum_evaluation_id"
    t.index ["project_id"], name: "index_evaluations_on_project_id"
    t.index ["sum_evaluation_id"], name: "index_evaluations_on_sum_evaluation_id"
    t.index ["user_normal_id"], name: "index_evaluations_on_user_normal_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.bigint "user_startup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantidadedefuncionariosppf"
    t.string "resumoppf"
    t.string "detalhesppf"
    t.integer "kindppf"
    t.string "descricaoppf"
    t.integer "categoriappf"
    t.string "qualdorpretenderesolverppf"
    t.integer "adotapraticasdegestaoppf"
    t.integer "processosdeoperacaoegestaoppf"
    t.integer "pesquisatecnologiasnaareadesuaatividadeppf"
    t.integer "avaliaoimpactodainovacaoppf"
    t.integer "executaparceriaseintercambiosppf"
    t.integer "valiaproblemasambientalppf"
    t.integer "definemetricasquantitativasparaaferirppf"
    t.integer "ofereceaoscolaboradoresmetodoscontroleegestaoppf"
    t.integer "qualvalortotaldosaportesrecebidosppf"
    t.integer "qualeaquantianecessariapararealizacaoppf"
    t.string "qualamaiordificuldadequeoseuprojetoenfrentahojeppf"
    t.integer "asuasolucaojatemconcorrentesnomercadoppf"
    t.integer "quantosconcorrentesppf"
    t.integer "quaismarcosjaforamatingidospeloprojetoppf"
    t.integer "qualeaestimativadetempoparaaconclusaoppf"
    t.integer "estagiocadeiainovacaoppf"
    t.integer "companypower_ids", default: [], array: true
    t.string "tokenidppf"
    t.string "paportesquaisinstituicoes"
    t.string "projetojarecebeualgumaporteppf"
    t.index ["user_startup_id"], name: "index_projects_on_user_startup_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.integer "region"
    t.string "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sum_evaluations", force: :cascade do |t|
    t.integer "kind"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "questions", default: [], array: true
    t.integer "year"
  end

  create_table "user_normals", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "companypower_id"
    t.integer "typerole"
    t.index ["companypower_id"], name: "index_user_normals_on_companypower_id"
    t.index ["user_id"], name: "index_user_normals_on_user_id"
  end

  create_table "user_startups", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "datadenascimentoppf"
    t.integer "tipodepessoappf"
    t.integer "enquadramentoppf"
    t.integer "cidadeondeoprojetoserexecutadoppf"
    t.integer "jparticipoudeoutrachamadadeprojetosdepdestartupsppf"
    t.string "razaosocialppf"
    t.integer "qualisppfs", default: [], array: true
    t.integer "current_phaseppf"
    t.integer "pipefyid"
    t.string "cellphoneppf"
    t.string "enderecoppf"
    t.string "cpfppf"
    t.string "nomefantasiappf"
    t.string "cnpjppf"
    t.string "enderecoinstituicaoppf"
    t.string "certificacaoppf"
    t.string "telppf"
    t.string "leuasinformacoessobreasconcessionariasppf"
    t.index ["user_id"], name: "index_user_startups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "typeclasse"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cities", "states"
  add_foreign_key "projects", "user_startups"
  add_foreign_key "user_normals", "users"
  add_foreign_key "user_startups", "users"
end

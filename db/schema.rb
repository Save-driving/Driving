# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130702014207) do

  create_table "abogados", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "abogados", ["calificacion_id"], :name => "index_abogados_on_calificacion_id"
  add_index "abogados", ["documento_id"], :name => "index_abogados_on_documento_id"
  add_index "abogados", ["municipio_id"], :name => "index_abogados_on_municipio_id"

  create_table "ambulancias", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "ambulancias", ["calificacion_id"], :name => "index_ambulancias_on_calificacion_id"
  add_index "ambulancias", ["documento_id"], :name => "index_ambulancias_on_documento_id"
  add_index "ambulancias", ["municipio_id"], :name => "index_ambulancias_on_municipio_id"

  create_table "aseguradoras", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "aseguradoras", ["calificacion_id"], :name => "index_aseguradoras_on_calificacion_id"
  add_index "aseguradoras", ["documento_id"], :name => "index_aseguradoras_on_documento_id"
  add_index "aseguradoras", ["municipio_id"], :name => "index_aseguradoras_on_municipio_id"

  create_table "bomberos", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "bomberos", ["calificacion_id"], :name => "index_bomberos_on_calificacion_id"
  add_index "bomberos", ["documento_id"], :name => "index_bomberos_on_documento_id"
  add_index "bomberos", ["municipio_id"], :name => "index_bomberos_on_municipio_id"

  create_table "calificaciones", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "carrotalleres", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "carrotalleres", ["calificacion_id"], :name => "index_carrotalleres_on_calificacion_id"
  add_index "carrotalleres", ["documento_id"], :name => "index_carrotalleres_on_documento_id"
  add_index "carrotalleres", ["municipio_id"], :name => "index_carrotalleres_on_municipio_id"

  create_table "conductores", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "conductores", ["calificacion_id"], :name => "index_conductores_on_calificacion_id"
  add_index "conductores", ["documento_id"], :name => "index_conductores_on_documento_id"
  add_index "conductores", ["municipio_id"], :name => "index_conductores_on_municipio_id"

  create_table "departamentos", :force => true do |t|
    t.string   "nombre"
    t.string   "sigla"
    t.integer  "pais_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "departamentos", ["pais_id"], :name => "index_departamentos_on_pais_id"

  create_table "desplazamientos", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "desplazamientos", ["calificacion_id"], :name => "index_desplazamientos_on_calificacion_id"
  add_index "desplazamientos", ["documento_id"], :name => "index_desplazamientos_on_documento_id"
  add_index "desplazamientos", ["municipio_id"], :name => "index_desplazamientos_on_municipio_id"

  create_table "documentos", :force => true do |t|
    t.string   "sigla"
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gruas", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "gruas", ["calificacion_id"], :name => "index_gruas_on_calificacion_id"
  add_index "gruas", ["documento_id"], :name => "index_gruas_on_documento_id"
  add_index "gruas", ["municipio_id"], :name => "index_gruas_on_municipio_id"

  create_table "mecanicos", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "mecanicos", ["calificacion_id"], :name => "index_mecanicos_on_calificacion_id"
  add_index "mecanicos", ["documento_id"], :name => "index_mecanicos_on_documento_id"
  add_index "mecanicos", ["municipio_id"], :name => "index_mecanicos_on_municipio_id"

  create_table "municipios", :force => true do |t|
    t.string   "nombre"
    t.integer  "departamento_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "municipios", ["departamento_id"], :name => "index_municipios_on_departamento_id"

  create_table "paises", :force => true do |t|
    t.string   "sigla"
    t.string   "nombre"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "parqueaderos", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "parqueaderos", ["calificacion_id"], :name => "index_parqueaderos_on_calificacion_id"
  add_index "parqueaderos", ["documento_id"], :name => "index_parqueaderos_on_documento_id"
  add_index "parqueaderos", ["municipio_id"], :name => "index_parqueaderos_on_municipio_id"

  create_table "talleres", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "talleres", ["calificacion_id"], :name => "index_talleres_on_calificacion_id"
  add_index "talleres", ["documento_id"], :name => "index_talleres_on_documento_id"
  add_index "talleres", ["municipio_id"], :name => "index_talleres_on_municipio_id"

  create_table "transitos", :force => true do |t|
    t.integer  "documento_id"
    t.string   "numero_doc"
    t.string   "nombres"
    t.string   "direccion"
    t.integer  "municipio_id"
    t.string   "telefonos"
    t.string   "email"
    t.integer  "calificacion_id"
    t.text     "observaciones"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "transitos", ["calificacion_id"], :name => "index_transitos_on_calificacion_id"
  add_index "transitos", ["documento_id"], :name => "index_transitos_on_documento_id"
  add_index "transitos", ["municipio_id"], :name => "index_transitos_on_municipio_id"

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end

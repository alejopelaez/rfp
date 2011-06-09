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

ActiveRecord::Schema.define(:version => 20110609004701) do

  create_table "assignments", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "cost_scores", :force => true do |t|
    t.float    "cost"
    t.float    "payment"
    t.float    "payment_option"
    t.float    "total_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cost_comment"
    t.string   "payment_comment"
    t.string   "payment_option_comment"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  create_table "development_scores", :force => true do |t|
    t.float    "scope"
    t.string   "scope_comment"
    t.float    "activities"
    t.string   "activities_comment"
    t.float    "deadline"
    t.string   "deadline_comment"
    t.float    "knowledge"
    t.string   "knowledge_comment"
    t.float    "technology_availability"
    t.string   "technology_availability_comment"
    t.float    "human_availability"
    t.string   "human_availability_comment"
    t.float    "experience"
    t.string   "experience_comment"
    t.float    "total_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  create_table "legal_scores", :force => true do |t|
    t.float    "requirements"
    t.string   "requirements_comment"
    t.float    "restrictions"
    t.string   "restrictions_comment"
    t.float    "contract"
    t.string   "contract_comment"
    t.float    "total_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  create_table "opportunity_scores", :force => true do |t|
    t.float    "adquired_knowledge"
    t.string   "adquired_knowledge_comment"
    t.float    "importance"
    t.string   "importance_comment"
    t.float    "positioning"
    t.string   "positioning_comment"
    t.float    "total_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "status"
    t.float    "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rfp_file_name"
    t.string   "rfp_content_type"
    t.integer  "rfp_file_size"
    t.datetime "rfp_updated_at"
    t.string   "comment"
    t.string   "company"
  end

  create_table "risk_scores", :force => true do |t|
    t.float    "penalties"
    t.string   "penalties_comment"
    t.float    "fulfillment_probability"
    t.string   "fulfillment_probability_comment"
    t.float    "total_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  create_table "technology_scores", :force => true do |t|
    t.float    "tech_requirements"
    t.string   "tech_requirements_comment"
    t.float    "actual_resources"
    t.string   "actual_resources_comment"
    t.float    "missing_resources"
    t.string   "missing_resources_comment"
    t.string   "total_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

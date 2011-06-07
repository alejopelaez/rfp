class AddUserIdsToScores < ActiveRecord::Migration
  def self.up
    add_column :cost_scores, :user_id, :integer
    add_column :technology_scores, :user_id, :integer
    add_column :development_scores, :user_id, :integer
    add_column :legal_scores, :user_id, :integer
    add_column :risk_scores, :user_id, :integer
    add_column :opportunity_scores, :user_id, :integer
  end

  def self.down
    remove_column :cost_scores, :user_id
    remove_column :technology_scores, :user_id
    remove_column :development_scores, :user_id
    remove_column :legal_scores, :user_id
    remove_column :risk_scores, :user_id
    remove_column :opportunity_scores, :user_id
  end
end

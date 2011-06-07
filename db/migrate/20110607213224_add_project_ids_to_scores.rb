class AddProjectIdsToScores < ActiveRecord::Migration
    def self.up
    add_column :cost_scores, :project_id, :integer
    add_column :technology_scores, :project_id, :integer
    add_column :development_scores, :project_id, :integer
    add_column :legal_scores, :project_id, :integer
    add_column :risk_scores, :project_id, :integer
    add_column :opportunity_scores, :project_id, :integer
  end

  def self.down
    remove_column :cost_scores, :project_id
    remove_column :technology_scores, :project_id
    remove_column :development_scores, :project_id
    remove_column :legal_scores, :project_id
    remove_column :risk_scores, :project_id
    remove_column :opportunity_scores, :project_id
  end
end

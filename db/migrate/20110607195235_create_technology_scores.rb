class CreateTechnologyScores < ActiveRecord::Migration
  def self.up
    create_table :technology_scores do |t|
      t.float :tech_requirements
      t.string :tech_requirements_comment
      t.float :actual_resources
      t.string :actual_resources_comment
      t.float :missing_resources
      t.string :missing_resources_comment
      t.string :total_score

      t.timestamps
    end
  end

  def self.down
    drop_table :technology_scores
  end
end

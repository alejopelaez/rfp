class CreateDevelopmentScores < ActiveRecord::Migration
  def self.up
    create_table :development_scores do |t|
      t.float :scope
      t.string :scope_comment
      t.float :activities
      t.string :activities_comment
      t.float :deadline
      t.string :deadline_comment
      t.float :knowledge
      t.string :knowledge_comment
      t.float :technology_availability
      t.string :technology_availability_comment
      t.float :human_availability
      t.string :human_availability_comment
      t.float :experience
      t.string :experience_comment
      t.float :total_score

      t.timestamps
    end
  end

  def self.down
    drop_table :development_scores
  end
end

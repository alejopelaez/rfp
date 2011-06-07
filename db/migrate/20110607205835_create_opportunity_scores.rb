class CreateOpportunityScores < ActiveRecord::Migration
  def self.up
    create_table :opportunity_scores do |t|
      t.float :adquired_knowledge
      t.string :adquired_knowledge_comment
      t.float :importance
      t.string :importance_comment
      t.float :positioning
      t.string :positioning_comment
      t.float :total_score

      t.timestamps
    end
  end

  def self.down
    drop_table :opportunity_scores
  end
end

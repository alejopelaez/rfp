class CreateLegalScores < ActiveRecord::Migration
  def self.up
    create_table :legal_scores do |t|
      t.float :requirements
      t.string :requirements_comment
      t.float :restrictions
      t.string :restrictions_comment
      t.float :contract
      t.string :contract_comment
      t.float :total_score

      t.timestamps
    end
  end

  def self.down
    drop_table :legal_scores
  end
end

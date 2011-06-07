class CreateRiskScores < ActiveRecord::Migration
  def self.up
    create_table :risk_scores do |t|
      t.float :penalties
      t.string :penalties_comment
      t.float :fulfillment_probability
      t.string :fulfillmetn_probability_comment
      t.float :total_score

      t.timestamps
    end
  end

  def self.down
    drop_table :risk_scores
  end
end

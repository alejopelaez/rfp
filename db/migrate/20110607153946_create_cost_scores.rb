class CreateCostScores < ActiveRecord::Migration
  def self.up
    create_table :cost_scores do |t|
      t.float :cost
      t.float :payment
      t.float :payment_option
      t.float :total_score

      t.timestamps
    end
  end

  def self.down
    drop_table :cost_scores
  end
end

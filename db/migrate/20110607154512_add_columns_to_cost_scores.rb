class AddColumnsToCostScores < ActiveRecord::Migration
  def self.up
    add_column :cost_scores, :cost_comment, :string
    add_column :cost_scores, :payment_comment, :string
    add_column :cost_scores, :payment_option_comment, :string
  end

  def self.down
    remove_column :cost_scores, :cost_comment
    remove_column :cost_scores, :payment_comment
    remove_column :cost_scores, :payment_option_comment
  end
end

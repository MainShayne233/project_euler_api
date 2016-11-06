class CreateAttempts < ActiveRecord::Migration[5.0]
  def change
    create_table :attempts do |t|
      t.integer :problem_id
      t.string :solution

      t.timestamps
    end
  end
end

class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
      t.integer :number
      t.string  :solution
    end
  end
end

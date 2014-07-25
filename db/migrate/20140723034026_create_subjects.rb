class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.text :contextDisplay
      t.integer :totalTime
      t.integer :countQuestion
      t.timestamps
    end
  end
end

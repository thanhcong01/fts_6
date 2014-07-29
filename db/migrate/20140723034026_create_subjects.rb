class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :context_display
      t.integer :total_time
      t.integer :count_question
      t.timestamps
    end
  end
end

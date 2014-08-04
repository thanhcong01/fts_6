class CreateAnswerSheets < ActiveRecord::Migration
  def change
    create_table :answer_sheets do |t|
      t.boolean :correct
      t.boolean :finish
      t.integer :register_id
      t.integer :question_id
      t.integer :answer_id
      t.timestamps
    end
    add_index :answer_sheets, [:register_id, :created_at]
    add_index :answer_sheets, [:question_id, :created_at]
    add_index :answer_sheets, [:answer_id, :created_at]
  end
end

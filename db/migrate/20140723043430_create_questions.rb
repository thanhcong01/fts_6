class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :contextQuestion
      t.integer :subject_id
      t.boolean :isControllText
      t.timestamps
    end
    add_index :questions, [:subject_id, :created_at]
  end
end

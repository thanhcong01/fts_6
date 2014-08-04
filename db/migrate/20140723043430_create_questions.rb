class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :context_question
      t.integer :subject_id
      t.boolean :is_controll_text
      t.timestamps
    end
    add_index :questions, [:subject_id, :created_at]
  end
end

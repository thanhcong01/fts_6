class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.text :contextQuestion
      t.text :contentAnswer
      t.boolean :IsCorrect
      t.integer :register_id
      t.timestamps
    end
    add_index :question_answers, [:register_id, :created_at]
  end
end

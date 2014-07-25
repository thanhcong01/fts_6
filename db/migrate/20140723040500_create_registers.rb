class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.datetime :dateTest
      t.integer :CountAnswerCorrect
      t.float :mark
      t.boolean :finish, default: false
      t.integer :user_id
      t.integer :subject_id
      t.timestamps
    end
    add_index :registers, [:user_id, :created_at]
    add_index :registers, [:subject_id, :created_at]
  end
end

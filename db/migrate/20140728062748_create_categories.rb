class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name_category
      t.timestamps
    end
  end
end

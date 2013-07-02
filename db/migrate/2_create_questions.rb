class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.boolean :enabled
      t.boolean :deleted
      t.integer :order
      t.datetime :date

      t.timestamps
    end
  end
end

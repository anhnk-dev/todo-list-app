class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :sub_title
      t.integer :priority, default: 0
      t.datetime :due_date
      t.boolean :completed
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end

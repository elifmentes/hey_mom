class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :task, foreign_key: true
      t.string :title
      t.integer :duration

      t.timestamps
    end
  end
end

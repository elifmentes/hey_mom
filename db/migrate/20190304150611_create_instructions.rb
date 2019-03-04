class CreateInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :instructions do |t|
      t.references :step, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

class AddImageToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :image, :string
  end
end

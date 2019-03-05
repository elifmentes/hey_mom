class ChangeDurationToContentInSteps < ActiveRecord::Migration[5.2]
  def change
    remove_column :steps, :duration
    add_column :steps, :content, :text
  end
end

class RemoveUserFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tasks, :user
  end
end

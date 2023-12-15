class DropTasks < ActiveRecord::Migration[7.1]
  def up
    drop_table :tasks, if_exists: true
  end
end

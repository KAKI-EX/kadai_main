class ChangeDatetypeStartdateOfTasks < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :startdate, :date
  end
end

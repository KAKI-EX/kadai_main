class ChangeDatatypeEnddateOfTasks < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :enddate, :date
  end
end

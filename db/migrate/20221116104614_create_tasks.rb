class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :startdate
      t.datetime :enddate
      t.boolean :wholeday
      t.text :memo

      t.timestamps
    end
  end
end

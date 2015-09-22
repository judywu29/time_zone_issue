class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :result

      t.timestamps null: false
    end
  end
end

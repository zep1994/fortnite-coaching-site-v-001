class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :time
      t.string :type_player

      t.timestamps
    end
  end
end

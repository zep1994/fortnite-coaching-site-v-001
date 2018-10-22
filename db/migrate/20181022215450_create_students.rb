class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :meeting_id
      
      t.timestamps
    end
  end
end

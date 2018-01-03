class CreateStudentGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :student_groups do |t|
      t.integer :user_id
      t.datetime :date
      t.integer :group_id

      t.timestamps
    end
  end
end

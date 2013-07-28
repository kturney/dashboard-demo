class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :description
      t.datetime :due_date
      t.integer :course_id
      t.boolean :active

      t.timestamps
    end
  end
end

class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :expertise
      t.string :created_by

      t.timestamps
    end
  end
end

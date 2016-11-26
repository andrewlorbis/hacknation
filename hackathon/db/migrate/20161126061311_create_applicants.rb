class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.integer :age
      t.string :location
      t.float :gpa
      t.float :exp

      t.timestamps null: false
    end
  end
end

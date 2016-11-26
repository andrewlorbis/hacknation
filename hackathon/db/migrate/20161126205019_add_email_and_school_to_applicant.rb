class AddEmailAndSchoolToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :email, :string
    add_column :applicants, :school, :string
  end
end

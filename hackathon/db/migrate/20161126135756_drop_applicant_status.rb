class DropApplicantStatus < ActiveRecord::Migration
  def change
  	drop_table :applicant_statuses

  	create_table :applicants_statuses, id: false do |t|
      t.belongs_to :applicant, index: true
      t.belongs_to :status, index: true
    end
  end
end

class RemoveRecruiterIdOnApplicant < ActiveRecord::Migration
  def change
  	remove_column :languages, :applicant_id
  	remove_column :positions, :applicant_id
  	remove_column :statuses, :applicant_id

  	add_reference :applicants, :recruiter, index: true
  	add_reference :applicants, :status, index: true
  	add_reference :applicants, :position, index: true
  end
end

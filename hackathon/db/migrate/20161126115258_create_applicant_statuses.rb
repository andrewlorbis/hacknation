class CreateApplicantStatuses < ActiveRecord::Migration
  def change
    create_table :applicant_statuses do |t|

      t.timestamps null: false
    end

    add_column :applicant_statuses, :applicant_id, :integer
    add_column :applicant_statuses, :status_id, :integer

    remove_column :applicants, :status_id, index: true
  end
end

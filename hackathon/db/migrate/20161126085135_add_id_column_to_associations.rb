class AddIdColumnToAssociations < ActiveRecord::Migration
  def change
  	add_reference :statuses, :applicant, index: true
  	add_reference :positions, :applicant, index: true
  	add_reference :languages, :applicant, index: true
  end
end

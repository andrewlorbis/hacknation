class CreateApplicantLanguages < ActiveRecord::Migration
  def change
    create_table :applicant_languages do |t|

      t.timestamps null: false
    end

    add_column :applicant_languages, :applicant_id, :integer
    add_column :applicant_languages, :language_id, :integer

  end
end

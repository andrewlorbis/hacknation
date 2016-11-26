json.extract! applicant, :id, :name, :age, :location, :gpa, :exp, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
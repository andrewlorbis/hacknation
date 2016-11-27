# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

status = ['responded', 'interview', 'test', 'final interview', 'job offer']
position = ['Software Engineer', 'Software Developer', 'Project Manager', 'Lead Developer', 'Software Tester', 'IT Consultant', 'Nurse', 'Customer Support', 'Factory Worker', 'Cloud Consultant', 'Customer Service Representative', 'Unit Maintenance', 'Technical Lead', 'Supervisor']
language = ['C', 'C++', 'Java', 'Assembly', 'Python', 'Assembly', 'Perl', 'Ruby', 'Fortran', 'Pascal', 'BASIC', 'Swift', 'LISP', 'Prolog', 'Scheme']


for i in status
	Status.create(name: i)
end
status = Status.all

for i in position
	Position.create(name: i)
end
position = Position.all

for i in language
	Language.create(name: i)
end
language = Language.all

for i in 1...20
	Recruiter.create(name: Faker::Name.name)
end
recruiter = Recruiter.all

for i in 1...1000

	a = Applicant.create(name: Faker::Name.name,
						 email: Faker::Internet.email,
						 school: Faker::University.name,
					 	 age: rand(17..61),
					     location: Faker::Address.secondary_address + " " + Faker::Address.street_name + " " + Faker::Address.city,
					     gpa: rand.round(2) * (5 - 1) + 1,
					     exp: rand.round(1) * (10 - 1) + 1
					 	)
	#status.sample.applicant << a
	position.sample.applicant << a
	recruiter.sample.applicant << a
	a.statuses << status.sample
	a.language << language.sample(rand(1...5))
	a.updated_at = rand(1..30).days.ago
	a.save
end

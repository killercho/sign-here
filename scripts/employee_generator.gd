class_name EmployeeGenerator

const MIN_AGE = 18
const MAX_AGE = 40

const MAX_EXPERIENCE = MAX_AGE - MIN_AGE

const MIN_SALARY = 10
const MAX_SALARY = 100
const SALARY_MULTIPLIER = 100

var rng = RandomNumberGenerator.new()

func generate_name():
	# Todo - Get names randomly from file
	var f_name = "John"
	var l_name = "Doe"
	return f_name + " " + l_name
	
func generate_age():
	return rng.randi_range(MIN_AGE, MAX_AGE)
	
func generate_experience(age):
	var experience = rng.randi_range(0, MAX_EXPERIENCE)
	if experience > age - MIN_AGE:
		experience = age - MIN_AGE
	return experience
	
func generate_monthly_salary(experience):
	return int((float(experience) / float(MAX_EXPERIENCE)) * (MAX_SALARY - MIN_SALARY) + MIN_SALARY) * SALARY_MULTIPLIER

func new_employee():
	rng.randomize()
	var name = generate_name()
	var age = generate_age()
	var experience = generate_experience(age)
	var monthly_salary = generate_monthly_salary(experience)
	
	return Employee.new(name, age, experience, monthly_salary)

class_name Employee

const MIN_AGE = 18
const MAX_AGE = 40

const MAX_EXPERIENCE = MAX_AGE - MIN_AGE

const MIN_SALARY = 10
const MAX_SALARY = 100
const SALARY_MULTIPLIER = 100

var rng = RandomNumberGenerator.new()
var name: String
var age: int
var experience: int
var monthly_salary: int

func generate_name():
	# Todo - Get names randomly from file
	var f_name = "John"
	var l_name = "Doe"
	return f_name + " " + l_name
	
func generate_age():
	return rng.randi_range(MIN_AGE, MAX_AGE)
	
func generate_experience():
	var experience = rng.randi_range(0, MAX_EXPERIENCE)
	if experience > age - MIN_AGE:
		experience = age - MIN_AGE
	return experience
	
func generate_monthly_salary():
	return int((float(experience) / float(MAX_EXPERIENCE)) * (MAX_SALARY - MIN_SALARY) + MIN_SALARY) * SALARY_MULTIPLIER

func generate_stats():
	rng.randomize()
	name = generate_name()
	age = generate_age()
	experience = generate_experience()
	monthly_salary = generate_monthly_salary()

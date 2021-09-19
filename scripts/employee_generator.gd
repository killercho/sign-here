class_name EmployeeGenerator

var trait_resource = preload("res://resources/traits/traits.tres") as TraitResource

const MIN_AGE = 18
const MAX_AGE = 40

const MAX_EXPERIENCE = MAX_AGE - MIN_AGE

const MIN_SALARY = 10
const MAX_SALARY = 100
const SALARY_MULTIPLIER = 100

var rng = RandomNumberGenerator.new()

func generate_name():
	var f_name: String
	var l_name: String
	var names_file = File.new()
	var err = names_file.open("res://resources/first_names.txt", File.READ)
	if err != OK:
		printerr("Could not open names_file, error code: ", err)
	var num_names = int(names_file.get_line())
	var name_idx = rng.randi_range(0, num_names - 1)
	for i in range(0, name_idx):
		f_name = names_file.get_line()
		
	err = names_file.open("res://resources/last_names.txt", File.READ)
	if err != OK:
		printerr("Could not open names_file, error code: ", err)
	num_names = int(names_file.get_line())
	name_idx = rng.randi_range(0, num_names - 1)
	for i in range(0, name_idx):
		l_name = names_file.get_line()
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

func generate_trait():
	var trait_index = rng.randi_range(0, trait_resource.traits.size() - 1)
	return trait_resource.traits[trait_index]

func new_employee():
	rng.randomize()
	var name = generate_name()
	var age = generate_age()
	var experience = generate_experience(age)
	var monthly_salary = generate_monthly_salary(experience)
	var trait = generate_trait()
	
	return Employee.new(name, age, experience, monthly_salary, trait)

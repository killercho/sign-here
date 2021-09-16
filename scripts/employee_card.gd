extends PanelContainer

const MIN_AGE = 18
const MAX_AGE = 40

const MAX_EXPERIENCE = MAX_AGE - MIN_AGE

const MIN_SALARY = 10
const MAX_SALARY = 100
const SALARY_MULTIPLIER = 100

var rng = RandomNumberGenerator.new()
var employee_name: String
var age: int
var experience: int
var monthly_salary: int

func generate_name():
	# Todo - Get names randomly from file
	var f_name = "John"
	var l_name = "Doe"
	return f_name + " " + l_name

func generate_stats():
	rng.randomize()
	employee_name = generate_name()
	age = rng.randi_range(MIN_AGE, MAX_AGE)
	experience = rng.randi_range(0, MAX_EXPERIENCE)
	if experience > age - MIN_AGE:
		experience = age - MIN_AGE
	monthly_salary = int((float(experience) / float(MAX_EXPERIENCE)) * (MAX_SALARY - MIN_SALARY) + MIN_SALARY) * SALARY_MULTIPLIER

func update_ui():
	$Split/Info/Name.text = "Name: " + employee_name
	$Split/Info/Age.text = "Age: " + String(age)
	$Split/Info/Experience.text = "Experience: " + String(experience) + " years"
	$Split/Info/Salary.text = "Salary: " + String(monthly_salary) + "$"

func generate_employee():
	generate_stats()
	update_ui()

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_employee()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

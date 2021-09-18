extends PanelContainer

func update_ui(name, age, experience, monthly_salary):
	$Split/Info/Name.text = "Name: " + name
	$Split/Info/Age.text = "Age: " + String(age)
	$Split/Info/Experience.text = "Experience: " + String(experience) + " years"
	$Split/Info/Salary.text = "Salary: " + String(monthly_salary) + "$"

func generate_employee():
	var employee = Employee.new()
	employee.generate_stats()
	update_ui(employee.name, employee.age, employee.experience, employee.monthly_salary)


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_employee()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

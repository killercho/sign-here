extends PanelContainer

var generator = EmployeeGenerator.new()
var employee

func update_ui():
	$Split/Info/Name.text = "Name: " + employee.name
	$Split/Info/Age.text = "Age: " + String(employee.age)
	$Split/Info/Experience.text = "Experience: " + String(employee.experience) + " years"
	$Split/Info/Salary.text = "Salary: " + String(employee.monthly_salary) + "$"
	if employee.trait != null:
		$Split/VBoxContainer/TraitIcon.visible = true
		$Split/VBoxContainer/TraitIcon.texture = employee.trait.icon
		$Split/VBoxContainer/TraitIcon/Name.text = employee.trait.name

func generate_employee():
	employee = generator.new_employee()
	update_ui()

func _ready():
	generate_employee()

func _on_TraitIcon_mouse_entered():
	$Split/VBoxContainer/TraitIcon/Name.visible = true


func _on_TraitIcon_mouse_exited():
	$Split/VBoxContainer/TraitIcon/Name.visible = false

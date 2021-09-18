class_name Employee

var name: String
var age: int
var experience: int
var monthly_salary: int
var trait: Trait

func _init(name, age, experience, monthly_salary, trait):
	self.name = name
	self.age = age
	self.experience = experience
	self.monthly_salary = monthly_salary
	self.trait = trait

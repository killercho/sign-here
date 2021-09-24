extends Node


export (PackedScene) var employee_card_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/VBoxContainer.add_child(employee_card_scene.instance())
	$Control/VBoxContainer.add_child(employee_card_scene.instance())
	$Control/VBoxContainer.add_child(employee_card_scene.instance())
	$Control/VBoxContainer.add_child(employee_card_scene.instance())
	$Control/VBoxContainer.add_child(employee_card_scene.instance())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Node3D

var fruitScene = preload("res://scenes/fruit.tscn")
@onready var spawnPoint = get_node("spawnPointFruit") as Marker3D;
@onready var center = $center as Marker3D;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_fruit():
	spawnPoint.global_position.x = randf_range(-3, 3);
	center.global_position.x = randf_range(-1, 1)
	
	var _f = fruitScene.instantiate() as RigidBody3D;
	_f.global_position = spawnPoint.global_position
	#_f.global_position.z -= randf_range(-0.5, 0.5)
	add_child(_f);
	
	var _dir = spawnPoint.global_position.direction_to($center.global_position)
	_f.apply_central_impulse(_dir * 10);
	#_f.apply_central_impulse(Vector3(0, 10, 0));


func _on_spawn_timer_timeout() -> void:
	spawn_fruit();
	$spawnTimer.start(3);

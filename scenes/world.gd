extends Node3D

var fruitScene = preload("res://scenes/fruit.tscn")
@onready var spawnPoint = get_node("spawnPointFruit")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_fruit():
	var _f = fruitScene.instantiate() as RigidBody3D;
	_f.global_position = spawnPoint.global_position
	#_f.global_position.z -= randf_range(-0.5, 0.5)
	add_child(_f);
	_f.apply_central_impulse(Vector3(0, 10, 0));


func _on_spawn_timer_timeout() -> void:
	spawn_fruit();
	$spawnTimer.start(3);

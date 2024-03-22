extends RigidBody3D

var cutted = false;
static var id = 0;

@onready var meshes = get_node("Meshes") as Node3D
@onready var particles = get_node("GPUParticles3D") as GPUParticles3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	id += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global_position.z < -20:
		queue_free();


func _on_input_event(camera: Node, event: InputEvent, position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if cutted: return;
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		cut_fruit();

func cut_fruit():
	# me apagar e spawnar eu explodindo
	freeze = true;
	meshes.visible = false;
	particles.emitting = true;
	cutted = true;
	await particles.finished
	queue_free()
	

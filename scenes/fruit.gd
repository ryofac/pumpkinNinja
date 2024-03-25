extends RigidBody3D

var cutted = false;
static var id = 0;

@onready var meshes = get_node("Meshes") as Node3D
@onready var particles = get_node("GPUParticles3D") as GPUParticles3D
@onready var fruit_mesh = $Meshes/fruitMesh
@onready var collision = $CollisionShape3D

var rotationDir: Vector3;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize();
	id += 1
	
	# Escolhe aleatoriamente uma direção pra rotacionar
	rotationDir = Vector3(
		randf_range(-1, 1),
		randf_range(-1, 1),
		randf_range(-1, 1)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if global_position.z < -20:
		queue_free();
	
	# Aplica a rotação a cada eixo
	fruit_mesh.rotate_y(rotationDir.z/10);
	fruit_mesh.rotate_z(rotationDir.x/10);
	fruit_mesh.rotate_x(rotationDir.y/10);
	
	

func _on_input_event(camera: Node, event: InputEvent, position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if cutted: return;
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		cut_fruit();

func cut_fruit():
	# me apagar e spawnar eu explodindo
	freeze = true;
	meshes.visible = false;
	collision.disabled = true;
	particles.emitting = true;
	cutted = true;
	await particles.finished
	queue_free()
	

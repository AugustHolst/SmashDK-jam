extends Camera3D

const CAMERA_SPEED = 0.05;
const RAY_LENGTH = 500;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if Input.is_action_pressed("cam_forward"):
		#position.x += CAMERA_SPEED;
	#if Input.is_action_pressed("cam_left"):
		#position.z -= CAMERA_SPEED;
	#if Input.is_action_pressed("cam_back"):
		#position.x -= CAMERA_SPEED;
	#if Input.is_action_pressed("cam_right"):
		#position.z += CAMERA_SPEED;

func _physics_process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var mousePos = get_viewport().get_mouse_position();
		var ray_from = project_ray_origin(mousePos);
		var ray_to = ray_from + project_ray_normal(mousePos) * RAY_LENGTH
		#var ray = RayCast3D(ray_to, ray_from);
		print("mouse position: " + str(mousePos));
		print("rayCast to: " + str(ray_to));
		

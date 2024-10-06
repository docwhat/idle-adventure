extends Area2D

@export var speed: int = 400 # pixels/sec
var position_min: Vector2
var position_max: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size: Vector2
	var player_size: Vector2

	screen_size = get_viewport_rect().size
	player_size = $CollisionShape2D.shape.get_rect().size
	position_min = Vector2.ZERO + player_size / 2
	position_max = screen_size - player_size / 2
	hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("jump"):
		$AnimatedSprite2D.animation = &"jump"
	else:
		$AnimatedSprite2D.animation = &"walk"
	$AnimatedSprite2D.play()

	position = position.clamp(position_min, position_max)

func start(pos: Vector2) -> void:
	position = pos
	show()

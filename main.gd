extends Node

var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_score_timer_timeout() -> void:
	score += 1

func _on_start_timer_timeout() -> void:
	$ScoreTimer.start()

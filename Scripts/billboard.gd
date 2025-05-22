extends Node3D

# 요소 정의
@onready var BILLBOARD = $".";
@onready var BOARD = $board;

func _process(delta: float) -> void:
	var move_speed := 1.0 * delta

	if Input.is_action_pressed("ui_up"):
		BILLBOARD.position.y += move_speed
	elif Input.is_action_pressed("ui_down"):
		BILLBOARD.position.y -= move_speed

func get_a() -> float:
	"""
	광고판의 가로 크기를 반환
	"""
	return BOARD.mesh.size.x;

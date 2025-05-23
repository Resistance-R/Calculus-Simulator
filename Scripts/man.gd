extends Node3D

#요소 정의
@onready var SIGHT = $sight;

# 광고판 정의
@onready var BOARD = get_node("/root/main/billboard/board")

func get_b() -> float:
	return round(SIGHT.position.y * 100.0) / 100.0 # 소수점 둘 째 자리 반올림

func _ready() -> void:
	SIGHT.mesh.size.x = BOARD.mesh.size.y * 2
	SIGHT.mesh.size.z = BOARD.mesh.size.x

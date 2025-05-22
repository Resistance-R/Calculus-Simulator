extends Node3D

#요소 정의
@onready var SIGHT = $sight;

func get_b() -> float:
	return round(SIGHT.position.y * 100.0) / 100.0 # 소수점 둘 째 자리 반올림

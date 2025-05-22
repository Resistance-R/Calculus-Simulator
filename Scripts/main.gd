extends Node3D

# 물체 정의
@onready var BILLBOARD = $billboard;
@onready var FLOOR = $stage;
@onready var MAN = $man;

# 상수 정의
@onready var CORRECTED_FLOOR_POS = FLOOR.position.y + 1.5; # 바닥이 땅으로 1.5m 만큼 내려가 있음
@onready var A = BILLBOARD.get_a();
@onready var B = MAN.get_b() + 1.0; # 관찰자 기준 상대 좌표로 반환되기 때문에 +1.0m

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if BILLBOARD.position.y <= 0:
		"""
		광고판이 바닥 밑으로 뚫고 내려가는 것 방지
		"""
		BILLBOARD.position.y = 0;

	# `h` 계산
	var h = BILLBOARD.position.y - CORRECTED_FLOOR_POS;
	var fov = rad_to_deg(theta(h));

func theta(h, a=A, b=B) -> float:
	"""
	시야각 구하는 함수
	"""
	return 2.0 * atan((a / 2.0) / (h - B));

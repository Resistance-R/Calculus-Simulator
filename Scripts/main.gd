extends Node3D

# 최대 시야각 검사를 위한 전역변수 선언
@export var is_max_fov = false; # false로 초기화

# 물체 정의
@onready var BILLBOARD = $billboard;
@onready var BOARD = $billboard/board;
@onready var FLOOR = $stage;
@onready var MAN = $man;

# 상수 정의
@onready var A = BILLBOARD.get_a();
@onready var B = MAN.get_b() + 1.0; # 눈높이 오차로 인한 수치 보정; 좌표계 문제로 인함
const FOV_TOLERANCE = 5.0 # 허용 오차; 비교가 너무 엄격하면 시뮬레이션의 의미가 퇴색된다고 판단

# UI
@onready var H_LABEL = $stage/UI/h_label;
@onready var THETA_LABEL = $stage/UI/theta_label;

var max_fov = 0; # 최대 시야각을 저장할 변수; 일단 0으로 초기화

func _process(delta: float) -> void:
	var corrected_billboard_pos = BILLBOARD.position.y - 1.5 # 바닥 두께로 인한 수치 보정
	if corrected_billboard_pos < 0:
		"""
		광고판이 바닥 밑으로 뚫고 내려가는 것 방지
		"""
		BILLBOARD.position.y = 1.5;

	var h = corrected_billboard_pos - FLOOR.position.y; # `h` 계산
	var fov = rad_to_deg(theta(h)); # 시야각 계산
	#var max_fov = 0; # 최대 시야각을 저장할 변수; 일단 0으로 초기화
	
	H_LABEL.text = "h: %.2f m" % h;
	THETA_LABEL.text = "θ: %.2f°" % fov;

	if max_fov < fov:
		max_fov = fov
	else:
		pass
	
	if abs(fov - max_fov) <= FOV_TOLERANCE: # 시야각이 충분히 최댓값과 가까운가
		is_max_fov = true;
		THETA_LABEL.modulate = Color.WHITE;
	else:
		is_max_fov = false;
		THETA_LABEL.modulate = Color.RED;
		
func theta(h, a=A, b=B) -> float:
	"""
	시야각 구하는 함수
	"""
	return 2.0 * atan((a / 2.0) / (h - b));

extends MeshInstance3D

"""
광고판 색깔 바꾸기
"""
 
# main 노드 정의
@onready var MAIN_NODE = get_node("/root/main") as Node3D;

#material 정의
const mat_white = preload("res://Assets/white.tres");
const mat_red = preload("res://Assets/red.tres");

func _ready() -> void:
	set_surface_override_material(0, mat_white); # 일단 흰색으로 초기화

func _process(delta: float) -> void:
	if MAIN_NODE.is_max_fov: # is_max_fov == true 일 때,
		set_surface_override_material(0, mat_white); # 광고판을 흰색으로
	else: # 아니면
		set_surface_override_material(0, mat_red); # 광고판을 빨간색으로

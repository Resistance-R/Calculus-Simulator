# 광고판 시야각 최적화 시뮬레이터
Godot Engine을 사용해 구현한 최적화 시뮬레이터입니다.  
광고판의 설치 높이에 따라 관찰자가 보게 되는 시야각(θ)을 시각적으로 확인할 수 있으며,  
시야각이 최대에 근접했을 때 시각적 피드백을 제공합니다.
___
## 문제
> 광고판 설치 위치 최적화:
> 
> 어느 도로변에 광고판을 설치하려고 한다. 광고판은 고정된 가로길이 a를 가지고 있으며,
> 지면에서 h미터 위에 설치된다. 광고판을 보는 사람의 눈높이는 지면에서 b미터이다.
> 사람이 광고판을 가장 넓은 시야각으로 보기 위해 광고판의 설치 높이 h를 최적화하라.

> \( a=20.0,\ b=1.8 \) (단위: m)
___
## 핵심 수식
시야각을 구하는 함수입니다:
\[
\theta(h) = 2 \cdot \arctan \left( \frac{a / 2}{h - b} \right)
\]
`main.gd` 스크립트의 `theta()`라는 함수로 작성되어 있습니다.
해당 코드:
```gdscript
func theta(h, a=A, b=B) -> float:
	"""
	시야각 구하는 함수
	"""
	return 2.0 * atan((a / 2.0) / (h - B));
```
___
## 시뮬레이터 사용법
1. [시뮬레이터 페이지](https://resistance-r.github.io/Calculus-Simulator/)에 접속합니다.
2. 방향키 위(\( \uparrow\))키와 아래(\( \downarrow\))키로 광고판을 올리고 내립니다.
3. 좌측 상단 UI에 `h`와 `θ` 값이 출력됩니다.
4. `θ`가 최댓값(180°)에 근접하면 `θ` UI 색상이 **하얀색**, 그렇지 않으면 **빨간색**으로 표시됩니다.
    4-1. 시야각이 최댓값에 근접하면 광고판의 색상이 **하얀색**, 그렇지 않으면 **빨간색**이 되도록 하여 시각적 피드백을 확실히 보이도록 했습니다.
___
## 시연 동영상
[![이곳을 클릭](https://img.youtube.com/vi/5_-nC0_L-JM/0.jpg)](https://youtu.be/5_-nC0_L-JM)
___
## 구조 요약
```shell
./CALCULUS_SIMULATOR/
│ .gitignore  
│  README.md
│  index.html
├─Assets
│      man.gdshader
│      my_portrait.png
│      Pretendard-Medium.ttf
│      red.tres
│      white.tres
│
├─Scenes
│      billboard.tscn
│      main.tscn
│      man.tscn
│      stage.tscn
│
└─Scripts
        billboard.gd
        board.gd
        main.gd
        man.gd
```
___
## 기타
- 시뮬레이터는 [GODOT HTML5 export](https://docs.godotengine.org/en/latest/tutorials/export/exporting_for_web.html)로 웹에서 시연 [가능](https://resistance-r.github.io/Calculus-Simulator/).
    - 노란색 구역은 관찰자의 시야를 의미합니다.
    - 데스크탑 환경에서 시행 권장.
___
## 프로젝트 기여자
- 프로젝트 기획, 구현, 정리: 2025245045 명윤재
- 프로젝트의 목적: `미적분학과벡터해석(1)` 팀 발표 자료용.
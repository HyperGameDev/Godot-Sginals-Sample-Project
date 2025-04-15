extends CanvasLayer

@onready var label_lives_val: Label = %Label_Lives_Val

var lives: int = 9:
	set(new_lives):
		lives = new_lives
		label_lives_val.text = str(lives)

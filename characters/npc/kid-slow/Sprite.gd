extends Sprite

export(Array, Texture) var TEXTURE_VARIATIONS_ARRAY: Array = [
	preload("res://characters/npc/sprite/Sprite_1.png"),
	preload("res://characters/npc/sprite/Sprite_2.png"),
	preload("res://characters/npc/sprite/Sprite_3.png"),
	preload("res://characters/npc/sprite/Sprite_4.png"),
	preload("res://characters/npc/sprite/Sprite_5.png"),
	preload("res://characters/npc/sprite/Sprite_6.png"),
	preload("res://characters/npc/sprite/Sprite_7.png"),
	preload("res://characters/npc/sprite/Sprite_8.png"),
	preload("res://characters/npc/sprite/Sprite_9.png")
]

func _ready():
	var texture_id: int = randi() % TEXTURE_VARIATIONS_ARRAY.size()
	var choosen_texture: Texture = TEXTURE_VARIATIONS_ARRAY[texture_id]
	texture = choosen_texture

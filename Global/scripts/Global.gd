extends Node2D

var player = null
var key = 0
var red_key = 0
var kills  = 0
var boss_key = 0
var dead_boss: bool = false
var boss_killed = 0
var player_pos : Vector2

func instance_node(node, location):
	var node_instance = node.instance()
	get_tree().get_root().add_child(node_instance)
	node_instance.global_position = location
	return node_instance

class_name Tooltip
extends Node


#####################################
# SIGNALS
#####################################

#####################################
# CONSTANTS
#####################################

#####################################
# @export VARIABLES 
#####################################
@export var visuals_res: PackedScene
@export var owner_path: NodePath
@export_range (0, 10, 0.05) var delay = 0.5
@export var follow_mouse: bool = true
@export_range (-400, 400, 1) var offset_x : float
@export_range (-400, 400, 1) var offset_y : float
@export_range (0, 100, 1) var padding_x : float
@export_range (0, 100, 1) var padding_y : float
@export var show_tooltip : bool = true

#####################################
# PUBLIC VARIABLES 
#####################################

#####################################
# PRIVATE VARIABLES
#####################################
var _visuals: Control
var _timer: Timer


#####################################
# ONREADY VARIABLES
#####################################
@onready var owner_node = get_node(owner_path)
@onready var offset: Vector2 = Vector2(offset_x, offset_y)
@onready var padding: Vector2i = Vector2i(padding_x, padding_y)
@onready var extents: Vector2


#####################################
# OVERRIDE FUNCTIONS
#####################################
func _init() -> void:
	pass


func Setup(lore : String) -> void:
	owner_node = get_node(owner_path)
	# create the visuals
	_visuals = visuals_res.instantiate()
	add_child(_visuals)
	# calculate the extents
	extents = _visuals.get_rect().size
	# connect signals
	owner_node.connect("mouse_entered", _mouse_entered)
	owner_node.connect("mouse_exited", _mouse_exited)
	# initialize the timer
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", _custom_show)
	# default to hide
	_visuals.hide()
	_visuals.lore = lore


func _process(delta: float) -> void:
	if(!_visuals):
		return
	if _visuals.visible:
		if(!show_tooltip):
			_visuals.hide()
			return
		var border = get_viewport().size - padding
		extents = _visuals.get_rect().size
		var base_pos = _get_screen_pos()
		# test if need to display to the left
		var final_x = base_pos.x + offset.x
		if final_x + extents.x > border.x:
			final_x = base_pos.x - offset.x - extents.x
		# test if need to display below
		var final_y = base_pos.y - extents.y - offset.y
		if final_y < padding.y:
			final_y = base_pos.y + offset.y
		_visuals.position = Vector2(final_x, final_y)


#####################################
# API FUNCTIONS
#####################################

#####################################
# HELPER FUNCTIONS
#####################################
func _mouse_entered() -> void:
	_timer.start(delay)


func _mouse_exited() -> void:
	_timer.stop()
	_visuals.hide()


func _custom_show() -> void:
	_timer.stop()
	if(show_tooltip):
		_visuals.show()


func _get_screen_pos() -> Vector2:
	if follow_mouse:
		return owner_node.get_global_mouse_position()
	
	
	var position = Vector2()
	
	if owner_node is Node2D:
		position = owner_node.global_position
	elif owner_node is Node3D:
		position = get_viewport().get_camera().unproject_position(owner_node.global_transform.origin)
	elif owner_node is Control:
		position = owner_node.rect_position
	
	return position

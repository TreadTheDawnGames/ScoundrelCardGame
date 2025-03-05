@tool
extends Node
@export_tool_button("Hello") var hello_action = hello

func hello():
	print("Hello world!")
	return

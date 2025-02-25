extends Node2D

# preload the level generator so we can instantiate it later
var level_generator = preload("res://LevelGenerator.tscn")
# set the level generator position that is being instantiated
var level_generator_position = Vector2(10, 50)

# set the world variable to this node when it's created
func _ready():
	Global.world = self
	# instantiate the level generator
	instance_node(level_generator, self, level_generator_position)

# when the node has left the tree
func _exit_tree():
	Global.world = null

# node instancing function
func instance_node(scene: PackedScene, parent: Node, location: Vector2):
	# create an instance of the scene
	var node_instance = scene.instantiate()
	# add the instance as a child of the parent node
	parent.add_child(node_instance)
	# set the global position of the new instance
	node_instance.global_position = location

# signal handler for creating a block
func _on_LevelGenerator_create_block(block: PackedScene, location: Vector2):
	instance_node(block, self, location)

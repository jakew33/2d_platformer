class_name Projectile
extends Node2D

const ExplosionEffectScene = preload("res://effects/explosion_effect.tscn")

@export var speed = 250


var velocity = Vector2.ZERO

func update_velocity():
	velocity.x = speed
	velocity = velocity.rotated(rotation)

func _process(delta):
	position += velocity * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()



func _on_hit_box_body_entered(body):
	Utils.instantiate_scene_on_world(ExplosionEffectScene, global_position)
#	Events.add_screenshake.emit(0.25, 0.25)
	queue_free()


func _on_hit_box_area_entered(area):
	Utils.instantiate_scene_on_world(ExplosionEffectScene, global_position)
#	Events.add_screenshake.emit(0.25, 0.25)
	queue_free()

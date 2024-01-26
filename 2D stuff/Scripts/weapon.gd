class_name Weapon
extends Resource

@export var weaponName: String
@export var testSprite: Texture2D
@export_multiline var description

@export_category("Bullet Props")
@export var bulletScene: PackedScene
@export var bulletSpeed: float
@export var bulletImpact: Texture2D

var _weaponLetter: String
var _canShoot: bool

func _shootBullet():
	print("'_shootBullet' no implemented for", weaponName)

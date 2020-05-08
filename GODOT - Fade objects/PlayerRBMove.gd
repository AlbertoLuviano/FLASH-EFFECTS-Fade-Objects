extends RigidBody

func _integrate_forces(_state):
	add_torque(Vector3(Input.get_action_strength("Left") - Input.get_action_strength("Right"), \
				0.0, \
				 Input.get_action_strength("Forward") - Input.get_action_strength("Back")) * 5)

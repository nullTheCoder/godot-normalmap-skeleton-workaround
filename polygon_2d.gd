@tool
extends Polygon2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (bones.size() > 1):
		var colors = PackedColorArray();
		var vertices = bones[1].size();
		colors.resize(vertices)
		for vert in range(0, vertices):
			var rot := Vector2(0.0, 0.0);
			var tot = 0;
			for boneIdiv in range(0, bones.size()/2):
				var i = boneIdiv*2;
				var w = bones[i+1][vert];
				var node: Bone2D = get_node(skeleton).get_node(bones[i]);
				var rt = -(node.global_rotation - node.rest.get_rotation());
				rot += Vector2(sin(rt)*w, cos(rt)*w)
				tot += w;
			rot /= tot;
			##print(str(rot) + ": " + str(cos(-rot)))
			colors[vert] = Color(rot.x*0.5+0.5, rot.y*0.5+0.5, 0, 1.0);
		vertex_colors = colors;
		pass

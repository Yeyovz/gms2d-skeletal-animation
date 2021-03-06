#macro SK_TYPE_BONE "bone"
enum sk_data_bone{
	name,
	parent,
	length,
	setupX,setupY,setupXScale,setupYScale,setupXShear,setupYShear,setupRotation,setupTransformMode,
	appliedX,appliedY,appliedXScale,appliedYScale,appliedXShear,appliedYShear,appliedRotation,appliedTransformMode,
	worldX,worldY,
	m00,m01,m10,m11,
	invalidAppliedTransform
}
/// @desc initialise
/// @param variable
sk_bone_set_name(argument0,undefined);
sk_bone_set_parent(argument0,undefined);
sk_bone_set_length(argument0,100);
sk_bone_set_pose(argument0,0,0,1,1,0,0,0,SK_TRANSFORM_MODE_NORMAL);
sk_bone_setup(argument0);
sk_bone_update(argument0);
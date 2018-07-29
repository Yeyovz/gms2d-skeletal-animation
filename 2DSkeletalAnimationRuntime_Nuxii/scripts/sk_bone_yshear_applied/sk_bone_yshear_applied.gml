/// @desc gets or sets a property
/// @param bone
/// @param [angle]
var sk_struct = argument[0];
if(argument_count<2){
	// get
	return sk_struct[SK_BONE.YShearApplied];
}	// set
	sk_struct[@ SK_BONE.badApplied] = true; // update applied flag
	sk_struct[@ SK_BONE.YShearApplied] = -angle_difference(0,real(argument[1]));
	return undefined;
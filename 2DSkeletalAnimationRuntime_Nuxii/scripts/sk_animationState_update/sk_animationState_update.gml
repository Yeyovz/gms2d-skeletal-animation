/// @desc updates the animation state
/// @param animationState
/// @param timestep
var sk_anim_prev = argument0[SK_ANIMATIONSTATE.animation_previous];
var sk_anim_current = argument0[SK_ANIMATIONSTATE.animation_current];
var sk_anim_next = argument0[SK_ANIMATIONSTATE.animation_next];
// update animations
if(sk_anim_next!=sk_anim_current){	// set new animation
	argument0[@ SK_ANIMATIONSTATE.animation_previous] = sk_anim_current;
	argument0[@ SK_ANIMATIONSTATE.animation_previous_loop] = argument0[SK_ANIMATIONSTATE.animation_current_loop];
	argument0[@ SK_ANIMATIONSTATE.animation_previous_time] = argument0[SK_ANIMATIONSTATE.animation_current_time];
	argument0[@ SK_ANIMATIONSTATE.animation_previous_timeLast] = argument0[SK_ANIMATIONSTATE.animation_current_timeLast];
	argument0[@ SK_ANIMATIONSTATE.animation_current] = sk_anim_next;
	argument0[@ SK_ANIMATIONSTATE.animation_current_loop] = argument0[SK_ANIMATIONSTATE.animation_next_loop];
	var sk_anim_next_time = argument0[SK_ANIMATIONSTATE.animation_next_time];
	if(sk_anim_next_time>=0){
		argument0[@ SK_ANIMATIONSTATE.animation_current_time] = argument0[SK_ANIMATIONSTATE.animation_next_time];
		argument0[@ SK_ANIMATIONSTATE.animation_current_timeLast] = 0;
	}
	// reset mixing alpha
	argument0[@ SK_ANIMATIONSTATE.mixAlpha] = 0;
} else {
	var sk_dt = argument1*argument0[SK_ANIMATIONSTATE.playbackRate];
	if(sk_dt<0){ sk_dt = -sk_dt; }
	// update time
	argument0[@ SK_ANIMATIONSTATE.animation_previous_timeLast] = argument0[SK_ANIMATIONSTATE.animation_previous_time];
	argument0[@ SK_ANIMATIONSTATE.animation_current_timeLast] = argument0[SK_ANIMATIONSTATE.animation_current_time];
	argument0[@ SK_ANIMATIONSTATE.animation_previous_time] += sk_dt;
	argument0[@ SK_ANIMATIONSTATE.animation_current_time] += sk_dt;
	// update mix
	var sk_mix = argument0[SK_ANIMATIONSTATE.mixAlpha];
	if(sk_mix<1){
		argument0[@ SK_ANIMATIONSTATE.mixAlpha] = min(sk_mix+sk_dt*sk_animationState_get_animation_mix(argument0,sk_anim_prev,sk_anim_current),1);
	}
}
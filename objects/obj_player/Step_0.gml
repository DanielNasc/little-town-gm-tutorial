/// @description Insert description here
// You can write your code in this editor

moveRight = keyboard_check(vk_right)
moveLeft = keyboard_check(vk_left)
moveUp = keyboard_check(vk_up)
moveDown = keyboard_check(vk_down)

// Calculate movement
vx = (moveRight - moveLeft) * walkSpeed;
vy = (moveDown - moveUp) * walkSpeed;

// If idle
if (vx == 0 && vy == 0) {
	switch dir {
		case 0: sprite_index = spr_player_idle_right; break;
		case 1: sprite_index = spr_player_idle_up; break;
		case 2: sprite_index = spr_player_idle_left; break;
		case 3: sprite_index = spr_player_idle_down; break;
	}
}
else {
	x += vx;
	y += vy;
	
	// right
	if (vx > 0) {
		sprite_index = spr_player_walk_right;
		dir = 0;
	// left
	} else if (vx < 0) {
		sprite_index = spr_player_walk_left;
		dir = 2;
	// down
	} else if (vy > 0) {
		sprite_index = spr_player_walk_down;
		dir = 3;
	// up
	} else {
		sprite_index = spr_player_walk_up;
		dir = 1;
	}
}

// depth sorting

depth =- y
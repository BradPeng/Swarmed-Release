if (!mouse_check_button(mb_left)) {
    grab = false;
}

if (grab) {
	// Mouse dragging logic for vertical movement
    if ((mouse_y + yy < bottom_limit) && (mouse_y + yy > top_limit)) {
        y = mouse_y + yy;
    } else if (mouse_y + yy > bottom_limit) {
        y = bottom_limit;
    } else if (mouse_y + yy < top_limit) {
        y = top_limit;
    }
}

// Handle mouse scroll wheel for vertical movement
if (mouse_wheel_up()) {
    y -= mouse_scroll_amount;
    if (y < top_limit) {
        y = top_limit;
    }
} else if (mouse_wheel_down()) {
    y += mouse_scroll_amount;
    if (y > bottom_limit) {
        y = bottom_limit;
    }
}

// Calculate percentage based on vertical movement
percentage = round(((y - top_limit) / (bottom_limit - top_limit)) * 100);

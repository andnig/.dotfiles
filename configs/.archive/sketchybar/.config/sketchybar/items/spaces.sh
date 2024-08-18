#!/usr/bin/env sh

export SPACE_CLICK_SCRIPT="yabai -m space --focus \$SID 2>/dev/null"

sketchybar --add space space_template left \
	--set space_template icon.color=0xffcba6f7 \
	icon.highlight_color=0xfffab387 \
	label.drawing=off \
	drawing=on \
	updates=on \
	associated_display=1 \
	label.font="$FONT:Black:10.0" \
	icon.font="Font Awesome 6 Free:Solid:15.4" \
	background.corner_radius=33 \
	background.color=0xff252630 \
	background.height=33 \
	click_script="$SPACE_CLICK_SCRIPT" \
	ignore_association=on \
	icon.padding_left=0 \
	icon.padding_right=64 \
	background.padding_right=-24 \
	background.padding_left=-24 \
	\
	--clone spaces_1.terminal space_template \
	--set spaces_1.terminal associated_space=1 \
	icon=⬤ \
	script="$PLUGIN_DIR/space.sh" \
	icon.padding_left=8 \
	\
	--clone spaces_1.browser space_template \
	--set spaces_1.browser associated_space=2 \
	icon=⬤ \
	script="$PLUGIN_DIR/space.sh" \
	\
	--clone spaces_1.email space_template \
	--set spaces_1.email associated_space=3 \
	icon=⬤ \
	drawing=on \
	script="$PLUGIN_DIR/space.sh" \
	\
	--clone spaces_1.notes space_template \
	--set spaces_1.notes associated_space=4 \
	icon=⬤ \
	script="$PLUGIN_DIR/space.sh" \
	\
	--clone spaces_1.misc1 space_template \
	--set spaces_1.misc1 associated_space=5 \
	icon=⬤ \
	script="$PLUGIN_DIR/space.sh" \
	\
	--clone spaces_2.nine space_template \
	--set spaces_2.nine associated_space=6 \
	icon=⬤ \
	script="$PLUGIN_DIR/space.sh" \
	icon.padding_right=0 \
	\
	--add bracket spaces_1 \
	spaces_1.label \
	spaces_1.terminal \
	spaces_1.browser \
	spaces_1.email \
	spaces_1.notes \
	spaces_1.misc1 \
	spaces_1.nine \
	spaces_1.label \
	spaces_1.terminal \
	spaces_1.browser

#!/bin/sh

workspace_list=$(swaymsg -p -t get_workspaces | grep Workspace)
all_workspaces=$(echo "${workspace_list}" | sed -e 's,^Workspace \([0-9]*\).*,\1,')
focused_workspace=$(echo "${workspace_list}" | grep focused | sed -e 's,^Workspace \([0-9]*\).*,\1,')

for workspace in ${all_workspaces}; do
	echo "moving ${workspace} to the right"
	swaymsg workspace ${workspace}
	swaymsg move workspace to output right
done

echo "focusing workspace ${focused_workspace}"
swaymsg workspace ${focused_workspace}


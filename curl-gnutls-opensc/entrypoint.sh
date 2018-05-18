#!/bin/bash
set -e
set -o pipefail

init(){
	local pcscd_running=$(ps -aux | grep [p]cscd)
	if [ -z "$pcscd_running" ]; then
		pcscd --debug --apdu
		pcscd --hotplug
	fi
}

init

"$@"

#!/bin/sh
# ..main script file..
#
# -------------------------------------------------------------------------
#  "Any sufficiently advanced technology is indistinguishable from magic."
#                                                  -- Arthur C. Clarke
# -------------------------------------------------------------------------
#set -evx # verbose debug output

# "exception/trap handling"
###########################################################################
banner=">> Cluster environment initialization -"
fail() {
	# arg: 1 - custom error message
	# arg: 2 - file
	# arg: 3 - line number
	# arg: 4 - exit status
	echo "$banner ERROR: $1."
	[[ ${2+defined} && ${3+defined} && ${4+defined} ]] && \
	echo "$banner file: $2, line number: $3, exit code: $4. exiting!"
} ; trap 'fail "caught signal"' HUP KILL QUIT
###########################################################################
# fail() function stanza:
#   fail "custom message" $0 ${LINENO} $?
###########################################################################

# exit for root login shells or if already initialised
###########################################################################
[[ `id -u` -eq 0 ]] && return
[[ $__env_init__complete ]] && return

# source configuration files and components (modular functions/variables)
###########################################################################
[ -d /etc/env_init/conf.d ] || fail "no conf.d directory found" $0 ${LINENO} $?
[ -d /etc/env_init/components.d ] || fail "no components.d directory found" $0 ${LINENO} $?

for k in `ls /etc/env_init/conf.d`; do
	. /etc/env_init/conf.d/$k || fail "failed to parse configuration '$k'" $0 ${LINENO} $?
done
for k in `ls /etc/env_init/components.d`; do
	{	# if the component is configured to be loaded and exists, load it
		[[ "$load_components" == *"$k"* ]] || continue
		. /etc/env_init/components.d/$k 
	} || fail "failed to load component '$k'" $0 ${LINENO} $?
done
export __env_init__complete=1
###########################################################################

#EOF

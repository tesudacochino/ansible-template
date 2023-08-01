#!/bin/bash

function show_time {
	local num=$1
	local min=0
	local hour=0
	local day=0
	if((num>59));then
		((sec=num%60))
		((num=num/60))
		if((num>59));then
			((min=num%60))
			((num=num/60))
			if((num>23));then
				((hour=num%24))
				((day=num/24))
			else
				((hour=num))
			fi
		else
			((min=num))
		fi
	else
		((sec=num))
	fi

	timer_show2=""
	if((day>0));then
		timer_show2="${day}d "
	fi
	if((hour>0));then
		timer_show2="${timer_show2}${hour}h "
	fi
	if((min>0));then
		timer_show2="${timer_show2}${min}m "
	fi
	if((sec>0));then
		timer_show2="${timer_show2}${sec}s "
	fi
}

function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  local timer_show=$((SECONDS - timer))

  timer_show2=""
  if (("$timer_show" > 0)); then
    show_time ${timer_show}
  fi

  unset timer
}

trap 'timer_start' DEBUG
PROMPT_COMMAND=timer_stop

PS1="${L_PURPLE}"'$timer_show2'"$PS1"


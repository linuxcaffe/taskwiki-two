#!/bin/bash

# meta
# two = Task Wiki Open
# this script is project-centric, that is to say that
# wiki files are related most to the project attribute.
# TODO allow other attributes to be used, with [attribute:] 
# the attribute is presumed to be "project"
# This will allow wiki files to be created for other attributes,
# like "tag:" or your favorite UDA

#####################################################
### edit the following to match your own preferences;
### TaskWiki setup;
TASKWIKI_ROOT=~/.task/wiki
FILE_EXT=wiki
### vim-template setup;
TEMPLATE_DIR=~/.vim/template
TEMPLATE_PREFIX=template
TEMPLATE_EXT=wiki
### vim options
VIM_OPTS='-c :Tagbar'
### expected task attributes (not working yet);
# DIRS='project|area|tag'

#####################################################
### edit the following if you know what you're doing;
USAGE='Usage: two [proj_name | attribute:[value] | -g string | -l [name] | -t [template] | -h]'
ATTRIB=project
FILE=''
FILTER=''
TASKWIKI_INDEX_FILE=$TASKWIKI_ROOT/index.$FILE_EXT
# TODO check for TASKWIKI_ROOT envar
# TODO figure out -c NERDtree $FILES vim_option
# TODO load `task _projects` matrix, for constraints and tab-completion

if [[ "$1" == '' ]]; then
	ACTION=root_index

elif [[ "$1" =~ [$DIRS]+:$ ]]; then
	ATTRIB=`echo $1 | cut -d: -f1`
	ACTION=attrib_index

elif [[ "$1" == -h ]]; then
	echo '        Task Wiki Open
    '$USAGE
echo -e '
    with no other args, opens .task/wiki/index.wiki

  -h  shows help (you are looking at it)

  -l  show tree list of wiki files

  -g  grep the taskwiki root for string

  -t list (if no other arguments) or edit template file
  '
  exit 0

elif [[ "$1" == -l ]]; then
	ACTION=list

elif [[ "$1" == -g ]]; then
	ACTION=grep
	shift

elif [[ "$1" == -t ]]; then
	if [[ $TEMPLATE_DIR == '' ]]; then
		echo 'the template directory has not been defined!'
		exit 1
	fi
	ACTION=template
	shift

fi

if [[ $ACTION == 'root_index' ]]; then
	vi $VIM_OPTS $TASKWIKI_INDEX_FILE
	exit 0

elif [[ $ACTION == 'attrib_index' ]]; then
	vi $VIM_OPTS $TASKWIKI_ROOT/$ATTRIB/index.$FILE_EXT
	exit 0

elif [[ $ACTION == 'list' ]]; then
	if [[ "$2" == '' ]]; then
		# TODO BUG! the following only works from ~/
		# otherwise listing path is confused
		tree -P *.$FILE_EXT -R $TASKWIKI_ROOT/
		exit 0
	fi
	tree -P $2*.wiki -R $TASKWIKI_ROOT/
	# TODO print corresponding numbers
	# TODO select N) from list
	exit 0

elif [[ $ACTION == 'grep' ]]; then
	#GREP_COUNT=`grep -irc --exclude=.*.swp --exclude=*.html $1 $TASKWIKI_ROOT/*`
	#echo $GREP_COUNT' files found'
	grep -inrT --color=always --exclude=.*.swp --exclude=*.html $1 $TASKWIKI_ROOT/* | sed s,$TASKWIKI_ROOT/,../,
	#grep -ilnr $1 $TASKWIKI_ROOT/*
	# TODO strip out $TASKWIKI_ROOT from list
	# TODO get grep line numbering working
	# TODO select N) from list
	exit 0

elif [[ $ACTION == 'template' ]]; then
	if [[ "$1" == '' ]]; then
		tree $TEMPLATE_DIR
		exit 0
	fi
	vi $TEMPLATE_DIR/$TEMPLATE_PREFIX.$1.$TEMPLATE_EXT
	exit 0
fi

# TODO sanity checks
FILE=$1
if [[ "$2" != '' ]]; then
	echo 'too many arguments!'
	echo $USAGE
	exit 1
fi

if [[ "$1" =~ [0-9a-zA-Z]+:[0-9a-zA-Z]+ ]]; then
	ATTRIB=$(echo $1 | cut -d: -f1)
	FILE=$(echo $1 | cut -d: -f2)
	# if [[ $ATTRIB != [$DIRS]+ ]]; then
	# echo $ATTRIB' directory does not exist yet'
	# # TODO "create it now?"
	# exit 1
	# fi
fi
if [[ "$1" =~ \+[0-9a-zA-Z]+ ]]; then
	ATTRIB=tag
	FILE=$(echo $1 | cut -d+ -f2)
fi

vi $VIM_OPTS $TASKWIKI_ROOT/$ATTRIB/$FILE.$ATTRIB.$FILE_EXT
ATTRIB=project
exit 0

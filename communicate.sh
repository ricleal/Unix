#!/bin/sh
# This is a comment

executable="/home/leal/git/Unix/Debug/Unix"
named_pipe=`mktemp -u`

echo "Communicating with process ${executable} with pid ${process_pid}."

# Exec

mkfifo ${named_pipe}
${executable} < ${named_pipe} &
#process_pid=`pgrep ${executable}`
process_pid=$!


echo "test 1" > ${named_pipe}
echo "test 2" > ${named_pipe}

kill -INT ${process_pid}
rm ${named_pipe}

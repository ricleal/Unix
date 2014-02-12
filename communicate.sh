#!/bin/sh
# This is a comment

executable="/net/serhom/home/cs/richard/Free_Lamp81/START_lamp -nws"

in_pipe=`mktemp -u`
out_pipe=`mktemp`

echo "Communicating with process ${executable} with pid ${process_pid}."

# Exec
mkfifo ${in_pipe}
${executable} < ${in_pipe} > ${out_pipe} &
touch ${in_pipe}

#process_pid=`pgrep ${executable}`
process_pid=$!


echo "Executable running with pid ${process_pid}. Use ${in_pipe} for communication."


tail -f ${out_pipe}

# in other term
echo "print,'Hello world'" > ${in_pipe}

#kill -INT ${process_pid}
#rm ${named_pipe}

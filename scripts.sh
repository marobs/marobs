semantlepls () {
    FILL=""
    for i in {1..20}
    do
        FILL+="$(( $RANDOM % 10 ))"
    done
    WORD=`sort -R ~/Desktop/5+words.txt | head -1 | tr -c -d "[:alnum:]"`
    FULL="$WORD$FILL"
    ENCODED=`echo ${FULL:0:19} | base64`
    echo "https://semantle.com/?word=$ENCODED"
}

workon () {
    if [ "$#" -eq 1 ] && ! [ -z "${1##*/*}" ]
    then
        cdls /google/src/cloud/$USER/$1/google3
    else
        cdls /google/src/cloud/$USER/$@
    fi
}

myclients () {
    ls -l /google/src/cloud/marobs
}

helpme() {
    echo "Your citc clients live in /google/src/cloud/USER. Try"
    echo "\n"
    echo "  workon [workspace_name]"
    echo "\nIf you need to look up a workspace name, try\n"
    echo "  myclients"
    echo "\n"
    echo "to jump to the base directory of google3 in the specific workspace. For more commands try"
    echo "\n"
    echo "  commands"
}

function commands () {
  echo "Commands:"
  echo "  gts         - git status"
  echo "  tmux_attach - attaches to a tmux2 session called 'macpro'"
  echo "  tmux_create - creates a tmux2 session called 'macpro'"
  echo ""
  echo "  cex [command] - runs the provided command in the current directory on cloudtop"
  echo "  build_cleaner - runs build_cleaner in the current directory on cloudtop"
  echo ""
  echo ""
  echo "  cdg  - changes directory to google head"
  echo "  cdh  - changes directory to marobs google home (where citc clients live)"
  echo "  cdtt - changes directory to google head at the traceability tool home dir"
  echo ""
  echo "  fftu - alias for blaze running ftu with special config. Should be run from /google/src/head/depot/google3"
  echo "\n"
  echo "From admin_apnea_scripts.sh:"
  echo "  admin_assessment  [unencoded_id] - checks the provided user's current sleep apnea assessment"
  echo "  admin_assessments [unencoded_id] - checks the provided user's sleep apnea assessments"
  echo "  admin_eligibility [unencoded_id] [ip_address] - checks apnea elgibility for the speicified user and ip addr"
  echo "\n"
  echo "From scripts.sh:"
  echo "  semantlepls        - generates a url for a random semantle word"
  echo "  workon [workspace] - changes dirs into the specified workspace"
  echo "  helpeme            - provides a help message around using workon"
}

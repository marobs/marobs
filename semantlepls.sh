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

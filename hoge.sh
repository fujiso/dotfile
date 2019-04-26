for i in `ls $HOME/.zprezto/runcoms/ | egrep -v "^README.md"`
do
    echo $i
done

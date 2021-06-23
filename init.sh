#bin/bash
### SET HOOKS
git config core.hooksPath ./hooks/
echo -e "set hooks"
SDK=mmwave_sdk*
AUTO=mmwave_automotive*
INDU=mmwave_industrial_*
PWD=`pwd`

# built file without dictionary
shopt -s extglob

one_layer_search(){
	re=$(find . \
			-maxdepth 1 \
            -type d \
            -name "$1" \
        )
	echo $re
}

create_file(){
    mkdir $1/.hiddendir
    echo -e "mkdir $1/.hiddendir"
    mv $1/.hiddendir $1/hooks
    echo -e "mv $1/.hiddendir hooks"
}

result=$(one_layer_search $SDK)
create_file $SDK
cp ./hooks/* $result/hooks/
SDK_PATH=("$result")
echo -e "cp ./hooks/* $result/hooks/"

result=$(one_layer_search $AUTO)
create_file $AUTO
cp ./hooks/* $result/hooks/
echo -e "cp ./hooks/* $result/hooks/"

result=$(one_layer_search $INDU)
create_file $INDU
cp ./hooks/* $result/hooks/
echo -e "cp ./hooks/* $result/hooks/"

### source *.sh
# echo -e "$SDK_PATH/packages/scripts/unix"
# cd $SDK_PATH/packages/scripts/unix
# cat ./setenv.sh
# source ./setenv.sh
# echo -e "cd $PWD"
# cd $PWD

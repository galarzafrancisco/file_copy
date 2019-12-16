#!/bin/bash

main_dir=$1

current_folder=$main_dir

echo "#!/bin/bash" > decode.sh
echo "mkdir $current_folder" >> decode.sh

for f in $(ls -R $main_dir); do
    echo Processing $f ...
    # Ignore lines ending with ":". That's a folder.
    if [[ $f == *: ]]; then
        current_folder=$(echo $f | awk '{print substr($1, 1, length($1)-1)}')
        echo "mkdir $current_folder" >> decode.sh
    else
        # Check if this item is a folder
        if [ -d "$current_folder/$f" ]; then
            echo "Ignoring $f because it is a directory"
        else
            encoded=$(base64 $current_folder/$f)
            echo "touch $current_folder/$f" >> decode.sh
            echo "echo $encoded | base64 --decode > $current_folder/$f" >> decode.sh
        fi
    fi
done

chmod +x decode.sh
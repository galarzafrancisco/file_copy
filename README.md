# file_copy
This product encodes the contents of a folder as text that can be copied and pasted into remote servers.

# Instructions
Run the encode.sh script pointing to the folder that you want to encode.
```bash
./encode.sh ./encode_this_folder
```

This will create a decode.sh script that you need to copy to the destination server and execute it there.

```bash
./decode.sh
```

The decode.sh script will replicate the folder structure of the source folder in the destination server.
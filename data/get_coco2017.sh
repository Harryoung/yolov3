#!/bin/bash

# The label file specifications are:

# 1. One row per object
# 2. Each row is class x_center y_center width height format.
# 3. Box coordinates must be in normalized xywh format (from 0 - 1). If your boxes are in pixels, divide x_center and width by image width, and y_center and height by image height.
# 4. Class numbers are zero-indexed (start from 0).


# Zip coco folder
# zip -r coco.zip coco
# tar -czvf coco.tar.gz coco

# Download labels from Google Drive, accepting presented query
filename="coco2017labels.zip"
fileid="1cXZR_ckHki6nddOmcysCuuJFM--T-Q6L"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
rm ./cookie

# Unzip labels
unzip -q ${filename}  # for coco.zip
# tar -xzf ${filename}  # for coco.tar.gz
rm ${filename}

# Download and unzip images
cd coco/images
f="train2017.zip" && curl http://images.cocodataset.org/zips/$f -o $f && unzip -q $f && rm $f
f="val2017.zip" && curl http://images.cocodataset.org/zips/$f -o $f && unzip -q $f && rm $f

# cd out
cd ../..


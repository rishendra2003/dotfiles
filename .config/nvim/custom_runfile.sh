#!/bin/sh

full_path="$1"

# Extract filename with extension
filename_ext=$(basename "$full_path")

# Extract filename and extension
filename="${filename_ext%.*}"
extension="${filename_ext##*.}"

echo "[running $filename_ext]"

if [ "$extension" = "cpp" ]; then
    start_time=$(date +%s%N)
    g++ -std=c++20 -Wall -DLOCAL "$full_path" -o "$filename.out"
    if [ $? -eq 0 ]; then
        ./"$filename.out"
        exit_code=$?
        end_time=$(date +%s%N)
        elapsed=$((end_time - start_time))
        elapsed_ms=$((elapsed / 1000000))
        echo "Execution time: ${elapsed_ms} milliseconds"
        if [ $exit_code -ne 0 ]; then
            echo "Execution failed with exit code $exit_code"
        fi
    else
        echo "Compilation failed"
    fi
elif [ "$extension" = "rs" ]; then
    start_time=$(date +%s%N)
    rustc "$filename_ext" -o "$filename"
    if [ $? -eq 0 ]; then
        ./"$filename"
        exit_code=$?
        end_time=$(date +%s%N)
        elapsed=$((end_time - start_time))
        elapsed_ms=$((elapsed / 1000000))
        echo "Execution time: ${elapsed_ms} milliseconds"
        if [ $exit_code -ne 0 ]; then
            echo "Execution failed with exit code $exit_code"
        fi
    else
        echo "Compilation failed"
    fi
else
    echo "Unsupported file extension: $extension"
fi

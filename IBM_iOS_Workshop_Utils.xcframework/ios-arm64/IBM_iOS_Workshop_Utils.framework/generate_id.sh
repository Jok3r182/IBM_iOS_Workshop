#!/bin/sh

#  generate_id.sh
#  IBM_Workshop_UI_Test
#
#  Created by Matas Paulius Dregva on 22/07/2024.
#

OUTPUT_DIR="${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app"

if [ "${TARGET_NAME}" == "IBM_iOS_WorkshopUITests" ]; then
    OUTPUT_DIR="${BUILT_PRODUCTS_DIR}/IBM_iOS_WorkshopUITests-Runner.app"
else
    OUTPUT_DIR="${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app"
fi

ENCRYPTED_FILE="id.enc"
KEY="iOS_Workshop"

echo "Output Directory: ${OUTPUT_DIR}"

mkdir -p "$OUTPUT_DIR"

if [ -f "$OUTPUT_DIR/$ENCRYPTED_FILE" ]; then
    echo "Encrypted file already exists: $OUTPUT_DIR/$ENCRYPTED_FILE"
    exit 0
fi

SERIAL_NUMBER=$(system_profiler SPHardwareDataType | awk '/Serial Number/ {print $4}')

xor_encrypt() {
    local input="$1"
    local output="$2"
    local key="$3"
    
    local key_length=${#key}
    local key_index=0

    while IFS= read -r -n1 char; do
        local ascii_code=$(printf "%d" "'$char")
        local key_code=$(printf "%d" "'${key:$key_index:1}")
        local xor_code=$((ascii_code ^ key_code))
        
        printf "%b" "$(printf "\\x%02x" "$xor_code")" >> "$output"

        key_index=$(( (key_index + 1) % key_length ))
    done < "$input"
}

TEMP_FILE=$(mktemp)

echo "$SERIAL_NUMBER" > "$TEMP_FILE"

xor_encrypt "$TEMP_FILE" "$OUTPUT_DIR/$ENCRYPTED_FILE" "$KEY"

rm "$TEMP_FILE"

if [ -f "$OUTPUT_DIR/$ENCRYPTED_FILE" ]; then
    echo "File successfully encrypted and saved as $OUTPUT_DIR/$ENCRYPTED_FILE"
else
    echo "Error: Encryption failed. File does not exist."
    exit 1
fi

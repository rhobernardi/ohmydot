yay -S arduino-cli --noconfirm

alias arduino-cli="/usr/bin/arduino-cli"

arduino-cli config init --overwrite

# Configure both esp32 and esp8266
config='
board_manager:
    additional_urls: [
        "https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json",
        "https://arduino.esp8266.com/stable/package_esp8266com_index.json",
    ]

library:
    enable_unsafe_install: true
'

echo -e "$config" > $HOME/.arduino15/arduino-cli.yaml

arduino-cli core update-index
arduino-cli core install esp8266:esp8266
arduino-cli core isntall esp32:esp32
arduino-cli lib install --git-url \
    https://github.com/bblanchon/ArduinoJson.git


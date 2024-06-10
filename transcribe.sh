###https://shinglyu.com/ai/2024/05/25/transcribe-voice-to-text-locally-with-whisper-cpp-and-raycast.html
WHISPER_CPP_PATH=/Users/mutuvi/Documents/ndizi/whisper.cpp
MODEL=models/ggml-base.en.bin
RECORDING_PATH=/Users/mutuvi/Documents/ndizi/whisper.cpp/recordings/
# RECORDING_FILE="/Users/mutuvi/Documents/ndizi/whisper.cpp/samples/jfk.wav"
# RECORDING_FILE="${RECORDING_PATH}/recording-$(date +%s).wav"
# TRANSCRIPTION_FILE="${RECORDING_FILE}.txt"
TRANSCRIPTION_FILE=txt_output/transcribed_text.txt
timeout 10s sox -d -r 16000 -c 1 -b 16 "${RECORDING_PATH}/recording-$(date +%s).wav"

cd "${WHISPER_CPP_PATH}"
# ./main -m "${MODEL}" -f "${RECORDING_FILE}" -otxt "${TRANSCRIPTION_FILE}" --language auto
./stream -m "${MODEL}" -t 2 --step 2500 --length 3000 -f "${TRANSCRIPTION_FILE}" -l auto
# ./stream -m ./models/ggml-base.en.bin -t 2 --step 5000 --length 5000 -f txt_output/en.txt

echo "Transcription:"
echo "--------------"
cat "${TRANSCRIPTION_FILE}"
echo "--------------"

# copy the file content to clipboard
pbcopy < "${TRANSCRIPTION_FILE}"
echo "Copiled to clipboard"

# echo "generate wordcloud"
python my_worldcloud.py

rm "${TRANSCRIPTION_FILE}"
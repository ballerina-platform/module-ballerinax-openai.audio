import ballerina/http;
import ballerina/io;
import ballerinax/openai.audio;

configurable string openAIKey = ?;

const string TRANSCRIBED_TEXT_FILE_PATH = "./transcribed.txt";
const string AUDIO_FILE_PATH = "./audio.mp3";
const string TRANSLATED_TEXT_FILE_PATH = "./translated.txt";

public function main(string audioURL) returns error? {
    // Creates a HTTP client to download the audio file
    http:Client audioEP = check new (audioURL);
    http:Response httpResp = check audioEP->/get();
    byte[] audioBytes = check httpResp.getBinaryPayload();
    check io:fileWriteBytes(AUDIO_FILE_PATH, audioBytes);

    // Creates an OpenAI audio client
    audio:Client openAIAudio = check new ({auth: {token: openAIKey}});

    // Creates a transcription request
    audio:CreateTranscriptionRequest transcriptionRequest = {
            file: {
                fileContent: check io:fileReadBytes(AUDIO_FILE_PATH),
                fileName: "audio.mp3"
            },
            model: "whisper-1"
    };

    // Transcribes the audio file
    audio:CreateTranscriptionResponse transcriptionResponse = check openAIAudio->/audio/transcriptions.post(transcriptionRequest);

    // Saves the transcribed text to a file
    string transcribedText = transcriptionResponse.text;
    check io:fileWriteString(TRANSCRIBED_TEXT_FILE_PATH, transcribedText);
    io:println("Transcribed text saved successfully at: ", TRANSCRIBED_TEXT_FILE_PATH);

    //Creates a translation request
    audio:CreateTranslationRequest translationRequest = {
            file: {
                fileContent: check io:fileReadBytes(AUDIO_FILE_PATH),
                fileName: "audioen.mp3"
            },
            model: "whisper-1"
        };

    // Translates the audio file
    audio:CreateTranslationResponse translationResponse = check openAIAudio->/audio/translations.post(translationRequest);

    // Saves the translated text to a file
    string translatedText = translationResponse.text;
    check io:fileWriteString(TRANSLATED_TEXT_FILE_PATH, translatedText);
    io:println("Transcribed text saved successfully at: ", TRANSLATED_TEXT_FILE_PATH);
}


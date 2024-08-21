// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/io;
import ballerinax/openai.audio;

configurable string openAIKey = ?;

const TRANSCRIBED_MEETING_TEXT_FILE_PATH = "./transcribed.txt";
const MEETING_AUDIO_FILE_PATH = "./audio.mp3";
const TRANSLATED_MEETING_TEXT_FILE_PATH = "./translated.txt";
const TRANSCRIBED_MEETING_AUDIO_FILE = "audio.mp3";
const TRANSLATED_MEETING_AUDIO_FILE = "audioen.mp3";

public function main(string meetingAudioUrl) returns error? {
    // Creates a HTTP client to download the audio file
    http:Client audioEP = check new (meetingAudioUrl);
    http:Response httpResp = check audioEP->/get();
    byte[] audioBytes = check httpResp.getBinaryPayload();
    check io:fileWriteBytes(MEETING_AUDIO_FILE_PATH, audioBytes);

    // Creates an OpenAI audio client
    audio:Client openAIAudio = check new ({auth: {token: openAIKey}});

    // Creates a transcription request
    audio:CreateTranscriptionRequest transcriptionRequest = {
        file: {
            fileContent: check io:fileReadBytes(MEETING_AUDIO_FILE_PATH),
            fileName: TRANSCRIBED_MEETING_AUDIO_FILE
        },
        model: "whisper-1"
    };

    // Transcribes the audio file
    audio:CreateTranscriptionResponse transcriptionResponse = check openAIAudio->/audio/transcriptions.post(transcriptionRequest);

    // Saves the transcribed text to a file
    string transcribedText = transcriptionResponse.text;
    check io:fileWriteString(TRANSCRIBED_MEETING_TEXT_FILE_PATH, transcribedText);
    io:println("Transcribed text saved successfully at: ", TRANSCRIBED_MEETING_TEXT_FILE_PATH);

    //Creates a translation request
    audio:CreateTranslationRequest translationRequest = {
        file: {
            fileContent: check io:fileReadBytes(MEETING_AUDIO_FILE_PATH),
            fileName: TRANSLATED_MEETING_AUDIO_FILE
        },
        model: "whisper-1"
    };

    // Translates the audio file
    audio:CreateTranslationResponse translationResponse = check openAIAudio->/audio/translations.post(translationRequest);

    // Saves the translated text to a file
    string translatedText = translationResponse.text;
    check io:fileWriteString(TRANSLATED_MEETING_TEXT_FILE_PATH, translatedText);
    io:println("Transcribed text saved successfully at: ", TRANSLATED_MEETING_TEXT_FILE_PATH);
}


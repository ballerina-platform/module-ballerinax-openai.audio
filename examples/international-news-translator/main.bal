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

const ENGLISH_NEWS_AUDIO_FILE_PATH = "./translated_news.mp3";
const DOWNLOADED_NEWS_TEXT_FILE_PATH = "./news.txt";
const TRANSLATED_NEWS_AUDIO_FILE = "englishAudio.mp3";

public function main(string newsTextUrl) returns error? {
    // Creates an HTTP client to download the text file
    http:Client textEP = check new (newsTextUrl);
    http:Response response = check textEP->/get();
    string fileContent = check response.getTextPayload();
    check io:fileWriteString(DOWNLOADED_NEWS_TEXT_FILE_PATH, fileContent);

    // Creates an OpenAI audio client
    audio:Client openAIAudio = check new ({auth: {token: openAIKey}});

    // Creates a request to convert the text into audio
    audio:CreateSpeechRequest speechRequest = {
        voice: "alloy",
        input: io:fileReadString(DOWNLOADED_NEWS_TEXT_FILE_PATH),
        model: "whisper-1"
    };

    // Convert the text to audio
    byte[] speechResponse = check openAIAudio->/audio/speech.post(speechRequest);

    // Creates a request to translate the audio to English
    audio:CreateTranslationRequest translationRequest = {
        file: {
            fileContent: speechResponse,
            fileName: TRANSLATED_NEWS_AUDIO_FILE
        },
        model: "whisper-1"
    };

    // Translate the audio to English
    audio:CreateTranslationResponse translationResponse = check openAIAudio->/audio/translations.post(translationRequest);

    // Creates a request to convert the translated english text to audio    
    audio:CreateSpeechRequest targetedSpeechRequest = {
        voice: "alloy",
        input: translationResponse.text,
        model: "whisper-1"
    };

    // Translate the english text to audio
    byte[] englishAudio = check openAIAudio->/audio/speech.post(targetedSpeechRequest);

    // Get the translated audio and save it in a '.mp3' file        
    check io:fileWriteBytes(ENGLISH_NEWS_AUDIO_FILE_PATH, englishAudio);
    io:println("Translated news saved as translated_news.mp3");
}

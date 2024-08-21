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

listener http:Listener ep0 = new (9090);

public type OkByteArray record {|
    *http:Ok;
    byte[] body;
    map<string|string[]> headers;
|};

const AUDIO_FILE_PATH = "tests/resources/audioClip.mp3";
readonly & byte[] content = check io:fileReadBytes(AUDIO_FILE_PATH);

service / on ep0 {
    # Converts a given text to speech.
    #
    # + return - OkByteArray if the operation is successful.
    resource function post audio/speech(@http:Payload CreateSpeechRequest payload) returns OkByteArray|error {
        return {
            body: content,
            headers: {"Transfer-Encoding": "chunked"}
        };
    }

    # Transcribes a given audio file.
    #
    # + return - CreateTranscriptionResponse if the operation is successful.
    resource function post audio/transcriptions(http:Request request) returns CreateTranscriptionResponse {
        CreateTranscriptionResponseJson mockTranscriptionResponse = {
            text: "The"
        };

        return mockTranscriptionResponse;
    }

    # Translates a given text.
    #
    # + return - CreateTranslationResponse if the operation is successful.
    resource function post audio/translations(http:Request request) returns CreateTranslationResponse {
        CreateTranslationResponseJson mockTranslationResponse = {
            text: "The"
        };

        return mockTranslationResponse;
    }
}

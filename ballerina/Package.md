## Overview

[OpenAI](https://openai.com/), an AI research organization focused on creating friendly AI for humanity, offers the [OpenAI API](https://platform.openai.com/docs/api-reference/introduction) to access its powerful AI models for tasks like natural language processing and image generation.

The `ballarinax/openai.audio` package offers APIs to connect and interact with [audio related endpoints of OpenAI REST API v1](https://platform.openai.com/docs/api-reference/audio/create) providing access to various models developed by OpenAI for audio-related tasks.

## Setup guide

To use the OpenAI Connector, you must have access to the OpenAI API through a [OpenAI Platform account](https://platform.openai.com) and a project under it. If you do not have a OpenAI Platform account, you can sign up for one [here](https://platform.openai.com/signup).

#### Create a OpenAI API Key

1. Open the [OpenAI Platform Dashboard](https://platform.openai.com).

2. Navigate to Dashboard -> API keys
![navigate-api-key-dashboard](https://github.com/e19166/module-ballerinax-openai.audio/blob/main/docs/setup/resources/navigate-api-key-dashboard.png)

3. Click on the "Create new secret key" button
![api-key-dashboard](https://github.com/e19166/module-ballerinax-openai.audio/blob/main/docs/setup/resources/api-key-dashboard.png)

4. Fill the details and click on Create secret key
![create-new-secret-key](https://github.com/e19166/module-ballerinax-openai.audio/blob/main/docs/setup/resources/create-new-secret-key.png)

5.  Store the API key securely to use in your application
![saved-key](https://github.com/e19166/module-ballerinax-openai.audio/blob/main/docs/setup/resources/saved-key.png)

## Quickstart

To use the `OpenAI Audio` connector in your Ballerina application, update the `.bal` file as follows: 

### Step 1: Import the module

Import the `openai.audio` module.

```ballerina
import ballerinax/openai.audio;
```

### Step 2: Instantiate a new connector

Create a `audio:ConnectionConfig` with the obtained API Key and initialize the connector.

```ballerina
configurable string apiKey = ?;

final images:Client openAIAudio = check new ({
    auth: {
        token: apiKey
    }
});
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

#### Transcribe audio into input language
```ballerina
public function main(string fileName) returns error? {
    byte[] fileContent = check io:fileReadBytes(fileName);
    audio:CreateTranscriptionRequest request = {
        model: "whisper-1",
        file: {fileContent, fileName}
    };

    audio:CreateTranscriptionResponse response =
        check OpenAIAudio->/audio/transcriptions.post(request);
}
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The `OpenAI Audio` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/module-ballerinax-openai.audio/tree/main/examples/), covering the following use cases:

1. [International-news-translator](https://github.com/ballerina-platform/module-ballerinax-openai.audio/tree/main/examples/International-news-translator) - Converts a text news given in any language to english
2. [Meeting-transcriber-and-translatoe](https://github.com/ballerina-platform/module-ballerinax-openai.audio/tree/main/examples/Meeting-transcriber-and-translator) - Converts an audio given in a different language into text in input language and english

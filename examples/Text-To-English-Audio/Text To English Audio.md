## Text To English Audio

This Ballerina program takes a text file of any language from a given URL, transcribes the text into audio using OpenAI's Whisper model, translates the generated audio into English, and then converts the translated English text back into audio. Finally, it saves the translated audio as an .mp3 file on the local system. This use case is useful for creating podcasts or audio content in English from text available in another language.

## Prerequisites

### 1. Generate a API key

Refer to the [Setup guide](https://central.ballerina.io/ballerinax/openai.audio/latest#setup-guide) to obtain the API key.

### 2. Configuration

Create a `Config.toml` file in the example's root directory as follows:

```bash
openAIKey = "<API key>"
```

## Run the example

Execute the following command to run the example:

```bash
bal run
```
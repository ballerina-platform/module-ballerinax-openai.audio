## Meeting transcriber and translator

This use case downloads a audio file of meeting in different language from a given URL, transcribes its content to text using OpenAI's Whisper model, and then translates the meeting audio file to english. This use case is useful for Automated Meeting Transcription and translation 

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
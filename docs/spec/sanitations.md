_Author_:  @e19166 \
_Created_: 2024/08/06 \
_Updated_: 2024/08/09 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from OpenAI Audio. 
The OpenAPI specification is obtained from The OpenAPI specification is obtained from the [OpenAPI specification for the OpenAI API](https://github.com/openai/openai-openapi/blob/master/openapi.yaml).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. **Removed the `default:null` property from the below schemas**:

   - **Changed Schemas**: `CreateCompletionRequest`,`ChatCompletionStreamOptions`,`CreateChatCompletionRequest`

   - **Original**:
      - default: `null`

   - **Updated**:
      - Removed the `default` parameter 

   - **Reason**: This change is done as a workaround for ballerina openapi tool not allowing to generate the client until the openAPI tool supports v3.1.x schemas

2. **Modified the specifications to use named schemas instead of inline schemas**

   - **Changed Path definitions**:
   `/audio/translations`,
   `/audio/transcriptions`

   - **Original**:
   ```bash
      - oneOf:
         - $ref: "#/components/schemas/CreateTranscriptionResponseJson"
         - $ref: "#/components/schemas/CreateTranscriptionResponseVerboseJson"

      - oneOf:
         - $ref: "#/components/schemas/CreateTranslationResponseJson"
         - $ref: "#/components/schemas/CreateTranslationResponseVerboseJson"
   ```

   - **Updated**:
      - Created a new `schema` in the `components` field and added the reference in the `/audio/transcription` path definition
      ```bash
         - $ref: "#/components/schemas/CreateTranscriptionResponse"
      
         - CreateTranscriptionResponse:
            - oneOf:
               - $ref: "#/components/schemas/CreateTranscriptionResponseJson"
               - $ref: "#/components/schemas/CreateTranscriptionResponseVerboseJson"
      ```

      - Created a new `schema` in the `components` field and added the reference in the `/audio/translation` path definition
      ```bash
         - $ref: "#/components/schemas/CreateTranslationResponse"

         - CreateTranslationResponse:
            - oneOf:
               - $ref: "#/components/schemas/CreateTranslationResponseJson"
               - $ref: "#/components/schemas/CreateTranslationResponseVerboseJson"
      ```

   - **Reason**: This modification has been implemented to enhance the readability and user-friendliness of record naming conventions.
 
3. Modified the generated util function `createBodyParts` as a workaround for the issue https://github.com/ballerina-platform/ballerina-library/issues/6872. This change should be reverted once the issue is fixed in a future release (2201.9.4 or later).


## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/openapi.yaml --mode client --tags Audio --license docs/license.txt -o ballerina
```
Note: The license year is hardcoded to 2024, change if necessary.

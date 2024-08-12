import ballerina/http;

listener http:Listener ep0 = new (9090);
public type OkByteArray record {|
    *http:Ok;
    byte[] body;
    map<string|string[]> headers;
|};

service / on ep0 {
    // Mock implementation for /audio/speech
    resource function post audio/speech(@http:Payload CreateSpeechRequest payload) returns OkByteArray|error {
        
        // Mock response: audio file content
        byte[]|error content = [255,243,228,196,0,98,76,57,216,18,230,112,116,8,6,118,53,249,142,19,131,75,16,161,40,200,64,51,17,142,141,72,152,48,225,28,205,37,179,28,14,76,254,119,50,56,172,231,108,66,32,65,5,204,28,68,233,116,212,40,206,24,16,1,148,96,56,68,132,2,4,2,33,77,19,13,30,204,81,203,116,106,8,97,222,124,210,6,108,178,224,163,22,16,192,48,204,17,36,37,8,96,96,2,188,89,102,153,156,74,208,211,220,20,54,253,61,204,33,5,33,65,11,128,93,133,72,89,194,208,23,241,28,21,188,182,238,58,231,93,110,147,104,255,196,220,69,224,90,70,154,169,222,120,97,153,180,37,3,88,236,237,173,170,120,122,50,227,173,52,240,107,200,208,103,168,4,7,104,23,192,8,96,228,62,235,221,64,31,87,45,97,219,250,174,90,194,34,162,98,46,135,1,118,78,214,165,107,143,90,129,168,58,61,128,66,93,182,190,134,102,165,25,128,0,17,169,65,8,92,128,64,46,8,178,69,183,102,8,233,177,57,19,56,81,117,188,159,96,195,2,144,234,188,238,196,117,71,11,224,166,101,199,103,101,215,71,57,125,63,93,7,89,33,28,71,242,102,142,24,114,36,16,196,57,44,164,110,106,238,97,125,175,119,253,208,114,20,1,204,92,239,61,137,67,175,16,162,160,107,14,228,98,196,173,156,48,197,72,177,28,72,156,73,136,73,159,201,217,169,10,85,150,157,75,242,194,180,97,244,107,148,174,27,59,163,228,149,76,215,91,15,72,114,229,169,123,134,186,217,194,128,36,34,150,55,55,29,195,101,253,153,103,110,218,115,162,186,1,209,254,53,45,68,196,80,131,159,249,36,58,187,225,232,114,188,252,97,227,80,52,199,88,236,61,137,170,48,98,32,108,196,32,122,140,1,5,236,201,236,133,76,16,133,192,200,21,52,205,26,193,116,202,96,117,140,102,207,124,206,100,115,76,57,203,204,202,188,135,76,110,68,36,101,4,98,88,9,223,112,231,19,60,136,71,228,68,51,11,132,76,38,41,12,47,198,132,32,50,33,255,243,228,196,73,108,252,57,252,84,247,50,116,120,16,128,6,30,24,0,52,5,4,152,44,34,20,9,24,88,52,64,49,51,12,12,229,175,211,98,164,204,254,93,14,62,52,162,16,2,64,35,129,103,32,101,158,6,17,132,139,24,207,135,135,47,170,248,89,226,1,100,10,218,187,0,197,200,217,196,15,19,171,72,2,28,44,34,85,131,32,59,164,3,42,112,194,33,56,12,169,196,49,142,120,240,197,221,83,101,4,125,147,36,72,167,173,224,82,200,38,88,237,54,181,148,212,80,84,1,80,13,88,107,148,156,11,212,91,241,107,12,119,204,211,145,149,172,182,233,48,186,151,74,61,151,145,253,121,148,108,168,16,56,4,205,78,183,238,101,118,178,57,145,24,112,212,203,114,68,133,164,156,170,190,157,61,87,132,33,118,160,17,159,39,115,203,0,172,165,44,45,188,58,180,137,6,119,19,221,205,144,175,245,202,92,97,224,29,215,90,26,69,7,73,64,210,77,218,101,235,193,251,47,130,101,172,121,116,22,253,37,72,112,137,214,200,27,68,239,81,105,245,60,204,151,35,75,97,14,98,138,192,174,149,35,88,104,212,207,27,70,128,236,62,247,153,253,235,82,230,8,142,240,251,196,251,187,141,73,164,173,118,238,196,98,80,210,57,196,28,9,66,236,75,119,109,241,151,62,208,226,249,77,54,180,187,84,206,36,150,138,118,142,140,125,57,23,168,200,35,64,75,19,189,194,83,119,144,20,34,143,184,40,158,193,214,9,139,46,245,92,177,85,181,181,96,228,32,179,132,215,128,217,194,60,51,213,59,107,10,166,146,78,68,17,129,131,170,30,241,147,160,36,41,146,83,7,169,235,46,250,201,171,148,49,241,167,190,237,41,207,98,131,73,131,74,16,121,149,246,45,145,137,172,33,65,141,44,34,185,144,142,24,249,134,116,21,169,129,188,25,169,136,124,27,129,181,4,89,150,102,49,138,32,153,142,194,40,16,21,47,41,129,128,24,8,30,18,1,18,236,193,208,76,192,0,60,194,96,8,193,240,232,194,195,64,49,163,49,255,243,228,196,104,119,20,57,240,8,255,116,144,230,102,48,57,67,48,176,206,50,196,254,48,52,172,49,116,102,6,2,166,40,5,177,115,0,80,73,58,212,11,4,48,128,138,162,75,208,33,10,16,225,129,163,89,165,46,104,145,171,226,99,11,144,180,65,130,208,196,4,17,93,180,181,240,33,48,142,102,12,17,145,28,80,92,210,200,7,10,49,160,21,89,33,158,248,100,24,5,65,156,86,66,60,72,16,28,80,41,124,145,13,47,8,133,162,131,47,80,54,44,92,34,19,34,132,140,58,48,230,160,17,102,64,17,137,14,37,21,46,132,68,208,97,85,228,172,105,158,167,3,146,143,161,96,228,66,135,135,22,232,202,18,116,135,128,5,134,24,83,160,164,100,69,2,2,38,242,149,150,253,146,206,23,122,149,208,11,12,47,242,201,25,0,135,4,39,18,145,46,218,215,3,0,65,80,168,164,201,77,17,33,78,180,8,129,38,38,139,239,108,50,140,96,32,77,226,194,8,194,176,197,88,137,173,57,2,151,32,208,212,84,109,64,34,145,100,132,34,194,40,114,146,140,75,90,99,13,86,81,33,141,197,221,83,54,142,94,87,249,82,47,70,238,184,162,232,248,154,207,243,160,199,84,130,152,38,250,219,67,102,244,183,111,235,24,77,166,4,238,177,21,150,152,20,44,29,139,40,114,137,47,119,225,79,177,230,15,237,217,168,187,204,69,202,104,109,213,19,87,237,247,17,126,57,47,235,54,117,230,215,42,124,177,84,137,131,147,49,194,108,114,7,146,54,220,223,23,137,175,183,21,47,118,110,195,211,180,54,209,89,173,50,167,245,180,126,26,5,85,229,42,129,21,48,234,70,187,51,169,208,234,53,209,101,197,61,158,110,202,49,191,211,90,50,206,197,70,55,220,30,210,50,168,201,40,48,136,67,250,48,248,192,216,49,18,1,218,48,45,128,5,48,105,2,188,48,59,193,153,48,107,1,121,48,68,65,251,48,37,193,102,48,13,64,186,48,24,0,48,48,2,128,8,47,64,32,0,116,1,10,0,56,36,1,80,8,0,255,243,228,196,94,122,244,57,240,1,95,224,0,83,0,56,3,83,2,132,76,112,35,49,96,212,200,224,211,17,136,78,60,3,52,153,72,195,233,64,83,120,20,31,47,73,119,80,121,80,33,18,101,50,151,33,87,45,37,226,226,1,64,130,32,154,165,98,9,230,137,47,224,224,41,106,185,43,217,25,83,125,192,153,17,128,71,1,50,228,187,66,20,166,44,240,112,12,72,10,146,108,221,18,135,128,131,64,8,113,29,20,155,206,163,175,50,177,160,20,152,24,89,134,34,0,9,129,1,33,193,224,64,37,90,70,128,69,64,26,165,2,128,225,198,150,240,43,18,56,175,71,99,37,84,87,108,205,20,104,153,194,133,138,129,98,128,80,3,56,120,96,82,0,104,64,65,14,38,19,4,41,177,131,0,164,0,129,32,10,21,142,6,3,128,43,61,59,68,97,3,2,4,39,82,156,194,128,99,1,132,75,248,94,112,128,32,128,30,131,67,0,245,1,34,17,195,129,0,161,16,8,144,6,132,194,217,24,40,8,140,203,145,146,152,36,2,149,197,0,4,175,94,163,192,68,238,47,26,160,14,1,6,2,11,70,149,203,20,68,4,99,246,70,64,12,117,60,217,61,130,232,169,99,190,181,25,67,32,117,211,133,4,195,64,149,214,28,22,93,1,0,118,166,156,104,128,188,12,12,4,32,0,179,69,12,38,9,163,146,79,180,169,232,49,79,49,20,31,80,149,72,128,55,249,200,109,149,209,127,248,156,173,162,1,90,35,92,64,34,226,102,12,77,116,187,13,239,89,68,56,225,70,30,116,98,97,232,215,66,68,7,97,145,52,58,185,44,60,128,24,226,43,51,172,252,69,153,218,117,192,169,10,193,29,251,80,19,66,78,72,250,224,47,68,181,217,128,152,132,121,18,48,64,134,65,92,138,112,200,242,198,24,216,118,121,100,253,198,13,213,26,125,180,154,199,14,2,142,96,228,5,166,124,66,54,14,13,147,50,241,27,48,98,7,131,4,240,133,34,14,131,12,16,33,42,1,153,131,8,45,24,1,130,17,96,94,18,169,216,255,243,228,196,69,114,52,58,28,49,158,216,0,194,81,201,130,8,12,149,92,218,76,85,180,144,5,97,93,169,121,132,11,46,177,128,35,124,52,48,181,48,20,177,200,174,182,144,35,169,39,167,98,108,93,53,93,101,254,101,176,71,40,124,126,17,134,32,142,113,106,48,204,161,170,74,33,184,105,224,74,135,213,189,144,38,185,225,209,155,185,25,141,7,25,42,169,206,217,156,73,140,59,20,143,85,220,3,82,6,129,157,216,245,216,202,177,153,138,121,179,184,154,152,185,150,157,154,139,137,177,143,153,225,4,174,93,110,28,236,162,211,207,101,134,77,75,224,74,245,40,217,43,122,97,134,70,164,68,108,169,166,126,134,103,162,38,50,14,96,135,198,152,60,125,121,243,81,182,144,228,181,232,18,0,91,175,195,197,15,70,233,225,113,186,204,5,135,202,165,247,157,5,161,0,29,156,105,165,130,158,60,153,68,17,135,4,29,189,9,199,182,155,41,57,186,33,11,12,18,0,154,123,61,200,62,98,1,143,222,149,67,211,181,101,125,191,44,144,74,117,99,178,154,243,142,59,246,205,222,201,19,52,145,73,169,32,19,107,91,51,240,211,25,33,48,81,3,56,26,57,120,83,105,85,52,144,116,190,4,0,9,6,26,41,169,158,166,154,56,121,165,39,26,193,164,174,228,17,65,102,95,59,185,61,152,110,55,150,125,152,135,115,179,247,55,34,119,33,182,230,174,95,233,44,24,224,200,155,170,87,176,119,93,254,117,29,217,102,80,251,188,191,5,131,14,49,184,153,144,4,86,105,137,134,144,96,28,72,98,100,38,62,7,136,24,92,198,74,204,196,37,106,153,170,25,149,135,153,208,112,144,8,24,60,203,6,12,72,42,137,0,8,32,6,30,30,39,15,8,134,33,12,4,110,1,135,79,49,252,69,177,144,224,1,135,160,233,19,6,101,81,116,114,193,224,107,236,74,68,49,164,225,139,65,50,51,25,26,142,152,94,10,129,69,83,81,49,12,40,105,209,47,1,153,0,152,185,105,131,140,152,0,56,192,40,132,56,12,42,255,243,228,196,79,115,28,58,89,97,157,216,0,98,162,168,186,97,226,99,64,134,46,14,96,6,135,44,72,112,227,38,82,44,34,51,22,7,50,192,208,105,98,76,152,136,12,125,21,19,64,198,203,140,208,72,192,132,151,201,40,24,92,12,42,12,24,30,92,20,132,48,145,100,89,46,208,132,6,40,68,24,220,10,5,11,46,10,18,22,93,71,244,3,136,130,196,128,80,202,42,188,68,33,65,64,247,157,128,51,150,166,194,208,152,132,182,103,182,163,15,197,91,209,144,196,220,33,13,48,80,231,40,192,66,149,85,232,124,76,4,40,20,20,24,10,200,105,88,195,114,81,80,104,18,67,7,8,97,40,149,97,29,105,76,53,74,65,34,70,66,52,97,32,101,170,34,3,65,50,59,3,65,130,192,232,67,0,170,99,34,19,28,0,49,96,0,192,167,197,40,219,153,105,16,74,254,40,187,56,42,128,37,96,64,72,208,106,208,88,168,163,2,205,65,50,200,105,25,4,33,65,2,42,172,152,115,73,28,66,4,131,105,144,248,168,178,253,72,231,204,24,14,93,119,145,33,204,0,41,114,24,40,176,64,66,34,33,171,10,48,81,145,208,22,202,161,73,144,132,185,19,185,8,116,132,32,15,19,13,36,0,46,202,206,47,107,166,177,88,131,244,228,0,128,87,152,16,21,224,137,10,1,171,134,162,158,140,189,176,166,138,123,10,1,175,72,105,150,181,22,160,205,31,73,98,177,175,166,86,155,12,68,68,4,143,45,193,174,185,9,162,202,214,240,112,18,238,143,186,115,233,200,207,32,228,252,90,44,85,199,125,31,86,106,165,215,30,245,210,224,55,25,232,251,120,164,189,234,102,77,93,96,163,234,48,15,4,195,10,80,148,49,167,29,35,131,55,159,48,218,18,51,9,97,6,49,111,89,67,96,224,175,48,254,5,240,64,135,153,87,51,225,134,24,236,24,250,134,201,137,144,183,26,3,138,105,131,176,19,0,2,84,194,132,57,12,17,0,48,192,84,4,12,4,5,8,56,67,76,7,0,4,4,5,166,11,65,52,10,255,243,228,196,85,123,228,58,68,1,222,224,0,1,4,249,48,227,112,48,10,6,26,152,72,82,109,4,224,32,192,13,54,27,159,110,106,20,1,158,1,134,204,124,157,116,202,99,17,8,40,30,102,35,121,66,124,28,155,49,40,80,211,225,179,4,128,199,65,96,64,136,56,134,24,15,48,185,8,152,154,56,13,12,27,16,148,204,2,9,21,19,152,212,100,12,1,152,164,122,101,162,73,137,12,6,61,58,153,92,104,102,18,1,146,4,198,36,5,24,248,44,140,130,32,0,36,50,56,4,11,3,139,248,44,28,110,236,161,40,155,171,91,86,198,176,208,93,16,176,16,24,12,81,160,168,84,193,226,82,248,152,120,58,132,226,1,1,130,65,70,30,27,152,44,30,96,240,66,146,75,120,121,161,191,49,248,125,250,161,149,210,55,6,238,196,100,143,218,246,112,217,131,170,220,18,49,64,209,92,0,3,10,129,26,192,40,12,179,84,176,68,3,18,9,40,42,149,48,69,252,211,147,86,33,121,250,156,162,206,47,111,27,125,183,122,191,127,153,101,90,164,246,80,236,145,175,66,30,6,133,44,119,95,76,33,235,239,242,115,53,39,134,92,227,54,116,139,87,46,34,148,168,2,58,50,43,66,64,22,8,139,140,21,165,35,112,92,2,44,1,108,110,0,144,108,56,40,8,0,3,64,101,0,145,208,26,7,39,82,92,168,184,92,2,28,17,149,198,208,136,181,136,73,28,0,148,0,220,182,158,236,67,197,64,40,88,0,149,197,255,10,128,208,109,16,96,116,152,122,153,68,15,6,169,114,160,126,91,176,144,17,253,87,81,228,24,76,150,104,155,139,81,215,21,0,160,242,128,181,246,122,229,36,66,50,144,0,136,0,105,56,66,0,7,9,25,217,111,18,96,100,2,92,198,156,242,211,151,4,26,6,83,90,48,12,0,195,1,48,20,48,54,9,83,82,134,114,48,110,4,83,0,64,44,48,231,45,129,232,141,48,81,2,19,0,193,54,49,200,54,83,5,96,110,48,139,3,19,36,5,8,52,225,8,3,7,0,131,131,255,243,228,196,56,111,156,58,76,0,247,54,144,103,220,28,24,188,104,97,64,25,181,68,230,78,4,135,3,136,14,134,140,29,152,120,32,52,46,2,179,136,136,6,41,11,2,19,198,250,9,141,3,76,74,58,62,162,40,199,197,19,44,150,140,147,221,12,97,128,131,102,32,118,111,175,65,18,106,124,199,221,13,92,37,191,48,101,51,99,12,12,110,81,211,49,54,24,2,84,198,56,154,106,98,166,6,0,96,70,166,154,44,102,160,198,18,2,112,171,6,244,106,100,162,70,89,36,115,168,161,81,177,131,3,9,95,50,18,82,244,24,129,152,8,176,136,5,9,72,130,227,174,192,160,25,126,235,164,99,94,100,205,112,192,64,80,78,6,4,17,157,152,96,121,40,88,20,32,196,7,204,160,36,196,66,202,196,131,132,139,246,0,2,129,19,161,30,223,170,8,212,49,53,36,140,90,95,44,58,25,135,87,145,127,97,44,165,18,149,226,194,47,228,176,117,85,136,56,1,5,25,64,208,59,65,98,14,156,65,236,114,226,208,52,74,175,39,102,96,142,103,223,251,24,106,229,76,187,114,165,37,37,204,49,163,158,166,162,206,183,41,228,145,120,196,118,9,156,126,37,246,35,178,61,188,83,13,188,82,102,243,76,128,153,130,198,113,24,37,35,169,15,50,166,176,214,25,107,80,148,185,16,151,242,22,214,120,148,37,201,65,87,85,195,172,195,18,161,2,43,101,64,26,203,46,102,73,30,243,64,207,1,111,93,37,50,118,83,9,107,182,97,32,4,161,87,236,130,38,95,120,202,193,160,123,245,29,165,86,246,230,203,26,250,43,178,199,41,232,30,2,131,219,229,150,247,89,178,165,138,216,141,236,208,184,202,218,149,130,192,68,32,117,32,10,128,12,96,20,3,166,2,97,108,101,210,239,102,12,160,108,10,5,147,5,208,189,53,42,7,194,207,24,17,129,121,165,153,112,24,31,129,33,128,136,7,24,23,189,241,166,216,102,151,188,196,168,227,96,75,76,20,13,49,120,204,195,217,243,42,136,211,156,195,100,195,119,158,196,255,243,228,196,76,114,140,58,76,4,247,52,158,134,96,32,17,156,224,225,2,196,65,48,106,128,196,202,16,113,108,70,83,62,61,200,221,134,163,71,140,76,71,11,55,100,48,202,0,160,72,132,198,82,115,59,130,204,18,5,11,131,77,78,48,74,194,1,169,144,7,38,91,8,160,28,193,195,240,199,195,216,85,1,131,72,70,47,3,133,193,102,42,45,153,240,216,98,192,137,132,4,198,174,87,154,120,36,99,146,33,133,81,198,195,46,161,32,192,178,53,56,0,8,198,5,134,10,11,167,40,84,52,88,32,145,64,132,115,120,220,98,35,107,72,88,50,52,134,51,46,48,8,81,154,64,12,24,84,50,98,155,24,32,195,39,140,145,176,40,192,128,198,116,25,108,4,1,80,230,92,53,238,193,27,147,29,82,116,49,135,221,154,208,195,162,193,224,73,58,94,44,152,4,144,17,108,229,138,241,17,154,130,61,167,75,138,195,84,217,150,171,123,184,191,239,193,42,102,235,186,168,40,252,180,53,78,250,36,91,91,137,193,47,77,60,146,37,46,203,39,229,201,116,162,242,237,168,228,173,125,208,82,91,144,83,97,25,142,202,109,212,146,76,82,217,139,114,91,47,138,74,170,64,113,71,221,118,195,12,53,173,74,216,59,97,103,76,241,163,180,39,2,129,150,61,240,195,196,229,68,223,41,99,168,221,86,1,117,186,45,53,242,107,176,226,234,115,152,220,65,179,186,204,153,107,77,191,172,161,30,155,107,149,93,167,10,52,221,26,147,94,102,235,157,64,224,166,238,156,77,205,9,204,209,141,237,124,184,105,69,13,57,201,184,170,233,56,196,211,8,28,57,12,83,205,26,7,137,35,130,31,166,130,131,170,116,18,17,197,0,131,249,135,228,125,11,4,168,24,3,76,2,7,196,215,112,34,71,64,88,193,0,24,205,106,130,188,194,120,0,204,13,129,60,194,93,254,13,214,64,152,195,4,22,76,5,65,92,202,212,20,13,200,10,47,153,156,50,231,13,8,152,24,44,1,55,155,181,24,98,80,41,32,128,211,11,99,31,134,255,243,228,196,84,115,188,58,72,4,247,52,188,71,140,166,13,44,30,236,110,105,18,1,142,83,103,212,73,159,141,170,52,154,51,32,184,225,134,114,104,233,16,168,221,7,0,160,88,72,6,96,160,129,179,6,238,89,119,204,200,128,51,216,88,179,38,12,27,15,54,204,72,10,81,83,25,27,12,158,22,25,17,152,240,212,33,61,25,16,92,98,20,48,93,146,110,145,137,162,68,70,89,32,26,130,22,98,145,139,142,104,131,1,145,196,5,4,51,26,143,76,20,34,80,106,112,32,81,158,46,160,32,41,80,42,155,88,48,68,65,206,132,149,152,96,71,12,57,139,4,96,16,27,233,70,124,65,96,89,197,112,110,155,152,134,170,136,20,196,196,143,1,16,14,30,92,18,32,44,141,31,33,196,9,175,135,242,165,35,185,65,27,80,53,78,139,73,149,25,145,32,243,78,70,131,14,37,14,42,82,88,14,173,243,109,49,94,177,118,194,129,74,177,96,212,185,208,80,21,222,138,74,141,36,152,232,144,6,136,178,31,151,154,65,14,73,157,5,215,23,111,151,35,69,88,105,4,4,222,88,123,103,225,185,37,53,38,116,80,236,130,85,65,51,10,156,121,93,220,170,217,110,50,10,146,38,90,254,175,22,75,79,131,206,188,157,102,119,41,140,79,186,206,149,73,91,227,19,128,228,200,217,12,48,199,81,86,178,197,9,120,153,107,124,205,25,36,50,149,16,20,6,255,83,201,255,40,9,246,165,166,78,22,236,234,47,117,109,146,175,118,172,243,52,150,13,20,107,109,37,21,20,27,6,28,210,88,250,185,72,116,223,136,41,39,125,124,179,165,212,173,206,226,151,182,85,178,222,49,6,157,70,119,173,246,48,194,81,112,192,108,69,19,0,209,81,51,72,0,99,0,112,14,48,17,0,179,50,176,33,14,0,148,190,48,62,62,3,69,176,118,48,47,1,65,144,35,49,44,21,193,160,84,22,4,83,4,96,24,48,151,0,69,66,24,1,166,22,192,48,185,212,100,192,104,55,7,129,172,72,2,80,220,193,208,37,139,0,14,255,243,228,196,88,94,20,58,88,0,246,153,56,96,116,1,65,3,236,99,170,4,64,32,47,48,60,12,35,1,224,73,7,2,65,124,207,29,99,16,69,91,204,234,83,168,181,76,151,137,167,112,20,23,15,153,81,167,44,65,146,38,95,209,225,70,216,27,198,98,80,157,181,166,224,184,178,35,37,224,202,120,53,40,73,88,156,101,161,59,200,67,152,177,128,46,131,197,138,164,68,134,24,145,105,30,144,161,2,26,251,126,223,171,245,43,140,168,40,9,89,32,178,168,243,72,72,195,5,73,99,130,88,80,200,113,48,105,160,81,224,82,66,217,21,7,23,177,255,88,144,91,193,26,120,25,221,118,234,209,92,168,26,30,118,219,230,153,47,123,218,196,113,224,107,204,149,76,221,214,78,217,94,41,43,182,172,185,57,12,241,112,60,14,124,130,152,116,84,218,53,137,87,40,166,207,99,211,134,80,186,234,233,214,146,211,160,134,30,165,254,102,214,254,251,205,231,98,91,5,242,62,179,207,109,29,57,138,56,18,169,122,4,103,106,31,60,62,62,29,142,135,234,7,171,77,226,42,172,31,211,8,37,119,52,178,149,45,86,46,72,103,135,101,71,215,30,41,59,53,20,148,161,90,38,194,96,125,107,70,114,13,113,13,178,209,244,81,29,111,19,85,76,65,77,69,85,85,85,10,18,94,18,208,5,193,108,198,244,249,140,11,192,36,32,4,76,22,200,28,201,144,16,76,4,128,100,192,120,36,204,119,133,248,193,8,14,68,32,180,96,240,136,70,54,161,56,96,62,6,102,2,129,172,99,160,24,225,192,166,68,1,198,2,226,4,163,202,102,99,9,71,16,50,143,193,195,102,106,228,76,154,96,160,0,4,195,134,69,30,13,49,56,163,56,182,61,242,194,33,131,133,100,3,64,5,192,200,139,78,216,64,100,33,77,140,168,128,136,144,190,106,128,35,37,28,99,130,197,5,97,236,0,64,24,10,181,5,0,191,166,56,38,44,38,0,17,48,100,115,163,54,49,130,112,2,41,222,65,24,88,193,64,177,149,170,21,141,56,192,255,243,228,196,171,95,172,58,92,6,246,222,220,145,129,209,100,18,49,34,16,164,161,174,180,145,189,230,73,247,137,78,219,70,6,96,226,228,161,2,17,0,193,243,50,15,80,227,27,20,11,3,2,143,144,60,56,0,40,192,121,41,212,132,185,62,134,57,174,96,168,146,230,154,26,150,107,100,48,156,24,76,241,26,58,196,244,155,0,234,175,32,96,60,8,233,45,16,179,128,75,38,7,169,80,169,67,132,178,189,94,78,73,162,141,181,52,201,14,51,199,250,212,63,156,102,152,188,75,199,188,61,63,141,13,141,244,73,39,128,231,86,200,216,129,31,55,219,60,117,101,155,97,199,75,101,201,154,14,228,180,210,183,48,63,157,81,7,14,230,128,222,242,172,235,215,88,131,51,11,147,232,108,210,50,43,99,53,101,153,245,178,233,92,212,195,25,170,60,90,98,60,239,84,237,237,231,251,216,135,139,44,176,39,66,218,246,224,241,20,174,103,101,137,42,76,48,16,0,67,1,16,35,48,122,19,99,128,231,229,48,234,9,3,1,112,181,48,151,121,147,48,224,245,48,131,7,131,4,98,64,51,110,53,147,1,96,74,48,122,7,131,49,248,188,50,212,2,227,10,176,8,0,26,241,153,232,186,152,94,31,153,162,58,154,23,55,152,100,7,16,2,134,13,57,70,39,9,224,161,200,192,240,20,202,166,116,48,76,32,27,12,74,125,12,24,9,197,128,211,22,67,179,209,114,131,0,129,211,16,71,211,67,251,48,51,34,96,176,84,96,106,44,32,52,204,24,11,76,18,12,140,35,84,12,61,9,4,65,33,133,69,209,133,65,154,162,11,130,102,31,153,139,60,193,80,16,192,227,48,194,96,172,0,1,24,30,53,153,234,101,24,104,13,131,2,195,20,7,211,35,198,131,27,67,115,14,2,227,147,198,83,34,135,193,81,84,194,51,8,193,192,128,72,97,20,22,204,122,23,76,74,0,133,66,144,194,8,24,2,40,218,176,3,64,2,32,40,0,44,199,132,18,140,12,64,14,26,102,199,146,45,50,230,79,101,19,150,252,219,255,243,228,196,254,116,108,58,64,0,247,116,188,159,17,238,59,169,128,134,3,18,27,152,128,169,229,102,76,120,212,0,168,26,170,44,162,247,161,36,186,44,189,14,8,34,22,22,4,6,209,199,67,13,5,49,196,90,88,112,16,128,0,98,104,154,102,1,168,128,40,96,36,138,115,128,2,15,46,32,42,23,10,6,48,215,69,136,173,213,128,66,165,225,60,217,149,61,36,86,77,56,238,82,203,101,117,173,204,103,115,85,127,149,172,221,255,185,36,169,122,205,170,122,124,241,223,100,124,191,115,120,103,67,157,140,37,181,108,215,191,77,140,196,244,183,41,85,88,204,229,248,236,154,93,126,82,241,114,83,26,153,175,59,61,86,172,220,190,71,30,141,70,44,101,27,169,105,255,205,222,127,169,112,127,157,157,70,226,180,81,137,153,185,185,52,244,141,214,152,134,161,136,156,173,254,180,239,68,155,232,50,47,0,90,153,142,87,128,37,143,52,205,29,21,76,65,77,69,51,46,49,48,48,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,62,198,128,88,120,20,76,29,193,116,216,220,142,12,51,64,40,192,12,21,77,36,240,76,161,29,76,29,12,1,44,33,224,162,17,131,32,56,16,41,51,95,133,53,48,115,48,40,184,54,195,112,55,4,172,26,25,12,119,60,204,51,35,144,28,96,72,190,102,104,212,1,1,1,1,105,137,229,9,147,226,129,131,160,121,130,65,241,140,226,137,135,129,9,131,33,153,137,108,57,160,134,25,132,65,177,142,163,153,190,1,233,134,65,73,134,99,249,199,220,26,153,129,128,152,141,53,154,194,104,4,160,203,1,12,220,89,42,12,72,40,194,207,204,224,204,194,129,140,44,68,197,132,76,80,52,66,84,100,136,38,128,26,12,18,50,227,35,109,136,43,27,51,26,115,177,196,53,179,227,112,46,49,201,115,134,91,1,68,24,177,24,240,32,136,84,56,124,88,180,8,10,212,75,192,5,4,44,249,48,43,103,113,16,146,145,64,32,165,47,18,19,48,65,83,255,243,228,196,225,109,60,58,80,4,247,118,60,48,37,50,67,99,87,29,50,165,19,3,7,22,0,12,83,49,112,49,144,32,72,10,87,56,81,117,52,77,23,234,163,104,235,72,217,84,145,57,212,22,4,77,117,50,24,2,112,22,17,75,209,184,187,50,98,245,161,138,11,6,6,1,65,223,132,66,105,234,233,153,129,0,23,138,238,114,103,214,96,48,1,57,93,36,180,99,112,137,152,151,47,85,199,82,254,79,213,185,57,63,118,114,63,47,175,24,125,115,164,198,60,221,25,124,138,29,111,233,222,104,26,98,146,154,93,53,90,87,95,59,115,56,208,114,139,46,99,87,26,75,19,52,150,101,149,159,202,218,161,181,247,103,233,226,22,40,123,61,170,213,101,178,186,183,103,38,96,154,9,85,200,106,35,15,56,16,60,150,81,29,171,65,26,179,57,132,17,76,239,79,82,99,13,71,239,219,135,38,31,232,132,70,8,137,110,99,25,53,61,20,20,76,65,77,69,121,129,64,16,152,10,132,161,128,105,245,155,21,18,33,131,176,36,152,5,2,249,133,18,165,24,154,129,185,132,168,77,152,234,40,17,147,136,31,24,32,7,145,143,80,121,26,11,142,113,133,216,61,152,254,36,113,158,40,194,152,15,129,113,135,96,182,25,20,8,249,130,56,72,152,36,129,249,129,16,173,152,17,1,248,240,9,24,62,139,57,135,144,23,152,50,128,216,0,36,76,88,195,152,193,116,9,140,9,66,92,194,200,61,140,64,192,40,192,196,24,76,82,136,136,199,32,160,64,130,34,97,194,13,230,50,192,38,103,224,129,145,132,198,254,94,142,1,204,112,54,49,202,104,202,225,163,9,2,0,130,163,45,145,129,201,241,8,8,202,229,35,21,128,64,0,131,28,16,76,32,111,48,72,248,197,102,243,55,9,77,80,58,51,24,212,223,133,147,100,132,76,84,28,61,202,176,228,103,67,59,34,131,144,102,85,74,24,212,128,99,112,81,143,193,230,13,9,152,24,30,96,96,17,134,129,102,3,12,151,161,51,194,128,80,192,242,75,24,0,10,255,243,228,196,251,115,148,58,64,2,247,25,56,90,100,67,11,138,12,24,0,49,24,104,196,225,129,67,33,128,1,230,71,21,152,232,54,101,98,136,84,0,0,13,35,97,135,192,75,44,16,0,75,84,241,134,163,178,216,26,39,13,51,53,52,104,80,75,50,96,208,250,152,41,171,203,196,21,67,84,229,121,0,128,114,238,173,119,53,75,19,134,4,40,9,5,2,111,169,111,145,57,49,133,128,37,214,22,129,17,52,108,26,3,237,2,39,49,121,143,89,9,215,127,47,87,199,33,56,118,85,170,11,130,48,37,230,79,182,137,15,9,69,166,75,74,33,94,123,17,42,236,157,27,73,203,14,70,242,235,31,158,161,29,175,90,118,68,141,26,65,217,25,24,78,104,189,117,39,232,10,65,178,199,218,76,180,150,154,148,76,141,121,96,196,248,175,39,39,102,42,97,76,120,235,74,210,234,179,201,68,114,119,84,118,117,98,213,86,88,70,39,151,76,42,76,65,77,69,24,12,3,128,208,195,76,165,77,67,99,244,217,113,12,204,121,6,72,199,205,12,205,129,14,132,192,248,113,76,72,134,224,207,88,27,2,128,166,100,102,154,70,71,228,168,100,214,158,162,140,144,110,58,155,70,239,97,128,100,212,69,39,172,8,26,49,90,114,2,145,194,83,198,119,19,154,253,52,103,116,193,183,88,70,130,113,154,180,184,111,183,81,135,90,102,194,51,156,34,242,110,194,57,189,46,167,116,37,24,37,152,114,108,41,213,121,198,133,87,152,77,78,113,69,169,142,2,38,108,7,152,172,108,97,193,49,157,26,228,200,130,97,209,148,207,193,139,115,4,134,140,58,25,48,80,56,64,115,50,88,200,198,98,99,6,164,204,236,53,48,72,188,200,198,35,46,128,204,204,60,49,49,84,145,194,101,193,24,165,36,225,76,240,20,96,213,169,99,62,139,12,44,2,51,112,220,193,160,33,192,9,132,3,233,136,20,13,15,8,146,129,79,217,2,19,32,42,144,225,203,138,198,167,176,146,147,28,80,4,144,105,209,54,35,20,212,233,22,50,245,255,243,228,196,251,115,140,58,48,4,247,52,188,13,154,162,217,1,66,22,109,21,5,128,64,40,56,251,55,44,101,178,185,75,97,130,227,241,6,65,64,254,184,210,89,60,137,124,22,80,40,48,196,14,7,24,0,18,14,6,90,144,226,6,72,225,132,0,97,3,15,12,79,130,218,170,100,116,16,8,109,91,4,156,189,107,221,95,193,202,178,65,35,139,103,156,9,49,55,34,175,27,220,252,174,212,142,87,26,201,249,94,239,244,94,17,27,113,37,15,101,3,241,25,135,220,125,96,228,68,36,21,126,103,57,28,63,217,28,81,251,148,83,58,149,103,242,171,65,148,244,11,51,57,43,139,211,92,162,165,249,46,56,69,165,82,183,150,89,12,69,225,49,90,89,12,61,29,147,210,195,205,118,27,125,223,247,250,236,86,85,36,130,96,168,228,8,236,60,18,9,68,33,246,164,105,12,10,197,3,164,231,197,239,92,138,76,70,95,120,102,15,120,235,85,76,65,77,69,51,46,49,48,48,85,85,85,85,85,120,32,31,133,88,228,212,0,50,76,24,137,88,212,133,3,12,103,201,136,202,204,76,140,122,198,8,195,36,106,140,68,0,188,194,184,78,76,106,5,204,195,168,31,76,59,10,60,203,176,112,76,71,66,128,194,176,25,76,42,131,36,235,224,141,22,244,197,113,142,156,224,193,145,12,72,28,197,226,77,57,116,203,152,140,196,76,197,208,13,144,212,206,139,198,87,76,49,180,213,146,140,200,32,219,152,206,41,112,205,190,140,77,124,197,232,71,14,76,8,116,219,133,130,192,70,46,78,24,18,97,195,165,64,216,16,132,9,7,204,16,100,179,163,197,6,30,20,1,44,48,0,96,160,89,96,125,67,67,4,70,149,76,176,132,10,48,99,0,70,121,14,96,209,38,47,62,103,136,33,18,38,32,12,97,225,64,160,153,42,18,225,3,160,141,178,142,207,32,41,186,152,129,154,131,136,5,6,50,91,195,31,3,100,101,228,6,4,24,41,128,11,115,66,181,64,131,70,72,134,89,5,145,113,90,203,128,132,226,249,51,255,243,228,196,241,113,28,58,36,2,246,242,190,166,188,216,98,238,13,44,162,47,0,69,25,18,0,128,8,152,197,152,64,164,130,129,23,60,24,58,72,144,140,20,20,202,4,194,12,0,25,140,11,65,76,32,72,1,112,146,244,182,40,83,14,33,82,143,37,178,115,36,211,93,188,255,63,112,236,101,76,85,43,178,249,200,162,79,164,181,255,126,159,198,177,29,107,21,33,75,57,211,65,86,90,163,172,234,7,128,92,151,242,92,196,159,169,200,219,184,210,162,241,56,179,154,211,88,75,96,142,191,116,207,164,130,87,11,134,163,175,252,101,236,114,87,140,220,133,181,181,9,150,67,180,240,91,93,113,95,216,85,151,226,164,24,253,193,241,168,98,70,253,97,49,27,228,5,206,201,29,230,218,180,33,249,110,49,245,244,156,172,133,75,94,73,51,215,90,37,51,45,138,68,89,18,129,44,50,25,38,179,94,140,195,78,85,11,41,80,85,210,252,189,74,9,135,25,24,26,6,42,153,137,40,121,25,18,142,33,132,152,141,152,29,12,81,141,248,47,24,145,8,56,16,65,12,57,1,32,194,60,10,12,24,195,112,195,180,47,12,34,195,8,195,252,85,140,49,195,52,196,72,25,204,22,193,240,192,40,9,136,65,172,195,64,64,204,46,129,140,4,13,6,5,224,168,96,122,5,102,17,65,122,97,116,16,98,134,83,57,15,204,34,84,50,121,8,197,96,115,46,41,76,220,108,55,189,40,235,117,99,80,19,14,87,102,57,106,88,194,136,147,102,62,205,168,163,50,192,80,206,168,67,52,139,144,164,195,162,128,112,152,44,15,92,140,193,224,68,16,176,48,197,2,240,81,52,195,163,163,37,141,130,10,70,12,12,132,17,76,58,76,51,9,120,199,64,211,27,159,13,78,192,53,169,160,170,99,51,241,36,148,100,100,178,33,140,193,8,72,48,168,80,72,36,12,5,150,181,84,32,116,121,134,1,128,20,97,68,227,7,129,18,28,194,192,145,208,17,135,67,198,33,9,21,65,6,43,30,25,4,84,52,34,48,64,20,12,17,255,243,228,196,255,120,4,57,252,3,94,224,0,140,55,37,242,134,203,189,48,85,44,94,91,102,86,229,246,109,229,124,90,58,148,178,229,68,177,220,246,82,213,144,224,13,4,33,80,80,2,2,4,172,16,88,22,128,215,230,149,162,64,235,53,26,30,135,253,121,59,108,133,148,189,66,16,2,155,54,86,200,186,30,217,98,215,104,76,138,137,154,63,80,42,106,193,204,186,60,180,97,41,248,189,95,196,246,96,78,91,235,105,226,156,117,153,59,181,67,57,1,90,107,238,221,20,173,191,105,113,119,213,174,56,77,251,136,212,210,29,61,224,213,128,104,209,52,189,81,196,204,74,23,2,30,167,119,100,53,29,217,101,228,234,109,223,28,159,199,210,39,25,135,30,6,200,255,83,184,178,9,185,217,67,129,74,232,187,105,94,143,106,56,199,223,182,146,182,22,9,58,159,52,49,123,148,174,58,169,7,0,76,129,154,178,215,185,232,116,175,190,178,28,98,23,30,57,117,4,59,1,191,254,190,154,67,88,9,16,12,158,138,176,196,180,16,13,28,70,76,12,21,134,21,34,28,97,30,15,162,65,2,91,48,184,18,131,64,72,193,84,4,12,6,128,236,148,4,11,46,33,1,18,168,0,32,105,128,72,2,33,152,36,85,148,1,135,196,0,163,128,67,128,198,70,42,6,63,48,112,100,105,72,176,80,138,197,83,68,65,70,179,36,76,50,99,67,30,24,5,33,152,32,0,88,32,160,149,95,153,16,162,35,160,76,186,77,185,32,81,130,8,4,14,24,136,249,134,133,129,135,192,128,69,161,14,2,28,4,68,215,121,114,165,219,48,76,102,150,130,16,97,105,163,158,153,25,137,193,60,26,33,49,162,19,77,133,129,5,131,204,36,36,46,88,10,67,48,33,53,129,114,154,35,43,2,2,163,171,240,103,229,34,2,0,18,33,134,147,153,105,153,154,147,154,16,210,214,26,32,73,64,168,187,208,175,80,36,14,18,34,12,130,226,41,154,187,156,168,25,198,102,202,118,28,2,177,204,80,112,205,138,1,70,6,74,30,166,69,255,243,228,196,242,122,76,57,244,17,158,216,0,144,49,209,17,34,32,112,2,243,21,6,48,144,210,168,90,91,135,20,163,242,48,129,64,139,171,13,80,53,197,139,54,23,3,70,101,53,69,245,237,31,116,140,44,52,195,192,208,2,99,35,96,36,51,76,62,52,68,99,40,22,51,178,19,21,3,10,135,161,65,129,0,219,66,134,245,116,18,129,151,69,233,66,89,114,139,135,12,60,235,105,212,141,166,226,162,92,143,220,10,180,146,33,229,72,101,82,89,41,136,166,74,88,240,33,114,12,1,129,12,132,68,200,70,204,132,68,197,136,29,118,230,97,4,70,104,80,102,130,70,110,114,101,227,96,99,243,18,4,45,36,203,78,103,132,192,41,140,169,75,242,89,69,99,94,170,164,160,41,240,225,68,134,65,41,97,180,49,123,147,221,132,135,4,56,77,122,40,139,107,10,211,152,18,138,203,19,9,144,186,12,77,172,166,250,201,105,108,53,98,50,213,234,155,75,149,38,22,163,164,97,192,129,64,3,29,19,48,48,82,251,175,70,234,168,154,195,243,36,140,177,167,117,163,36,98,54,85,49,147,148,192,174,99,32,142,12,134,57,49,25,32,199,34,3,139,190,136,10,166,30,42,24,24,56,2,13,48,227,63,28,204,164,149,49,80,32,196,129,118,4,96,48,193,150,135,133,208,130,135,128,195,0,113,240,16,164,16,30,99,67,230,52,42,100,34,102,70,116,106,235,65,100,48,161,1,138,9,24,96,105,32,234,193,0,64,139,244,156,198,216,166,100,9,98,3,112,131,147,16,99,10,130,147,2,152,64,57,128,133,9,8,182,207,11,90,103,169,138,99,40,134,138,56,99,102,134,72,10,99,230,134,199,60,6,7,46,176,168,32,232,65,134,4,141,8,183,84,2,185,145,23,246,90,106,74,43,112,225,17,204,232,108,215,140,204,209,4,196,90,140,20,41,32,201,4,140,0,21,211,1,6,164,138,241,0,1,152,16,28,216,48,4,186,46,137,143,148,26,185,240,97,105,157,147,0,149,76,72,164,104,36,205,3,195,16,131,255,243,228,196,219,123,204,57,228,1,156,216,0,128,88,145,136,1,152,64,8,192,25,80,72,64,14,188,203,218,169,92,7,5,201,138,183,100,37,36,84,50,98,193,230,148,170,56,68,109,102,134,122,204,4,9,16,144,25,9,113,132,29,155,17,185,144,18,133,193,17,17,43,222,150,160,240,175,213,0,97,197,1,192,32,247,69,248,143,57,88,184,75,186,2,75,230,77,90,26,107,84,171,153,223,20,29,50,67,83,82,99,49,52,99,87,118,55,119,195,24,79,51,228,211,56,93,49,144,65,128,211,6,5,11,128,24,168,18,94,38,18,134,129,131,145,241,56,81,153,61,16,0,76,20,22,0,4,2,39,18,70,149,131,170,139,237,39,134,159,229,205,18,141,56,80,213,12,25,1,44,50,39,38,138,116,128,70,152,96,136,12,80,97,89,139,156,5,2,2,1,152,194,9,147,16,152,137,81,146,132,5,70,148,64,44,6,6,12,108,197,182,67,97,24,66,152,172,212,212,42,129,164,74,167,101,139,69,116,33,49,21,64,64,172,213,179,198,19,172,20,2,208,75,142,208,210,13,213,105,237,5,134,180,165,76,235,83,64,44,230,85,156,50,233,49,39,234,84,206,161,249,84,52,202,156,25,2,55,42,64,65,195,33,45,78,5,47,57,212,164,223,139,179,54,6,76,38,50,3,21,140,68,91,51,194,4,200,161,195,2,13,76,152,89,50,241,124,203,4,179,25,4,65,162,195,42,156,12,246,118,49,176,68,193,35,3,31,143,12,98,28,38,13,152,16,34,97,0,58,212,2,129,144,117,212,6,136,50,232,141,90,163,74,72,66,36,214,71,58,19,193,206,140,114,179,100,188,209,17,74,22,36,56,12,204,43,54,76,66,15,0,9,153,130,230,48,11,80,97,204,252,192,13,50,68,84,40,8,44,201,21,50,67,64,195,90,138,55,24,48,198,36,35,21,47,112,8,18,27,67,101,157,45,107,200,166,79,204,213,59,41,47,232,0,25,134,22,99,7,152,193,46,179,33,46,9,128,2,6,2,175,81,8,196,146,50,164,146,4,255,243,228,196,190,123,76,57,76,51,220,208,0,42,0,20,25,173,150,117,10,68,35,13,27,67,118,216,49,9,133,52,105,81,25,145,136,212,202,94,64,168,35,18,33,79,3,65,24,80,72,109,47,135,87,209,129,20,102,204,33,104,20,65,141,20,14,12,253,174,215,240,26,8,195,134,87,168,220,89,34,227,41,180,158,25,103,45,118,157,253,136,33,144,4,1,104,154,248,32,57,138,22,164,130,192,76,48,147,16,28,12,21,126,161,56,194,140,49,162,148,136,92,1,137,20,99,69,0,133,44,228,65,48,195,76,112,212,250,64,73,128,2,130,176,117,166,66,4,6,97,131,163,243,210,160,42,10,177,86,21,47,75,186,128,87,25,186,162,105,101,75,106,189,83,216,194,140,50,35,146,229,1,69,174,117,212,197,180,2,146,52,172,141,42,32,113,17,24,67,26,64,200,140,1,14,99,200,9,48,195,76,96,180,114,85,82,228,163,235,243,85,144,151,4,0,5,77,162,108,53,97,85,42,165,80,20,133,80,88,218,152,169,172,81,115,38,51,204,165,37,225,129,209,229,58,96,4,19,32,9,199,6,5,49,2,86,113,123,75,138,242,37,242,63,51,243,4,52,200,17,66,161,16,19,16,52,198,13,49,0,86,232,84,49,149,60,104,207,15,1,0,140,49,226,18,9,27,80,212,84,65,159,96,110,90,85,76,65,77,69,51,46,49,48,48,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85,85];           
        
        return {
            body: check content,
            headers: { "Transfer-Encoding": "chunked" }
        };
    }

    // Mock implementation for /audio/transcriptions
    resource function post audio/transcriptions(http:Request request) returns CreateTranscriptionResponse {
        
        // Mock response: transcription object
        CreateTranscriptionResponseJson mockTranscriptionResponse = {
            text: "The"
        };

        return mockTranscriptionResponse;
    }

    // Mock implementation for /audio/translations
    resource function post audio/translations(http:Request request) returns CreateTranslationResponse {
       
        // Mock response: translation object  
        CreateTranslationResponseJson mockTranslationResponse = {
            text: "The"
        };

        return mockTranslationResponse;
    }
}

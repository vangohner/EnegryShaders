#version 460

//attributes
in vec3 vaPosition; //vertex position
in vec2 vaUV0;
in vec4 vaColor;
in ivec2 vaUV2;

//uniforms
uniform vec3 chunkOffset;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform vec3 cameraPosition;
uniform mat4 gbufferModelViewInverse;
uniform int worldTime;

out vec2 texCoord;
out vec3 foliageColor;
out vec2 lightMapCoords;

void main() {

    texCoord = vaUV0;
    foliageColor = vaColor.rgb;
    lightMapCoords = vaUV2 * (1.0 / 256.0) + (1.0 / 32.0);

    // displace the vaPosition.y based on wave function here if desired
    float wavePos = vaPosition.x * 0.5 + vaPosition.z * 0.5 + float(worldTime) * 0.1;
    float waveOffset = sin(wavePos) * 0.01 + sin(wavePos * 0.5) * 0.2;
    vec3 displacedPosition = vaPosition + vec3(0.0, waveOffset * 0.5, 0.0);

    gl_Position = projectionMatrix * modelViewMatrix * vec4(displacedPosition + chunkOffset, 1);
}
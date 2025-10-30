#version 460 compatibility

out vec2 lmcoord;
out vec2 texcoord;
out vec4 glcolor;

void main() {
    const float scale = 0.5;
    vec4 scaledVertex = gl_Vertex;
    scaledVertex.xyz *= scale;
    gl_Position = gl_ProjectionMatrix * gl_ModelViewMatrix * scaledVertex;
    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    glcolor = gl_Color;
}

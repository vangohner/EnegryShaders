#version 460 compatibility

out vec2 lmcoord;
out vec2 texcoord;
out vec4 glcolor;

void main() {
    const float scale = 0.5;
    mat4 modelViewScaled = gl_ModelViewMatrix;
    modelViewScaled[0].xyz *= scale;
    modelViewScaled[1].xyz *= scale;
    modelViewScaled[2].xyz *= scale;
    gl_Position = gl_ProjectionMatrix * modelViewScaled * gl_Vertex;
    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    glcolor = gl_Color;
}

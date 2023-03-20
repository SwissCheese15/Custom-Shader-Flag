uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
// Dynamic uniform form js
uniform vec2 uFrequency;
uniform float uTime;

// dynamic data that is defferent for each vertex
attribute vec3 position;
attribute float aRandom;
// uv attribute to create varying for textures
attribute vec2 uv;

// data passed to the fragment shader
varying float vRandom;
// uv varying for textures
varying vec2 vUv;
// variable to animate colors
varying float vElevation;

void main() {
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    // // Create waves
    // modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime * 3.0) * 0.05;
    // modelPosition.z += sin(modelPosition.y * uFrequency.y) * 0.05;

    // Also creating waves but with a variable that can be sent to fragment
    float elevation = sin(modelPosition.x * uFrequency.x - uTime * 3.0) * 0.05;
    elevation += sin(modelPosition.y * uFrequency.y) * 0.05;

    modelPosition.z += elevation;

    // // creating random spikes with the random values set as Attribute
    // modelPosition.z += aRandom * 0.1;
    
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    // reseting varying to attribute value
    vRandom = aRandom;
    vUv = uv;
    vElevation = elevation;
}
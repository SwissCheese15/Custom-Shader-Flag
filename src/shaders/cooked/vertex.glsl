uniform vec2 uFrequency;
uniform float uTime;

attribute float aRandom;

varying float vRandom;
varying vec2 vUv;
varying float vElevation;

void main() {

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    float elevation = sin(modelPosition.x * uFrequency.x - uTime * 3.0) * 0.05;
    elevation += sin(modelPosition.y * uFrequency.y) * 0.05;

    modelPosition.z += elevation;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    vUv = uv;
    vElevation = elevation;
}
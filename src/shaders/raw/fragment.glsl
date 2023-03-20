precision mediump float;
// capturing dynamic uniforms
uniform vec3 uColor;
uniform sampler2D uTexture;

// capturing the varying value to use
varying float vRandom;
// for texture
varying vec2 vUv;
// for color animation based on height
varying float vElevation;

void main()
{
    // texture
    vec4 textureColor = texture2D(uTexture, vUv);
    textureColor.rgb *= vElevation * 2.0 + 0.8;
    gl_FragColor = textureColor;

    // // dynamic color
    // gl_FragColor = vec4(uColor, 0.8);

    // // using the varying for color
    // gl_FragColor = vec4(0.0, vRandom * 0.6, vRandom, vRandom);
}

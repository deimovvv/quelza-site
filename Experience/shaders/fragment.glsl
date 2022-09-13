uniform float time;
uniform sampler2D uImage;
uniform float hoverState;

varying float vNoise;
varying vec2 vUv;
varying vec3 vNormal;



void main() {
    // gl_FragColor = vec4(0.,0.,1., 1.);

    vec2 newUv = vUv;

            vec2 p = newUv;
			float x = hoverState;
			x = smoothstep(.0,1.0,(x*2.0+p.y-1.0));
			vec4 f = mix(
				texture2D(uImage, (p-.5)*(1.-x)+.5), 
				texture2D(uImage, (p-.5)*x+.5), 
				x);



   

    

    newUv = vec2(newUv.x, newUv.y  + 0.01*sin(newUv.x*10. + time*0.5));

     vec4 myimage = texture2D(
        uImage,
        newUv
    );


    gl_FragColor = vec4(vNoise,0.,0.,1.);
    gl_FragColor = f;
    gl_FragColor = myimage + 0.1*vec4(vNoise);
    gl_FragColor = myimage;





    





    
}
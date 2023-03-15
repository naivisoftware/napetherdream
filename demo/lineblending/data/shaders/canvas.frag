// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.

#version 450 core

// input  
in vec3 pass_Uvs;
in vec4 pass_Color;

// output
out vec4 out_Color;

// uniform sampler inputs
uniform sampler2D	mCanvas;

// uniform buffer inputs
uniform UBO
{
	uniform vec3	mColor;
} ubo;


void main() 
{
	vec2 uvs = vec2(pass_Uvs.x, pass_Uvs.y);
	vec4 canvas_color = texture(mCanvas, uvs);
	vec3 output_color = canvas_color.rgb * ubo.mColor;
	out_Color =  vec4(output_color.rgb, canvas_color.a);
}

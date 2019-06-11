// Compiled shader for Android

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "ARCore/PlaneGrid" {
Properties {
 _MainTex ("Texture", 2D) = "white" { }
 _GridColor ("Grid Color", Color) = (1.000000,1.000000,0.000000,1.000000)
 _PlaneNormal ("Plane Normal", Vector) = (0.000000,0.000000,0.000000,1.000000)
 _UvRotation ("UV Rotation", Float) = 30.000000
}
SubShader { 
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
No keywords set in this variant.
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles":
Shader Disassembly:
#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec3 _PlaneNormal;
uniform 	mediump float _UvRotation;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = _PlaneNormal.zxy * vec3(1.0, 0.0, 1.0);
    u_xlat0.xyz = _PlaneNormal.yzx * vec3(0.0, 1.0, 1.0) + (-u_xlat0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yzx * _PlaneNormal.zxy;
    u_xlat1.xyz = _PlaneNormal.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
    u_xlat16_2 = sin(_UvRotation);
    u_xlat16_3 = cos(_UvRotation);
    u_xlat16_4.x = (-u_xlat16_2);
    u_xlat16_4.y = u_xlat16_3;
    u_xlat16_4.z = u_xlat16_2;
    vs_TEXCOORD0.y = dot(u_xlat16_4.zy, u_xlat0.xy);
    vs_TEXCOORD0.x = dot(u_xlat16_4.yx, u_xlat0.xy);
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _GridColor;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat10_0 * vs_COLOR0.w;
    SV_Target0.xyz = _GridColor.xyz;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
No keywords set in this variant.
-- Hardware tier variant: Tier 2
-- Vertex shader for "gles":
Shader Disassembly:
#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec3 _PlaneNormal;
uniform 	mediump float _UvRotation;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = _PlaneNormal.zxy * vec3(1.0, 0.0, 1.0);
    u_xlat0.xyz = _PlaneNormal.yzx * vec3(0.0, 1.0, 1.0) + (-u_xlat0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yzx * _PlaneNormal.zxy;
    u_xlat1.xyz = _PlaneNormal.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
    u_xlat16_2 = sin(_UvRotation);
    u_xlat16_3 = cos(_UvRotation);
    u_xlat16_4.x = (-u_xlat16_2);
    u_xlat16_4.y = u_xlat16_3;
    u_xlat16_4.z = u_xlat16_2;
    vs_TEXCOORD0.y = dot(u_xlat16_4.zy, u_xlat0.xy);
    vs_TEXCOORD0.x = dot(u_xlat16_4.yx, u_xlat0.xy);
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _GridColor;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat10_0 * vs_COLOR0.w;
    SV_Target0.xyz = _GridColor.xyz;
    return;
}

#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
No keywords set in this variant.
-- Hardware tier variant: Tier 3
-- Vertex shader for "gles":
Shader Disassembly:
#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec3 _PlaneNormal;
uniform 	mediump float _UvRotation;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = _PlaneNormal.zxy * vec3(1.0, 0.0, 1.0);
    u_xlat0.xyz = _PlaneNormal.yzx * vec3(0.0, 1.0, 1.0) + (-u_xlat0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yzx * _PlaneNormal.zxy;
    u_xlat1.xyz = _PlaneNormal.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
    u_xlat16_2 = sin(_UvRotation);
    u_xlat16_3 = cos(_UvRotation);
    u_xlat16_4.x = (-u_xlat16_2);
    u_xlat16_4.y = u_xlat16_3;
    u_xlat16_4.z = u_xlat16_2;
    vs_TEXCOORD0.y = dot(u_xlat16_4.zy, u_xlat0.xy);
    vs_TEXCOORD0.x = dot(u_xlat16_4.yx, u_xlat0.xy);
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _GridColor;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat10_0 * vs_COLOR0.w;
    SV_Target0.xyz = _GridColor.xyz;
    return;
}

#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
No keywords set in this variant.
-- Hardware tier variant: Tier 1
-- Vertex shader for "gles3":
Shader Disassembly:
#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec3 _PlaneNormal;
uniform 	mediump float _UvRotation;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = _PlaneNormal.zxy * vec3(1.0, 0.0, 1.0);
    u_xlat0.xyz = _PlaneNormal.yzx * vec3(0.0, 1.0, 1.0) + (-u_xlat0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yzx * _PlaneNormal.zxy;
    u_xlat1.xyz = _PlaneNormal.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
    u_xlat16_2 = sin(_UvRotation);
    u_xlat16_3 = cos(_UvRotation);
    u_xlat16_4.x = (-u_xlat16_2);
    u_xlat16_4.y = u_xlat16_3;
    u_xlat16_4.z = u_xlat16_2;
    vs_TEXCOORD0.y = dot(u_xlat16_4.zy, u_xlat0.xy);
    vs_TEXCOORD0.x = dot(u_xlat16_4.yx, u_xlat0.xy);
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _GridColor;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat16_0 * vs_COLOR0.w;
    SV_Target0.xyz = _GridColor.xyz;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "gles3":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
No keywords set in this variant.
-- Hardware tier variant: Tier 2
-- Vertex shader for "gles3":
Shader Disassembly:
#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec3 _PlaneNormal;
uniform 	mediump float _UvRotation;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = _PlaneNormal.zxy * vec3(1.0, 0.0, 1.0);
    u_xlat0.xyz = _PlaneNormal.yzx * vec3(0.0, 1.0, 1.0) + (-u_xlat0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yzx * _PlaneNormal.zxy;
    u_xlat1.xyz = _PlaneNormal.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
    u_xlat16_2 = sin(_UvRotation);
    u_xlat16_3 = cos(_UvRotation);
    u_xlat16_4.x = (-u_xlat16_2);
    u_xlat16_4.y = u_xlat16_3;
    u_xlat16_4.z = u_xlat16_2;
    vs_TEXCOORD0.y = dot(u_xlat16_4.zy, u_xlat0.xy);
    vs_TEXCOORD0.x = dot(u_xlat16_4.yx, u_xlat0.xy);
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _GridColor;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat16_0 * vs_COLOR0.w;
    SV_Target0.xyz = _GridColor.xyz;
    return;
}

#endif


-- Hardware tier variant: Tier 2
-- Fragment shader for "gles3":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
No keywords set in this variant.
-- Hardware tier variant: Tier 3
-- Vertex shader for "gles3":
Shader Disassembly:
#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec3 _PlaneNormal;
uniform 	mediump float _UvRotation;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = _PlaneNormal.zxy * vec3(1.0, 0.0, 1.0);
    u_xlat0.xyz = _PlaneNormal.yzx * vec3(0.0, 1.0, 1.0) + (-u_xlat0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yzx * _PlaneNormal.zxy;
    u_xlat1.xyz = _PlaneNormal.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy;
    u_xlat16_2 = sin(_UvRotation);
    u_xlat16_3 = cos(_UvRotation);
    u_xlat16_4.x = (-u_xlat16_2);
    u_xlat16_4.y = u_xlat16_3;
    u_xlat16_4.z = u_xlat16_2;
    vs_TEXCOORD0.y = dot(u_xlat16_4.zy, u_xlat0.xy);
    vs_TEXCOORD0.x = dot(u_xlat16_4.yx, u_xlat0.xy);
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec4 _GridColor;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat16_0 * vs_COLOR0.w;
    SV_Target0.xyz = _GridColor.xyz;
    return;
}

#endif


-- Hardware tier variant: Tier 3
-- Fragment shader for "gles3":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
}
}
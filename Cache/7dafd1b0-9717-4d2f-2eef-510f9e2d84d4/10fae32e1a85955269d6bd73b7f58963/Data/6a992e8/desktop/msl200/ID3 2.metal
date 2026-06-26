#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#ifdef ColorOnOffid03
#undef ColorOnOffid03
#endif
#ifdef pbrOnOffId03
#undef pbrOnOffId03
#endif
#ifdef rimOnOffId03
#undef rimOnOffId03
#endif
#ifdef patternOnOffId03
#undef patternOnOffId03
#endif
#ifdef pngPatternId03
#undef pngPatternId03
#endif
#ifdef ColorOnOffid02
#undef ColorOnOffid02
#endif
#ifdef pbrOnOffId02
#undef pbrOnOffId02
#endif
#ifdef rimOnOffId02
#undef rimOnOffId02
#endif
#ifdef patternOnOffId02
#undef patternOnOffId02
#endif
#ifdef pngPatternId02
#undef pngPatternId02
#endif
#ifdef pbrOnOffId01
#undef pbrOnOffId01
#endif
#ifdef rimOnOffId01
#undef rimOnOffId01
#endif
#ifdef patternOnOffId01
#undef patternOnOffId01
#endif
#ifdef pngPatternId01
#undef pngPatternId01
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
return 0;
}
}
#ifndef sc_TextureRenderingLayout_Regular
#define sc_TextureRenderingLayout_Regular 0
#define sc_TextureRenderingLayout_StereoInstancedClipped 1
#define sc_TextureRenderingLayout_StereoMultiview 2
#endif
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// SCC_BACKEND_SHADER_FLAGS_END__
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 sc_FragData0 0
//output uvec4 sc_RayTracingPositionAndMask 0
//output uvec4 sc_RayTracingNormalAndMore 1
//sampler sampler Tweak_N25SmpSC 0:30
//sampler sampler Tweak_N27SmpSC 0:31
//sampler sampler greyMaskIdSmpSC 0:32
//sampler sampler intensityTextureSmpSC 0:33
//sampler sampler patternTextureId01SmpSC 0:34
//sampler sampler patternTextureId02SmpSC 0:35
//sampler sampler patternTextureId03SmpSC 0:36
//sampler sampler sc_EnvmapDiffuseSmpSC 0:37
//sampler sampler sc_EnvmapSpecularSmpSC 0:38
//sampler sampler sc_RayTracingGlobalIlluminationSmpSC 0:40
//sampler sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC 0:41
//sampler sampler sc_RayTracingRayDirectionSmpSC 0:42
//sampler sampler sc_RayTracingReflectionsSmpSC 0:43
//sampler sampler sc_RayTracingShadowsSmpSC 0:44
//sampler sampler sc_SSAOTextureSmpSC 0:45
//sampler sampler sc_ScreenTextureSmpSC 0:46
//sampler sampler sc_ShadowTextureSmpSC 0:47
//texture texture2D Tweak_N25 0:4:0:30
//texture texture2D Tweak_N27 0:5:0:31
//texture texture2D greyMaskId 0:6:0:32
//texture texture2D intensityTexture 0:7:0:33
//texture texture2D patternTextureId01 0:8:0:34
//texture texture2D patternTextureId02 0:9:0:35
//texture texture2D patternTextureId03 0:10:0:36
//texture texture2D sc_EnvmapDiffuse 0:11:0:37
//texture texture2D sc_EnvmapSpecular 0:12:0:38
//texture texture2D sc_RayTracingGlobalIllumination 0:21:0:40
//texture utexture2D sc_RayTracingHitCasterIdAndBarycentric 0:22:0:41
//texture texture2D sc_RayTracingRayDirection 0:23:0:42
//texture texture2D sc_RayTracingReflections 0:24:0:43
//texture texture2D sc_RayTracingShadows 0:25:0:44
//texture texture2D sc_SSAOTexture 0:26:0:45
//texture texture2D sc_ScreenTexture 0:27:0:46
//texture texture2D sc_ShadowTexture 0:28:0:47
//ubo float sc_BonesUBO 0:3:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:49:6304 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[5]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 400:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 496
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1088
//float4 sc_EnvmapSpecularSize 1136
//float3 sc_EnvmapRotation 1184
//float sc_EnvmapExposure 1200
//float3 sc_Sh 1216:[9]:16
//float sc_ShIntensity 1360
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2768:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float4x4 sc_PrevFrameModelMatrix 3248
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float4 weights0 3616
//float4 weights1 3632
//float4 sc_StereoClipPlanes 3664:[2]:16
//float2 sc_TAAJitterOffset 3704
//int sc_RayTracingReceiverEffectsMask 3824
//float3 sc_RayTracingOriginScale 3984
//uint sc_RayTracingReceiverMask 4000
//float3 sc_RayTracingOriginOffset 4032
//uint sc_RayTracingReceiverId 4048
//uint4 sc_RayTracingCasterConfiguration 4064
//uint4 sc_RayTracingCasterOffsetPNTC 4080
//uint4 sc_RayTracingCasterOffsetTexture 4096
//uint4 sc_RayTracingCasterFormatPNTC 4112
//uint4 sc_RayTracingCasterFormatTexture 4128
//float4 voxelization_params_0 4192
//float4 voxelization_params_frustum_lrbt 4208
//float4 voxelization_params_frustum_nf 4224
//float3 voxelization_params_camera_pos 4240
//float4x4 sc_ModelMatrixVoxelization 4256
//float correctedIntensity 4320
//float3x3 intensityTextureTransform 4384
//float4 intensityTextureUvMinMax 4432
//float4 intensityTextureBorderColor 4448
//int PreviewEnabled 4612
//float alphaTestThreshold 4620
//float Tweak_N16 4624
//float3x3 Tweak_N25Transform 4688
//float4 Tweak_N25UvMinMax 4736
//float4 Tweak_N25BorderColor 4752
//float3x3 Tweak_N27Transform 4816
//float4 Tweak_N27UvMinMax 4864
//float4 Tweak_N27BorderColor 4880
//bool ColorOnOffid03 4896
//bool pbrOnOffId03 4900
//bool rimOnOffId03 4904
//float rimExpId03 4908
//float rimIntId03 4912
//bool patternOnOffId03 4916
//float4 patternColorId03 4928
//bool pngPatternId03 4944
//float3x3 patternTextureId03Transform 5008
//float4 patternTextureId03UvMinMax 5056
//float4 patternTextureId03BorderColor 5072
//float2 patternScaleId03 5088
//float2 patternOffsetId03 5096
//float patternRotateId03 5104
//float4 colorId03 5120
//float3x3 greyMaskIdTransform 5184
//float4 greyMaskIdUvMinMax 5232
//float4 greyMaskIdBorderColor 5248
//float metallicId03 5264
//float rougnessId03 5268
//bool ColorOnOffid02 5272
//bool pbrOnOffId02 5276
//bool rimOnOffId02 5280
//float rimExpId02 5284
//float rimIntId02 5288
//bool patternOnOffId02 5292
//float4 patternColorId02 5296
//bool pngPatternId02 5312
//float3x3 patternTextureId02Transform 5376
//float4 patternTextureId02UvMinMax 5424
//float4 patternTextureId02BorderColor 5440
//float2 patternScaleId02 5456
//float2 patternOffsetId02 5464
//float patternRotateId02 5472
//float4 colorId02 5488
//float metallicId02 5504
//float rougnessId02 5508
//bool pbrOnOffId01 5512
//bool rimOnOffId01 5516
//float rimExpId01 5520
//float rimIntId01 5524
//bool patternOnOffId01 5528
//float4 patternColorId01 5536
//bool pngPatternId01 5552
//float3x3 patternTextureId01Transform 5616
//float4 patternTextureId01UvMinMax 5664
//float4 patternTextureId01BorderColor 5680
//float2 patternScaleId01 5696
//float2 patternOffsetId01 5704
//float patternRotateId01 5712
//float4 colorId01 5728
//float metallicId01 5744
//float rougnessId01 5748
//float Tweak_N47 5752
//float3 Port_Import_N014 5760
//float2 Port_Center_N379 5776
//float2 Port_Center_N383 5784
//float Port_Input1_N006 5792
//float Port_Input1_N009 5796
//float4 Port_Default_N358 5808
//float Port_Opacity_N410 5828
//float3 Port_Emissive_N410 5856
//float3 Port_AO_N410 5872
//float3 Port_SpecularAO_N410 5888
//float2 Port_Center_N282 5904
//float2 Port_Center_N286 5912
//float Port_Input1_N038 5920
//float Port_Input1_N035 5924
//float4 Port_Default_N338 5936
//float Port_Opacity_N313 5956
//float3 Port_Emissive_N313 5984
//float3 Port_AO_N313 6000
//float3 Port_SpecularAO_N313 6016
//float2 Port_Center_N122 6032
//float2 Port_Center_N126 6040
//float Port_Input1_N034 6048
//float Port_Opacity_N152 6056
//float3 Port_Emissive_N152 6080
//float3 Port_AO_N152 6096
//float3 Port_SpecularAO_N152 6112
//float4 Port_Input1_N051 6144
//float4 Port_Input2_N051 6160
//float4 Port_Input0_N102 6176
//float Port_Import_N060 6208
//float4 Port_Input1_N062 6224
//float Port_Import_N063 6240
//float Port_Import_N100 6244
//float4 Port_Input1_N070 6256
//float4 Port_Input2_N070 6272
//float depthRef 6288
//}
//ssbo int sc_RayTracingCasterIndexBuffer 0:0:4 {
//uint sc_RayTracingCasterTriangles 0:[1]:4
//}
//ssbo float sc_RayTracingCasterNonAnimatedVertexBuffer 0:2:4 {
//float sc_RayTracingCasterNonAnimatedVertices 0:[1]:4
//}
//ssbo float sc_RayTracingCasterVertexBuffer 0:1:4 {
//float sc_RayTracingCasterVertices 0:[1]:4
//}
//spec_const bool BLEND_MODE_AVERAGE 0 0
//spec_const bool BLEND_MODE_BRIGHT 1 0
//spec_const bool BLEND_MODE_COLOR_BURN 2 0
//spec_const bool BLEND_MODE_COLOR_DODGE 3 0
//spec_const bool BLEND_MODE_COLOR 4 0
//spec_const bool BLEND_MODE_DARKEN 5 0
//spec_const bool BLEND_MODE_DIFFERENCE 6 0
//spec_const bool BLEND_MODE_DIVIDE 7 0
//spec_const bool BLEND_MODE_DIVISION 8 0
//spec_const bool BLEND_MODE_EXCLUSION 9 0
//spec_const bool BLEND_MODE_FORGRAY 10 0
//spec_const bool BLEND_MODE_HARD_GLOW 11 0
//spec_const bool BLEND_MODE_HARD_LIGHT 12 0
//spec_const bool BLEND_MODE_HARD_MIX 13 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 14 0
//spec_const bool BLEND_MODE_HARD_REFLECT 15 0
//spec_const bool BLEND_MODE_HUE 16 0
//spec_const bool BLEND_MODE_INTENSE 17 0
//spec_const bool BLEND_MODE_LIGHTEN 18 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19 0
//spec_const bool BLEND_MODE_LUMINOSITY 20 0
//spec_const bool BLEND_MODE_NEGATION 21 0
//spec_const bool BLEND_MODE_NOTBRIGHT 22 0
//spec_const bool BLEND_MODE_OVERLAY 23 0
//spec_const bool BLEND_MODE_PIN_LIGHT 24 0
//spec_const bool BLEND_MODE_REALISTIC 25 0
//spec_const bool BLEND_MODE_SATURATION 26 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 27 0
//spec_const bool BLEND_MODE_SUBTRACT 28 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 29 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N25 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N27 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_greyMaskId 33 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 34 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_patternTextureId01 35 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_patternTextureId02 36 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_patternTextureId03 37 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N25 38 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N27 39 0
//spec_const bool SC_USE_UV_MIN_MAX_greyMaskId 40 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 41 0
//spec_const bool SC_USE_UV_MIN_MAX_patternTextureId01 42 0
//spec_const bool SC_USE_UV_MIN_MAX_patternTextureId02 43 0
//spec_const bool SC_USE_UV_MIN_MAX_patternTextureId03 44 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N25 45 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N27 46 0
//spec_const bool SC_USE_UV_TRANSFORM_greyMaskId 47 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 48 0
//spec_const bool SC_USE_UV_TRANSFORM_patternTextureId01 49 0
//spec_const bool SC_USE_UV_TRANSFORM_patternTextureId02 50 0
//spec_const bool SC_USE_UV_TRANSFORM_patternTextureId03 51 0
//spec_const bool Tweak_N25HasSwappedViews 52 0
//spec_const bool Tweak_N27HasSwappedViews 53 0
//spec_const bool UseViewSpaceDepthVariant 54 1
//spec_const bool greyMaskIdHasSwappedViews 55 0
//spec_const bool intensityTextureHasSwappedViews 56 0
//spec_const bool patternTextureId01HasSwappedViews 57 0
//spec_const bool patternTextureId02HasSwappedViews 58 0
//spec_const bool patternTextureId03HasSwappedViews 59 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 60 0
//spec_const bool sc_BlendMode_Add 61 0
//spec_const bool sc_BlendMode_AlphaTest 62 0
//spec_const bool sc_BlendMode_AlphaToCoverage 63 0
//spec_const bool sc_BlendMode_ColoredGlass 64 0
//spec_const bool sc_BlendMode_Custom 65 0
//spec_const bool sc_BlendMode_Max 66 0
//spec_const bool sc_BlendMode_Min 67 0
//spec_const bool sc_BlendMode_MultiplyOriginal 68 0
//spec_const bool sc_BlendMode_Multiply 69 0
//spec_const bool sc_BlendMode_Normal 70 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 71 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 72 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 73 0
//spec_const bool sc_BlendMode_Screen 74 0
//spec_const bool sc_DepthOnly 75 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 76 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 77 0
//spec_const bool sc_FramebufferFetch 78 0
//spec_const bool sc_HasDiffuseEnvmap 79 0
//spec_const bool sc_IsEditor 80 0
//spec_const bool sc_LightEstimation 81 0
//spec_const bool sc_MotionVectorsPass 82 0
//spec_const bool sc_OITCompositingPass 83 0
//spec_const bool sc_OITDepthBoundsPass 84 0
//spec_const bool sc_OITDepthGatherPass 85 0
//spec_const bool sc_OutputBounds 86 0
//spec_const bool sc_ProjectiveShadowsCaster 87 0
//spec_const bool sc_ProjectiveShadowsReceiver 88 0
//spec_const bool sc_RayTracingCasterForceOpaque 89 0
//spec_const bool sc_RayTracingGlobalIlluminationHasSwappedViews 90 0
//spec_const bool sc_RayTracingReflectionsHasSwappedViews 91 0
//spec_const bool sc_RayTracingShadowsHasSwappedViews 92 0
//spec_const bool sc_RenderAlphaToColor 93 0
//spec_const bool sc_SSAOEnabled 94 0
//spec_const bool sc_ScreenTextureHasSwappedViews 95 0
//spec_const bool sc_TAAEnabled 96 0
//spec_const bool sc_VertexBlendingUseNormals 97 0
//spec_const bool sc_VertexBlending 98 0
//spec_const bool sc_Voxelization 99 0
//spec_const int SC_DEVICE_CLASS 100 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N25 101 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N27 102 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_greyMaskId 103 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 104 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_patternTextureId01 105 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_patternTextureId02 106 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_patternTextureId03 107 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N25 108 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N27 109 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_greyMaskId 110 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 111 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_patternTextureId01 112 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_patternTextureId02 113 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_patternTextureId03 114 -1
//spec_const int Tweak_N25Layout 115 0
//spec_const int Tweak_N27Layout 116 0
//spec_const int greyMaskIdLayout 117 0
//spec_const int intensityTextureLayout 118 0
//spec_const int patternTextureId01Layout 119 0
//spec_const int patternTextureId02Layout 120 0
//spec_const int patternTextureId03Layout 121 0
//spec_const int sc_AmbientLightMode0 122 0
//spec_const int sc_AmbientLightMode1 123 0
//spec_const int sc_AmbientLightMode2 124 0
//spec_const int sc_AmbientLightMode_Constant 125 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 126 0
//spec_const int sc_AmbientLightMode_FromCamera 127 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 128 0
//spec_const int sc_AmbientLightsCount 129 0
//spec_const int sc_DepthBufferMode 130 0
//spec_const int sc_DirectionalLightsCount 131 0
//spec_const int sc_EnvLightMode 132 0
//spec_const int sc_EnvmapDiffuseLayout 133 0
//spec_const int sc_EnvmapSpecularLayout 134 0
//spec_const int sc_LightEstimationSGCount 135 0
//spec_const int sc_PointLightsCount 136 0
//spec_const int sc_RayTracingGlobalIlluminationLayout 137 0
//spec_const int sc_RayTracingReflectionsLayout 138 0
//spec_const int sc_RayTracingShadowsLayout 139 0
//spec_const int sc_RenderingSpace 140 -1
//spec_const int sc_ScreenTextureLayout 141 0
//spec_const int sc_ShaderCacheConstant 142 0
//spec_const int sc_SkinBonesCount 143 0
//spec_const int sc_StereoRenderingMode 144 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 145 0
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(0)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(2)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(3)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(4)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(5)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(6)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(7)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(8)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(9)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(10)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(11)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(12)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(13)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(14)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(15)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(16)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(17)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(18)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(19)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(20)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(21)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(22)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(23)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(25)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(26)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(27)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(28)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(30)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N25 [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N25_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_Tweak_N25) ? SC_USE_CLAMP_TO_BORDER_Tweak_N25 : false;
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N27 [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N27_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_Tweak_N27) ? SC_USE_CLAMP_TO_BORDER_Tweak_N27 : false;
constant bool SC_USE_CLAMP_TO_BORDER_greyMaskId [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_greyMaskId) ? SC_USE_CLAMP_TO_BORDER_greyMaskId : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_patternTextureId01 [[function_constant(35)]];
constant bool SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_patternTextureId01) ? SC_USE_CLAMP_TO_BORDER_patternTextureId01 : false;
constant bool SC_USE_CLAMP_TO_BORDER_patternTextureId02 [[function_constant(36)]];
constant bool SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_patternTextureId02) ? SC_USE_CLAMP_TO_BORDER_patternTextureId02 : false;
constant bool SC_USE_CLAMP_TO_BORDER_patternTextureId03 [[function_constant(37)]];
constant bool SC_USE_CLAMP_TO_BORDER_patternTextureId03_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_patternTextureId03) ? SC_USE_CLAMP_TO_BORDER_patternTextureId03 : false;
constant bool SC_USE_UV_MIN_MAX_Tweak_N25 [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_Tweak_N25_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_Tweak_N25) ? SC_USE_UV_MIN_MAX_Tweak_N25 : false;
constant bool SC_USE_UV_MIN_MAX_Tweak_N27 [[function_constant(39)]];
constant bool SC_USE_UV_MIN_MAX_Tweak_N27_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_Tweak_N27) ? SC_USE_UV_MIN_MAX_Tweak_N27 : false;
constant bool SC_USE_UV_MIN_MAX_greyMaskId [[function_constant(40)]];
constant bool SC_USE_UV_MIN_MAX_greyMaskId_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_greyMaskId) ? SC_USE_UV_MIN_MAX_greyMaskId : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(41)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_patternTextureId01 [[function_constant(42)]];
constant bool SC_USE_UV_MIN_MAX_patternTextureId01_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_patternTextureId01) ? SC_USE_UV_MIN_MAX_patternTextureId01 : false;
constant bool SC_USE_UV_MIN_MAX_patternTextureId02 [[function_constant(43)]];
constant bool SC_USE_UV_MIN_MAX_patternTextureId02_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_patternTextureId02) ? SC_USE_UV_MIN_MAX_patternTextureId02 : false;
constant bool SC_USE_UV_MIN_MAX_patternTextureId03 [[function_constant(44)]];
constant bool SC_USE_UV_MIN_MAX_patternTextureId03_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_patternTextureId03) ? SC_USE_UV_MIN_MAX_patternTextureId03 : false;
constant bool SC_USE_UV_TRANSFORM_Tweak_N25 [[function_constant(45)]];
constant bool SC_USE_UV_TRANSFORM_Tweak_N25_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_Tweak_N25) ? SC_USE_UV_TRANSFORM_Tweak_N25 : false;
constant bool SC_USE_UV_TRANSFORM_Tweak_N27 [[function_constant(46)]];
constant bool SC_USE_UV_TRANSFORM_Tweak_N27_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_Tweak_N27) ? SC_USE_UV_TRANSFORM_Tweak_N27 : false;
constant bool SC_USE_UV_TRANSFORM_greyMaskId [[function_constant(47)]];
constant bool SC_USE_UV_TRANSFORM_greyMaskId_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_greyMaskId) ? SC_USE_UV_TRANSFORM_greyMaskId : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(48)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_patternTextureId01 [[function_constant(49)]];
constant bool SC_USE_UV_TRANSFORM_patternTextureId01_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_patternTextureId01) ? SC_USE_UV_TRANSFORM_patternTextureId01 : false;
constant bool SC_USE_UV_TRANSFORM_patternTextureId02 [[function_constant(50)]];
constant bool SC_USE_UV_TRANSFORM_patternTextureId02_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_patternTextureId02) ? SC_USE_UV_TRANSFORM_patternTextureId02 : false;
constant bool SC_USE_UV_TRANSFORM_patternTextureId03 [[function_constant(51)]];
constant bool SC_USE_UV_TRANSFORM_patternTextureId03_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_patternTextureId03) ? SC_USE_UV_TRANSFORM_patternTextureId03 : false;
constant bool Tweak_N25HasSwappedViews [[function_constant(52)]];
constant bool Tweak_N25HasSwappedViews_tmp = is_function_constant_defined(Tweak_N25HasSwappedViews) ? Tweak_N25HasSwappedViews : false;
constant bool Tweak_N27HasSwappedViews [[function_constant(53)]];
constant bool Tweak_N27HasSwappedViews_tmp = is_function_constant_defined(Tweak_N27HasSwappedViews) ? Tweak_N27HasSwappedViews : false;
constant bool UseViewSpaceDepthVariant [[function_constant(54)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool greyMaskIdHasSwappedViews [[function_constant(55)]];
constant bool greyMaskIdHasSwappedViews_tmp = is_function_constant_defined(greyMaskIdHasSwappedViews) ? greyMaskIdHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(56)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool patternTextureId01HasSwappedViews [[function_constant(57)]];
constant bool patternTextureId01HasSwappedViews_tmp = is_function_constant_defined(patternTextureId01HasSwappedViews) ? patternTextureId01HasSwappedViews : false;
constant bool patternTextureId02HasSwappedViews [[function_constant(58)]];
constant bool patternTextureId02HasSwappedViews_tmp = is_function_constant_defined(patternTextureId02HasSwappedViews) ? patternTextureId02HasSwappedViews : false;
constant bool patternTextureId03HasSwappedViews [[function_constant(59)]];
constant bool patternTextureId03HasSwappedViews_tmp = is_function_constant_defined(patternTextureId03HasSwappedViews) ? patternTextureId03HasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(60)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(61)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(62)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(63)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(64)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(65)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(66)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(67)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(68)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(69)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(70)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(71)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(72)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(73)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(74)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(75)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(76)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(77)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(78)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(79)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_IsEditor [[function_constant(80)]];
constant bool sc_IsEditor_tmp = is_function_constant_defined(sc_IsEditor) ? sc_IsEditor : false;
constant bool sc_LightEstimation [[function_constant(81)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(82)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(83)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(84)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(85)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_OutputBounds [[function_constant(86)]];
constant bool sc_OutputBounds_tmp = is_function_constant_defined(sc_OutputBounds) ? sc_OutputBounds : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(87)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(88)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RayTracingCasterForceOpaque [[function_constant(89)]];
constant bool sc_RayTracingCasterForceOpaque_tmp = is_function_constant_defined(sc_RayTracingCasterForceOpaque) ? sc_RayTracingCasterForceOpaque : false;
constant bool sc_RayTracingGlobalIlluminationHasSwappedViews [[function_constant(90)]];
constant bool sc_RayTracingGlobalIlluminationHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingGlobalIlluminationHasSwappedViews) ? sc_RayTracingGlobalIlluminationHasSwappedViews : false;
constant bool sc_RayTracingReflectionsHasSwappedViews [[function_constant(91)]];
constant bool sc_RayTracingReflectionsHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingReflectionsHasSwappedViews) ? sc_RayTracingReflectionsHasSwappedViews : false;
constant bool sc_RayTracingShadowsHasSwappedViews [[function_constant(92)]];
constant bool sc_RayTracingShadowsHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingShadowsHasSwappedViews) ? sc_RayTracingShadowsHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(93)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(94)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(95)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_TAAEnabled [[function_constant(96)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(97)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(98)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool sc_Voxelization [[function_constant(99)]];
constant bool sc_Voxelization_tmp = is_function_constant_defined(sc_Voxelization) ? sc_Voxelization : false;
constant int SC_DEVICE_CLASS [[function_constant(100)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N25 [[function_constant(101)]];
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N25_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_Tweak_N25) ? SC_SOFTWARE_WRAP_MODE_U_Tweak_N25 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N27 [[function_constant(102)]];
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N27_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_Tweak_N27) ? SC_SOFTWARE_WRAP_MODE_U_Tweak_N27 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_greyMaskId [[function_constant(103)]];
constant int SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_greyMaskId) ? SC_SOFTWARE_WRAP_MODE_U_greyMaskId : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(104)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_patternTextureId01 [[function_constant(105)]];
constant int SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01) ? SC_SOFTWARE_WRAP_MODE_U_patternTextureId01 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_patternTextureId02 [[function_constant(106)]];
constant int SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02) ? SC_SOFTWARE_WRAP_MODE_U_patternTextureId02 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_patternTextureId03 [[function_constant(107)]];
constant int SC_SOFTWARE_WRAP_MODE_U_patternTextureId03_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_patternTextureId03) ? SC_SOFTWARE_WRAP_MODE_U_patternTextureId03 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N25 [[function_constant(108)]];
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N25_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_Tweak_N25) ? SC_SOFTWARE_WRAP_MODE_V_Tweak_N25 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N27 [[function_constant(109)]];
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N27_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_Tweak_N27) ? SC_SOFTWARE_WRAP_MODE_V_Tweak_N27 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_greyMaskId [[function_constant(110)]];
constant int SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_greyMaskId) ? SC_SOFTWARE_WRAP_MODE_V_greyMaskId : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(111)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_patternTextureId01 [[function_constant(112)]];
constant int SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_patternTextureId01) ? SC_SOFTWARE_WRAP_MODE_V_patternTextureId01 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_patternTextureId02 [[function_constant(113)]];
constant int SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_patternTextureId02) ? SC_SOFTWARE_WRAP_MODE_V_patternTextureId02 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_patternTextureId03 [[function_constant(114)]];
constant int SC_SOFTWARE_WRAP_MODE_V_patternTextureId03_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_patternTextureId03) ? SC_SOFTWARE_WRAP_MODE_V_patternTextureId03 : -1;
constant int Tweak_N25Layout [[function_constant(115)]];
constant int Tweak_N25Layout_tmp = is_function_constant_defined(Tweak_N25Layout) ? Tweak_N25Layout : 0;
constant int Tweak_N27Layout [[function_constant(116)]];
constant int Tweak_N27Layout_tmp = is_function_constant_defined(Tweak_N27Layout) ? Tweak_N27Layout : 0;
constant int greyMaskIdLayout [[function_constant(117)]];
constant int greyMaskIdLayout_tmp = is_function_constant_defined(greyMaskIdLayout) ? greyMaskIdLayout : 0;
constant int intensityTextureLayout [[function_constant(118)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int patternTextureId01Layout [[function_constant(119)]];
constant int patternTextureId01Layout_tmp = is_function_constant_defined(patternTextureId01Layout) ? patternTextureId01Layout : 0;
constant int patternTextureId02Layout [[function_constant(120)]];
constant int patternTextureId02Layout_tmp = is_function_constant_defined(patternTextureId02Layout) ? patternTextureId02Layout : 0;
constant int patternTextureId03Layout [[function_constant(121)]];
constant int patternTextureId03Layout_tmp = is_function_constant_defined(patternTextureId03Layout) ? patternTextureId03Layout : 0;
constant int sc_AmbientLightMode0 [[function_constant(122)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(123)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(124)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(125)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(126)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(127)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(128)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(129)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(130)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(131)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(132)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(133)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(134)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(135)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_PointLightsCount [[function_constant(136)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracingGlobalIlluminationLayout [[function_constant(137)]];
constant int sc_RayTracingGlobalIlluminationLayout_tmp = is_function_constant_defined(sc_RayTracingGlobalIlluminationLayout) ? sc_RayTracingGlobalIlluminationLayout : 0;
constant int sc_RayTracingReflectionsLayout [[function_constant(138)]];
constant int sc_RayTracingReflectionsLayout_tmp = is_function_constant_defined(sc_RayTracingReflectionsLayout) ? sc_RayTracingReflectionsLayout : 0;
constant int sc_RayTracingShadowsLayout [[function_constant(139)]];
constant int sc_RayTracingShadowsLayout_tmp = is_function_constant_defined(sc_RayTracingShadowsLayout) ? sc_RayTracingShadowsLayout : 0;
constant int sc_RenderingSpace [[function_constant(140)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(141)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(142)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(143)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(144)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(145)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int sc_RayTracingReceiverEffectsMask;
float4 sc_RayTracingReflectionsSize;
float4 sc_RayTracingReflectionsDims;
float4 sc_RayTracingReflectionsView;
float4 sc_RayTracingGlobalIlluminationSize;
float4 sc_RayTracingGlobalIlluminationDims;
float4 sc_RayTracingGlobalIlluminationView;
float4 sc_RayTracingShadowsSize;
float4 sc_RayTracingShadowsDims;
float4 sc_RayTracingShadowsView;
float3 sc_RayTracingOriginScale;
uint sc_RayTracingReceiverMask;
float3 sc_RayTracingOriginScaleInv;
float3 sc_RayTracingOriginOffset;
uint sc_RayTracingReceiverId;
uint4 sc_RayTracingCasterConfiguration;
uint4 sc_RayTracingCasterOffsetPNTC;
uint4 sc_RayTracingCasterOffsetTexture;
uint4 sc_RayTracingCasterFormatPNTC;
uint4 sc_RayTracingCasterFormatTexture;
float4 sc_RayTracingRayDirectionSize;
float4 sc_RayTracingRayDirectionDims;
float4 sc_RayTracingRayDirectionView;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float Tweak_N16;
float4 Tweak_N25Size;
float4 Tweak_N25Dims;
float4 Tweak_N25View;
float3x3 Tweak_N25Transform;
float4 Tweak_N25UvMinMax;
float4 Tweak_N25BorderColor;
float4 Tweak_N27Size;
float4 Tweak_N27Dims;
float4 Tweak_N27View;
float3x3 Tweak_N27Transform;
float4 Tweak_N27UvMinMax;
float4 Tweak_N27BorderColor;
int ColorOnOffid03;
int pbrOnOffId03;
int rimOnOffId03;
float rimExpId03;
float rimIntId03;
int patternOnOffId03;
float4 patternColorId03;
int pngPatternId03;
float4 patternTextureId03Size;
float4 patternTextureId03Dims;
float4 patternTextureId03View;
float3x3 patternTextureId03Transform;
float4 patternTextureId03UvMinMax;
float4 patternTextureId03BorderColor;
float2 patternScaleId03;
float2 patternOffsetId03;
float patternRotateId03;
float4 colorId03;
float4 greyMaskIdSize;
float4 greyMaskIdDims;
float4 greyMaskIdView;
float3x3 greyMaskIdTransform;
float4 greyMaskIdUvMinMax;
float4 greyMaskIdBorderColor;
float metallicId03;
float rougnessId03;
int ColorOnOffid02;
int pbrOnOffId02;
int rimOnOffId02;
float rimExpId02;
float rimIntId02;
int patternOnOffId02;
float4 patternColorId02;
int pngPatternId02;
float4 patternTextureId02Size;
float4 patternTextureId02Dims;
float4 patternTextureId02View;
float3x3 patternTextureId02Transform;
float4 patternTextureId02UvMinMax;
float4 patternTextureId02BorderColor;
float2 patternScaleId02;
float2 patternOffsetId02;
float patternRotateId02;
float4 colorId02;
float metallicId02;
float rougnessId02;
int pbrOnOffId01;
int rimOnOffId01;
float rimExpId01;
float rimIntId01;
int patternOnOffId01;
float4 patternColorId01;
int pngPatternId01;
float4 patternTextureId01Size;
float4 patternTextureId01Dims;
float4 patternTextureId01View;
float3x3 patternTextureId01Transform;
float4 patternTextureId01UvMinMax;
float4 patternTextureId01BorderColor;
float2 patternScaleId01;
float2 patternOffsetId01;
float patternRotateId01;
float4 colorId01;
float metallicId01;
float rougnessId01;
float Tweak_N47;
float Port_Import_N008;
float3 Port_Import_N014;
float2 Port_Center_N379;
float2 Port_Center_N383;
float Port_Input1_N006;
float Port_Input1_N009;
float4 Port_Default_N358;
float Port_Mask_N399;
float Port_Opacity_N410;
float3 Port_Normal_N410;
float3 Port_Emissive_N410;
float3 Port_AO_N410;
float3 Port_SpecularAO_N410;
float2 Port_Center_N282;
float2 Port_Center_N286;
float Port_Input1_N038;
float Port_Input1_N035;
float4 Port_Default_N338;
float Port_Mask_N302;
float Port_Opacity_N313;
float3 Port_Normal_N313;
float3 Port_Emissive_N313;
float3 Port_AO_N313;
float3 Port_SpecularAO_N313;
float2 Port_Center_N122;
float2 Port_Center_N126;
float Port_Input1_N034;
float Port_Mask_N139;
float Port_Opacity_N152;
float3 Port_Normal_N152;
float3 Port_Emissive_N152;
float3 Port_AO_N152;
float3 Port_SpecularAO_N152;
float Port_Mask_N263;
float Port_Mask_N418;
float4 Port_Input1_N051;
float4 Port_Input2_N051;
float4 Port_Input0_N102;
float4 Port_Import_N059;
float Port_Import_N060;
float4 Port_Input1_N062;
float Port_Import_N063;
float Port_Import_N100;
float4 Port_Input1_N070;
float4 Port_Input2_N070;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_RayTracingCasterIndexBuffer_obj
{
uint sc_RayTracingCasterTriangles[1];
};
struct sc_RayTracingCasterVertexBuffer_obj
{
float sc_RayTracingCasterVertices[1];
};
struct sc_RayTracingCasterNonAnimatedVertexBuffer_obj
{
float sc_RayTracingCasterNonAnimatedVertices[1];
};
struct sc_Set0
{
const device sc_RayTracingCasterIndexBuffer_obj* sc_RayTracingCasterIndexBuffer [[id(0)]];
const device sc_RayTracingCasterVertexBuffer_obj* sc_RayTracingCasterVertexBuffer [[id(1)]];
const device sc_RayTracingCasterNonAnimatedVertexBuffer_obj* sc_RayTracingCasterNonAnimatedVertexBuffer [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> Tweak_N25 [[id(4)]];
texture2d<float> Tweak_N27 [[id(5)]];
texture2d<float> greyMaskId [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> patternTextureId01 [[id(8)]];
texture2d<float> patternTextureId02 [[id(9)]];
texture2d<float> patternTextureId03 [[id(10)]];
texture2d<float> sc_EnvmapDiffuse [[id(11)]];
texture2d<float> sc_EnvmapSpecular [[id(12)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(21)]];
texture2d<uint> sc_RayTracingHitCasterIdAndBarycentric [[id(22)]];
texture2d<float> sc_RayTracingRayDirection [[id(23)]];
texture2d<float> sc_RayTracingReflections [[id(24)]];
texture2d<float> sc_RayTracingShadows [[id(25)]];
texture2d<float> sc_SSAOTexture [[id(26)]];
texture2d<float> sc_ScreenTexture [[id(27)]];
texture2d<float> sc_ShadowTexture [[id(28)]];
sampler Tweak_N25SmpSC [[id(30)]];
sampler Tweak_N27SmpSC [[id(31)]];
sampler greyMaskIdSmpSC [[id(32)]];
sampler intensityTextureSmpSC [[id(33)]];
sampler patternTextureId01SmpSC [[id(34)]];
sampler patternTextureId02SmpSC [[id(35)]];
sampler patternTextureId03SmpSC [[id(36)]];
sampler sc_EnvmapDiffuseSmpSC [[id(37)]];
sampler sc_EnvmapSpecularSmpSC [[id(38)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(40)]];
sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC [[id(41)]];
sampler sc_RayTracingRayDirectionSmpSC [[id(42)]];
sampler sc_RayTracingReflectionsSmpSC [[id(43)]];
sampler sc_RayTracingShadowsSmpSC [[id(44)]];
sampler sc_SSAOTextureSmpSC [[id(45)]];
sampler sc_ScreenTextureSmpSC [[id(46)]];
sampler sc_ShadowTextureSmpSC [[id(47)]];
constant userUniformsObj* UserUniforms [[id(49)]];
};
struct main_vert_out
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
if ((*sc_set0.UserUniforms).sc_RayTracingCasterConfiguration.x!=0u)
{
float4 param=float4(in.position.xy,(*sc_set0.UserUniforms).depthRef+(1e-10*in.position.z),1.0+(1e-10*in.position.w));
if (sc_ShaderCacheConstant_tmp!=0)
{
param.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_0=param;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_1=dot(l9_0,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_2=l9_1;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_2;
}
}
float4 l9_3=float4(param.x,-param.y,(param.z*0.5)+(param.w*0.5),param.w);
out.gl_Position=l9_3;
return out;
}
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_5;
l9_5.position=in.position;
l9_5.normal=in.normal;
l9_5.tangent=in.tangent.xyz;
l9_5.texture0=in.texture0;
l9_5.texture1=in.texture1;
sc_Vertex_t l9_6=l9_5;
sc_Vertex_t param_1=l9_6;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_7=param_1;
param_1=l9_7;
}
sc_Vertex_t l9_8=param_1;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_9=l9_8;
float3 l9_10=in.blendShape0Pos;
float3 l9_11=in.blendShape0Normal;
float l9_12=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_13=l9_9;
float3 l9_14=l9_10;
float l9_15=l9_12;
float3 l9_16=l9_13.position.xyz+(l9_14*l9_15);
l9_13.position=float4(l9_16.x,l9_16.y,l9_16.z,l9_13.position.w);
l9_9=l9_13;
l9_9.normal+=(l9_11*l9_12);
l9_8=l9_9;
sc_Vertex_t l9_17=l9_8;
float3 l9_18=in.blendShape1Pos;
float3 l9_19=in.blendShape1Normal;
float l9_20=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_21=l9_17;
float3 l9_22=l9_18;
float l9_23=l9_20;
float3 l9_24=l9_21.position.xyz+(l9_22*l9_23);
l9_21.position=float4(l9_24.x,l9_24.y,l9_24.z,l9_21.position.w);
l9_17=l9_21;
l9_17.normal+=(l9_19*l9_20);
l9_8=l9_17;
sc_Vertex_t l9_25=l9_8;
float3 l9_26=in.blendShape2Pos;
float3 l9_27=in.blendShape2Normal;
float l9_28=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_29=l9_25;
float3 l9_30=l9_26;
float l9_31=l9_28;
float3 l9_32=l9_29.position.xyz+(l9_30*l9_31);
l9_29.position=float4(l9_32.x,l9_32.y,l9_32.z,l9_29.position.w);
l9_25=l9_29;
l9_25.normal+=(l9_27*l9_28);
l9_8=l9_25;
}
else
{
sc_Vertex_t l9_33=l9_8;
float3 l9_34=in.blendShape0Pos;
float l9_35=(*sc_set0.UserUniforms).weights0.x;
float3 l9_36=l9_33.position.xyz+(l9_34*l9_35);
l9_33.position=float4(l9_36.x,l9_36.y,l9_36.z,l9_33.position.w);
l9_8=l9_33;
sc_Vertex_t l9_37=l9_8;
float3 l9_38=in.blendShape1Pos;
float l9_39=(*sc_set0.UserUniforms).weights0.y;
float3 l9_40=l9_37.position.xyz+(l9_38*l9_39);
l9_37.position=float4(l9_40.x,l9_40.y,l9_40.z,l9_37.position.w);
l9_8=l9_37;
sc_Vertex_t l9_41=l9_8;
float3 l9_42=in.blendShape2Pos;
float l9_43=(*sc_set0.UserUniforms).weights0.z;
float3 l9_44=l9_41.position.xyz+(l9_42*l9_43);
l9_41.position=float4(l9_44.x,l9_44.y,l9_44.z,l9_41.position.w);
l9_8=l9_41;
sc_Vertex_t l9_45=l9_8;
float3 l9_46=in.blendShape3Pos;
float l9_47=(*sc_set0.UserUniforms).weights0.w;
float3 l9_48=l9_45.position.xyz+(l9_46*l9_47);
l9_45.position=float4(l9_48.x,l9_48.y,l9_48.z,l9_45.position.w);
l9_8=l9_45;
sc_Vertex_t l9_49=l9_8;
float3 l9_50=in.blendShape4Pos;
float l9_51=(*sc_set0.UserUniforms).weights1.x;
float3 l9_52=l9_49.position.xyz+(l9_50*l9_51);
l9_49.position=float4(l9_52.x,l9_52.y,l9_52.z,l9_49.position.w);
l9_8=l9_49;
sc_Vertex_t l9_53=l9_8;
float3 l9_54=in.blendShape5Pos;
float l9_55=(*sc_set0.UserUniforms).weights1.y;
float3 l9_56=l9_53.position.xyz+(l9_54*l9_55);
l9_53.position=float4(l9_56.x,l9_56.y,l9_56.z,l9_53.position.w);
l9_8=l9_53;
}
}
param_1=l9_8;
sc_Vertex_t l9_57=param_1;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_58=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_58=float4(1.0,fract(in.boneData.yzw));
l9_58.x-=dot(l9_58.yzw,float3(1.0));
}
float4 l9_59=l9_58;
float4 l9_60=l9_59;
int l9_61=int(in.boneData.x);
int l9_62=int(in.boneData.y);
int l9_63=int(in.boneData.z);
int l9_64=int(in.boneData.w);
int l9_65=l9_61;
float4 l9_66=l9_57.position;
float3 l9_67=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_68=l9_65;
float4 l9_69=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[0];
float4 l9_70=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[1];
float4 l9_71=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[2];
float4 l9_72[3];
l9_72[0]=l9_69;
l9_72[1]=l9_70;
l9_72[2]=l9_71;
l9_67=float3(dot(l9_66,l9_72[0]),dot(l9_66,l9_72[1]),dot(l9_66,l9_72[2]));
}
else
{
l9_67=l9_66.xyz;
}
float3 l9_73=l9_67;
float3 l9_74=l9_73;
float l9_75=l9_60.x;
int l9_76=l9_62;
float4 l9_77=l9_57.position;
float3 l9_78=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_79=l9_76;
float4 l9_80=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[0];
float4 l9_81=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[1];
float4 l9_82=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[2];
float4 l9_83[3];
l9_83[0]=l9_80;
l9_83[1]=l9_81;
l9_83[2]=l9_82;
l9_78=float3(dot(l9_77,l9_83[0]),dot(l9_77,l9_83[1]),dot(l9_77,l9_83[2]));
}
else
{
l9_78=l9_77.xyz;
}
float3 l9_84=l9_78;
float3 l9_85=l9_84;
float l9_86=l9_60.y;
int l9_87=l9_63;
float4 l9_88=l9_57.position;
float3 l9_89=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_90=l9_87;
float4 l9_91=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[0];
float4 l9_92=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[1];
float4 l9_93=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[2];
float4 l9_94[3];
l9_94[0]=l9_91;
l9_94[1]=l9_92;
l9_94[2]=l9_93;
l9_89=float3(dot(l9_88,l9_94[0]),dot(l9_88,l9_94[1]),dot(l9_88,l9_94[2]));
}
else
{
l9_89=l9_88.xyz;
}
float3 l9_95=l9_89;
float3 l9_96=l9_95;
float l9_97=l9_60.z;
int l9_98=l9_64;
float4 l9_99=l9_57.position;
float3 l9_100=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_101=l9_98;
float4 l9_102=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[0];
float4 l9_103=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[1];
float4 l9_104=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[2];
float4 l9_105[3];
l9_105[0]=l9_102;
l9_105[1]=l9_103;
l9_105[2]=l9_104;
l9_100=float3(dot(l9_99,l9_105[0]),dot(l9_99,l9_105[1]),dot(l9_99,l9_105[2]));
}
else
{
l9_100=l9_99.xyz;
}
float3 l9_106=l9_100;
float3 l9_107=(((l9_74*l9_75)+(l9_85*l9_86))+(l9_96*l9_97))+(l9_106*l9_60.w);
l9_57.position=float4(l9_107.x,l9_107.y,l9_107.z,l9_57.position.w);
int l9_108=l9_61;
float3x3 l9_109=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[2].xyz));
float3x3 l9_110=l9_109;
float3x3 l9_111=l9_110;
int l9_112=l9_62;
float3x3 l9_113=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[2].xyz));
float3x3 l9_114=l9_113;
float3x3 l9_115=l9_114;
int l9_116=l9_63;
float3x3 l9_117=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[2].xyz));
float3x3 l9_118=l9_117;
float3x3 l9_119=l9_118;
int l9_120=l9_64;
float3x3 l9_121=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[2].xyz));
float3x3 l9_122=l9_121;
float3x3 l9_123=l9_122;
l9_57.normal=((((l9_111*l9_57.normal)*l9_60.x)+((l9_115*l9_57.normal)*l9_60.y))+((l9_119*l9_57.normal)*l9_60.z))+((l9_123*l9_57.normal)*l9_60.w);
l9_57.tangent=((((l9_111*l9_57.tangent)*l9_60.x)+((l9_115*l9_57.tangent)*l9_60.y))+((l9_119*l9_57.tangent)*l9_60.z))+((l9_123*l9_57.tangent)*l9_60.w);
}
param_1=l9_57;
if (sc_RenderingSpace_tmp==3)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param_1.normal.x,param_1.normal.y,param_1.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param_1.normal.x,param_1.normal.y,param_1.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPosAndMotion=float4(param_1.position.xyz.x,param_1.position.xyz.y,param_1.position.xyz.z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param_1.normal.x,param_1.normal.y,param_1.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
float3 l9_124=((*sc_set0.UserUniforms).sc_ModelMatrix*param_1.position).xyz;
out.varPosAndMotion=float4(l9_124.x,l9_124.y,l9_124.z,out.varPosAndMotion.w);
float3 l9_125=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.normal;
out.varNormalAndMotion=float4(l9_125.x,l9_125.y,l9_125.z,out.varNormalAndMotion.w);
float3 l9_126=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.tangent;
out.varTangent=float4(l9_126.x,l9_126.y,l9_126.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param_1.texture0.x=1.0-param_1.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param_1;
float3 WorldPosition=out.varPosAndMotion.xyz;
float3 WorldNormal=out.varNormalAndMotion.xyz;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPosAndMotion.xyz;
WorldNormal=out.varNormalAndMotion.xyz;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_2=v;
float3 param_3=WorldPosition;
float3 param_4=WorldNormal;
float3 param_5=WorldTangent;
float4 param_6=v.position;
out.varPosAndMotion=float4(param_3.x,param_3.y,param_3.z,out.varPosAndMotion.w);
float3 l9_127=normalize(param_4);
out.varNormalAndMotion=float4(l9_127.x,l9_127.y,l9_127.z,out.varNormalAndMotion.w);
float3 l9_128=normalize(param_5);
out.varTangent=float4(l9_128.x,l9_128.y,l9_128.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_129=param_2.position;
float4 l9_130=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_131=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_131=0;
}
else
{
l9_131=gl_InstanceIndex%2;
}
int l9_132=l9_131;
l9_130=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_132]*l9_129;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_133=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_133=0;
}
else
{
l9_133=gl_InstanceIndex%2;
}
int l9_134=l9_133;
l9_130=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_134]*l9_129;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_135=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_135=0;
}
else
{
l9_135=gl_InstanceIndex%2;
}
int l9_136=l9_135;
l9_130=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_136]*l9_129;
}
else
{
l9_130=l9_129;
}
}
}
float4 l9_137=l9_130;
out.varViewSpaceDepth=-l9_137.z;
}
float4 l9_138=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_138=param_6;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_139=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_139=0;
}
else
{
l9_139=gl_InstanceIndex%2;
}
int l9_140=l9_139;
l9_138=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_140]*param_2.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_141=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_141=0;
}
else
{
l9_141=gl_InstanceIndex%2;
}
int l9_142=l9_141;
l9_138=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_142]*float4(out.varPosAndMotion.xyz,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_143=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_143=0;
}
else
{
l9_143=gl_InstanceIndex%2;
}
int l9_144=l9_143;
l9_138=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_144]*float4(out.varPosAndMotion.xyz,1.0);
}
}
}
}
out.varTex01=float4(param_2.texture0,param_2.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_145=param_2.position;
float4 l9_146=l9_145;
if (sc_RenderingSpace_tmp==1)
{
l9_146=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_145;
}
float4 l9_147=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_146;
float2 l9_148=((l9_147.xy/float2(l9_147.w))*0.5)+float2(0.5);
out.varShadowTex=l9_148;
}
float4 l9_149=l9_138;
if (sc_DepthBufferMode_tmp==1)
{
int l9_150=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_150=0;
}
else
{
l9_150=gl_InstanceIndex%2;
}
int l9_151=l9_150;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_151][2].w!=0.0)
{
float l9_152=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_149.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_149.w))*l9_152)-1.0)*l9_149.w;
}
}
float4 l9_153=l9_149;
l9_138=l9_153;
float4 l9_154=l9_138;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_155=l9_154.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_154.w);
l9_154=float4(l9_155.x,l9_155.y,l9_154.z,l9_154.w);
}
float4 l9_156=l9_154;
l9_138=l9_156;
float4 l9_157=l9_138;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_157.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_158=l9_157;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_159=dot(l9_158,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_160=l9_159;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_160;
}
}
float4 l9_161=float4(l9_157.x,-l9_157.y,(l9_157.z*0.5)+(l9_157.w*0.5),l9_157.w);
out.gl_Position=l9_161;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_162=param_2;
sc_Vertex_t l9_163=l9_162;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_164=l9_163;
float3 l9_165=in.blendShape0Pos;
float3 l9_166=in.blendShape0Normal;
float l9_167=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_168=l9_164;
float3 l9_169=l9_165;
float l9_170=l9_167;
float3 l9_171=l9_168.position.xyz+(l9_169*l9_170);
l9_168.position=float4(l9_171.x,l9_171.y,l9_171.z,l9_168.position.w);
l9_164=l9_168;
l9_164.normal+=(l9_166*l9_167);
l9_163=l9_164;
sc_Vertex_t l9_172=l9_163;
float3 l9_173=in.blendShape1Pos;
float3 l9_174=in.blendShape1Normal;
float l9_175=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_176=l9_172;
float3 l9_177=l9_173;
float l9_178=l9_175;
float3 l9_179=l9_176.position.xyz+(l9_177*l9_178);
l9_176.position=float4(l9_179.x,l9_179.y,l9_179.z,l9_176.position.w);
l9_172=l9_176;
l9_172.normal+=(l9_174*l9_175);
l9_163=l9_172;
sc_Vertex_t l9_180=l9_163;
float3 l9_181=in.blendShape2Pos;
float3 l9_182=in.blendShape2Normal;
float l9_183=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_184=l9_180;
float3 l9_185=l9_181;
float l9_186=l9_183;
float3 l9_187=l9_184.position.xyz+(l9_185*l9_186);
l9_184.position=float4(l9_187.x,l9_187.y,l9_187.z,l9_184.position.w);
l9_180=l9_184;
l9_180.normal+=(l9_182*l9_183);
l9_163=l9_180;
}
else
{
sc_Vertex_t l9_188=l9_163;
float3 l9_189=in.blendShape0Pos;
float l9_190=(*sc_set0.UserUniforms).weights0.x;
float3 l9_191=l9_188.position.xyz+(l9_189*l9_190);
l9_188.position=float4(l9_191.x,l9_191.y,l9_191.z,l9_188.position.w);
l9_163=l9_188;
sc_Vertex_t l9_192=l9_163;
float3 l9_193=in.blendShape1Pos;
float l9_194=(*sc_set0.UserUniforms).weights0.y;
float3 l9_195=l9_192.position.xyz+(l9_193*l9_194);
l9_192.position=float4(l9_195.x,l9_195.y,l9_195.z,l9_192.position.w);
l9_163=l9_192;
sc_Vertex_t l9_196=l9_163;
float3 l9_197=in.blendShape2Pos;
float l9_198=(*sc_set0.UserUniforms).weights0.z;
float3 l9_199=l9_196.position.xyz+(l9_197*l9_198);
l9_196.position=float4(l9_199.x,l9_199.y,l9_199.z,l9_196.position.w);
l9_163=l9_196;
sc_Vertex_t l9_200=l9_163;
float3 l9_201=in.blendShape3Pos;
float l9_202=(*sc_set0.UserUniforms).weights0.w;
float3 l9_203=l9_200.position.xyz+(l9_201*l9_202);
l9_200.position=float4(l9_203.x,l9_203.y,l9_203.z,l9_200.position.w);
l9_163=l9_200;
sc_Vertex_t l9_204=l9_163;
float3 l9_205=in.blendShape4Pos;
float l9_206=(*sc_set0.UserUniforms).weights1.x;
float3 l9_207=l9_204.position.xyz+(l9_205*l9_206);
l9_204.position=float4(l9_207.x,l9_207.y,l9_207.z,l9_204.position.w);
l9_163=l9_204;
sc_Vertex_t l9_208=l9_163;
float3 l9_209=in.blendShape5Pos;
float l9_210=(*sc_set0.UserUniforms).weights1.y;
float3 l9_211=l9_208.position.xyz+(l9_209*l9_210);
l9_208.position=float4(l9_211.x,l9_211.y,l9_211.z,l9_208.position.w);
l9_163=l9_208;
}
}
l9_162=l9_163;
sc_Vertex_t l9_212=l9_162;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_213=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_213=float4(1.0,fract(in.boneData.yzw));
l9_213.x-=dot(l9_213.yzw,float3(1.0));
}
float4 l9_214=l9_213;
float4 l9_215=l9_214;
int l9_216=int(in.boneData.x);
int l9_217=int(in.boneData.y);
int l9_218=int(in.boneData.z);
int l9_219=int(in.boneData.w);
int l9_220=l9_216;
float4 l9_221=l9_212.position;
float3 l9_222=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_223=l9_220;
float4 l9_224=(*sc_set0.sc_BonesUBO).sc_Bones[l9_223].boneMatrix[0];
float4 l9_225=(*sc_set0.sc_BonesUBO).sc_Bones[l9_223].boneMatrix[1];
float4 l9_226=(*sc_set0.sc_BonesUBO).sc_Bones[l9_223].boneMatrix[2];
float4 l9_227[3];
l9_227[0]=l9_224;
l9_227[1]=l9_225;
l9_227[2]=l9_226;
l9_222=float3(dot(l9_221,l9_227[0]),dot(l9_221,l9_227[1]),dot(l9_221,l9_227[2]));
}
else
{
l9_222=l9_221.xyz;
}
float3 l9_228=l9_222;
float3 l9_229=l9_228;
float l9_230=l9_215.x;
int l9_231=l9_217;
float4 l9_232=l9_212.position;
float3 l9_233=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_234=l9_231;
float4 l9_235=(*sc_set0.sc_BonesUBO).sc_Bones[l9_234].boneMatrix[0];
float4 l9_236=(*sc_set0.sc_BonesUBO).sc_Bones[l9_234].boneMatrix[1];
float4 l9_237=(*sc_set0.sc_BonesUBO).sc_Bones[l9_234].boneMatrix[2];
float4 l9_238[3];
l9_238[0]=l9_235;
l9_238[1]=l9_236;
l9_238[2]=l9_237;
l9_233=float3(dot(l9_232,l9_238[0]),dot(l9_232,l9_238[1]),dot(l9_232,l9_238[2]));
}
else
{
l9_233=l9_232.xyz;
}
float3 l9_239=l9_233;
float3 l9_240=l9_239;
float l9_241=l9_215.y;
int l9_242=l9_218;
float4 l9_243=l9_212.position;
float3 l9_244=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_245=l9_242;
float4 l9_246=(*sc_set0.sc_BonesUBO).sc_Bones[l9_245].boneMatrix[0];
float4 l9_247=(*sc_set0.sc_BonesUBO).sc_Bones[l9_245].boneMatrix[1];
float4 l9_248=(*sc_set0.sc_BonesUBO).sc_Bones[l9_245].boneMatrix[2];
float4 l9_249[3];
l9_249[0]=l9_246;
l9_249[1]=l9_247;
l9_249[2]=l9_248;
l9_244=float3(dot(l9_243,l9_249[0]),dot(l9_243,l9_249[1]),dot(l9_243,l9_249[2]));
}
else
{
l9_244=l9_243.xyz;
}
float3 l9_250=l9_244;
float3 l9_251=l9_250;
float l9_252=l9_215.z;
int l9_253=l9_219;
float4 l9_254=l9_212.position;
float3 l9_255=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_256=l9_253;
float4 l9_257=(*sc_set0.sc_BonesUBO).sc_Bones[l9_256].boneMatrix[0];
float4 l9_258=(*sc_set0.sc_BonesUBO).sc_Bones[l9_256].boneMatrix[1];
float4 l9_259=(*sc_set0.sc_BonesUBO).sc_Bones[l9_256].boneMatrix[2];
float4 l9_260[3];
l9_260[0]=l9_257;
l9_260[1]=l9_258;
l9_260[2]=l9_259;
l9_255=float3(dot(l9_254,l9_260[0]),dot(l9_254,l9_260[1]),dot(l9_254,l9_260[2]));
}
else
{
l9_255=l9_254.xyz;
}
float3 l9_261=l9_255;
float3 l9_262=(((l9_229*l9_230)+(l9_240*l9_241))+(l9_251*l9_252))+(l9_261*l9_215.w);
l9_212.position=float4(l9_262.x,l9_262.y,l9_262.z,l9_212.position.w);
int l9_263=l9_216;
float3x3 l9_264=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_263].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_263].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_263].normalMatrix[2].xyz));
float3x3 l9_265=l9_264;
float3x3 l9_266=l9_265;
int l9_267=l9_217;
float3x3 l9_268=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_267].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_267].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_267].normalMatrix[2].xyz));
float3x3 l9_269=l9_268;
float3x3 l9_270=l9_269;
int l9_271=l9_218;
float3x3 l9_272=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_271].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_271].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_271].normalMatrix[2].xyz));
float3x3 l9_273=l9_272;
float3x3 l9_274=l9_273;
int l9_275=l9_219;
float3x3 l9_276=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_275].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_275].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_275].normalMatrix[2].xyz));
float3x3 l9_277=l9_276;
float3x3 l9_278=l9_277;
l9_212.normal=((((l9_266*l9_212.normal)*l9_215.x)+((l9_270*l9_212.normal)*l9_215.y))+((l9_274*l9_212.normal)*l9_215.z))+((l9_278*l9_212.normal)*l9_215.w);
l9_212.tangent=((((l9_266*l9_212.tangent)*l9_215.x)+((l9_270*l9_212.tangent)*l9_215.y))+((l9_274*l9_212.tangent)*l9_215.z))+((l9_278*l9_212.tangent)*l9_215.w);
}
l9_162=l9_212;
float l9_279=(*sc_set0.UserUniforms).voxelization_params_0.y;
float l9_280=(*sc_set0.UserUniforms).voxelization_params_0.z;
float l9_281=(*sc_set0.UserUniforms).voxelization_params_0.w;
float l9_282=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_283=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_284=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_285=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_286=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_287=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float3 l9_288=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float l9_289=l9_279/l9_280;
int l9_290=gl_InstanceIndex;
int l9_291=l9_290;
l9_162.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_162.position;
float3 l9_292=l9_162.position.xyz;
float3 l9_293=float3(float(l9_291%int(l9_281))*l9_279,float(l9_291/int(l9_281))*l9_279,(float(l9_291)*l9_289)+l9_286);
float3 l9_294=l9_292+l9_293;
float4 l9_295=float4(l9_294-l9_288,1.0);
float l9_296=l9_282;
float l9_297=l9_283;
float l9_298=l9_284;
float l9_299=l9_285;
float l9_300=l9_286;
float l9_301=l9_287;
float4x4 l9_302=float4x4(float4(2.0/(l9_297-l9_296),0.0,0.0,(-(l9_297+l9_296))/(l9_297-l9_296)),float4(0.0,2.0/(l9_299-l9_298),0.0,(-(l9_299+l9_298))/(l9_299-l9_298)),float4(0.0,0.0,(-2.0)/(l9_301-l9_300),(-(l9_301+l9_300))/(l9_301-l9_300)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_303=l9_302;
float4 l9_304=l9_303*l9_295;
l9_304.w=1.0;
out.varScreenPos=l9_304;
float4 l9_305=l9_304*1.0;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_305.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_306=l9_305;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_307=dot(l9_306,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_308=l9_307;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_308;
}
}
float4 l9_309=float4(l9_305.x,-l9_305.y,(l9_305.z*0.5)+(l9_305.w*0.5),l9_305.w);
out.gl_Position=l9_309;
param_2=l9_162;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
sc_Vertex_t l9_310=param_2;
sc_Vertex_t l9_311=l9_310;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_312=l9_311;
float3 l9_313=in.blendShape0Pos;
float3 l9_314=in.blendShape0Normal;
float l9_315=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_316=l9_312;
float3 l9_317=l9_313;
float l9_318=l9_315;
float3 l9_319=l9_316.position.xyz+(l9_317*l9_318);
l9_316.position=float4(l9_319.x,l9_319.y,l9_319.z,l9_316.position.w);
l9_312=l9_316;
l9_312.normal+=(l9_314*l9_315);
l9_311=l9_312;
sc_Vertex_t l9_320=l9_311;
float3 l9_321=in.blendShape1Pos;
float3 l9_322=in.blendShape1Normal;
float l9_323=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_324=l9_320;
float3 l9_325=l9_321;
float l9_326=l9_323;
float3 l9_327=l9_324.position.xyz+(l9_325*l9_326);
l9_324.position=float4(l9_327.x,l9_327.y,l9_327.z,l9_324.position.w);
l9_320=l9_324;
l9_320.normal+=(l9_322*l9_323);
l9_311=l9_320;
sc_Vertex_t l9_328=l9_311;
float3 l9_329=in.blendShape2Pos;
float3 l9_330=in.blendShape2Normal;
float l9_331=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_332=l9_328;
float3 l9_333=l9_329;
float l9_334=l9_331;
float3 l9_335=l9_332.position.xyz+(l9_333*l9_334);
l9_332.position=float4(l9_335.x,l9_335.y,l9_335.z,l9_332.position.w);
l9_328=l9_332;
l9_328.normal+=(l9_330*l9_331);
l9_311=l9_328;
}
else
{
sc_Vertex_t l9_336=l9_311;
float3 l9_337=in.blendShape0Pos;
float l9_338=(*sc_set0.UserUniforms).weights0.x;
float3 l9_339=l9_336.position.xyz+(l9_337*l9_338);
l9_336.position=float4(l9_339.x,l9_339.y,l9_339.z,l9_336.position.w);
l9_311=l9_336;
sc_Vertex_t l9_340=l9_311;
float3 l9_341=in.blendShape1Pos;
float l9_342=(*sc_set0.UserUniforms).weights0.y;
float3 l9_343=l9_340.position.xyz+(l9_341*l9_342);
l9_340.position=float4(l9_343.x,l9_343.y,l9_343.z,l9_340.position.w);
l9_311=l9_340;
sc_Vertex_t l9_344=l9_311;
float3 l9_345=in.blendShape2Pos;
float l9_346=(*sc_set0.UserUniforms).weights0.z;
float3 l9_347=l9_344.position.xyz+(l9_345*l9_346);
l9_344.position=float4(l9_347.x,l9_347.y,l9_347.z,l9_344.position.w);
l9_311=l9_344;
sc_Vertex_t l9_348=l9_311;
float3 l9_349=in.blendShape3Pos;
float l9_350=(*sc_set0.UserUniforms).weights0.w;
float3 l9_351=l9_348.position.xyz+(l9_349*l9_350);
l9_348.position=float4(l9_351.x,l9_351.y,l9_351.z,l9_348.position.w);
l9_311=l9_348;
sc_Vertex_t l9_352=l9_311;
float3 l9_353=in.blendShape4Pos;
float l9_354=(*sc_set0.UserUniforms).weights1.x;
float3 l9_355=l9_352.position.xyz+(l9_353*l9_354);
l9_352.position=float4(l9_355.x,l9_355.y,l9_355.z,l9_352.position.w);
l9_311=l9_352;
sc_Vertex_t l9_356=l9_311;
float3 l9_357=in.blendShape5Pos;
float l9_358=(*sc_set0.UserUniforms).weights1.y;
float3 l9_359=l9_356.position.xyz+(l9_357*l9_358);
l9_356.position=float4(l9_359.x,l9_359.y,l9_359.z,l9_356.position.w);
l9_311=l9_356;
}
}
l9_310=l9_311;
sc_Vertex_t l9_360=l9_310;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_361=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_361=float4(1.0,fract(in.boneData.yzw));
l9_361.x-=dot(l9_361.yzw,float3(1.0));
}
float4 l9_362=l9_361;
float4 l9_363=l9_362;
int l9_364=int(in.boneData.x);
int l9_365=int(in.boneData.y);
int l9_366=int(in.boneData.z);
int l9_367=int(in.boneData.w);
int l9_368=l9_364;
float4 l9_369=l9_360.position;
float3 l9_370=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_371=l9_368;
float4 l9_372=(*sc_set0.sc_BonesUBO).sc_Bones[l9_371].boneMatrix[0];
float4 l9_373=(*sc_set0.sc_BonesUBO).sc_Bones[l9_371].boneMatrix[1];
float4 l9_374=(*sc_set0.sc_BonesUBO).sc_Bones[l9_371].boneMatrix[2];
float4 l9_375[3];
l9_375[0]=l9_372;
l9_375[1]=l9_373;
l9_375[2]=l9_374;
l9_370=float3(dot(l9_369,l9_375[0]),dot(l9_369,l9_375[1]),dot(l9_369,l9_375[2]));
}
else
{
l9_370=l9_369.xyz;
}
float3 l9_376=l9_370;
float3 l9_377=l9_376;
float l9_378=l9_363.x;
int l9_379=l9_365;
float4 l9_380=l9_360.position;
float3 l9_381=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_382=l9_379;
float4 l9_383=(*sc_set0.sc_BonesUBO).sc_Bones[l9_382].boneMatrix[0];
float4 l9_384=(*sc_set0.sc_BonesUBO).sc_Bones[l9_382].boneMatrix[1];
float4 l9_385=(*sc_set0.sc_BonesUBO).sc_Bones[l9_382].boneMatrix[2];
float4 l9_386[3];
l9_386[0]=l9_383;
l9_386[1]=l9_384;
l9_386[2]=l9_385;
l9_381=float3(dot(l9_380,l9_386[0]),dot(l9_380,l9_386[1]),dot(l9_380,l9_386[2]));
}
else
{
l9_381=l9_380.xyz;
}
float3 l9_387=l9_381;
float3 l9_388=l9_387;
float l9_389=l9_363.y;
int l9_390=l9_366;
float4 l9_391=l9_360.position;
float3 l9_392=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_393=l9_390;
float4 l9_394=(*sc_set0.sc_BonesUBO).sc_Bones[l9_393].boneMatrix[0];
float4 l9_395=(*sc_set0.sc_BonesUBO).sc_Bones[l9_393].boneMatrix[1];
float4 l9_396=(*sc_set0.sc_BonesUBO).sc_Bones[l9_393].boneMatrix[2];
float4 l9_397[3];
l9_397[0]=l9_394;
l9_397[1]=l9_395;
l9_397[2]=l9_396;
l9_392=float3(dot(l9_391,l9_397[0]),dot(l9_391,l9_397[1]),dot(l9_391,l9_397[2]));
}
else
{
l9_392=l9_391.xyz;
}
float3 l9_398=l9_392;
float3 l9_399=l9_398;
float l9_400=l9_363.z;
int l9_401=l9_367;
float4 l9_402=l9_360.position;
float3 l9_403=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_404=l9_401;
float4 l9_405=(*sc_set0.sc_BonesUBO).sc_Bones[l9_404].boneMatrix[0];
float4 l9_406=(*sc_set0.sc_BonesUBO).sc_Bones[l9_404].boneMatrix[1];
float4 l9_407=(*sc_set0.sc_BonesUBO).sc_Bones[l9_404].boneMatrix[2];
float4 l9_408[3];
l9_408[0]=l9_405;
l9_408[1]=l9_406;
l9_408[2]=l9_407;
l9_403=float3(dot(l9_402,l9_408[0]),dot(l9_402,l9_408[1]),dot(l9_402,l9_408[2]));
}
else
{
l9_403=l9_402.xyz;
}
float3 l9_409=l9_403;
float3 l9_410=(((l9_377*l9_378)+(l9_388*l9_389))+(l9_399*l9_400))+(l9_409*l9_363.w);
l9_360.position=float4(l9_410.x,l9_410.y,l9_410.z,l9_360.position.w);
int l9_411=l9_364;
float3x3 l9_412=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_411].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_411].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_411].normalMatrix[2].xyz));
float3x3 l9_413=l9_412;
float3x3 l9_414=l9_413;
int l9_415=l9_365;
float3x3 l9_416=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_415].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_415].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_415].normalMatrix[2].xyz));
float3x3 l9_417=l9_416;
float3x3 l9_418=l9_417;
int l9_419=l9_366;
float3x3 l9_420=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_419].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_419].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_419].normalMatrix[2].xyz));
float3x3 l9_421=l9_420;
float3x3 l9_422=l9_421;
int l9_423=l9_367;
float3x3 l9_424=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_423].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_423].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_423].normalMatrix[2].xyz));
float3x3 l9_425=l9_424;
float3x3 l9_426=l9_425;
l9_360.normal=((((l9_414*l9_360.normal)*l9_363.x)+((l9_418*l9_360.normal)*l9_363.y))+((l9_422*l9_360.normal)*l9_363.z))+((l9_426*l9_360.normal)*l9_363.w);
l9_360.tangent=((((l9_414*l9_360.tangent)*l9_363.x)+((l9_418*l9_360.tangent)*l9_363.y))+((l9_422*l9_360.tangent)*l9_363.z))+((l9_426*l9_360.tangent)*l9_363.w);
}
l9_310=l9_360;
float3 l9_427=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float2 l9_428=((l9_310.position.xy/float2(l9_310.position.w))*0.5)+float2(0.5);
out.varTex01=float4(l9_428.x,l9_428.y,out.varTex01.z,out.varTex01.w);
l9_310.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_310.position;
float3 l9_429=l9_310.position.xyz-l9_427;
l9_310.position=float4(l9_429.x,l9_429.y,l9_429.z,l9_310.position.w);
out.varPosAndMotion=float4(l9_310.position.xyz.x,l9_310.position.xyz.y,l9_310.position.xyz.z,out.varPosAndMotion.w);
float3 l9_430=normalize(l9_310.normal);
out.varNormalAndMotion=float4(l9_430.x,l9_430.y,l9_430.z,out.varNormalAndMotion.w);
float l9_431=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_432=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_433=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_434=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_435=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_436=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float l9_437=l9_431;
float l9_438=l9_432;
float l9_439=l9_433;
float l9_440=l9_434;
float l9_441=l9_435;
float l9_442=l9_436;
float4x4 l9_443=float4x4(float4(2.0/(l9_438-l9_437),0.0,0.0,(-(l9_438+l9_437))/(l9_438-l9_437)),float4(0.0,2.0/(l9_440-l9_439),0.0,(-(l9_440+l9_439))/(l9_440-l9_439)),float4(0.0,0.0,(-2.0)/(l9_442-l9_441),(-(l9_442+l9_441))/(l9_442-l9_441)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_444=l9_443;
float4 l9_445=float4(0.0);
float3 l9_446=(l9_444*l9_310.position).xyz;
l9_445=float4(l9_446.x,l9_446.y,l9_446.z,l9_445.w);
l9_445.w=1.0;
out.varScreenPos=l9_445;
float4 l9_447=l9_445*1.0;
float4 l9_448=l9_447;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_448.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_449=l9_448;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_450=dot(l9_449,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_451=l9_450;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_451;
}
}
float4 l9_452=float4(l9_448.x,-l9_448.y,(l9_448.z*0.5)+(l9_448.w*0.5),l9_448.w);
out.gl_Position=l9_452;
param_2=l9_310;
}
}
v=param_2;
float3 param_7=out.varPosAndMotion.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float4 l9_453=((*sc_set0.UserUniforms).sc_PrevFrameModelMatrix*(*sc_set0.UserUniforms).sc_ModelMatrixInverse)*float4(param_7,1.0);
float3 l9_454=param_7;
float3 l9_455=l9_453.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
int l9_456=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_456=0;
}
else
{
l9_456=gl_InstanceIndex%2;
}
int l9_457=l9_456;
float4 l9_458=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_457]*float4(l9_454,1.0);
float2 l9_459=l9_458.xy/float2(l9_458.w);
l9_458=float4(l9_459.x,l9_459.y,l9_458.z,l9_458.w);
int l9_460=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_460=0;
}
else
{
l9_460=gl_InstanceIndex%2;
}
int l9_461=l9_460;
float4 l9_462=(*sc_set0.UserUniforms).sc_PrevFrameViewProjectionMatrixArray[l9_461]*float4(l9_455,1.0);
float2 l9_463=l9_462.xy/float2(l9_462.w);
l9_462=float4(l9_463.x,l9_463.y,l9_462.z,l9_462.w);
float2 l9_464=(l9_458.xy-l9_462.xy)*0.5;
out.varPosAndMotion.w=l9_464.x;
out.varNormalAndMotion.w=l9_464.y;
}
}
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct sc_RayTracingHitPayload
{
float3 viewDirWS;
float3 positionWS;
float3 normalWS;
float4 tangentWS;
float4 color;
float2 uv0;
float2 uv1;
float2 uv2;
float2 uv3;
uint2 id;
};
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 VertexNormal_WorldSpace;
float3 VertexTangent_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 ViewDirWS;
float3 SurfacePosition_WorldSpace;
float2 Surface_UVCoord0;
float3 BumpedNormal;
float3 PositionWS;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int sc_RayTracingReceiverEffectsMask;
float4 sc_RayTracingReflectionsSize;
float4 sc_RayTracingReflectionsDims;
float4 sc_RayTracingReflectionsView;
float4 sc_RayTracingGlobalIlluminationSize;
float4 sc_RayTracingGlobalIlluminationDims;
float4 sc_RayTracingGlobalIlluminationView;
float4 sc_RayTracingShadowsSize;
float4 sc_RayTracingShadowsDims;
float4 sc_RayTracingShadowsView;
float3 sc_RayTracingOriginScale;
uint sc_RayTracingReceiverMask;
float3 sc_RayTracingOriginScaleInv;
float3 sc_RayTracingOriginOffset;
uint sc_RayTracingReceiverId;
uint4 sc_RayTracingCasterConfiguration;
uint4 sc_RayTracingCasterOffsetPNTC;
uint4 sc_RayTracingCasterOffsetTexture;
uint4 sc_RayTracingCasterFormatPNTC;
uint4 sc_RayTracingCasterFormatTexture;
float4 sc_RayTracingRayDirectionSize;
float4 sc_RayTracingRayDirectionDims;
float4 sc_RayTracingRayDirectionView;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float Tweak_N16;
float4 Tweak_N25Size;
float4 Tweak_N25Dims;
float4 Tweak_N25View;
float3x3 Tweak_N25Transform;
float4 Tweak_N25UvMinMax;
float4 Tweak_N25BorderColor;
float4 Tweak_N27Size;
float4 Tweak_N27Dims;
float4 Tweak_N27View;
float3x3 Tweak_N27Transform;
float4 Tweak_N27UvMinMax;
float4 Tweak_N27BorderColor;
int ColorOnOffid03;
int pbrOnOffId03;
int rimOnOffId03;
float rimExpId03;
float rimIntId03;
int patternOnOffId03;
float4 patternColorId03;
int pngPatternId03;
float4 patternTextureId03Size;
float4 patternTextureId03Dims;
float4 patternTextureId03View;
float3x3 patternTextureId03Transform;
float4 patternTextureId03UvMinMax;
float4 patternTextureId03BorderColor;
float2 patternScaleId03;
float2 patternOffsetId03;
float patternRotateId03;
float4 colorId03;
float4 greyMaskIdSize;
float4 greyMaskIdDims;
float4 greyMaskIdView;
float3x3 greyMaskIdTransform;
float4 greyMaskIdUvMinMax;
float4 greyMaskIdBorderColor;
float metallicId03;
float rougnessId03;
int ColorOnOffid02;
int pbrOnOffId02;
int rimOnOffId02;
float rimExpId02;
float rimIntId02;
int patternOnOffId02;
float4 patternColorId02;
int pngPatternId02;
float4 patternTextureId02Size;
float4 patternTextureId02Dims;
float4 patternTextureId02View;
float3x3 patternTextureId02Transform;
float4 patternTextureId02UvMinMax;
float4 patternTextureId02BorderColor;
float2 patternScaleId02;
float2 patternOffsetId02;
float patternRotateId02;
float4 colorId02;
float metallicId02;
float rougnessId02;
int pbrOnOffId01;
int rimOnOffId01;
float rimExpId01;
float rimIntId01;
int patternOnOffId01;
float4 patternColorId01;
int pngPatternId01;
float4 patternTextureId01Size;
float4 patternTextureId01Dims;
float4 patternTextureId01View;
float3x3 patternTextureId01Transform;
float4 patternTextureId01UvMinMax;
float4 patternTextureId01BorderColor;
float2 patternScaleId01;
float2 patternOffsetId01;
float patternRotateId01;
float4 colorId01;
float metallicId01;
float rougnessId01;
float Tweak_N47;
float Port_Import_N008;
float3 Port_Import_N014;
float2 Port_Center_N379;
float2 Port_Center_N383;
float Port_Input1_N006;
float Port_Input1_N009;
float4 Port_Default_N358;
float Port_Mask_N399;
float Port_Opacity_N410;
float3 Port_Normal_N410;
float3 Port_Emissive_N410;
float3 Port_AO_N410;
float3 Port_SpecularAO_N410;
float2 Port_Center_N282;
float2 Port_Center_N286;
float Port_Input1_N038;
float Port_Input1_N035;
float4 Port_Default_N338;
float Port_Mask_N302;
float Port_Opacity_N313;
float3 Port_Normal_N313;
float3 Port_Emissive_N313;
float3 Port_AO_N313;
float3 Port_SpecularAO_N313;
float2 Port_Center_N122;
float2 Port_Center_N126;
float Port_Input1_N034;
float Port_Mask_N139;
float Port_Opacity_N152;
float3 Port_Normal_N152;
float3 Port_Emissive_N152;
float3 Port_AO_N152;
float3 Port_SpecularAO_N152;
float Port_Mask_N263;
float Port_Mask_N418;
float4 Port_Input1_N051;
float4 Port_Input2_N051;
float4 Port_Input0_N102;
float4 Port_Import_N059;
float Port_Import_N060;
float4 Port_Input1_N062;
float Port_Import_N063;
float Port_Import_N100;
float4 Port_Input1_N070;
float4 Port_Input2_N070;
float depthRef;
};
struct sc_RayTracingCasterVertexBuffer_obj
{
float sc_RayTracingCasterVertices[1];
};
struct sc_RayTracingCasterNonAnimatedVertexBuffer_obj
{
float sc_RayTracingCasterNonAnimatedVertices[1];
};
struct sc_RayTracingCasterIndexBuffer_obj
{
uint sc_RayTracingCasterTriangles[1];
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
const device sc_RayTracingCasterIndexBuffer_obj* sc_RayTracingCasterIndexBuffer [[id(0)]];
const device sc_RayTracingCasterVertexBuffer_obj* sc_RayTracingCasterVertexBuffer [[id(1)]];
const device sc_RayTracingCasterNonAnimatedVertexBuffer_obj* sc_RayTracingCasterNonAnimatedVertexBuffer [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> Tweak_N25 [[id(4)]];
texture2d<float> Tweak_N27 [[id(5)]];
texture2d<float> greyMaskId [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> patternTextureId01 [[id(8)]];
texture2d<float> patternTextureId02 [[id(9)]];
texture2d<float> patternTextureId03 [[id(10)]];
texture2d<float> sc_EnvmapDiffuse [[id(11)]];
texture2d<float> sc_EnvmapSpecular [[id(12)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(21)]];
texture2d<uint> sc_RayTracingHitCasterIdAndBarycentric [[id(22)]];
texture2d<float> sc_RayTracingRayDirection [[id(23)]];
texture2d<float> sc_RayTracingReflections [[id(24)]];
texture2d<float> sc_RayTracingShadows [[id(25)]];
texture2d<float> sc_SSAOTexture [[id(26)]];
texture2d<float> sc_ScreenTexture [[id(27)]];
texture2d<float> sc_ShadowTexture [[id(28)]];
sampler Tweak_N25SmpSC [[id(30)]];
sampler Tweak_N27SmpSC [[id(31)]];
sampler greyMaskIdSmpSC [[id(32)]];
sampler intensityTextureSmpSC [[id(33)]];
sampler patternTextureId01SmpSC [[id(34)]];
sampler patternTextureId02SmpSC [[id(35)]];
sampler patternTextureId03SmpSC [[id(36)]];
sampler sc_EnvmapDiffuseSmpSC [[id(37)]];
sampler sc_EnvmapSpecularSmpSC [[id(38)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(40)]];
sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC [[id(41)]];
sampler sc_RayTracingRayDirectionSmpSC [[id(42)]];
sampler sc_RayTracingReflectionsSmpSC [[id(43)]];
sampler sc_RayTracingShadowsSmpSC [[id(44)]];
sampler sc_SSAOTextureSmpSC [[id(45)]];
sampler sc_ScreenTextureSmpSC [[id(46)]];
sampler sc_ShadowTextureSmpSC [[id(47)]];
constant userUniformsObj* UserUniforms [[id(49)]];
};
struct main_frag_out
{
float4 sc_FragData0 [[color(0)]];
};
struct main_frag_in
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
// Implementation of the GLSL radians() function
template<typename T>
T radians(T d)
{
return d*T(0.01745329251);
}
sc_RayTracingHitPayload sc_RayTracingEvaluateHitPayload(thread const int2& screenPos,constant userUniformsObj& UserUniforms,const device sc_RayTracingCasterVertexBuffer_obj& sc_RayTracingCasterVertexBuffer,const device sc_RayTracingCasterNonAnimatedVertexBuffer_obj& sc_RayTracingCasterNonAnimatedVertexBuffer,const device sc_RayTracingCasterIndexBuffer_obj& sc_RayTracingCasterIndexBuffer,thread texture2d<uint> sc_RayTracingHitCasterIdAndBarycentric,thread sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC,thread texture2d<float> sc_RayTracingRayDirection,thread sampler sc_RayTracingRayDirectionSmpSC)
{
uint4 idAndBarycentric=sc_RayTracingHitCasterIdAndBarycentric.read(uint2(screenPos),0);
sc_RayTracingHitPayload rhp;
rhp.id=idAndBarycentric.xy;
if (rhp.id.x!=(UserUniforms.sc_RayTracingCasterConfiguration.y&65535u))
{
return rhp;
}
float2 brcVW=float2(as_type<half2>(idAndBarycentric.z|(idAndBarycentric.w<<uint(16))));
float3 brc=float3((1.0-brcVW.x)-brcVW.y,brcVW);
float2 param=sc_RayTracingRayDirection.read(uint2(screenPos),0).xy;
float3 l9_0=float3(param.x,param.y,(1.0-abs(param.x))-abs(param.y));
float l9_1=fast::clamp(-l9_0.z,0.0,1.0);
float l9_2;
if (l9_0.x>=0.0)
{
l9_2=-l9_1;
}
else
{
l9_2=l9_1;
}
float l9_3=l9_2;
float l9_4;
if (l9_0.y>=0.0)
{
l9_4=-l9_1;
}
else
{
l9_4=l9_1;
}
float2 l9_5=l9_0.xy+float2(l9_3,l9_4);
l9_0=float3(l9_5.x,l9_5.y,l9_0.z);
float3 l9_6=normalize(l9_0);
float3 rayDir=l9_6;
rhp.viewDirWS=-rayDir;
uint param_1=rhp.id.y;
uint l9_7=min(param_1,UserUniforms.sc_RayTracingCasterConfiguration.z);
uint l9_8=l9_7*6u;
uint l9_9=l9_8&4294967292u;
uint4 l9_10=(uint4(uint2(sc_RayTracingCasterIndexBuffer.sc_RayTracingCasterTriangles[l9_9/4u]),uint2(sc_RayTracingCasterIndexBuffer.sc_RayTracingCasterTriangles[(l9_9/4u)+1u]))&uint4(65535u,4294967295u,65535u,4294967295u))>>uint4(0u,16u,0u,16u);
uint3 l9_11;
if (l9_8==l9_9)
{
l9_11=l9_10.xyz;
}
else
{
l9_11=l9_10.yzw;
}
uint3 l9_12=l9_11;
uint3 i=l9_12;
if (UserUniforms.sc_RayTracingCasterConfiguration.x==2u)
{
float3 param_2=brc;
uint3 param_3=i;
uint param_4=0u;
uint3 l9_13=uint3((param_3*uint3(6u))+uint3(param_4));
uint l9_14=l9_13.x;
float3 l9_15=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_14],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_14+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_14+2u]);
uint l9_16=l9_13.y;
float3 l9_17=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_16],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_16+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_16+2u]);
uint l9_18=l9_13.z;
float3 l9_19=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_18],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_18+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_18+2u]);
float3 l9_20=((l9_15*param_2.x)+(l9_17*param_2.y))+(l9_19*param_2.z);
rhp.positionWS=l9_20;
}
else
{
float3 param_5=brc;
uint3 param_6=i;
uint3 l9_21=uint3((param_6.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.x,(param_6.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.x,(param_6.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.x);
float3 l9_22=float3(0.0);
if (UserUniforms.sc_RayTracingCasterFormatPNTC.x==5u)
{
uint l9_23=l9_21.x;
float3 l9_24=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_23],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_23+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_23+2u]);
uint l9_25=l9_21.y;
float3 l9_26=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_25],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_25+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_25+2u]);
uint l9_27=l9_21.z;
float3 l9_28=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_27],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_27+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_27+2u]);
l9_22=((l9_24*param_5.x)+(l9_26*param_5.y))+(l9_28*param_5.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.x==6u)
{
uint l9_29=l9_21.x;
float3 l9_30=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_29]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_29+1u]))).x);
uint l9_31=l9_21.y;
float3 l9_32=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_31]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_31+1u]))).x);
uint l9_33=l9_21.z;
float3 l9_34=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_33]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_33+1u]))).x);
l9_22=((l9_30*param_5.x)+(l9_32*param_5.y))+(l9_34*param_5.z);
}
else
{
l9_22=float3(1.0,0.0,0.0);
}
}
float3 l9_35=l9_22;
float3 positionOS=l9_35;
rhp.positionWS=(UserUniforms.sc_ModelMatrix*float4(positionOS,1.0)).xyz;
}
if (UserUniforms.sc_RayTracingCasterOffsetPNTC.y>0u)
{
if (UserUniforms.sc_RayTracingCasterConfiguration.x==2u)
{
float3 param_7=brc;
uint3 param_8=i;
uint param_9=3u;
uint3 l9_36=uint3((param_8*uint3(6u))+uint3(param_9));
uint l9_37=l9_36.x;
float3 l9_38=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_37],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_37+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_37+2u]);
uint l9_39=l9_36.y;
float3 l9_40=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_39],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_39+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_39+2u]);
uint l9_41=l9_36.z;
float3 l9_42=float3(sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_41],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_41+1u],sc_RayTracingCasterNonAnimatedVertexBuffer.sc_RayTracingCasterNonAnimatedVertices[l9_41+2u]);
float3 l9_43=((l9_38*param_7.x)+(l9_40*param_7.y))+(l9_42*param_7.z);
rhp.normalWS=l9_43;
}
else
{
float3 param_10=brc;
uint3 param_11=i;
uint3 l9_44=uint3((param_11.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.y,(param_11.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.y,(param_11.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.y);
float3 l9_45=float3(0.0);
if (UserUniforms.sc_RayTracingCasterFormatPNTC.y==5u)
{
uint l9_46=l9_44.x;
float3 l9_47=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_46],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_46+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_46+2u]);
uint l9_48=l9_44.y;
float3 l9_49=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_48],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_48+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_48+2u]);
uint l9_50=l9_44.z;
float3 l9_51=float3(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_50],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_50+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_50+2u]);
l9_45=((l9_47*param_10.x)+(l9_49*param_10.y))+(l9_51*param_10.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.y==6u)
{
uint l9_52=l9_44.x;
float3 l9_53=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_52]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_52+1u]))).x);
uint l9_54=l9_44.y;
float3 l9_55=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_54]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_54+1u]))).x);
uint l9_56=l9_44.z;
float3 l9_57=float3(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_56]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_56+1u]))).x);
l9_45=((l9_53*param_10.x)+(l9_55*param_10.y))+(l9_57*param_10.z);
}
else
{
l9_45=float3(1.0,0.0,0.0);
}
}
float3 l9_58=l9_45;
float3 normalOS=l9_58;
rhp.normalWS=normalize(UserUniforms.sc_NormalMatrix*normalOS);
}
}
else
{
rhp.normalWS=float3(1.0,0.0,0.0);
}
bool l9_59=!(UserUniforms.sc_RayTracingCasterConfiguration.x==2u);
bool l9_60;
if (l9_59)
{
l9_60=UserUniforms.sc_RayTracingCasterOffsetPNTC.z>0u;
}
else
{
l9_60=l9_59;
}
if (l9_60)
{
float3 param_12=brc;
uint3 param_13=i;
uint3 l9_61=uint3((param_13.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.z,(param_13.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.z,(param_13.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.z);
float4 l9_62=float4(0.0);
if (UserUniforms.sc_RayTracingCasterFormatPNTC.z==5u)
{
uint l9_63=l9_61.x;
float4 l9_64=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_63],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_63+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_63+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_63+3u]);
uint l9_65=l9_61.y;
float4 l9_66=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_65],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_65+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_65+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_65+3u]);
uint l9_67=l9_61.z;
float4 l9_68=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_67],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_67+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_67+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_67+3u]);
l9_62=((l9_64*param_12.x)+(l9_66*param_12.y))+(l9_68*param_12.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.z==6u)
{
uint l9_69=l9_61.x;
float4 l9_70=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_69]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_69+1u]))));
uint l9_71=l9_61.y;
float4 l9_72=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_71]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_71+1u]))));
uint l9_73=l9_61.z;
float4 l9_74=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_73]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_73+1u]))));
l9_62=((l9_70*param_12.x)+(l9_72*param_12.y))+(l9_74*param_12.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.z==2u)
{
uint l9_75=l9_61.x;
uint l9_76=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_75]);
uint l9_77=l9_76&255u;
uint l9_78=(l9_76>>uint(8))&255u;
uint l9_79=(l9_76>>uint(16))&255u;
uint l9_80=(l9_76>>uint(24))&255u;
float4 l9_81=float4(float(l9_77),float(l9_78),float(l9_79),float(l9_80))/float4(255.0);
uint l9_82=l9_61.y;
uint l9_83=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_82]);
uint l9_84=l9_83&255u;
uint l9_85=(l9_83>>uint(8))&255u;
uint l9_86=(l9_83>>uint(16))&255u;
uint l9_87=(l9_83>>uint(24))&255u;
float4 l9_88=float4(float(l9_84),float(l9_85),float(l9_86),float(l9_87))/float4(255.0);
uint l9_89=l9_61.z;
uint l9_90=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_89]);
uint l9_91=l9_90&255u;
uint l9_92=(l9_90>>uint(8))&255u;
uint l9_93=(l9_90>>uint(16))&255u;
uint l9_94=(l9_90>>uint(24))&255u;
float4 l9_95=float4(float(l9_91),float(l9_92),float(l9_93),float(l9_94))/float4(255.0);
l9_62=((l9_81*param_12.x)+(l9_88*param_12.y))+(l9_95*param_12.z);
}
else
{
l9_62=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_96=l9_62;
float4 tangentOS=l9_96;
float3 tangentWS=normalize(UserUniforms.sc_NormalMatrix*tangentOS.xyz);
rhp.tangentWS=float4(tangentWS,tangentOS.w);
}
else
{
rhp.tangentWS=float4(1.0,0.0,0.0,1.0);
}
if (UserUniforms.sc_RayTracingCasterFormatPNTC.w>0u)
{
float3 param_14=brc;
uint3 param_15=i;
uint3 l9_97=uint3((param_15.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.w,(param_15.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.w,(param_15.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetPNTC.w);
float4 l9_98=float4(0.0);
if (UserUniforms.sc_RayTracingCasterFormatPNTC.w==5u)
{
uint l9_99=l9_97.x;
float4 l9_100=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_99],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_99+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_99+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_99+3u]);
uint l9_101=l9_97.y;
float4 l9_102=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_101],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_101+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_101+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_101+3u]);
uint l9_103=l9_97.z;
float4 l9_104=float4(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_103],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_103+1u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_103+2u],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_103+3u]);
l9_98=((l9_100*param_14.x)+(l9_102*param_14.y))+(l9_104*param_14.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.w==6u)
{
uint l9_105=l9_97.x;
float4 l9_106=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_105]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_105+1u]))));
uint l9_107=l9_97.y;
float4 l9_108=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_107]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_107+1u]))));
uint l9_109=l9_97.z;
float4 l9_110=float4(float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_109]))),float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_109+1u]))));
l9_98=((l9_106*param_14.x)+(l9_108*param_14.y))+(l9_110*param_14.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatPNTC.w==2u)
{
uint l9_111=l9_97.x;
uint l9_112=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_111]);
uint l9_113=l9_112&255u;
uint l9_114=(l9_112>>uint(8))&255u;
uint l9_115=(l9_112>>uint(16))&255u;
uint l9_116=(l9_112>>uint(24))&255u;
float4 l9_117=float4(float(l9_113),float(l9_114),float(l9_115),float(l9_116))/float4(255.0);
uint l9_118=l9_97.y;
uint l9_119=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_118]);
uint l9_120=l9_119&255u;
uint l9_121=(l9_119>>uint(8))&255u;
uint l9_122=(l9_119>>uint(16))&255u;
uint l9_123=(l9_119>>uint(24))&255u;
float4 l9_124=float4(float(l9_120),float(l9_121),float(l9_122),float(l9_123))/float4(255.0);
uint l9_125=l9_97.z;
uint l9_126=as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_125]);
uint l9_127=l9_126&255u;
uint l9_128=(l9_126>>uint(8))&255u;
uint l9_129=(l9_126>>uint(16))&255u;
uint l9_130=(l9_126>>uint(24))&255u;
float4 l9_131=float4(float(l9_127),float(l9_128),float(l9_129),float(l9_130))/float4(255.0);
l9_98=((l9_117*param_14.x)+(l9_124*param_14.y))+(l9_131*param_14.z);
}
else
{
l9_98=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_132=l9_98;
rhp.color=l9_132;
}
float2 dummyRedBlack=float2(dot(brc,float3(uint3(1u)-(i%uint3(2u)))),0.0);
if (UserUniforms.sc_RayTracingCasterFormatTexture.x>0u)
{
float3 param_16=brc;
uint3 param_17=i;
uint3 l9_133=uint3((param_17.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.x,(param_17.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.x,(param_17.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.x);
float2 l9_134=float2(0.0);
if (UserUniforms.sc_RayTracingCasterFormatTexture.x==5u)
{
uint l9_135=l9_133.x;
float2 l9_136=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_135],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_135+1u]);
uint l9_137=l9_133.y;
float2 l9_138=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_137],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_137+1u]);
uint l9_139=l9_133.z;
float2 l9_140=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_139],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_139+1u]);
l9_134=((l9_136*param_16.x)+(l9_138*param_16.y))+(l9_140*param_16.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatTexture.x==6u)
{
uint l9_141=l9_133.x;
float2 l9_142=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_141])));
uint l9_143=l9_133.y;
float2 l9_144=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_143])));
uint l9_145=l9_133.z;
float2 l9_146=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_145])));
l9_134=((l9_142*param_16.x)+(l9_144*param_16.y))+(l9_146*param_16.z);
}
else
{
l9_134=float2(1.0,0.0);
}
}
float2 l9_147=l9_134;
rhp.uv0=l9_147;
}
else
{
rhp.uv0=dummyRedBlack;
}
if (UserUniforms.sc_RayTracingCasterFormatTexture.y>0u)
{
float3 param_18=brc;
uint3 param_19=i;
uint3 l9_148=uint3((param_19.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.y,(param_19.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.y,(param_19.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.y);
float2 l9_149=float2(0.0);
if (UserUniforms.sc_RayTracingCasterFormatTexture.y==5u)
{
uint l9_150=l9_148.x;
float2 l9_151=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_150],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_150+1u]);
uint l9_152=l9_148.y;
float2 l9_153=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_152],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_152+1u]);
uint l9_154=l9_148.z;
float2 l9_155=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_154],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_154+1u]);
l9_149=((l9_151*param_18.x)+(l9_153*param_18.y))+(l9_155*param_18.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatTexture.y==6u)
{
uint l9_156=l9_148.x;
float2 l9_157=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_156])));
uint l9_158=l9_148.y;
float2 l9_159=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_158])));
uint l9_160=l9_148.z;
float2 l9_161=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_160])));
l9_149=((l9_157*param_18.x)+(l9_159*param_18.y))+(l9_161*param_18.z);
}
else
{
l9_149=float2(1.0,0.0);
}
}
float2 l9_162=l9_149;
rhp.uv1=l9_162;
}
else
{
rhp.uv1=dummyRedBlack;
}
if (UserUniforms.sc_RayTracingCasterFormatTexture.z>0u)
{
float3 param_20=brc;
uint3 param_21=i;
uint3 l9_163=uint3((param_21.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.z,(param_21.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.z,(param_21.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.z);
float2 l9_164=float2(0.0);
if (UserUniforms.sc_RayTracingCasterFormatTexture.z==5u)
{
uint l9_165=l9_163.x;
float2 l9_166=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_165],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_165+1u]);
uint l9_167=l9_163.y;
float2 l9_168=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_167],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_167+1u]);
uint l9_169=l9_163.z;
float2 l9_170=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_169],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_169+1u]);
l9_164=((l9_166*param_20.x)+(l9_168*param_20.y))+(l9_170*param_20.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatTexture.z==6u)
{
uint l9_171=l9_163.x;
float2 l9_172=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_171])));
uint l9_173=l9_163.y;
float2 l9_174=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_173])));
uint l9_175=l9_163.z;
float2 l9_176=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_175])));
l9_164=((l9_172*param_20.x)+(l9_174*param_20.y))+(l9_176*param_20.z);
}
else
{
l9_164=float2(1.0,0.0);
}
}
float2 l9_177=l9_164;
rhp.uv2=l9_177;
}
else
{
rhp.uv2=dummyRedBlack;
}
if (UserUniforms.sc_RayTracingCasterFormatTexture.w>0u)
{
float3 param_22=brc;
uint3 param_23=i;
uint3 l9_178=uint3((param_23.x*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.w,(param_23.y*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.w,(param_23.z*(UserUniforms.sc_RayTracingCasterConfiguration.y>>16u))+UserUniforms.sc_RayTracingCasterOffsetTexture.w);
float2 l9_179=float2(0.0);
if (UserUniforms.sc_RayTracingCasterFormatTexture.w==5u)
{
uint l9_180=l9_178.x;
float2 l9_181=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_180],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_180+1u]);
uint l9_182=l9_178.y;
float2 l9_183=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_182],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_182+1u]);
uint l9_184=l9_178.z;
float2 l9_185=float2(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_184],sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_184+1u]);
l9_179=((l9_181*param_22.x)+(l9_183*param_22.y))+(l9_185*param_22.z);
}
else
{
if (UserUniforms.sc_RayTracingCasterFormatTexture.w==6u)
{
uint l9_186=l9_178.x;
float2 l9_187=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_186])));
uint l9_188=l9_178.y;
float2 l9_189=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_188])));
uint l9_190=l9_178.z;
float2 l9_191=float2(as_type<half2>(as_type<uint>(sc_RayTracingCasterVertexBuffer.sc_RayTracingCasterVertices[l9_190])));
l9_179=((l9_187*param_22.x)+(l9_189*param_22.y))+(l9_191*param_22.z);
}
else
{
l9_179=float2(1.0,0.0);
}
}
float2 l9_192=l9_179;
rhp.uv3=l9_192;
}
else
{
rhp.uv3=dummyRedBlack;
}
return rhp;
}
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V,constant userUniformsObj& UserUniforms)
{
float r=fast::max(surfaceProperties.roughness,0.029999999);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=9.9999999e-09;
if (UserUniforms.sc_RayTracingCasterConfiguration.x!=0u)
{
l9_9=1e-07;
}
float l9_10=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_11=param_6;
float l9_12=param_8;
float l9_13=l9_12+1.0;
l9_13=(l9_13*l9_13)*0.125;
float l9_14=(l9_11*(1.0-l9_13))+l9_13;
float l9_15=param_7;
float l9_16=param_8;
float l9_17=l9_16+1.0;
l9_17=(l9_17*l9_17)*0.125;
float l9_18=(l9_15*(1.0-l9_17))+l9_17;
float l9_19=1.0/(l9_14*l9_18);
float param_9=VdotH;
float3 param_10=F0;
float l9_20=param_9;
float3 l9_21=param_10;
float3 l9_22=float3(1.0);
float l9_23=1.0-l9_20;
float l9_24=l9_23*l9_23;
float l9_25=(l9_24*l9_24)*l9_23;
float3 l9_26=l9_21+((l9_22-l9_21)*l9_25);
float3 l9_27=l9_26;
return l9_27*(((l9_10*l9_19)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_28=param_11;
float3 l9_29=param_12;
float3 l9_30=float3(1.0);
float l9_31=1.0-l9_28;
float l9_32=l9_31*l9_31;
float l9_33=(l9_32*l9_32)*l9_31;
float3 l9_34=l9_29+((l9_30-l9_29)*l9_33);
float3 l9_35=l9_34;
return ((l9_35*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float3 getSpecularDominantDir(thread const float3& N,thread const float3& R,thread const float& roughness)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float lerpFactor=(roughness*roughness)*roughness;
return normalize(mix(R,N,float3(lerpFactor)));
}
else
{
return R;
}
}
float3 envBRDFApprox(thread const SurfaceProperties& surfaceProperties,thread const float& NdotV)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float param=surfaceProperties.roughness;
float param_1=NdotV;
float4 l9_0=(float4(-1.0,-0.0275,-0.57200003,0.022)*param)+float4(1.0,0.0425,1.04,-0.039999999);
float l9_1=(fast::min(l9_0.x*l9_0.x,exp2((-9.2799997)*param_1))*l9_0.x)+l9_0.y;
float2 l9_2=(float2(-1.04,1.04)*l9_1)+l9_0.zw;
float2 l9_3=l9_2;
float2 AB=l9_3;
return fast::max((surfaceProperties.specColor*AB.x)+float3(AB.y),float3(0.0));
}
else
{
float3 fresnelMax=fast::max(float3(1.0-surfaceProperties.roughness),surfaceProperties.specColor);
float param_2=NdotV;
float3 param_3=surfaceProperties.specColor;
float3 param_4=fresnelMax;
float l9_4=1.0-param_2;
float l9_5=l9_4*l9_4;
float l9_6=(l9_5*l9_5)*l9_4;
float3 l9_7=param_3+((param_4-param_3)*l9_6);
return l9_7;
}
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.45454547);
}
else
{
return sqrt(x);
}
}
float4 ngsCalculateLighting(thread const float3& albedo,thread const float& opacity,thread const float3& normal,thread const float3& position,thread const float3& viewDir,thread const float3& emissive,thread const float& metallic,thread const float& roughness,thread const float3& ao,thread const float3& specularAO,thread int& varStereoViewID,thread texture2d<float> sc_EnvmapDiffuse,thread sampler sc_EnvmapDiffuseSmpSC,thread texture2d<float> sc_EnvmapSpecular,thread sampler sc_EnvmapSpecularSmpSC,thread texture2d<float> sc_ScreenTexture,thread sampler sc_ScreenTextureSmpSC,thread texture2d<float> sc_RayTracingReflections,thread sampler sc_RayTracingReflectionsSmpSC,thread texture2d<float> sc_RayTracingGlobalIllumination,thread sampler sc_RayTracingGlobalIlluminationSmpSC,thread texture2d<float> sc_RayTracingShadows,thread sampler sc_RayTracingShadowsSmpSC,thread float4& gl_FragCoord,constant userUniformsObj& UserUniforms,thread float2& varShadowTex,thread texture2d<float> sc_ShadowTexture,thread sampler sc_ShadowTextureSmpSC,thread float4& sc_FragData0,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
SurfaceProperties l9_0;
l9_0.albedo=float3(0.0);
l9_0.opacity=1.0;
l9_0.normal=float3(0.0);
l9_0.positionWS=float3(0.0);
l9_0.viewDirWS=float3(0.0);
l9_0.metallic=0.0;
l9_0.roughness=0.0;
l9_0.emissive=float3(0.0);
l9_0.ao=float3(1.0);
l9_0.specularAo=float3(1.0);
l9_0.bakedShadows=float3(1.0);
SurfaceProperties l9_1=l9_0;
SurfaceProperties surfaceProperties=l9_1;
surfaceProperties.opacity=opacity;
float3 param=albedo;
float3 l9_2;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2=float3(pow(param.x,2.2),pow(param.y,2.2),pow(param.z,2.2));
}
else
{
l9_2=param*param;
}
float3 l9_3=l9_2;
surfaceProperties.albedo=l9_3;
surfaceProperties.normal=normalize(normal);
surfaceProperties.positionWS=position;
surfaceProperties.viewDirWS=viewDir;
float3 param_1=emissive;
float3 l9_4;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4=float3(pow(param_1.x,2.2),pow(param_1.y,2.2),pow(param_1.z,2.2));
}
else
{
l9_4=param_1*param_1;
}
float3 l9_5=l9_4;
surfaceProperties.emissive=l9_5;
surfaceProperties.metallic=metallic;
surfaceProperties.roughness=roughness;
surfaceProperties.ao=ao;
surfaceProperties.specularAo=specularAO;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 param_2=surfaceProperties.positionWS;
surfaceProperties.ao=evaluateSSAO(param_2,varStereoViewID,UserUniforms,sc_SSAOTexture,sc_SSAOTextureSmpSC);
}
SurfaceProperties param_3=surfaceProperties;
SurfaceProperties l9_6=param_3;
float3 l9_7=mix(float3(0.039999999),l9_6.albedo*l9_6.metallic,float3(l9_6.metallic));
float3 l9_8=mix(l9_6.albedo*(1.0-l9_6.metallic),float3(0.0),float3(l9_6.metallic));
param_3.albedo=l9_8;
param_3.specColor=l9_7;
SurfaceProperties l9_9=param_3;
surfaceProperties=l9_9;
SurfaceProperties param_4=surfaceProperties;
LightingComponents l9_10;
l9_10.directDiffuse=float3(0.0);
l9_10.directSpecular=float3(0.0);
l9_10.indirectDiffuse=float3(1.0);
l9_10.indirectSpecular=float3(0.0);
l9_10.emitted=float3(0.0);
l9_10.transmitted=float3(0.0);
LightingComponents l9_11=l9_10;
LightingComponents l9_12=l9_11;
float3 l9_13=param_4.viewDirWS;
int l9_14=0;
float4 l9_15=float4(param_4.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_16;
LightProperties l9_17;
int l9_18=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_18<sc_DirectionalLightsCount_tmp)
{
l9_16.direction=UserUniforms.sc_DirectionalLights[l9_18].direction;
l9_16.color=UserUniforms.sc_DirectionalLights[l9_18].color;
l9_17.direction=l9_16.direction;
l9_17.color=l9_16.color.xyz;
l9_17.attenuation=l9_16.color.w;
l9_17.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
l9_14++;
LightingComponents l9_19=l9_12;
LightProperties l9_20=l9_17;
SurfaceProperties l9_21=param_4;
float3 l9_22=l9_13;
SurfaceProperties l9_23=l9_21;
float3 l9_24=l9_20.direction;
float l9_25=dot(l9_23.normal,l9_24);
float l9_26=fast::clamp(l9_25,0.0,1.0);
float3 l9_27=float3(l9_26);
l9_19.directDiffuse+=((l9_27*l9_20.color)*l9_20.attenuation);
SurfaceProperties l9_28=l9_21;
float3 l9_29=l9_20.direction;
float3 l9_30=l9_22;
l9_19.directSpecular+=((calculateDirectSpecular(l9_28,l9_29,l9_30,UserUniforms)*l9_20.color)*l9_20.attenuation);
LightingComponents l9_31=l9_19;
l9_12=l9_31;
l9_18++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_32;
LightProperties l9_33;
int l9_34=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_34<sc_PointLightsCount_tmp)
{
l9_32.falloffEnabled=UserUniforms.sc_PointLights[l9_34].falloffEnabled!=0;
l9_32.falloffEndDistance=UserUniforms.sc_PointLights[l9_34].falloffEndDistance;
l9_32.negRcpFalloffEndDistance4=UserUniforms.sc_PointLights[l9_34].negRcpFalloffEndDistance4;
l9_32.angleScale=UserUniforms.sc_PointLights[l9_34].angleScale;
l9_32.angleOffset=UserUniforms.sc_PointLights[l9_34].angleOffset;
l9_32.direction=UserUniforms.sc_PointLights[l9_34].direction;
l9_32.position=UserUniforms.sc_PointLights[l9_34].position;
l9_32.color=UserUniforms.sc_PointLights[l9_34].color;
float3 l9_35=l9_32.position-param_4.positionWS;
l9_33.direction=normalize(l9_35);
l9_33.color=l9_32.color.xyz;
l9_33.attenuation=l9_32.color.w;
l9_33.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
float3 l9_36=l9_33.direction;
float3 l9_37=l9_32.direction;
float l9_38=l9_32.angleScale;
float l9_39=l9_32.angleOffset;
float l9_40=dot(l9_36,l9_37);
float l9_41=fast::clamp((l9_40*l9_38)+l9_39,0.0,1.0);
float l9_42=l9_41*l9_41;
l9_33.attenuation*=l9_42;
if (l9_32.falloffEnabled)
{
float l9_43=length(l9_35);
float l9_44=l9_32.falloffEndDistance;
l9_33.attenuation*=computeDistanceAttenuation(l9_43,l9_44);
}
l9_14++;
LightingComponents l9_45=l9_12;
LightProperties l9_46=l9_33;
SurfaceProperties l9_47=param_4;
float3 l9_48=l9_13;
SurfaceProperties l9_49=l9_47;
float3 l9_50=l9_46.direction;
float l9_51=dot(l9_49.normal,l9_50);
float l9_52=fast::clamp(l9_51,0.0,1.0);
float3 l9_53=float3(l9_52);
l9_45.directDiffuse+=((l9_53*l9_46.color)*l9_46.attenuation);
SurfaceProperties l9_54=l9_47;
float3 l9_55=l9_46.direction;
float3 l9_56=l9_48;
l9_45.directSpecular+=((calculateDirectSpecular(l9_54,l9_55,l9_56,UserUniforms)*l9_46.color)*l9_46.attenuation);
LightingComponents l9_57=l9_45;
l9_12=l9_57;
l9_34++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_58=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_59=abs(varShadowTex-float2(0.5));
float l9_60=fast::max(l9_59.x,l9_59.y);
float l9_61=step(l9_60,0.5);
float4 l9_62=sc_ShadowTexture.sample(sc_ShadowTextureSmpSC,varShadowTex)*l9_61;
float3 l9_63=mix(UserUniforms.sc_ShadowColor.xyz,UserUniforms.sc_ShadowColor.xyz*l9_62.xyz,float3(UserUniforms.sc_ShadowColor.w));
float l9_64=l9_62.w*UserUniforms.sc_ShadowDensity;
l9_58=mix(float3(1.0),l9_63,float3(l9_64));
}
else
{
l9_58=float3(1.0);
}
float3 l9_65=l9_58;
float3 l9_66=l9_65;
l9_12.directDiffuse*=l9_66;
l9_12.directSpecular*=l9_66;
}
if ((UserUniforms.sc_RayTracingReceiverEffectsMask&4)!=0)
{
float4 l9_67=gl_FragCoord;
float2 l9_68=l9_67.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_69=l9_68;
float2 l9_70=l9_69;
float l9_71=0.0;
int l9_72;
if ((int(sc_RayTracingShadowsHasSwappedViews_tmp)!=0))
{
int l9_73=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_73=0;
}
else
{
l9_73=varStereoViewID;
}
int l9_74=l9_73;
l9_72=1-l9_74;
}
else
{
int l9_75=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_75=0;
}
else
{
l9_75=varStereoViewID;
}
int l9_76=l9_75;
l9_72=l9_76;
}
int l9_77=l9_72;
float2 l9_78=l9_70;
int l9_79=sc_RayTracingShadowsLayout_tmp;
int l9_80=l9_77;
float l9_81=l9_71;
float2 l9_82=l9_78;
int l9_83=l9_79;
int l9_84=l9_80;
float3 l9_85=float3(0.0);
if (l9_83==0)
{
l9_85=float3(l9_82,0.0);
}
else
{
if (l9_83==1)
{
l9_85=float3(l9_82.x,(l9_82.y*0.5)+(0.5-(float(l9_84)*0.5)),0.0);
}
else
{
l9_85=float3(l9_82,float(l9_84));
}
}
float3 l9_86=l9_85;
float3 l9_87=l9_86;
float4 l9_88=sc_RayTracingShadows.sample(sc_RayTracingShadowsSmpSC,l9_87.xy,bias(l9_81));
float4 l9_89=l9_88;
float4 l9_90=l9_89;
float l9_91=l9_90.x;
float l9_92=1.0-l9_91;
l9_12.directDiffuse*=l9_92;
l9_12.directSpecular*=l9_92;
}
SurfaceProperties l9_93=param_4;
float3 l9_94=l9_93.normal;
float3 l9_95=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_96=l9_94;
float3 l9_97=l9_96;
float l9_98=UserUniforms.sc_EnvmapRotation.y;
float2 l9_99=float2(0.0);
float l9_100=l9_97.x;
float l9_101=-l9_97.z;
float l9_102=(l9_100<0.0) ? (-1.0) : 1.0;
float l9_103=l9_102*acos(fast::clamp(l9_101/length(float2(l9_100,l9_101)),-1.0,1.0));
l9_99.x=l9_103-1.5707964;
l9_99.y=acos(l9_97.y);
l9_99/=float2(6.2831855,3.1415927);
l9_99.y=1.0-l9_99.y;
l9_99.x+=(l9_98/360.0);
l9_99.x=fract((l9_99.x+floor(l9_99.x))+1.0);
float2 l9_104=l9_99;
float2 l9_105=l9_104;
float4 l9_106=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_107=l9_105;
float2 l9_108=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_109=5.0;
l9_105=calcSeamlessPanoramicUvsForSampling(l9_107,l9_108,l9_109);
}
float2 l9_110=l9_105;
float l9_111=13.0;
int l9_112;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_113=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_113=0;
}
else
{
l9_113=varStereoViewID;
}
int l9_114=l9_113;
l9_112=1-l9_114;
}
else
{
int l9_115=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_115=0;
}
else
{
l9_115=varStereoViewID;
}
int l9_116=l9_115;
l9_112=l9_116;
}
int l9_117=l9_112;
float2 l9_118=l9_110;
int l9_119=sc_EnvmapSpecularLayout_tmp;
int l9_120=l9_117;
float l9_121=l9_111;
float2 l9_122=l9_118;
int l9_123=l9_119;
int l9_124=l9_120;
float3 l9_125=float3(0.0);
if (l9_123==0)
{
l9_125=float3(l9_122,0.0);
}
else
{
if (l9_123==1)
{
l9_125=float3(l9_122.x,(l9_122.y*0.5)+(0.5-(float(l9_124)*0.5)),0.0);
}
else
{
l9_125=float3(l9_122,float(l9_124));
}
}
float3 l9_126=l9_125;
float3 l9_127=l9_126;
float4 l9_128=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_127.xy,bias(l9_121));
float4 l9_129=l9_128;
l9_106=l9_129;
}
else
{
if ((int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_130=l9_105;
float2 l9_131=UserUniforms.sc_EnvmapDiffuseSize.xy;
float l9_132=0.0;
l9_105=calcSeamlessPanoramicUvsForSampling(l9_130,l9_131,l9_132);
if (UserUniforms.sc_RayTracingCasterConfiguration.x!=0u)
{
float2 l9_133=l9_105;
float l9_134=0.0;
int l9_135;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_136=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=varStereoViewID;
}
int l9_137=l9_136;
l9_135=1-l9_137;
}
else
{
int l9_138=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_138=0;
}
else
{
l9_138=varStereoViewID;
}
int l9_139=l9_138;
l9_135=l9_139;
}
int l9_140=l9_135;
float2 l9_141=l9_133;
int l9_142=sc_EnvmapDiffuseLayout_tmp;
int l9_143=l9_140;
float l9_144=l9_134;
float2 l9_145=l9_141;
int l9_146=l9_142;
int l9_147=l9_143;
float3 l9_148=float3(0.0);
if (l9_146==0)
{
l9_148=float3(l9_145,0.0);
}
else
{
if (l9_146==1)
{
l9_148=float3(l9_145.x,(l9_145.y*0.5)+(0.5-(float(l9_147)*0.5)),0.0);
}
else
{
l9_148=float3(l9_145,float(l9_147));
}
}
float3 l9_149=l9_148;
float3 l9_150=l9_149;
float4 l9_151=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_150.xy,level(l9_144));
float4 l9_152=l9_151;
l9_106=l9_152;
}
else
{
float2 l9_153=l9_105;
float l9_154=-13.0;
int l9_155;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_156=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_156=0;
}
else
{
l9_156=varStereoViewID;
}
int l9_157=l9_156;
l9_155=1-l9_157;
}
else
{
int l9_158=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_158=0;
}
else
{
l9_158=varStereoViewID;
}
int l9_159=l9_158;
l9_155=l9_159;
}
int l9_160=l9_155;
float2 l9_161=l9_153;
int l9_162=sc_EnvmapDiffuseLayout_tmp;
int l9_163=l9_160;
float l9_164=l9_154;
float2 l9_165=l9_161;
int l9_166=l9_162;
int l9_167=l9_163;
float3 l9_168=float3(0.0);
if (l9_166==0)
{
l9_168=float3(l9_165,0.0);
}
else
{
if (l9_166==1)
{
l9_168=float3(l9_165.x,(l9_165.y*0.5)+(0.5-(float(l9_167)*0.5)),0.0);
}
else
{
l9_168=float3(l9_165,float(l9_167));
}
}
float3 l9_169=l9_168;
float3 l9_170=l9_169;
float4 l9_171=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_170.xy,bias(l9_164));
float4 l9_172=l9_171;
l9_106=l9_172;
}
}
else
{
float2 l9_173=l9_105;
float l9_174=13.0;
int l9_175;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_176=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_176=0;
}
else
{
l9_176=varStereoViewID;
}
int l9_177=l9_176;
l9_175=1-l9_177;
}
else
{
int l9_178=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_178=0;
}
else
{
l9_178=varStereoViewID;
}
int l9_179=l9_178;
l9_175=l9_179;
}
int l9_180=l9_175;
float2 l9_181=l9_173;
int l9_182=sc_EnvmapSpecularLayout_tmp;
int l9_183=l9_180;
float l9_184=l9_174;
float2 l9_185=l9_181;
int l9_186=l9_182;
int l9_187=l9_183;
float3 l9_188=float3(0.0);
if (l9_186==0)
{
l9_188=float3(l9_185,0.0);
}
else
{
if (l9_186==1)
{
l9_188=float3(l9_185.x,(l9_185.y*0.5)+(0.5-(float(l9_187)*0.5)),0.0);
}
else
{
l9_188=float3(l9_185,float(l9_187));
}
}
float3 l9_189=l9_188;
float3 l9_190=l9_189;
float4 l9_191=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_190.xy,bias(l9_184));
float4 l9_192=l9_191;
l9_106=l9_192;
}
}
float4 l9_193=l9_106;
float3 l9_194=l9_193.xyz*(1.0/l9_193.w);
float3 l9_195=l9_194*UserUniforms.sc_EnvmapExposure;
l9_95=l9_195;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_196=UserUniforms.sc_Sh[0];
float3 l9_197=UserUniforms.sc_Sh[1];
float3 l9_198=UserUniforms.sc_Sh[2];
float3 l9_199=UserUniforms.sc_Sh[3];
float3 l9_200=UserUniforms.sc_Sh[4];
float3 l9_201=UserUniforms.sc_Sh[5];
float3 l9_202=UserUniforms.sc_Sh[6];
float3 l9_203=UserUniforms.sc_Sh[7];
float3 l9_204=UserUniforms.sc_Sh[8];
float3 l9_205=-l9_94;
float l9_206=0.0;
l9_206=l9_205.x;
float l9_207=l9_205.y;
float l9_208=l9_205.z;
float l9_209=l9_206*l9_206;
float l9_210=l9_207*l9_207;
float l9_211=l9_208*l9_208;
float l9_212=l9_206*l9_207;
float l9_213=l9_207*l9_208;
float l9_214=l9_206*l9_208;
float3 l9_215=((((((l9_204*0.42904299)*(l9_209-l9_210))+((l9_202*0.74312502)*l9_211))+(l9_196*0.88622701))-(l9_202*0.24770799))+((((l9_200*l9_212)+(l9_203*l9_214))+(l9_201*l9_213))*0.85808599))+((((l9_199*l9_206)+(l9_197*l9_207))+(l9_198*l9_208))*1.0233279);
l9_95=l9_215*UserUniforms.sc_ShIntensity;
}
}
if ((UserUniforms.sc_RayTracingReceiverEffectsMask&2)!=0)
{
float4 l9_216=gl_FragCoord;
float2 l9_217=l9_216.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_218=l9_217;
float2 l9_219=l9_218;
float l9_220=0.0;
int l9_221;
if ((int(sc_RayTracingGlobalIlluminationHasSwappedViews_tmp)!=0))
{
int l9_222=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_222=0;
}
else
{
l9_222=varStereoViewID;
}
int l9_223=l9_222;
l9_221=1-l9_223;
}
else
{
int l9_224=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_224=0;
}
else
{
l9_224=varStereoViewID;
}
int l9_225=l9_224;
l9_221=l9_225;
}
int l9_226=l9_221;
float2 l9_227=l9_219;
int l9_228=sc_RayTracingGlobalIlluminationLayout_tmp;
int l9_229=l9_226;
float l9_230=l9_220;
float2 l9_231=l9_227;
int l9_232=l9_228;
int l9_233=l9_229;
float3 l9_234=float3(0.0);
if (l9_232==0)
{
l9_234=float3(l9_231,0.0);
}
else
{
if (l9_232==1)
{
l9_234=float3(l9_231.x,(l9_231.y*0.5)+(0.5-(float(l9_233)*0.5)),0.0);
}
else
{
l9_234=float3(l9_231,float(l9_233));
}
}
float3 l9_235=l9_234;
float3 l9_236=l9_235;
float4 l9_237=sc_RayTracingGlobalIllumination.sample(sc_RayTracingGlobalIlluminationSmpSC,l9_236.xy,bias(l9_230));
float4 l9_238=l9_237;
float4 l9_239=l9_238;
float4 l9_240=l9_239;
l9_95=mix(l9_95,l9_240.xyz,float3(l9_240.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_95+=(UserUniforms.sc_AmbientLights[0].color*UserUniforms.sc_AmbientLights[0].intensity);
}
else
{
l9_95.x+=(1e-06*UserUniforms.sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_95+=(UserUniforms.sc_AmbientLights[1].color*UserUniforms.sc_AmbientLights[1].intensity);
}
else
{
l9_95.x+=(1e-06*UserUniforms.sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_95+=(UserUniforms.sc_AmbientLights[2].color*UserUniforms.sc_AmbientLights[2].intensity);
}
else
{
l9_95.x+=(1e-06*UserUniforms.sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_241=l9_94;
float3 l9_242=UserUniforms.sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_243;
float l9_244;
int l9_245=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_245<sc_LightEstimationSGCount_tmp)
{
l9_243.color=UserUniforms.sc_LightEstimationData.sg[l9_245].color;
l9_243.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_245].sharpness;
l9_243.axis=UserUniforms.sc_LightEstimationData.sg[l9_245].axis;
float3 l9_246=l9_241;
float l9_247=dot(l9_243.axis,l9_246);
float l9_248=l9_243.sharpness;
float l9_249=0.36000001;
float l9_250=1.0/(4.0*l9_249);
float l9_251=exp(-l9_248);
float l9_252=l9_251*l9_251;
float l9_253=1.0/l9_248;
float l9_254=(1.0+(2.0*l9_252))-l9_253;
float l9_255=((l9_251-l9_252)*l9_253)-l9_252;
float l9_256=sqrt(1.0-l9_254);
float l9_257=l9_249*l9_247;
float l9_258=l9_250*l9_256;
float l9_259=l9_257+l9_258;
float l9_260=l9_247;
float l9_261=fast::clamp(l9_260,0.0,1.0);
float l9_262=l9_261;
if (step(abs(l9_257),l9_258)>0.5)
{
l9_244=(l9_259*l9_259)/l9_256;
}
else
{
l9_244=l9_262;
}
l9_262=l9_244;
float l9_263=(l9_254*l9_262)+l9_255;
sc_SphericalGaussianLight_t l9_264=l9_243;
float3 l9_265=(l9_264.color/float3(l9_264.sharpness))*6.2831855;
float3 l9_266=(l9_265*l9_263)/float3(3.1415927);
l9_242+=l9_266;
l9_245++;
continue;
}
else
{
break;
}
}
float3 l9_267=l9_242;
l9_95+=l9_267;
}
float3 l9_268=l9_95;
float3 l9_269=l9_268;
l9_12.indirectDiffuse=l9_269;
SurfaceProperties l9_270=param_4;
float3 l9_271=l9_13;
float3 l9_272=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_273=l9_270;
float3 l9_274=l9_271;
float3 l9_275=l9_273.normal;
float3 l9_276=reflect(-l9_274,l9_275);
float3 l9_277=l9_275;
float3 l9_278=l9_276;
float l9_279=l9_273.roughness;
l9_276=getSpecularDominantDir(l9_277,l9_278,l9_279);
float l9_280=l9_273.roughness;
float l9_281=pow(l9_280,0.66666669);
float l9_282=fast::clamp(l9_281,0.0,1.0);
float l9_283=l9_282*5.0;
float l9_284=l9_283;
float l9_285=l9_284;
float3 l9_286=l9_276;
float l9_287=l9_285;
float3 l9_288=l9_286;
float l9_289=l9_287;
float4 l9_290=float4(0.0);
float3 l9_291=l9_288;
float l9_292=UserUniforms.sc_EnvmapRotation.y;
float2 l9_293=float2(0.0);
float l9_294=l9_291.x;
float l9_295=-l9_291.z;
float l9_296=(l9_294<0.0) ? (-1.0) : 1.0;
float l9_297=l9_296*acos(fast::clamp(l9_295/length(float2(l9_294,l9_295)),-1.0,1.0));
l9_293.x=l9_297-1.5707964;
l9_293.y=acos(l9_291.y);
l9_293/=float2(6.2831855,3.1415927);
l9_293.y=1.0-l9_293.y;
l9_293.x+=(l9_292/360.0);
l9_293.x=fract((l9_293.x+floor(l9_293.x))+1.0);
float2 l9_298=l9_293;
float2 l9_299=l9_298;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_300=floor(l9_289);
float l9_301=ceil(l9_289);
float l9_302=l9_289-l9_300;
float2 l9_303=l9_299;
float2 l9_304=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_305=l9_300;
float2 l9_306=calcSeamlessPanoramicUvsForSampling(l9_303,l9_304,l9_305);
float2 l9_307=l9_306;
float l9_308=l9_300;
float2 l9_309=l9_307;
float l9_310=l9_308;
int l9_311;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_312=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_312=0;
}
else
{
l9_312=varStereoViewID;
}
int l9_313=l9_312;
l9_311=1-l9_313;
}
else
{
int l9_314=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_314=0;
}
else
{
l9_314=varStereoViewID;
}
int l9_315=l9_314;
l9_311=l9_315;
}
int l9_316=l9_311;
float2 l9_317=l9_309;
int l9_318=sc_EnvmapSpecularLayout_tmp;
int l9_319=l9_316;
float l9_320=l9_310;
float2 l9_321=l9_317;
int l9_322=l9_318;
int l9_323=l9_319;
float3 l9_324=float3(0.0);
if (l9_322==0)
{
l9_324=float3(l9_321,0.0);
}
else
{
if (l9_322==1)
{
l9_324=float3(l9_321.x,(l9_321.y*0.5)+(0.5-(float(l9_323)*0.5)),0.0);
}
else
{
l9_324=float3(l9_321,float(l9_323));
}
}
float3 l9_325=l9_324;
float3 l9_326=l9_325;
float4 l9_327=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_326.xy,level(l9_320));
float4 l9_328=l9_327;
float4 l9_329=l9_328;
float4 l9_330=l9_329;
float2 l9_331=l9_299;
float2 l9_332=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_333=l9_301;
float2 l9_334=calcSeamlessPanoramicUvsForSampling(l9_331,l9_332,l9_333);
float2 l9_335=l9_334;
float l9_336=l9_301;
float2 l9_337=l9_335;
float l9_338=l9_336;
int l9_339;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_340=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_340=0;
}
else
{
l9_340=varStereoViewID;
}
int l9_341=l9_340;
l9_339=1-l9_341;
}
else
{
int l9_342=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_342=0;
}
else
{
l9_342=varStereoViewID;
}
int l9_343=l9_342;
l9_339=l9_343;
}
int l9_344=l9_339;
float2 l9_345=l9_337;
int l9_346=sc_EnvmapSpecularLayout_tmp;
int l9_347=l9_344;
float l9_348=l9_338;
float2 l9_349=l9_345;
int l9_350=l9_346;
int l9_351=l9_347;
float3 l9_352=float3(0.0);
if (l9_350==0)
{
l9_352=float3(l9_349,0.0);
}
else
{
if (l9_350==1)
{
l9_352=float3(l9_349.x,(l9_349.y*0.5)+(0.5-(float(l9_351)*0.5)),0.0);
}
else
{
l9_352=float3(l9_349,float(l9_351));
}
}
float3 l9_353=l9_352;
float3 l9_354=l9_353;
float4 l9_355=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_354.xy,level(l9_348));
float4 l9_356=l9_355;
float4 l9_357=l9_356;
float4 l9_358=l9_357;
l9_290=mix(l9_330,l9_358,float4(l9_302));
}
else
{
float2 l9_359=l9_299;
float l9_360=l9_289;
float2 l9_361=l9_359;
float l9_362=l9_360;
int l9_363;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_364=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_364=0;
}
else
{
l9_364=varStereoViewID;
}
int l9_365=l9_364;
l9_363=1-l9_365;
}
else
{
int l9_366=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_366=0;
}
else
{
l9_366=varStereoViewID;
}
int l9_367=l9_366;
l9_363=l9_367;
}
int l9_368=l9_363;
float2 l9_369=l9_361;
int l9_370=sc_EnvmapSpecularLayout_tmp;
int l9_371=l9_368;
float l9_372=l9_362;
float2 l9_373=l9_369;
int l9_374=l9_370;
int l9_375=l9_371;
float3 l9_376=float3(0.0);
if (l9_374==0)
{
l9_376=float3(l9_373,0.0);
}
else
{
if (l9_374==1)
{
l9_376=float3(l9_373.x,(l9_373.y*0.5)+(0.5-(float(l9_375)*0.5)),0.0);
}
else
{
l9_376=float3(l9_373,float(l9_375));
}
}
float3 l9_377=l9_376;
float3 l9_378=l9_377;
float4 l9_379=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_378.xy,level(l9_372));
float4 l9_380=l9_379;
float4 l9_381=l9_380;
l9_290=l9_381;
}
float4 l9_382=l9_290;
float3 l9_383=l9_382.xyz*(1.0/l9_382.w);
float3 l9_384=l9_383;
float3 l9_385=l9_384*UserUniforms.sc_EnvmapExposure;
l9_385+=float3(1e-06);
float3 l9_386=l9_385;
float3 l9_387=l9_386;
if ((UserUniforms.sc_RayTracingReceiverEffectsMask&1)!=0)
{
float4 l9_388=gl_FragCoord;
float2 l9_389=l9_388.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_390=l9_389;
float2 l9_391=l9_390;
float l9_392=0.0;
int l9_393;
if ((int(sc_RayTracingReflectionsHasSwappedViews_tmp)!=0))
{
int l9_394=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_394=0;
}
else
{
l9_394=varStereoViewID;
}
int l9_395=l9_394;
l9_393=1-l9_395;
}
else
{
int l9_396=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_396=0;
}
else
{
l9_396=varStereoViewID;
}
int l9_397=l9_396;
l9_393=l9_397;
}
int l9_398=l9_393;
float2 l9_399=l9_391;
int l9_400=sc_RayTracingReflectionsLayout_tmp;
int l9_401=l9_398;
float l9_402=l9_392;
float2 l9_403=l9_399;
int l9_404=l9_400;
int l9_405=l9_401;
float3 l9_406=float3(0.0);
if (l9_404==0)
{
l9_406=float3(l9_403,0.0);
}
else
{
if (l9_404==1)
{
l9_406=float3(l9_403.x,(l9_403.y*0.5)+(0.5-(float(l9_405)*0.5)),0.0);
}
else
{
l9_406=float3(l9_403,float(l9_405));
}
}
float3 l9_407=l9_406;
float3 l9_408=l9_407;
float4 l9_409=sc_RayTracingReflections.sample(sc_RayTracingReflectionsSmpSC,l9_408.xy,bias(l9_402));
float4 l9_410=l9_409;
float4 l9_411=l9_410;
float4 l9_412=l9_411;
l9_387=mix(l9_387,l9_412.xyz,float3(l9_412.w));
}
float l9_413=abs(dot(l9_275,l9_274));
SurfaceProperties l9_414=l9_273;
float l9_415=l9_413;
float3 l9_416=l9_387*envBRDFApprox(l9_414,l9_415);
l9_272+=l9_416;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_417=l9_270;
float3 l9_418=l9_271;
float l9_419=fast::clamp(l9_417.roughness*l9_417.roughness,0.0099999998,1.0);
float3 l9_420=UserUniforms.sc_LightEstimationData.ambientLight*l9_417.specColor;
sc_SphericalGaussianLight_t l9_421;
sc_SphericalGaussianLight_t l9_422;
sc_SphericalGaussianLight_t l9_423;
int l9_424=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_424<sc_LightEstimationSGCount_tmp)
{
l9_421.color=UserUniforms.sc_LightEstimationData.sg[l9_424].color;
l9_421.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_424].sharpness;
l9_421.axis=UserUniforms.sc_LightEstimationData.sg[l9_424].axis;
float3 l9_425=l9_417.normal;
float l9_426=l9_419;
float3 l9_427=l9_418;
float3 l9_428=l9_417.specColor;
float3 l9_429=l9_425;
float l9_430=l9_426;
l9_422.axis=l9_429;
float l9_431=l9_430*l9_430;
l9_422.sharpness=2.0/l9_431;
l9_422.color=float3(1.0/(3.1415927*l9_431));
sc_SphericalGaussianLight_t l9_432=l9_422;
sc_SphericalGaussianLight_t l9_433=l9_432;
sc_SphericalGaussianLight_t l9_434=l9_433;
float3 l9_435=l9_427;
l9_423.axis=reflect(-l9_435,l9_434.axis);
l9_423.color=l9_434.color;
l9_423.sharpness=l9_434.sharpness;
l9_423.sharpness/=(4.0*fast::max(dot(l9_434.axis,l9_435),9.9999997e-05));
sc_SphericalGaussianLight_t l9_436=l9_423;
sc_SphericalGaussianLight_t l9_437=l9_436;
sc_SphericalGaussianLight_t l9_438=l9_437;
sc_SphericalGaussianLight_t l9_439=l9_421;
float l9_440=length((l9_438.axis*l9_438.sharpness)+(l9_439.axis*l9_439.sharpness));
float3 l9_441=(l9_438.color*exp((l9_440-l9_438.sharpness)-l9_439.sharpness))*l9_439.color;
float l9_442=1.0-exp((-2.0)*l9_440);
float3 l9_443=((l9_441*6.2831855)*l9_442)/float3(l9_440);
float3 l9_444=l9_443;
float3 l9_445=l9_437.axis;
float l9_446=l9_426*l9_426;
float l9_447=dot(l9_425,l9_445);
float l9_448=fast::clamp(l9_447,0.0,1.0);
float l9_449=l9_448;
float l9_450=dot(l9_425,l9_427);
float l9_451=fast::clamp(l9_450,0.0,1.0);
float l9_452=l9_451;
float3 l9_453=normalize(l9_437.axis+l9_427);
float l9_454=l9_446;
float l9_455=l9_449;
float l9_456=1.0/(l9_455+sqrt(l9_454+(((1.0-l9_454)*l9_455)*l9_455)));
float l9_457=l9_446;
float l9_458=l9_452;
float l9_459=1.0/(l9_458+sqrt(l9_457+(((1.0-l9_457)*l9_458)*l9_458)));
l9_444*=(l9_456*l9_459);
float l9_460=dot(l9_445,l9_453);
float l9_461=fast::clamp(l9_460,0.0,1.0);
float l9_462=pow(1.0-l9_461,5.0);
l9_444*=(l9_428+((float3(1.0)-l9_428)*l9_462));
l9_444*=l9_449;
float3 l9_463=l9_444;
l9_420+=l9_463;
l9_424++;
continue;
}
else
{
break;
}
}
float3 l9_464=l9_420;
l9_272+=l9_464;
}
float3 l9_465=l9_272;
l9_12.indirectSpecular=l9_465;
LightingComponents l9_466=l9_12;
LightingComponents lighting=l9_466;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
lighting.directDiffuse=float3(0.0);
lighting.indirectDiffuse=float3(0.0);
float4 l9_467=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_468=sc_FragData0;
l9_467=l9_468;
}
else
{
float4 l9_469=gl_FragCoord;
float2 l9_470=l9_469.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_471=l9_470;
float2 l9_472=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_473=1;
int l9_474=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_474=0;
}
else
{
l9_474=varStereoViewID;
}
int l9_475=l9_474;
int l9_476=l9_475;
float3 l9_477=float3(l9_471,0.0);
int l9_478=l9_473;
int l9_479=l9_476;
if (l9_478==1)
{
l9_477.y=((2.0*l9_477.y)+float(l9_479))-1.0;
}
float2 l9_480=l9_477.xy;
l9_472=l9_480;
}
else
{
l9_472=l9_471;
}
float2 l9_481=l9_472;
float2 l9_482=l9_481;
float2 l9_483=l9_482;
float2 l9_484=l9_483;
float l9_485=0.0;
int l9_486;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_487=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_487=0;
}
else
{
l9_487=varStereoViewID;
}
int l9_488=l9_487;
l9_486=1-l9_488;
}
else
{
int l9_489=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_489=0;
}
else
{
l9_489=varStereoViewID;
}
int l9_490=l9_489;
l9_486=l9_490;
}
int l9_491=l9_486;
float2 l9_492=l9_484;
int l9_493=sc_ScreenTextureLayout_tmp;
int l9_494=l9_491;
float l9_495=l9_485;
float2 l9_496=l9_492;
int l9_497=l9_493;
int l9_498=l9_494;
float3 l9_499=float3(0.0);
if (l9_497==0)
{
l9_499=float3(l9_496,0.0);
}
else
{
if (l9_497==1)
{
l9_499=float3(l9_496.x,(l9_496.y*0.5)+(0.5-(float(l9_498)*0.5)),0.0);
}
else
{
l9_499=float3(l9_496,float(l9_498));
}
}
float3 l9_500=l9_499;
float3 l9_501=l9_500;
float4 l9_502=sc_ScreenTexture.sample(sc_ScreenTextureSmpSC,l9_501.xy,bias(l9_495));
float4 l9_503=l9_502;
float4 l9_504=l9_503;
l9_467=l9_504;
}
float4 l9_505=l9_467;
float3 param_5=l9_505.xyz;
float3 l9_506;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_506=float3(pow(param_5.x,2.2),pow(param_5.y,2.2),pow(param_5.z,2.2));
}
else
{
l9_506=param_5*param_5;
}
float3 l9_507=l9_506;
float3 framebuffer=l9_507;
lighting.transmitted=framebuffer*mix(float3(1.0),surfaceProperties.albedo,float3(surfaceProperties.opacity));
surfaceProperties.opacity=1.0;
}
bool enablePremultipliedAlpha=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
enablePremultipliedAlpha=true;
}
SurfaceProperties param_6=surfaceProperties;
LightingComponents param_7=lighting;
bool param_8=enablePremultipliedAlpha;
float3 l9_508=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*param_6.ao));
float3 l9_509=param_7.directSpecular+(param_7.indirectSpecular*param_6.specularAo);
float3 l9_510=param_6.emissive;
float3 l9_511=param_7.transmitted;
if (param_8)
{
float l9_512=param_6.opacity;
l9_508*=srgbToLinear(l9_512);
}
float3 l9_513=((l9_508+l9_509)+l9_510)+l9_511;
float3 l9_514=l9_513;
float4 Output=float4(l9_514,surfaceProperties.opacity);
if ((int(sc_IsEditor_tmp)!=0))
{
Output.x+=((surfaceProperties.ao.x*surfaceProperties.specularAo.x)*9.9999997e-06);
}
if (UserUniforms.sc_RayTracingCasterConfiguration.x!=0u)
{
return Output;
}
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 param_9=Output.xyz;
float l9_515=1.8;
float l9_516=1.4;
float l9_517=0.5;
float l9_518=1.5;
float3 l9_519=(param_9*((param_9*l9_515)+float3(l9_516)))/((param_9*((param_9*l9_515)+float3(l9_517)))+float3(l9_518));
Output=float4(l9_519.x,l9_519.y,l9_519.z,Output.w);
}
float3 param_10=Output.xyz;
float l9_520=param_10.x;
float l9_521=param_10.y;
float l9_522=param_10.z;
float3 l9_523=float3(linearToSrgb(l9_520),linearToSrgb(l9_521),linearToSrgb(l9_522));
Output=float4(l9_523.x,l9_523.y,l9_523.z,Output.w);
return Output;
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
l9_236=l9_278;
float l9_279=l9_236.x;
int l9_280=l9_239.x;
bool l9_281=l9_245;
float l9_282=l9_246;
if ((l9_280==0)||(l9_280==3))
{
float l9_283=l9_279;
float l9_284=0.0;
float l9_285=1.0;
bool l9_286=l9_281;
float l9_287=l9_282;
float l9_288=fast::clamp(l9_283,l9_284,l9_285);
float l9_289=step(abs(l9_283-l9_288),9.9999997e-06);
l9_287*=(l9_289+((1.0-float(l9_286))*(1.0-l9_289)));
l9_283=l9_288;
l9_279=l9_283;
l9_282=l9_287;
}
l9_236.x=l9_279;
l9_246=l9_282;
float l9_290=l9_236.y;
int l9_291=l9_239.y;
bool l9_292=l9_245;
float l9_293=l9_246;
if ((l9_291==0)||(l9_291==3))
{
float l9_294=l9_290;
float l9_295=0.0;
float l9_296=1.0;
bool l9_297=l9_292;
float l9_298=l9_293;
float l9_299=fast::clamp(l9_294,l9_295,l9_296);
float l9_300=step(abs(l9_294-l9_299),9.9999997e-06);
l9_298*=(l9_300+((1.0-float(l9_297))*(1.0-l9_300)));
l9_294=l9_299;
l9_290=l9_294;
l9_293=l9_298;
}
l9_236.y=l9_290;
l9_246=l9_293;
float2 l9_301=l9_236;
int l9_302=l9_234;
int l9_303=l9_235;
float l9_304=l9_244;
float2 l9_305=l9_301;
int l9_306=l9_302;
int l9_307=l9_303;
float3 l9_308=float3(0.0);
if (l9_306==0)
{
l9_308=float3(l9_305,0.0);
}
else
{
if (l9_306==1)
{
l9_308=float3(l9_305.x,(l9_305.y*0.5)+(0.5-(float(l9_307)*0.5)),0.0);
}
else
{
l9_308=float3(l9_305,float(l9_307));
}
}
float3 l9_309=l9_308;
float3 l9_310=l9_309;
float4 l9_311=intensityTexture.sample(intensityTextureSmpSC,l9_310.xy,bias(l9_304));
float4 l9_312=l9_311;
if (l9_242)
{
l9_312=mix(l9_243,l9_312,float4(l9_246));
}
float4 l9_313=l9_312;
float3 l9_314=l9_313.xyz;
float3 l9_315=l9_314;
float l9_316=16.0;
float l9_317=((((l9_315.x*256.0)+l9_315.y)+(l9_315.z/256.0))/257.00391)*l9_316;
float l9_318=l9_317;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_318=fast::max(l9_318,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_318=fast::min(l9_318,1.0);
}
float l9_319=l9_225;
float3 l9_320=param_8;
float3 l9_321=param_9;
float l9_322=l9_226;
float l9_323=l9_318;
float3 l9_324=transformColor(l9_319,l9_320,l9_321,l9_322,l9_323);
return l9_324;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 sc_OutputMotionVectorIfNeeded(thread const float4& finalColor,thread float4& varPosAndMotion,thread float4& varNormalAndMotion)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float2 param=float2(varPosAndMotion.w,varNormalAndMotion.w);
float l9_0=(param.x*5.0)+0.5;
float l9_1=floor(l9_0*65535.0);
float l9_2=floor(l9_1*0.00390625);
float2 l9_3=float2(l9_2/255.0,(l9_1-(l9_2*256.0))/255.0);
float l9_4=(param.y*5.0)+0.5;
float l9_5=floor(l9_4*65535.0);
float l9_6=floor(l9_5*0.00390625);
float2 l9_7=float2(l9_6/255.0,(l9_5-(l9_6*256.0))/255.0);
float4 l9_8=float4(l9_3,l9_7);
return l9_8;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
int N15_NormalSpace=0;
float3 N15_Normal=float3(0.0);
float2 N15_ReflectionUV=float2(0.0);
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
if ((*sc_set0.UserUniforms).sc_RayTracingCasterConfiguration.x!=0u)
{
float4 l9_0=gl_FragCoord;
int2 param=int2(l9_0.xy);
sc_RayTracingHitPayload rhp=sc_RayTracingEvaluateHitPayload(param,(*sc_set0.UserUniforms),(*sc_set0.sc_RayTracingCasterVertexBuffer),(*sc_set0.sc_RayTracingCasterNonAnimatedVertexBuffer),(*sc_set0.sc_RayTracingCasterIndexBuffer),sc_set0.sc_RayTracingHitCasterIdAndBarycentric,sc_set0.sc_RayTracingHitCasterIdAndBarycentricSmpSC,sc_set0.sc_RayTracingRayDirection,sc_set0.sc_RayTracingRayDirectionSmpSC);
if (rhp.id.x!=((*sc_set0.UserUniforms).sc_RayTracingCasterConfiguration.y&65535u))
{
return out;
}
Globals.VertexNormal_WorldSpace=rhp.normalWS;
Globals.VertexTangent_WorldSpace=rhp.tangentWS.xyz;
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*rhp.tangentWS.w;
Globals.SurfacePosition_WorldSpace=rhp.positionWS;
Globals.ViewDirWS=rhp.viewDirWS;
Globals.Surface_UVCoord0=rhp.uv0;
Globals.BumpedNormal=float3(0.0);
Globals.PositionWS=rhp.positionWS;
}
else
{
Globals.VertexNormal_WorldSpace=normalize(in.varNormalAndMotion.xyz);
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPosAndMotion.xyz;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
Globals.Surface_UVCoord0=in.varTex01.xy;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPosAndMotion.xyz);
Globals.PositionWS=in.varPosAndMotion.xyz;
}
float Output_N16=0.0;
float param_1=(*sc_set0.UserUniforms).Tweak_N16;
Output_N16=param_1;
float Value_N8=0.0;
Value_N8=Output_N16;
float Value_N13=0.0;
Value_N13=1.0;
float3 Value_N14=float3(0.0);
Value_N14=(*sc_set0.UserUniforms).Port_Import_N014;
float2 ReflectionUV_N15=float2(0.0);
float param_2=Value_N13;
float3 param_3=Value_N14;
ssGlobals param_5=Globals;
ssGlobals tempGlobals=param_5;
float2 param_4=float2(0.0);
N15_NormalSpace=int(param_2);
N15_Normal=param_3;
float3 l9_1=N15_Normal;
if (N15_NormalSpace==1)
{
float3 l9_2=tempGlobals.VertexTangent_WorldSpace;
float3 l9_3=tempGlobals.VertexBinormal_WorldSpace;
float3 l9_4=tempGlobals.VertexNormal_WorldSpace;
float3x3 l9_5=float3x3(float3(l9_2),float3(l9_3),float3(l9_4));
l9_1=normalize(l9_5*l9_1);
}
float3 l9_6=tempGlobals.ViewDirWS;
float3 l9_7=normalize(-l9_6);
float3 l9_8=l9_7;
int l9_9=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9=0;
}
else
{
l9_9=in.varStereoViewID;
}
int l9_10=l9_9;
float3 l9_11=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_10][1].xyz;
float3 l9_12=normalize(cross(l9_8,l9_11));
float3 l9_13=cross(l9_12,l9_7);
float3x3 l9_14=float3x3(float3(l9_12.x,l9_13.x,l9_7.x),float3(l9_12.y,l9_13.y,l9_7.y),float3(l9_12.z,l9_13.z,l9_7.z));
l9_1=l9_14*l9_1;
N15_ReflectionUV=(l9_1.xy*0.5)+float2(0.5);
param_4=N15_ReflectionUV;
ReflectionUV_N15=param_4;
float4 Color_N17=float4(0.0);
int l9_15;
if ((int(Tweak_N25HasSwappedViews_tmp)!=0))
{
int l9_16=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_16=0;
}
else
{
l9_16=in.varStereoViewID;
}
int l9_17=l9_16;
l9_15=1-l9_17;
}
else
{
int l9_18=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_18=0;
}
else
{
l9_18=in.varStereoViewID;
}
int l9_19=l9_18;
l9_15=l9_19;
}
int l9_20=l9_15;
int param_6=Tweak_N25Layout_tmp;
int param_7=l9_20;
float2 param_8=ReflectionUV_N15;
bool param_9=(int(SC_USE_UV_TRANSFORM_Tweak_N25_tmp)!=0);
float3x3 param_10=(*sc_set0.UserUniforms).Tweak_N25Transform;
int2 param_11=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N25_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N25_tmp);
bool param_12=(int(SC_USE_UV_MIN_MAX_Tweak_N25_tmp)!=0);
float4 param_13=(*sc_set0.UserUniforms).Tweak_N25UvMinMax;
bool param_14=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N25_tmp)!=0);
float4 param_15=(*sc_set0.UserUniforms).Tweak_N25BorderColor;
float param_16=0.0;
bool l9_21=param_14&&(!param_12);
float l9_22=1.0;
float l9_23=param_8.x;
int l9_24=param_11.x;
if (l9_24==1)
{
l9_23=fract(l9_23);
}
else
{
if (l9_24==2)
{
float l9_25=fract(l9_23);
float l9_26=l9_23-l9_25;
float l9_27=step(0.25,fract(l9_26*0.5));
l9_23=mix(l9_25,1.0-l9_25,fast::clamp(l9_27,0.0,1.0));
}
}
param_8.x=l9_23;
float l9_28=param_8.y;
int l9_29=param_11.y;
if (l9_29==1)
{
l9_28=fract(l9_28);
}
else
{
if (l9_29==2)
{
float l9_30=fract(l9_28);
float l9_31=l9_28-l9_30;
float l9_32=step(0.25,fract(l9_31*0.5));
l9_28=mix(l9_30,1.0-l9_30,fast::clamp(l9_32,0.0,1.0));
}
}
param_8.y=l9_28;
if (param_12)
{
bool l9_33=param_14;
bool l9_34;
if (l9_33)
{
l9_34=param_11.x==3;
}
else
{
l9_34=l9_33;
}
float l9_35=param_8.x;
float l9_36=param_13.x;
float l9_37=param_13.z;
bool l9_38=l9_34;
float l9_39=l9_22;
float l9_40=fast::clamp(l9_35,l9_36,l9_37);
float l9_41=step(abs(l9_35-l9_40),9.9999997e-06);
l9_39*=(l9_41+((1.0-float(l9_38))*(1.0-l9_41)));
l9_35=l9_40;
param_8.x=l9_35;
l9_22=l9_39;
bool l9_42=param_14;
bool l9_43;
if (l9_42)
{
l9_43=param_11.y==3;
}
else
{
l9_43=l9_42;
}
float l9_44=param_8.y;
float l9_45=param_13.y;
float l9_46=param_13.w;
bool l9_47=l9_43;
float l9_48=l9_22;
float l9_49=fast::clamp(l9_44,l9_45,l9_46);
float l9_50=step(abs(l9_44-l9_49),9.9999997e-06);
l9_48*=(l9_50+((1.0-float(l9_47))*(1.0-l9_50)));
l9_44=l9_49;
param_8.y=l9_44;
l9_22=l9_48;
}
float2 l9_51=param_8;
bool l9_52=param_9;
float3x3 l9_53=param_10;
if (l9_52)
{
l9_51=float2((l9_53*float3(l9_51,1.0)).xy);
}
float2 l9_54=l9_51;
param_8=l9_54;
float l9_55=param_8.x;
int l9_56=param_11.x;
bool l9_57=l9_21;
float l9_58=l9_22;
if ((l9_56==0)||(l9_56==3))
{
float l9_59=l9_55;
float l9_60=0.0;
float l9_61=1.0;
bool l9_62=l9_57;
float l9_63=l9_58;
float l9_64=fast::clamp(l9_59,l9_60,l9_61);
float l9_65=step(abs(l9_59-l9_64),9.9999997e-06);
l9_63*=(l9_65+((1.0-float(l9_62))*(1.0-l9_65)));
l9_59=l9_64;
l9_55=l9_59;
l9_58=l9_63;
}
param_8.x=l9_55;
l9_22=l9_58;
float l9_66=param_8.y;
int l9_67=param_11.y;
bool l9_68=l9_21;
float l9_69=l9_22;
if ((l9_67==0)||(l9_67==3))
{
float l9_70=l9_66;
float l9_71=0.0;
float l9_72=1.0;
bool l9_73=l9_68;
float l9_74=l9_69;
float l9_75=fast::clamp(l9_70,l9_71,l9_72);
float l9_76=step(abs(l9_70-l9_75),9.9999997e-06);
l9_74*=(l9_76+((1.0-float(l9_73))*(1.0-l9_76)));
l9_70=l9_75;
l9_66=l9_70;
l9_69=l9_74;
}
param_8.y=l9_66;
l9_22=l9_69;
float2 l9_77=param_8;
int l9_78=param_6;
int l9_79=param_7;
float l9_80=param_16;
float2 l9_81=l9_77;
int l9_82=l9_78;
int l9_83=l9_79;
float3 l9_84=float3(0.0);
if (l9_82==0)
{
l9_84=float3(l9_81,0.0);
}
else
{
if (l9_82==1)
{
l9_84=float3(l9_81.x,(l9_81.y*0.5)+(0.5-(float(l9_83)*0.5)),0.0);
}
else
{
l9_84=float3(l9_81,float(l9_83));
}
}
float3 l9_85=l9_84;
float3 l9_86=l9_85;
float4 l9_87=sc_set0.Tweak_N25.sample(sc_set0.Tweak_N25SmpSC,l9_86.xy,bias(l9_80));
float4 l9_88=l9_87;
if (param_14)
{
l9_88=mix(param_15,l9_88,float4(l9_22));
}
float4 l9_89=l9_88;
Color_N17=l9_89;
float4 Output_N19=float4(0.0);
Output_N19=float4(Value_N8)*Color_N17;
float4 Export_N20=float4(0.0);
Export_N20=Output_N19;
float4 Output_N52=float4(0.0);
int l9_90;
if ((int(Tweak_N27HasSwappedViews_tmp)!=0))
{
int l9_91=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_91=0;
}
else
{
l9_91=in.varStereoViewID;
}
int l9_92=l9_91;
l9_90=1-l9_92;
}
else
{
int l9_93=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_93=0;
}
else
{
l9_93=in.varStereoViewID;
}
int l9_94=l9_93;
l9_90=l9_94;
}
int l9_95=l9_90;
int param_17=Tweak_N27Layout_tmp;
int param_18=l9_95;
float2 param_19=Globals.Surface_UVCoord0;
bool param_20=(int(SC_USE_UV_TRANSFORM_Tweak_N27_tmp)!=0);
float3x3 param_21=(*sc_set0.UserUniforms).Tweak_N27Transform;
int2 param_22=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N27_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N27_tmp);
bool param_23=(int(SC_USE_UV_MIN_MAX_Tweak_N27_tmp)!=0);
float4 param_24=(*sc_set0.UserUniforms).Tweak_N27UvMinMax;
bool param_25=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N27_tmp)!=0);
float4 param_26=(*sc_set0.UserUniforms).Tweak_N27BorderColor;
float param_27=0.0;
bool l9_96=param_25&&(!param_23);
float l9_97=1.0;
float l9_98=param_19.x;
int l9_99=param_22.x;
if (l9_99==1)
{
l9_98=fract(l9_98);
}
else
{
if (l9_99==2)
{
float l9_100=fract(l9_98);
float l9_101=l9_98-l9_100;
float l9_102=step(0.25,fract(l9_101*0.5));
l9_98=mix(l9_100,1.0-l9_100,fast::clamp(l9_102,0.0,1.0));
}
}
param_19.x=l9_98;
float l9_103=param_19.y;
int l9_104=param_22.y;
if (l9_104==1)
{
l9_103=fract(l9_103);
}
else
{
if (l9_104==2)
{
float l9_105=fract(l9_103);
float l9_106=l9_103-l9_105;
float l9_107=step(0.25,fract(l9_106*0.5));
l9_103=mix(l9_105,1.0-l9_105,fast::clamp(l9_107,0.0,1.0));
}
}
param_19.y=l9_103;
if (param_23)
{
bool l9_108=param_25;
bool l9_109;
if (l9_108)
{
l9_109=param_22.x==3;
}
else
{
l9_109=l9_108;
}
float l9_110=param_19.x;
float l9_111=param_24.x;
float l9_112=param_24.z;
bool l9_113=l9_109;
float l9_114=l9_97;
float l9_115=fast::clamp(l9_110,l9_111,l9_112);
float l9_116=step(abs(l9_110-l9_115),9.9999997e-06);
l9_114*=(l9_116+((1.0-float(l9_113))*(1.0-l9_116)));
l9_110=l9_115;
param_19.x=l9_110;
l9_97=l9_114;
bool l9_117=param_25;
bool l9_118;
if (l9_117)
{
l9_118=param_22.y==3;
}
else
{
l9_118=l9_117;
}
float l9_119=param_19.y;
float l9_120=param_24.y;
float l9_121=param_24.w;
bool l9_122=l9_118;
float l9_123=l9_97;
float l9_124=fast::clamp(l9_119,l9_120,l9_121);
float l9_125=step(abs(l9_119-l9_124),9.9999997e-06);
l9_123*=(l9_125+((1.0-float(l9_122))*(1.0-l9_125)));
l9_119=l9_124;
param_19.y=l9_119;
l9_97=l9_123;
}
float2 l9_126=param_19;
bool l9_127=param_20;
float3x3 l9_128=param_21;
if (l9_127)
{
l9_126=float2((l9_128*float3(l9_126,1.0)).xy);
}
float2 l9_129=l9_126;
param_19=l9_129;
float l9_130=param_19.x;
int l9_131=param_22.x;
bool l9_132=l9_96;
float l9_133=l9_97;
if ((l9_131==0)||(l9_131==3))
{
float l9_134=l9_130;
float l9_135=0.0;
float l9_136=1.0;
bool l9_137=l9_132;
float l9_138=l9_133;
float l9_139=fast::clamp(l9_134,l9_135,l9_136);
float l9_140=step(abs(l9_134-l9_139),9.9999997e-06);
l9_138*=(l9_140+((1.0-float(l9_137))*(1.0-l9_140)));
l9_134=l9_139;
l9_130=l9_134;
l9_133=l9_138;
}
param_19.x=l9_130;
l9_97=l9_133;
float l9_141=param_19.y;
int l9_142=param_22.y;
bool l9_143=l9_96;
float l9_144=l9_97;
if ((l9_142==0)||(l9_142==3))
{
float l9_145=l9_141;
float l9_146=0.0;
float l9_147=1.0;
bool l9_148=l9_143;
float l9_149=l9_144;
float l9_150=fast::clamp(l9_145,l9_146,l9_147);
float l9_151=step(abs(l9_145-l9_150),9.9999997e-06);
l9_149*=(l9_151+((1.0-float(l9_148))*(1.0-l9_151)));
l9_145=l9_150;
l9_141=l9_145;
l9_144=l9_149;
}
param_19.y=l9_141;
l9_97=l9_144;
float2 l9_152=param_19;
int l9_153=param_17;
int l9_154=param_18;
float l9_155=param_27;
float2 l9_156=l9_152;
int l9_157=l9_153;
int l9_158=l9_154;
float3 l9_159=float3(0.0);
if (l9_157==0)
{
l9_159=float3(l9_156,0.0);
}
else
{
if (l9_157==1)
{
l9_159=float3(l9_156.x,(l9_156.y*0.5)+(0.5-(float(l9_158)*0.5)),0.0);
}
else
{
l9_159=float3(l9_156,float(l9_158));
}
}
float3 l9_160=l9_159;
float3 l9_161=l9_160;
float4 l9_162=sc_set0.Tweak_N27.sample(sc_set0.Tweak_N27SmpSC,l9_161.xy,bias(l9_155));
float4 l9_163=l9_162;
if (param_25)
{
l9_163=mix(param_26,l9_163,float4(l9_97));
}
float4 l9_164=l9_163;
Output_N52=l9_164;
float4 Output_N26=float4(0.0);
Output_N26=Export_N20*Output_N52;
float4 Result_N419=float4(0.0);
float param_28=0.0;
float4 param_29=float4(0.0);
float4 param_30=float4(0.0);
ssGlobals param_32=Globals;
float l9_165=0.0;
float l9_166=float((*sc_set0.UserUniforms).ColorOnOffid03!=0);
l9_165=l9_166;
param_28=l9_165;
float4 param_31;
if ((param_28*1.0)!=0.0)
{
float4 l9_167=float4(0.0);
float l9_168=0.0;
float4 l9_169=float4(0.0);
float4 l9_170=float4(0.0);
ssGlobals l9_171=param_32;
float l9_172=0.0;
float l9_173=float((*sc_set0.UserUniforms).pbrOnOffId03!=0);
l9_172=l9_173;
l9_168=l9_172;
float4 l9_174;
if ((l9_168*1.0)!=0.0)
{
float4 l9_175=float4(0.0);
float l9_176=0.0;
float4 l9_177=float4(0.0);
float4 l9_178=float4(0.0);
ssGlobals l9_179=l9_171;
float l9_180=0.0;
float l9_181=float((*sc_set0.UserUniforms).rimOnOffId03!=0);
l9_180=l9_181;
l9_176=l9_180;
float4 l9_182;
if ((l9_176*1.0)!=0.0)
{
float l9_183=0.0;
float l9_184=(*sc_set0.UserUniforms).rimExpId03;
l9_183=l9_184;
float l9_185=0.0;
float l9_186=(*sc_set0.UserUniforms).rimIntId03;
l9_185=l9_186;
float l9_187=0.0;
float l9_188=l9_183;
float l9_189=l9_185;
ssGlobals l9_190=l9_179;
float l9_191=abs(dot(-l9_190.ViewDirWS,l9_190.VertexNormal_WorldSpace));
float l9_192=1.0-pow(1.0-l9_191,l9_188);
l9_192=fast::max(l9_192,0.0);
l9_192*=l9_189;
l9_187=l9_192;
float4 l9_193=float4(0.0);
float l9_194=0.0;
float4 l9_195=float4(0.0);
float4 l9_196=float4(0.0);
ssGlobals l9_197=l9_179;
float l9_198=0.0;
float l9_199=float((*sc_set0.UserUniforms).patternOnOffId03!=0);
l9_198=l9_199;
l9_194=l9_198;
float4 l9_200;
if ((l9_194*1.0)!=0.0)
{
float4 l9_201=float4(0.0);
float4 l9_202=(*sc_set0.UserUniforms).patternColorId03;
l9_201=l9_202;
float4 l9_203=float4(0.0);
float l9_204=0.0;
float4 l9_205=float4(0.0);
float4 l9_206=float4(0.0);
ssGlobals l9_207=l9_197;
float l9_208=0.0;
float l9_209=float((*sc_set0.UserUniforms).pngPatternId03!=0);
l9_208=l9_209;
l9_204=l9_208;
float4 l9_210;
if ((l9_204*1.0)!=0.0)
{
float2 l9_211=float2(0.0);
l9_211=l9_207.Surface_UVCoord0;
float2 l9_212=float2(0.0);
float2 l9_213=(*sc_set0.UserUniforms).patternScaleId03;
l9_212=l9_213;
float2 l9_214=float2(0.0);
l9_214=((l9_211-(*sc_set0.UserUniforms).Port_Center_N379)*l9_212)+(*sc_set0.UserUniforms).Port_Center_N379;
float2 l9_215=float2(0.0);
float2 l9_216=(*sc_set0.UserUniforms).patternOffsetId03;
l9_215=l9_216;
float2 l9_217=float2(0.0);
l9_217=l9_214+l9_215;
float l9_218=0.0;
float l9_219=(*sc_set0.UserUniforms).patternRotateId03;
l9_218=l9_219;
float2 l9_220=float2(0.0);
float2 l9_221=l9_217;
float l9_222=l9_218;
float2 l9_223=(*sc_set0.UserUniforms).Port_Center_N383;
float l9_224=sin(radians(l9_222));
float l9_225=cos(radians(l9_222));
float2 l9_226=l9_221-l9_223;
l9_226=float2(dot(float2(l9_225,l9_224),l9_226),dot(float2(-l9_224,l9_225),l9_226))+l9_223;
l9_220=l9_226;
float4 l9_227=float4(0.0);
int l9_228;
if ((int(patternTextureId03HasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=in.varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=in.varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=patternTextureId03Layout_tmp;
int l9_235=l9_233;
float2 l9_236=l9_220;
bool l9_237=(int(SC_USE_UV_TRANSFORM_patternTextureId03_tmp)!=0);
float3x3 l9_238=(*sc_set0.UserUniforms).patternTextureId03Transform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId03_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId03_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_patternTextureId03_tmp)!=0);
float4 l9_241=(*sc_set0.UserUniforms).patternTextureId03UvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId03_tmp)!=0);
float4 l9_243=(*sc_set0.UserUniforms).patternTextureId03BorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
l9_236=l9_278;
float l9_279=l9_236.x;
int l9_280=l9_239.x;
bool l9_281=l9_245;
float l9_282=l9_246;
if ((l9_280==0)||(l9_280==3))
{
float l9_283=l9_279;
float l9_284=0.0;
float l9_285=1.0;
bool l9_286=l9_281;
float l9_287=l9_282;
float l9_288=fast::clamp(l9_283,l9_284,l9_285);
float l9_289=step(abs(l9_283-l9_288),9.9999997e-06);
l9_287*=(l9_289+((1.0-float(l9_286))*(1.0-l9_289)));
l9_283=l9_288;
l9_279=l9_283;
l9_282=l9_287;
}
l9_236.x=l9_279;
l9_246=l9_282;
float l9_290=l9_236.y;
int l9_291=l9_239.y;
bool l9_292=l9_245;
float l9_293=l9_246;
if ((l9_291==0)||(l9_291==3))
{
float l9_294=l9_290;
float l9_295=0.0;
float l9_296=1.0;
bool l9_297=l9_292;
float l9_298=l9_293;
float l9_299=fast::clamp(l9_294,l9_295,l9_296);
float l9_300=step(abs(l9_294-l9_299),9.9999997e-06);
l9_298*=(l9_300+((1.0-float(l9_297))*(1.0-l9_300)));
l9_294=l9_299;
l9_290=l9_294;
l9_293=l9_298;
}
l9_236.y=l9_290;
l9_246=l9_293;
float2 l9_301=l9_236;
int l9_302=l9_234;
int l9_303=l9_235;
float l9_304=l9_244;
float2 l9_305=l9_301;
int l9_306=l9_302;
int l9_307=l9_303;
float3 l9_308=float3(0.0);
if (l9_306==0)
{
l9_308=float3(l9_305,0.0);
}
else
{
if (l9_306==1)
{
l9_308=float3(l9_305.x,(l9_305.y*0.5)+(0.5-(float(l9_307)*0.5)),0.0);
}
else
{
l9_308=float3(l9_305,float(l9_307));
}
}
float3 l9_309=l9_308;
float3 l9_310=l9_309;
float4 l9_311=sc_set0.patternTextureId03.sample(sc_set0.patternTextureId03SmpSC,l9_310.xy,bias(l9_304));
float4 l9_312=l9_311;
if (l9_242)
{
l9_312=mix(l9_243,l9_312,float4(l9_246));
}
float4 l9_313=l9_312;
l9_227=l9_313;
l9_205=l9_227;
l9_210=l9_205;
}
else
{
float2 l9_314=float2(0.0);
l9_314=l9_207.Surface_UVCoord0;
float2 l9_315=float2(0.0);
float2 l9_316=(*sc_set0.UserUniforms).patternScaleId03;
l9_315=l9_316;
float2 l9_317=float2(0.0);
l9_317=((l9_314-(*sc_set0.UserUniforms).Port_Center_N379)*l9_315)+(*sc_set0.UserUniforms).Port_Center_N379;
float2 l9_318=float2(0.0);
float2 l9_319=(*sc_set0.UserUniforms).patternOffsetId03;
l9_318=l9_319;
float2 l9_320=float2(0.0);
l9_320=l9_317+l9_318;
float l9_321=0.0;
float l9_322=(*sc_set0.UserUniforms).patternRotateId03;
l9_321=l9_322;
float2 l9_323=float2(0.0);
float2 l9_324=l9_320;
float l9_325=l9_321;
float2 l9_326=(*sc_set0.UserUniforms).Port_Center_N383;
float l9_327=sin(radians(l9_325));
float l9_328=cos(radians(l9_325));
float2 l9_329=l9_324-l9_326;
l9_329=float2(dot(float2(l9_328,l9_327),l9_329),dot(float2(-l9_327,l9_328),l9_329))+l9_326;
l9_323=l9_329;
float4 l9_330=float4(0.0);
int l9_331;
if ((int(patternTextureId03HasSwappedViews_tmp)!=0))
{
int l9_332=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_332=0;
}
else
{
l9_332=in.varStereoViewID;
}
int l9_333=l9_332;
l9_331=1-l9_333;
}
else
{
int l9_334=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_334=0;
}
else
{
l9_334=in.varStereoViewID;
}
int l9_335=l9_334;
l9_331=l9_335;
}
int l9_336=l9_331;
int l9_337=patternTextureId03Layout_tmp;
int l9_338=l9_336;
float2 l9_339=l9_323;
bool l9_340=(int(SC_USE_UV_TRANSFORM_patternTextureId03_tmp)!=0);
float3x3 l9_341=(*sc_set0.UserUniforms).patternTextureId03Transform;
int2 l9_342=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId03_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId03_tmp);
bool l9_343=(int(SC_USE_UV_MIN_MAX_patternTextureId03_tmp)!=0);
float4 l9_344=(*sc_set0.UserUniforms).patternTextureId03UvMinMax;
bool l9_345=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId03_tmp)!=0);
float4 l9_346=(*sc_set0.UserUniforms).patternTextureId03BorderColor;
float l9_347=0.0;
bool l9_348=l9_345&&(!l9_343);
float l9_349=1.0;
float l9_350=l9_339.x;
int l9_351=l9_342.x;
if (l9_351==1)
{
l9_350=fract(l9_350);
}
else
{
if (l9_351==2)
{
float l9_352=fract(l9_350);
float l9_353=l9_350-l9_352;
float l9_354=step(0.25,fract(l9_353*0.5));
l9_350=mix(l9_352,1.0-l9_352,fast::clamp(l9_354,0.0,1.0));
}
}
l9_339.x=l9_350;
float l9_355=l9_339.y;
int l9_356=l9_342.y;
if (l9_356==1)
{
l9_355=fract(l9_355);
}
else
{
if (l9_356==2)
{
float l9_357=fract(l9_355);
float l9_358=l9_355-l9_357;
float l9_359=step(0.25,fract(l9_358*0.5));
l9_355=mix(l9_357,1.0-l9_357,fast::clamp(l9_359,0.0,1.0));
}
}
l9_339.y=l9_355;
if (l9_343)
{
bool l9_360=l9_345;
bool l9_361;
if (l9_360)
{
l9_361=l9_342.x==3;
}
else
{
l9_361=l9_360;
}
float l9_362=l9_339.x;
float l9_363=l9_344.x;
float l9_364=l9_344.z;
bool l9_365=l9_361;
float l9_366=l9_349;
float l9_367=fast::clamp(l9_362,l9_363,l9_364);
float l9_368=step(abs(l9_362-l9_367),9.9999997e-06);
l9_366*=(l9_368+((1.0-float(l9_365))*(1.0-l9_368)));
l9_362=l9_367;
l9_339.x=l9_362;
l9_349=l9_366;
bool l9_369=l9_345;
bool l9_370;
if (l9_369)
{
l9_370=l9_342.y==3;
}
else
{
l9_370=l9_369;
}
float l9_371=l9_339.y;
float l9_372=l9_344.y;
float l9_373=l9_344.w;
bool l9_374=l9_370;
float l9_375=l9_349;
float l9_376=fast::clamp(l9_371,l9_372,l9_373);
float l9_377=step(abs(l9_371-l9_376),9.9999997e-06);
l9_375*=(l9_377+((1.0-float(l9_374))*(1.0-l9_377)));
l9_371=l9_376;
l9_339.y=l9_371;
l9_349=l9_375;
}
float2 l9_378=l9_339;
bool l9_379=l9_340;
float3x3 l9_380=l9_341;
if (l9_379)
{
l9_378=float2((l9_380*float3(l9_378,1.0)).xy);
}
float2 l9_381=l9_378;
l9_339=l9_381;
float l9_382=l9_339.x;
int l9_383=l9_342.x;
bool l9_384=l9_348;
float l9_385=l9_349;
if ((l9_383==0)||(l9_383==3))
{
float l9_386=l9_382;
float l9_387=0.0;
float l9_388=1.0;
bool l9_389=l9_384;
float l9_390=l9_385;
float l9_391=fast::clamp(l9_386,l9_387,l9_388);
float l9_392=step(abs(l9_386-l9_391),9.9999997e-06);
l9_390*=(l9_392+((1.0-float(l9_389))*(1.0-l9_392)));
l9_386=l9_391;
l9_382=l9_386;
l9_385=l9_390;
}
l9_339.x=l9_382;
l9_349=l9_385;
float l9_393=l9_339.y;
int l9_394=l9_342.y;
bool l9_395=l9_348;
float l9_396=l9_349;
if ((l9_394==0)||(l9_394==3))
{
float l9_397=l9_393;
float l9_398=0.0;
float l9_399=1.0;
bool l9_400=l9_395;
float l9_401=l9_396;
float l9_402=fast::clamp(l9_397,l9_398,l9_399);
float l9_403=step(abs(l9_397-l9_402),9.9999997e-06);
l9_401*=(l9_403+((1.0-float(l9_400))*(1.0-l9_403)));
l9_397=l9_402;
l9_393=l9_397;
l9_396=l9_401;
}
l9_339.y=l9_393;
l9_349=l9_396;
float2 l9_404=l9_339;
int l9_405=l9_337;
int l9_406=l9_338;
float l9_407=l9_347;
float2 l9_408=l9_404;
int l9_409=l9_405;
int l9_410=l9_406;
float3 l9_411=float3(0.0);
if (l9_409==0)
{
l9_411=float3(l9_408,0.0);
}
else
{
if (l9_409==1)
{
l9_411=float3(l9_408.x,(l9_408.y*0.5)+(0.5-(float(l9_410)*0.5)),0.0);
}
else
{
l9_411=float3(l9_408,float(l9_410));
}
}
float3 l9_412=l9_411;
float3 l9_413=l9_412;
float4 l9_414=sc_set0.patternTextureId03.sample(sc_set0.patternTextureId03SmpSC,l9_413.xy,bias(l9_407));
float4 l9_415=l9_414;
if (l9_345)
{
l9_415=mix(l9_346,l9_415,float4(l9_349));
}
float4 l9_416=l9_415;
l9_330=l9_416;
float l9_417=0.0;
float3 l9_418=l9_330.xyz;
float l9_419=l9_418.x;
l9_417=l9_419;
l9_206=float4(l9_417);
l9_210=l9_206;
}
l9_203=l9_210;
float4 l9_420=float4(0.0);
l9_420=l9_201*l9_203;
l9_195=l9_420;
l9_200=l9_195;
}
else
{
float4 l9_421=float4(0.0);
float4 l9_422=(*sc_set0.UserUniforms).colorId03;
l9_421=l9_422;
float4 l9_423=float4(0.0);
float l9_424=0.0;
float4 l9_425=float4(0.0);
float4 l9_426=(*sc_set0.UserUniforms).Port_Default_N358;
ssGlobals l9_427=l9_197;
float l9_428=0.0;
float l9_429=float((*sc_set0.UserUniforms).ColorOnOffid03!=0);
l9_428=l9_429;
l9_424=l9_428;
float4 l9_430;
if ((l9_424*1.0)!=0.0)
{
float2 l9_431=float2(0.0);
l9_431=l9_427.Surface_UVCoord0;
float4 l9_432=float4(0.0);
int l9_433;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_434=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_434=0;
}
else
{
l9_434=in.varStereoViewID;
}
int l9_435=l9_434;
l9_433=1-l9_435;
}
else
{
int l9_436=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_436=0;
}
else
{
l9_436=in.varStereoViewID;
}
int l9_437=l9_436;
l9_433=l9_437;
}
int l9_438=l9_433;
int l9_439=greyMaskIdLayout_tmp;
int l9_440=l9_438;
float2 l9_441=l9_431;
bool l9_442=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_443=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_444=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_445=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_446=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_447=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_448=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_449=0.0;
bool l9_450=l9_447&&(!l9_445);
float l9_451=1.0;
float l9_452=l9_441.x;
int l9_453=l9_444.x;
if (l9_453==1)
{
l9_452=fract(l9_452);
}
else
{
if (l9_453==2)
{
float l9_454=fract(l9_452);
float l9_455=l9_452-l9_454;
float l9_456=step(0.25,fract(l9_455*0.5));
l9_452=mix(l9_454,1.0-l9_454,fast::clamp(l9_456,0.0,1.0));
}
}
l9_441.x=l9_452;
float l9_457=l9_441.y;
int l9_458=l9_444.y;
if (l9_458==1)
{
l9_457=fract(l9_457);
}
else
{
if (l9_458==2)
{
float l9_459=fract(l9_457);
float l9_460=l9_457-l9_459;
float l9_461=step(0.25,fract(l9_460*0.5));
l9_457=mix(l9_459,1.0-l9_459,fast::clamp(l9_461,0.0,1.0));
}
}
l9_441.y=l9_457;
if (l9_445)
{
bool l9_462=l9_447;
bool l9_463;
if (l9_462)
{
l9_463=l9_444.x==3;
}
else
{
l9_463=l9_462;
}
float l9_464=l9_441.x;
float l9_465=l9_446.x;
float l9_466=l9_446.z;
bool l9_467=l9_463;
float l9_468=l9_451;
float l9_469=fast::clamp(l9_464,l9_465,l9_466);
float l9_470=step(abs(l9_464-l9_469),9.9999997e-06);
l9_468*=(l9_470+((1.0-float(l9_467))*(1.0-l9_470)));
l9_464=l9_469;
l9_441.x=l9_464;
l9_451=l9_468;
bool l9_471=l9_447;
bool l9_472;
if (l9_471)
{
l9_472=l9_444.y==3;
}
else
{
l9_472=l9_471;
}
float l9_473=l9_441.y;
float l9_474=l9_446.y;
float l9_475=l9_446.w;
bool l9_476=l9_472;
float l9_477=l9_451;
float l9_478=fast::clamp(l9_473,l9_474,l9_475);
float l9_479=step(abs(l9_473-l9_478),9.9999997e-06);
l9_477*=(l9_479+((1.0-float(l9_476))*(1.0-l9_479)));
l9_473=l9_478;
l9_441.y=l9_473;
l9_451=l9_477;
}
float2 l9_480=l9_441;
bool l9_481=l9_442;
float3x3 l9_482=l9_443;
if (l9_481)
{
l9_480=float2((l9_482*float3(l9_480,1.0)).xy);
}
float2 l9_483=l9_480;
l9_441=l9_483;
float l9_484=l9_441.x;
int l9_485=l9_444.x;
bool l9_486=l9_450;
float l9_487=l9_451;
if ((l9_485==0)||(l9_485==3))
{
float l9_488=l9_484;
float l9_489=0.0;
float l9_490=1.0;
bool l9_491=l9_486;
float l9_492=l9_487;
float l9_493=fast::clamp(l9_488,l9_489,l9_490);
float l9_494=step(abs(l9_488-l9_493),9.9999997e-06);
l9_492*=(l9_494+((1.0-float(l9_491))*(1.0-l9_494)));
l9_488=l9_493;
l9_484=l9_488;
l9_487=l9_492;
}
l9_441.x=l9_484;
l9_451=l9_487;
float l9_495=l9_441.y;
int l9_496=l9_444.y;
bool l9_497=l9_450;
float l9_498=l9_451;
if ((l9_496==0)||(l9_496==3))
{
float l9_499=l9_495;
float l9_500=0.0;
float l9_501=1.0;
bool l9_502=l9_497;
float l9_503=l9_498;
float l9_504=fast::clamp(l9_499,l9_500,l9_501);
float l9_505=step(abs(l9_499-l9_504),9.9999997e-06);
l9_503*=(l9_505+((1.0-float(l9_502))*(1.0-l9_505)));
l9_499=l9_504;
l9_495=l9_499;
l9_498=l9_503;
}
l9_441.y=l9_495;
l9_451=l9_498;
float2 l9_506=l9_441;
int l9_507=l9_439;
int l9_508=l9_440;
float l9_509=l9_449;
float2 l9_510=l9_506;
int l9_511=l9_507;
int l9_512=l9_508;
float3 l9_513=float3(0.0);
if (l9_511==0)
{
l9_513=float3(l9_510,0.0);
}
else
{
if (l9_511==1)
{
l9_513=float3(l9_510.x,(l9_510.y*0.5)+(0.5-(float(l9_512)*0.5)),0.0);
}
else
{
l9_513=float3(l9_510,float(l9_512));
}
}
float3 l9_514=l9_513;
float3 l9_515=l9_514;
float4 l9_516=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_515.xy,bias(l9_509));
float4 l9_517=l9_516;
if (l9_447)
{
l9_517=mix(l9_448,l9_517,float4(l9_451));
}
float4 l9_518=l9_517;
l9_432=l9_518;
float l9_519=0.0;
l9_519=l9_432.x;
float l9_520=0.0;
l9_520=step(l9_519,(*sc_set0.UserUniforms).Port_Input1_N006);
float l9_521=0.0;
l9_521=step(l9_519,(*sc_set0.UserUniforms).Port_Input1_N009);
float l9_522=0.0;
l9_522=l9_520-l9_521;
l9_425=float4(l9_522);
l9_430=l9_425;
}
else
{
l9_430=l9_426;
}
l9_423=l9_430;
float4 l9_523=float4(0.0);
l9_523=l9_421*l9_423;
l9_196=l9_523;
l9_200=l9_196;
}
l9_193=l9_200;
float4 l9_524=float4(0.0);
float l9_525=0.0;
float4 l9_526=float4(0.0);
float4 l9_527=(*sc_set0.UserUniforms).Port_Default_N358;
ssGlobals l9_528=l9_179;
float l9_529=0.0;
float l9_530=float((*sc_set0.UserUniforms).ColorOnOffid03!=0);
l9_529=l9_530;
l9_525=l9_529;
float4 l9_531;
if ((l9_525*1.0)!=0.0)
{
float2 l9_532=float2(0.0);
l9_532=l9_528.Surface_UVCoord0;
float4 l9_533=float4(0.0);
int l9_534;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_535=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_535=0;
}
else
{
l9_535=in.varStereoViewID;
}
int l9_536=l9_535;
l9_534=1-l9_536;
}
else
{
int l9_537=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_537=0;
}
else
{
l9_537=in.varStereoViewID;
}
int l9_538=l9_537;
l9_534=l9_538;
}
int l9_539=l9_534;
int l9_540=greyMaskIdLayout_tmp;
int l9_541=l9_539;
float2 l9_542=l9_532;
bool l9_543=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_544=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_545=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_546=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_547=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_548=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_549=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_550=0.0;
bool l9_551=l9_548&&(!l9_546);
float l9_552=1.0;
float l9_553=l9_542.x;
int l9_554=l9_545.x;
if (l9_554==1)
{
l9_553=fract(l9_553);
}
else
{
if (l9_554==2)
{
float l9_555=fract(l9_553);
float l9_556=l9_553-l9_555;
float l9_557=step(0.25,fract(l9_556*0.5));
l9_553=mix(l9_555,1.0-l9_555,fast::clamp(l9_557,0.0,1.0));
}
}
l9_542.x=l9_553;
float l9_558=l9_542.y;
int l9_559=l9_545.y;
if (l9_559==1)
{
l9_558=fract(l9_558);
}
else
{
if (l9_559==2)
{
float l9_560=fract(l9_558);
float l9_561=l9_558-l9_560;
float l9_562=step(0.25,fract(l9_561*0.5));
l9_558=mix(l9_560,1.0-l9_560,fast::clamp(l9_562,0.0,1.0));
}
}
l9_542.y=l9_558;
if (l9_546)
{
bool l9_563=l9_548;
bool l9_564;
if (l9_563)
{
l9_564=l9_545.x==3;
}
else
{
l9_564=l9_563;
}
float l9_565=l9_542.x;
float l9_566=l9_547.x;
float l9_567=l9_547.z;
bool l9_568=l9_564;
float l9_569=l9_552;
float l9_570=fast::clamp(l9_565,l9_566,l9_567);
float l9_571=step(abs(l9_565-l9_570),9.9999997e-06);
l9_569*=(l9_571+((1.0-float(l9_568))*(1.0-l9_571)));
l9_565=l9_570;
l9_542.x=l9_565;
l9_552=l9_569;
bool l9_572=l9_548;
bool l9_573;
if (l9_572)
{
l9_573=l9_545.y==3;
}
else
{
l9_573=l9_572;
}
float l9_574=l9_542.y;
float l9_575=l9_547.y;
float l9_576=l9_547.w;
bool l9_577=l9_573;
float l9_578=l9_552;
float l9_579=fast::clamp(l9_574,l9_575,l9_576);
float l9_580=step(abs(l9_574-l9_579),9.9999997e-06);
l9_578*=(l9_580+((1.0-float(l9_577))*(1.0-l9_580)));
l9_574=l9_579;
l9_542.y=l9_574;
l9_552=l9_578;
}
float2 l9_581=l9_542;
bool l9_582=l9_543;
float3x3 l9_583=l9_544;
if (l9_582)
{
l9_581=float2((l9_583*float3(l9_581,1.0)).xy);
}
float2 l9_584=l9_581;
l9_542=l9_584;
float l9_585=l9_542.x;
int l9_586=l9_545.x;
bool l9_587=l9_551;
float l9_588=l9_552;
if ((l9_586==0)||(l9_586==3))
{
float l9_589=l9_585;
float l9_590=0.0;
float l9_591=1.0;
bool l9_592=l9_587;
float l9_593=l9_588;
float l9_594=fast::clamp(l9_589,l9_590,l9_591);
float l9_595=step(abs(l9_589-l9_594),9.9999997e-06);
l9_593*=(l9_595+((1.0-float(l9_592))*(1.0-l9_595)));
l9_589=l9_594;
l9_585=l9_589;
l9_588=l9_593;
}
l9_542.x=l9_585;
l9_552=l9_588;
float l9_596=l9_542.y;
int l9_597=l9_545.y;
bool l9_598=l9_551;
float l9_599=l9_552;
if ((l9_597==0)||(l9_597==3))
{
float l9_600=l9_596;
float l9_601=0.0;
float l9_602=1.0;
bool l9_603=l9_598;
float l9_604=l9_599;
float l9_605=fast::clamp(l9_600,l9_601,l9_602);
float l9_606=step(abs(l9_600-l9_605),9.9999997e-06);
l9_604*=(l9_606+((1.0-float(l9_603))*(1.0-l9_606)));
l9_600=l9_605;
l9_596=l9_600;
l9_599=l9_604;
}
l9_542.y=l9_596;
l9_552=l9_599;
float2 l9_607=l9_542;
int l9_608=l9_540;
int l9_609=l9_541;
float l9_610=l9_550;
float2 l9_611=l9_607;
int l9_612=l9_608;
int l9_613=l9_609;
float3 l9_614=float3(0.0);
if (l9_612==0)
{
l9_614=float3(l9_611,0.0);
}
else
{
if (l9_612==1)
{
l9_614=float3(l9_611.x,(l9_611.y*0.5)+(0.5-(float(l9_613)*0.5)),0.0);
}
else
{
l9_614=float3(l9_611,float(l9_613));
}
}
float3 l9_615=l9_614;
float3 l9_616=l9_615;
float4 l9_617=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_616.xy,bias(l9_610));
float4 l9_618=l9_617;
if (l9_548)
{
l9_618=mix(l9_549,l9_618,float4(l9_552));
}
float4 l9_619=l9_618;
l9_533=l9_619;
float l9_620=0.0;
l9_620=l9_533.x;
float l9_621=0.0;
l9_621=step(l9_620,(*sc_set0.UserUniforms).Port_Input1_N006);
float l9_622=0.0;
l9_622=step(l9_620,(*sc_set0.UserUniforms).Port_Input1_N009);
float l9_623=0.0;
l9_623=l9_621-l9_622;
l9_526=float4(l9_623);
l9_531=l9_526;
}
else
{
l9_531=l9_527;
}
l9_524=l9_531;
float4 l9_624=float4(0.0);
l9_624=l9_193*l9_524;
float4 l9_625=float4(0.0);
float4 l9_626=(*sc_set0.UserUniforms).colorId03;
l9_625=l9_626;
float4 l9_627=float4(0.0);
l9_627=l9_625*l9_524;
float4 l9_628=float4(0.0);
float4 l9_629=l9_624;
float4 l9_630=l9_627;
float4 l9_631=l9_629;
float4 l9_632=l9_630;
float3 l9_633=l9_631.xyz*l9_631.w;
l9_631=float4(l9_633.x,l9_633.y,l9_633.z,l9_631.w);
float4 l9_634=l9_631+(l9_632*(1.0-l9_631.w));
l9_628=l9_634;
float4 l9_635=float4(0.0);
l9_635=float4(l9_187)*l9_628;
float4 l9_636=float4(0.0);
l9_636=l9_635+l9_628;
l9_177=l9_636;
l9_182=l9_177;
}
else
{
float4 l9_637=float4(0.0);
float l9_638=0.0;
float4 l9_639=float4(0.0);
float4 l9_640=float4(0.0);
ssGlobals l9_641=l9_179;
float l9_642=0.0;
float l9_643=float((*sc_set0.UserUniforms).patternOnOffId03!=0);
l9_642=l9_643;
l9_638=l9_642;
float4 l9_644;
if ((l9_638*1.0)!=0.0)
{
float4 l9_645=float4(0.0);
float4 l9_646=(*sc_set0.UserUniforms).patternColorId03;
l9_645=l9_646;
float4 l9_647=float4(0.0);
float l9_648=0.0;
float4 l9_649=float4(0.0);
float4 l9_650=float4(0.0);
ssGlobals l9_651=l9_641;
float l9_652=0.0;
float l9_653=float((*sc_set0.UserUniforms).pngPatternId03!=0);
l9_652=l9_653;
l9_648=l9_652;
float4 l9_654;
if ((l9_648*1.0)!=0.0)
{
float2 l9_655=float2(0.0);
l9_655=l9_651.Surface_UVCoord0;
float2 l9_656=float2(0.0);
float2 l9_657=(*sc_set0.UserUniforms).patternScaleId03;
l9_656=l9_657;
float2 l9_658=float2(0.0);
l9_658=((l9_655-(*sc_set0.UserUniforms).Port_Center_N379)*l9_656)+(*sc_set0.UserUniforms).Port_Center_N379;
float2 l9_659=float2(0.0);
float2 l9_660=(*sc_set0.UserUniforms).patternOffsetId03;
l9_659=l9_660;
float2 l9_661=float2(0.0);
l9_661=l9_658+l9_659;
float l9_662=0.0;
float l9_663=(*sc_set0.UserUniforms).patternRotateId03;
l9_662=l9_663;
float2 l9_664=float2(0.0);
float2 l9_665=l9_661;
float l9_666=l9_662;
float2 l9_667=(*sc_set0.UserUniforms).Port_Center_N383;
float l9_668=sin(radians(l9_666));
float l9_669=cos(radians(l9_666));
float2 l9_670=l9_665-l9_667;
l9_670=float2(dot(float2(l9_669,l9_668),l9_670),dot(float2(-l9_668,l9_669),l9_670))+l9_667;
l9_664=l9_670;
float4 l9_671=float4(0.0);
int l9_672;
if ((int(patternTextureId03HasSwappedViews_tmp)!=0))
{
int l9_673=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_673=0;
}
else
{
l9_673=in.varStereoViewID;
}
int l9_674=l9_673;
l9_672=1-l9_674;
}
else
{
int l9_675=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_675=0;
}
else
{
l9_675=in.varStereoViewID;
}
int l9_676=l9_675;
l9_672=l9_676;
}
int l9_677=l9_672;
int l9_678=patternTextureId03Layout_tmp;
int l9_679=l9_677;
float2 l9_680=l9_664;
bool l9_681=(int(SC_USE_UV_TRANSFORM_patternTextureId03_tmp)!=0);
float3x3 l9_682=(*sc_set0.UserUniforms).patternTextureId03Transform;
int2 l9_683=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId03_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId03_tmp);
bool l9_684=(int(SC_USE_UV_MIN_MAX_patternTextureId03_tmp)!=0);
float4 l9_685=(*sc_set0.UserUniforms).patternTextureId03UvMinMax;
bool l9_686=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId03_tmp)!=0);
float4 l9_687=(*sc_set0.UserUniforms).patternTextureId03BorderColor;
float l9_688=0.0;
bool l9_689=l9_686&&(!l9_684);
float l9_690=1.0;
float l9_691=l9_680.x;
int l9_692=l9_683.x;
if (l9_692==1)
{
l9_691=fract(l9_691);
}
else
{
if (l9_692==2)
{
float l9_693=fract(l9_691);
float l9_694=l9_691-l9_693;
float l9_695=step(0.25,fract(l9_694*0.5));
l9_691=mix(l9_693,1.0-l9_693,fast::clamp(l9_695,0.0,1.0));
}
}
l9_680.x=l9_691;
float l9_696=l9_680.y;
int l9_697=l9_683.y;
if (l9_697==1)
{
l9_696=fract(l9_696);
}
else
{
if (l9_697==2)
{
float l9_698=fract(l9_696);
float l9_699=l9_696-l9_698;
float l9_700=step(0.25,fract(l9_699*0.5));
l9_696=mix(l9_698,1.0-l9_698,fast::clamp(l9_700,0.0,1.0));
}
}
l9_680.y=l9_696;
if (l9_684)
{
bool l9_701=l9_686;
bool l9_702;
if (l9_701)
{
l9_702=l9_683.x==3;
}
else
{
l9_702=l9_701;
}
float l9_703=l9_680.x;
float l9_704=l9_685.x;
float l9_705=l9_685.z;
bool l9_706=l9_702;
float l9_707=l9_690;
float l9_708=fast::clamp(l9_703,l9_704,l9_705);
float l9_709=step(abs(l9_703-l9_708),9.9999997e-06);
l9_707*=(l9_709+((1.0-float(l9_706))*(1.0-l9_709)));
l9_703=l9_708;
l9_680.x=l9_703;
l9_690=l9_707;
bool l9_710=l9_686;
bool l9_711;
if (l9_710)
{
l9_711=l9_683.y==3;
}
else
{
l9_711=l9_710;
}
float l9_712=l9_680.y;
float l9_713=l9_685.y;
float l9_714=l9_685.w;
bool l9_715=l9_711;
float l9_716=l9_690;
float l9_717=fast::clamp(l9_712,l9_713,l9_714);
float l9_718=step(abs(l9_712-l9_717),9.9999997e-06);
l9_716*=(l9_718+((1.0-float(l9_715))*(1.0-l9_718)));
l9_712=l9_717;
l9_680.y=l9_712;
l9_690=l9_716;
}
float2 l9_719=l9_680;
bool l9_720=l9_681;
float3x3 l9_721=l9_682;
if (l9_720)
{
l9_719=float2((l9_721*float3(l9_719,1.0)).xy);
}
float2 l9_722=l9_719;
l9_680=l9_722;
float l9_723=l9_680.x;
int l9_724=l9_683.x;
bool l9_725=l9_689;
float l9_726=l9_690;
if ((l9_724==0)||(l9_724==3))
{
float l9_727=l9_723;
float l9_728=0.0;
float l9_729=1.0;
bool l9_730=l9_725;
float l9_731=l9_726;
float l9_732=fast::clamp(l9_727,l9_728,l9_729);
float l9_733=step(abs(l9_727-l9_732),9.9999997e-06);
l9_731*=(l9_733+((1.0-float(l9_730))*(1.0-l9_733)));
l9_727=l9_732;
l9_723=l9_727;
l9_726=l9_731;
}
l9_680.x=l9_723;
l9_690=l9_726;
float l9_734=l9_680.y;
int l9_735=l9_683.y;
bool l9_736=l9_689;
float l9_737=l9_690;
if ((l9_735==0)||(l9_735==3))
{
float l9_738=l9_734;
float l9_739=0.0;
float l9_740=1.0;
bool l9_741=l9_736;
float l9_742=l9_737;
float l9_743=fast::clamp(l9_738,l9_739,l9_740);
float l9_744=step(abs(l9_738-l9_743),9.9999997e-06);
l9_742*=(l9_744+((1.0-float(l9_741))*(1.0-l9_744)));
l9_738=l9_743;
l9_734=l9_738;
l9_737=l9_742;
}
l9_680.y=l9_734;
l9_690=l9_737;
float2 l9_745=l9_680;
int l9_746=l9_678;
int l9_747=l9_679;
float l9_748=l9_688;
float2 l9_749=l9_745;
int l9_750=l9_746;
int l9_751=l9_747;
float3 l9_752=float3(0.0);
if (l9_750==0)
{
l9_752=float3(l9_749,0.0);
}
else
{
if (l9_750==1)
{
l9_752=float3(l9_749.x,(l9_749.y*0.5)+(0.5-(float(l9_751)*0.5)),0.0);
}
else
{
l9_752=float3(l9_749,float(l9_751));
}
}
float3 l9_753=l9_752;
float3 l9_754=l9_753;
float4 l9_755=sc_set0.patternTextureId03.sample(sc_set0.patternTextureId03SmpSC,l9_754.xy,bias(l9_748));
float4 l9_756=l9_755;
if (l9_686)
{
l9_756=mix(l9_687,l9_756,float4(l9_690));
}
float4 l9_757=l9_756;
l9_671=l9_757;
l9_649=l9_671;
l9_654=l9_649;
}
else
{
float2 l9_758=float2(0.0);
l9_758=l9_651.Surface_UVCoord0;
float2 l9_759=float2(0.0);
float2 l9_760=(*sc_set0.UserUniforms).patternScaleId03;
l9_759=l9_760;
float2 l9_761=float2(0.0);
l9_761=((l9_758-(*sc_set0.UserUniforms).Port_Center_N379)*l9_759)+(*sc_set0.UserUniforms).Port_Center_N379;
float2 l9_762=float2(0.0);
float2 l9_763=(*sc_set0.UserUniforms).patternOffsetId03;
l9_762=l9_763;
float2 l9_764=float2(0.0);
l9_764=l9_761+l9_762;
float l9_765=0.0;
float l9_766=(*sc_set0.UserUniforms).patternRotateId03;
l9_765=l9_766;
float2 l9_767=float2(0.0);
float2 l9_768=l9_764;
float l9_769=l9_765;
float2 l9_770=(*sc_set0.UserUniforms).Port_Center_N383;
float l9_771=sin(radians(l9_769));
float l9_772=cos(radians(l9_769));
float2 l9_773=l9_768-l9_770;
l9_773=float2(dot(float2(l9_772,l9_771),l9_773),dot(float2(-l9_771,l9_772),l9_773))+l9_770;
l9_767=l9_773;
float4 l9_774=float4(0.0);
int l9_775;
if ((int(patternTextureId03HasSwappedViews_tmp)!=0))
{
int l9_776=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_776=0;
}
else
{
l9_776=in.varStereoViewID;
}
int l9_777=l9_776;
l9_775=1-l9_777;
}
else
{
int l9_778=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_778=0;
}
else
{
l9_778=in.varStereoViewID;
}
int l9_779=l9_778;
l9_775=l9_779;
}
int l9_780=l9_775;
int l9_781=patternTextureId03Layout_tmp;
int l9_782=l9_780;
float2 l9_783=l9_767;
bool l9_784=(int(SC_USE_UV_TRANSFORM_patternTextureId03_tmp)!=0);
float3x3 l9_785=(*sc_set0.UserUniforms).patternTextureId03Transform;
int2 l9_786=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId03_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId03_tmp);
bool l9_787=(int(SC_USE_UV_MIN_MAX_patternTextureId03_tmp)!=0);
float4 l9_788=(*sc_set0.UserUniforms).patternTextureId03UvMinMax;
bool l9_789=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId03_tmp)!=0);
float4 l9_790=(*sc_set0.UserUniforms).patternTextureId03BorderColor;
float l9_791=0.0;
bool l9_792=l9_789&&(!l9_787);
float l9_793=1.0;
float l9_794=l9_783.x;
int l9_795=l9_786.x;
if (l9_795==1)
{
l9_794=fract(l9_794);
}
else
{
if (l9_795==2)
{
float l9_796=fract(l9_794);
float l9_797=l9_794-l9_796;
float l9_798=step(0.25,fract(l9_797*0.5));
l9_794=mix(l9_796,1.0-l9_796,fast::clamp(l9_798,0.0,1.0));
}
}
l9_783.x=l9_794;
float l9_799=l9_783.y;
int l9_800=l9_786.y;
if (l9_800==1)
{
l9_799=fract(l9_799);
}
else
{
if (l9_800==2)
{
float l9_801=fract(l9_799);
float l9_802=l9_799-l9_801;
float l9_803=step(0.25,fract(l9_802*0.5));
l9_799=mix(l9_801,1.0-l9_801,fast::clamp(l9_803,0.0,1.0));
}
}
l9_783.y=l9_799;
if (l9_787)
{
bool l9_804=l9_789;
bool l9_805;
if (l9_804)
{
l9_805=l9_786.x==3;
}
else
{
l9_805=l9_804;
}
float l9_806=l9_783.x;
float l9_807=l9_788.x;
float l9_808=l9_788.z;
bool l9_809=l9_805;
float l9_810=l9_793;
float l9_811=fast::clamp(l9_806,l9_807,l9_808);
float l9_812=step(abs(l9_806-l9_811),9.9999997e-06);
l9_810*=(l9_812+((1.0-float(l9_809))*(1.0-l9_812)));
l9_806=l9_811;
l9_783.x=l9_806;
l9_793=l9_810;
bool l9_813=l9_789;
bool l9_814;
if (l9_813)
{
l9_814=l9_786.y==3;
}
else
{
l9_814=l9_813;
}
float l9_815=l9_783.y;
float l9_816=l9_788.y;
float l9_817=l9_788.w;
bool l9_818=l9_814;
float l9_819=l9_793;
float l9_820=fast::clamp(l9_815,l9_816,l9_817);
float l9_821=step(abs(l9_815-l9_820),9.9999997e-06);
l9_819*=(l9_821+((1.0-float(l9_818))*(1.0-l9_821)));
l9_815=l9_820;
l9_783.y=l9_815;
l9_793=l9_819;
}
float2 l9_822=l9_783;
bool l9_823=l9_784;
float3x3 l9_824=l9_785;
if (l9_823)
{
l9_822=float2((l9_824*float3(l9_822,1.0)).xy);
}
float2 l9_825=l9_822;
l9_783=l9_825;
float l9_826=l9_783.x;
int l9_827=l9_786.x;
bool l9_828=l9_792;
float l9_829=l9_793;
if ((l9_827==0)||(l9_827==3))
{
float l9_830=l9_826;
float l9_831=0.0;
float l9_832=1.0;
bool l9_833=l9_828;
float l9_834=l9_829;
float l9_835=fast::clamp(l9_830,l9_831,l9_832);
float l9_836=step(abs(l9_830-l9_835),9.9999997e-06);
l9_834*=(l9_836+((1.0-float(l9_833))*(1.0-l9_836)));
l9_830=l9_835;
l9_826=l9_830;
l9_829=l9_834;
}
l9_783.x=l9_826;
l9_793=l9_829;
float l9_837=l9_783.y;
int l9_838=l9_786.y;
bool l9_839=l9_792;
float l9_840=l9_793;
if ((l9_838==0)||(l9_838==3))
{
float l9_841=l9_837;
float l9_842=0.0;
float l9_843=1.0;
bool l9_844=l9_839;
float l9_845=l9_840;
float l9_846=fast::clamp(l9_841,l9_842,l9_843);
float l9_847=step(abs(l9_841-l9_846),9.9999997e-06);
l9_845*=(l9_847+((1.0-float(l9_844))*(1.0-l9_847)));
l9_841=l9_846;
l9_837=l9_841;
l9_840=l9_845;
}
l9_783.y=l9_837;
l9_793=l9_840;
float2 l9_848=l9_783;
int l9_849=l9_781;
int l9_850=l9_782;
float l9_851=l9_791;
float2 l9_852=l9_848;
int l9_853=l9_849;
int l9_854=l9_850;
float3 l9_855=float3(0.0);
if (l9_853==0)
{
l9_855=float3(l9_852,0.0);
}
else
{
if (l9_853==1)
{
l9_855=float3(l9_852.x,(l9_852.y*0.5)+(0.5-(float(l9_854)*0.5)),0.0);
}
else
{
l9_855=float3(l9_852,float(l9_854));
}
}
float3 l9_856=l9_855;
float3 l9_857=l9_856;
float4 l9_858=sc_set0.patternTextureId03.sample(sc_set0.patternTextureId03SmpSC,l9_857.xy,bias(l9_851));
float4 l9_859=l9_858;
if (l9_789)
{
l9_859=mix(l9_790,l9_859,float4(l9_793));
}
float4 l9_860=l9_859;
l9_774=l9_860;
float l9_861=0.0;
float3 l9_862=l9_774.xyz;
float l9_863=l9_862.x;
l9_861=l9_863;
l9_650=float4(l9_861);
l9_654=l9_650;
}
l9_647=l9_654;
float4 l9_864=float4(0.0);
l9_864=l9_645*l9_647;
l9_639=l9_864;
l9_644=l9_639;
}
else
{
float4 l9_865=float4(0.0);
float4 l9_866=(*sc_set0.UserUniforms).colorId03;
l9_865=l9_866;
float4 l9_867=float4(0.0);
float l9_868=0.0;
float4 l9_869=float4(0.0);
float4 l9_870=(*sc_set0.UserUniforms).Port_Default_N358;
ssGlobals l9_871=l9_641;
float l9_872=0.0;
float l9_873=float((*sc_set0.UserUniforms).ColorOnOffid03!=0);
l9_872=l9_873;
l9_868=l9_872;
float4 l9_874;
if ((l9_868*1.0)!=0.0)
{
float2 l9_875=float2(0.0);
l9_875=l9_871.Surface_UVCoord0;
float4 l9_876=float4(0.0);
int l9_877;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_878=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_878=0;
}
else
{
l9_878=in.varStereoViewID;
}
int l9_879=l9_878;
l9_877=1-l9_879;
}
else
{
int l9_880=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_880=0;
}
else
{
l9_880=in.varStereoViewID;
}
int l9_881=l9_880;
l9_877=l9_881;
}
int l9_882=l9_877;
int l9_883=greyMaskIdLayout_tmp;
int l9_884=l9_882;
float2 l9_885=l9_875;
bool l9_886=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_887=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_888=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_889=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_890=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_891=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_892=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_893=0.0;
bool l9_894=l9_891&&(!l9_889);
float l9_895=1.0;
float l9_896=l9_885.x;
int l9_897=l9_888.x;
if (l9_897==1)
{
l9_896=fract(l9_896);
}
else
{
if (l9_897==2)
{
float l9_898=fract(l9_896);
float l9_899=l9_896-l9_898;
float l9_900=step(0.25,fract(l9_899*0.5));
l9_896=mix(l9_898,1.0-l9_898,fast::clamp(l9_900,0.0,1.0));
}
}
l9_885.x=l9_896;
float l9_901=l9_885.y;
int l9_902=l9_888.y;
if (l9_902==1)
{
l9_901=fract(l9_901);
}
else
{
if (l9_902==2)
{
float l9_903=fract(l9_901);
float l9_904=l9_901-l9_903;
float l9_905=step(0.25,fract(l9_904*0.5));
l9_901=mix(l9_903,1.0-l9_903,fast::clamp(l9_905,0.0,1.0));
}
}
l9_885.y=l9_901;
if (l9_889)
{
bool l9_906=l9_891;
bool l9_907;
if (l9_906)
{
l9_907=l9_888.x==3;
}
else
{
l9_907=l9_906;
}
float l9_908=l9_885.x;
float l9_909=l9_890.x;
float l9_910=l9_890.z;
bool l9_911=l9_907;
float l9_912=l9_895;
float l9_913=fast::clamp(l9_908,l9_909,l9_910);
float l9_914=step(abs(l9_908-l9_913),9.9999997e-06);
l9_912*=(l9_914+((1.0-float(l9_911))*(1.0-l9_914)));
l9_908=l9_913;
l9_885.x=l9_908;
l9_895=l9_912;
bool l9_915=l9_891;
bool l9_916;
if (l9_915)
{
l9_916=l9_888.y==3;
}
else
{
l9_916=l9_915;
}
float l9_917=l9_885.y;
float l9_918=l9_890.y;
float l9_919=l9_890.w;
bool l9_920=l9_916;
float l9_921=l9_895;
float l9_922=fast::clamp(l9_917,l9_918,l9_919);
float l9_923=step(abs(l9_917-l9_922),9.9999997e-06);
l9_921*=(l9_923+((1.0-float(l9_920))*(1.0-l9_923)));
l9_917=l9_922;
l9_885.y=l9_917;
l9_895=l9_921;
}
float2 l9_924=l9_885;
bool l9_925=l9_886;
float3x3 l9_926=l9_887;
if (l9_925)
{
l9_924=float2((l9_926*float3(l9_924,1.0)).xy);
}
float2 l9_927=l9_924;
l9_885=l9_927;
float l9_928=l9_885.x;
int l9_929=l9_888.x;
bool l9_930=l9_894;
float l9_931=l9_895;
if ((l9_929==0)||(l9_929==3))
{
float l9_932=l9_928;
float l9_933=0.0;
float l9_934=1.0;
bool l9_935=l9_930;
float l9_936=l9_931;
float l9_937=fast::clamp(l9_932,l9_933,l9_934);
float l9_938=step(abs(l9_932-l9_937),9.9999997e-06);
l9_936*=(l9_938+((1.0-float(l9_935))*(1.0-l9_938)));
l9_932=l9_937;
l9_928=l9_932;
l9_931=l9_936;
}
l9_885.x=l9_928;
l9_895=l9_931;
float l9_939=l9_885.y;
int l9_940=l9_888.y;
bool l9_941=l9_894;
float l9_942=l9_895;
if ((l9_940==0)||(l9_940==3))
{
float l9_943=l9_939;
float l9_944=0.0;
float l9_945=1.0;
bool l9_946=l9_941;
float l9_947=l9_942;
float l9_948=fast::clamp(l9_943,l9_944,l9_945);
float l9_949=step(abs(l9_943-l9_948),9.9999997e-06);
l9_947*=(l9_949+((1.0-float(l9_946))*(1.0-l9_949)));
l9_943=l9_948;
l9_939=l9_943;
l9_942=l9_947;
}
l9_885.y=l9_939;
l9_895=l9_942;
float2 l9_950=l9_885;
int l9_951=l9_883;
int l9_952=l9_884;
float l9_953=l9_893;
float2 l9_954=l9_950;
int l9_955=l9_951;
int l9_956=l9_952;
float3 l9_957=float3(0.0);
if (l9_955==0)
{
l9_957=float3(l9_954,0.0);
}
else
{
if (l9_955==1)
{
l9_957=float3(l9_954.x,(l9_954.y*0.5)+(0.5-(float(l9_956)*0.5)),0.0);
}
else
{
l9_957=float3(l9_954,float(l9_956));
}
}
float3 l9_958=l9_957;
float3 l9_959=l9_958;
float4 l9_960=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_959.xy,bias(l9_953));
float4 l9_961=l9_960;
if (l9_891)
{
l9_961=mix(l9_892,l9_961,float4(l9_895));
}
float4 l9_962=l9_961;
l9_876=l9_962;
float l9_963=0.0;
l9_963=l9_876.x;
float l9_964=0.0;
l9_964=step(l9_963,(*sc_set0.UserUniforms).Port_Input1_N006);
float l9_965=0.0;
l9_965=step(l9_963,(*sc_set0.UserUniforms).Port_Input1_N009);
float l9_966=0.0;
l9_966=l9_964-l9_965;
l9_869=float4(l9_966);
l9_874=l9_869;
}
else
{
l9_874=l9_870;
}
l9_867=l9_874;
float4 l9_967=float4(0.0);
l9_967=l9_865*l9_867;
l9_640=l9_967;
l9_644=l9_640;
}
l9_637=l9_644;
float4 l9_968=float4(0.0);
float l9_969=0.0;
float4 l9_970=float4(0.0);
float4 l9_971=(*sc_set0.UserUniforms).Port_Default_N358;
ssGlobals l9_972=l9_179;
float l9_973=0.0;
float l9_974=float((*sc_set0.UserUniforms).ColorOnOffid03!=0);
l9_973=l9_974;
l9_969=l9_973;
float4 l9_975;
if ((l9_969*1.0)!=0.0)
{
float2 l9_976=float2(0.0);
l9_976=l9_972.Surface_UVCoord0;
float4 l9_977=float4(0.0);
int l9_978;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_979=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_979=0;
}
else
{
l9_979=in.varStereoViewID;
}
int l9_980=l9_979;
l9_978=1-l9_980;
}
else
{
int l9_981=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_981=0;
}
else
{
l9_981=in.varStereoViewID;
}
int l9_982=l9_981;
l9_978=l9_982;
}
int l9_983=l9_978;
int l9_984=greyMaskIdLayout_tmp;
int l9_985=l9_983;
float2 l9_986=l9_976;
bool l9_987=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_988=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_989=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_990=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_991=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_992=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_993=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_994=0.0;
bool l9_995=l9_992&&(!l9_990);
float l9_996=1.0;
float l9_997=l9_986.x;
int l9_998=l9_989.x;
if (l9_998==1)
{
l9_997=fract(l9_997);
}
else
{
if (l9_998==2)
{
float l9_999=fract(l9_997);
float l9_1000=l9_997-l9_999;
float l9_1001=step(0.25,fract(l9_1000*0.5));
l9_997=mix(l9_999,1.0-l9_999,fast::clamp(l9_1001,0.0,1.0));
}
}
l9_986.x=l9_997;
float l9_1002=l9_986.y;
int l9_1003=l9_989.y;
if (l9_1003==1)
{
l9_1002=fract(l9_1002);
}
else
{
if (l9_1003==2)
{
float l9_1004=fract(l9_1002);
float l9_1005=l9_1002-l9_1004;
float l9_1006=step(0.25,fract(l9_1005*0.5));
l9_1002=mix(l9_1004,1.0-l9_1004,fast::clamp(l9_1006,0.0,1.0));
}
}
l9_986.y=l9_1002;
if (l9_990)
{
bool l9_1007=l9_992;
bool l9_1008;
if (l9_1007)
{
l9_1008=l9_989.x==3;
}
else
{
l9_1008=l9_1007;
}
float l9_1009=l9_986.x;
float l9_1010=l9_991.x;
float l9_1011=l9_991.z;
bool l9_1012=l9_1008;
float l9_1013=l9_996;
float l9_1014=fast::clamp(l9_1009,l9_1010,l9_1011);
float l9_1015=step(abs(l9_1009-l9_1014),9.9999997e-06);
l9_1013*=(l9_1015+((1.0-float(l9_1012))*(1.0-l9_1015)));
l9_1009=l9_1014;
l9_986.x=l9_1009;
l9_996=l9_1013;
bool l9_1016=l9_992;
bool l9_1017;
if (l9_1016)
{
l9_1017=l9_989.y==3;
}
else
{
l9_1017=l9_1016;
}
float l9_1018=l9_986.y;
float l9_1019=l9_991.y;
float l9_1020=l9_991.w;
bool l9_1021=l9_1017;
float l9_1022=l9_996;
float l9_1023=fast::clamp(l9_1018,l9_1019,l9_1020);
float l9_1024=step(abs(l9_1018-l9_1023),9.9999997e-06);
l9_1022*=(l9_1024+((1.0-float(l9_1021))*(1.0-l9_1024)));
l9_1018=l9_1023;
l9_986.y=l9_1018;
l9_996=l9_1022;
}
float2 l9_1025=l9_986;
bool l9_1026=l9_987;
float3x3 l9_1027=l9_988;
if (l9_1026)
{
l9_1025=float2((l9_1027*float3(l9_1025,1.0)).xy);
}
float2 l9_1028=l9_1025;
l9_986=l9_1028;
float l9_1029=l9_986.x;
int l9_1030=l9_989.x;
bool l9_1031=l9_995;
float l9_1032=l9_996;
if ((l9_1030==0)||(l9_1030==3))
{
float l9_1033=l9_1029;
float l9_1034=0.0;
float l9_1035=1.0;
bool l9_1036=l9_1031;
float l9_1037=l9_1032;
float l9_1038=fast::clamp(l9_1033,l9_1034,l9_1035);
float l9_1039=step(abs(l9_1033-l9_1038),9.9999997e-06);
l9_1037*=(l9_1039+((1.0-float(l9_1036))*(1.0-l9_1039)));
l9_1033=l9_1038;
l9_1029=l9_1033;
l9_1032=l9_1037;
}
l9_986.x=l9_1029;
l9_996=l9_1032;
float l9_1040=l9_986.y;
int l9_1041=l9_989.y;
bool l9_1042=l9_995;
float l9_1043=l9_996;
if ((l9_1041==0)||(l9_1041==3))
{
float l9_1044=l9_1040;
float l9_1045=0.0;
float l9_1046=1.0;
bool l9_1047=l9_1042;
float l9_1048=l9_1043;
float l9_1049=fast::clamp(l9_1044,l9_1045,l9_1046);
float l9_1050=step(abs(l9_1044-l9_1049),9.9999997e-06);
l9_1048*=(l9_1050+((1.0-float(l9_1047))*(1.0-l9_1050)));
l9_1044=l9_1049;
l9_1040=l9_1044;
l9_1043=l9_1048;
}
l9_986.y=l9_1040;
l9_996=l9_1043;
float2 l9_1051=l9_986;
int l9_1052=l9_984;
int l9_1053=l9_985;
float l9_1054=l9_994;
float2 l9_1055=l9_1051;
int l9_1056=l9_1052;
int l9_1057=l9_1053;
float3 l9_1058=float3(0.0);
if (l9_1056==0)
{
l9_1058=float3(l9_1055,0.0);
}
else
{
if (l9_1056==1)
{
l9_1058=float3(l9_1055.x,(l9_1055.y*0.5)+(0.5-(float(l9_1057)*0.5)),0.0);
}
else
{
l9_1058=float3(l9_1055,float(l9_1057));
}
}
float3 l9_1059=l9_1058;
float3 l9_1060=l9_1059;
float4 l9_1061=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_1060.xy,bias(l9_1054));
float4 l9_1062=l9_1061;
if (l9_992)
{
l9_1062=mix(l9_993,l9_1062,float4(l9_996));
}
float4 l9_1063=l9_1062;
l9_977=l9_1063;
float l9_1064=0.0;
l9_1064=l9_977.x;
float l9_1065=0.0;
l9_1065=step(l9_1064,(*sc_set0.UserUniforms).Port_Input1_N006);
float l9_1066=0.0;
l9_1066=step(l9_1064,(*sc_set0.UserUniforms).Port_Input1_N009);
float l9_1067=0.0;
l9_1067=l9_1065-l9_1066;
l9_970=float4(l9_1067);
l9_975=l9_970;
}
else
{
l9_975=l9_971;
}
l9_968=l9_975;
float4 l9_1068=float4(0.0);
l9_1068=l9_637*l9_968;
float4 l9_1069=float4(0.0);
float4 l9_1070=(*sc_set0.UserUniforms).colorId03;
l9_1069=l9_1070;
float4 l9_1071=float4(0.0);
l9_1071=l9_1069*l9_968;
float4 l9_1072=float4(0.0);
float4 l9_1073=l9_1068;
float4 l9_1074=l9_1071;
float4 l9_1075=l9_1073;
float4 l9_1076=l9_1074;
float3 l9_1077=l9_1075.xyz*l9_1075.w;
l9_1075=float4(l9_1077.x,l9_1077.y,l9_1077.z,l9_1075.w);
float4 l9_1078=l9_1075+(l9_1076*(1.0-l9_1075.w));
l9_1072=l9_1078;
l9_178=l9_1072;
l9_182=l9_178;
}
l9_175=l9_182;
float l9_1079=0.0;
float l9_1080=(*sc_set0.UserUniforms).metallicId03;
l9_1079=l9_1080;
float l9_1081=0.0;
float l9_1082=(*sc_set0.UserUniforms).rougnessId03;
l9_1081=l9_1082;
float4 l9_1083=float4(0.0);
float3 l9_1084=l9_175.xyz;
float l9_1085=(*sc_set0.UserUniforms).Port_Opacity_N410;
float3 l9_1086=(*sc_set0.UserUniforms).Port_Emissive_N410;
float l9_1087=l9_1079;
float l9_1088=l9_1081;
float3 l9_1089=(*sc_set0.UserUniforms).Port_AO_N410;
float3 l9_1090=(*sc_set0.UserUniforms).Port_SpecularAO_N410;
ssGlobals l9_1091=l9_171;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_1091.BumpedNormal=l9_1091.VertexNormal_WorldSpace;
}
float l9_1092=l9_1085;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_1092<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1093=gl_FragCoord;
float2 l9_1094=floor(mod(l9_1093.xy,float2(4.0)));
float l9_1095=(mod(dot(l9_1094,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_1092<l9_1095)
{
discard_fragment();
}
}
l9_1084=fast::max(l9_1084,float3(0.0));
float4 l9_1096;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_1096=float4(l9_1084,l9_1085);
}
else
{
l9_1087=fast::clamp(l9_1087,0.0,1.0);
l9_1088=fast::clamp(l9_1088,0.0,1.0);
float3 l9_1097=l9_1084;
float l9_1098=l9_1085;
float3 l9_1099=l9_1091.BumpedNormal;
float3 l9_1100=l9_1091.PositionWS;
float3 l9_1101=l9_1091.ViewDirWS;
float3 l9_1102=l9_1086;
float l9_1103=l9_1087;
float l9_1104=l9_1088;
float3 l9_1105=l9_1089;
float3 l9_1106=l9_1090;
l9_1096=ngsCalculateLighting(l9_1097,l9_1098,l9_1099,l9_1100,l9_1101,l9_1102,l9_1103,l9_1104,l9_1105,l9_1106,in.varStereoViewID,sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_RayTracingReflections,sc_set0.sc_RayTracingReflectionsSmpSC,sc_set0.sc_RayTracingGlobalIllumination,sc_set0.sc_RayTracingGlobalIlluminationSmpSC,sc_set0.sc_RayTracingShadows,sc_set0.sc_RayTracingShadowsSmpSC,gl_FragCoord,(*sc_set0.UserUniforms),in.varShadowTex,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,out.sc_FragData0,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
l9_1096=fast::max(l9_1096,float4(0.0));
l9_1083=l9_1096;
l9_169=l9_1083;
l9_174=l9_169;
}
else
{
float4 l9_1107=float4(0.0);
float l9_1108=0.0;
float4 l9_1109=float4(0.0);
float4 l9_1110=float4(0.0);
ssGlobals l9_1111=l9_171;
float l9_1112=0.0;
float l9_1113=float((*sc_set0.UserUniforms).rimOnOffId03!=0);
l9_1112=l9_1113;
l9_1108=l9_1112;
float4 l9_1114;
if ((l9_1108*1.0)!=0.0)
{
float l9_1115=0.0;
float l9_1116=(*sc_set0.UserUniforms).rimExpId03;
l9_1115=l9_1116;
float l9_1117=0.0;
float l9_1118=(*sc_set0.UserUniforms).rimIntId03;
l9_1117=l9_1118;
float l9_1119=0.0;
float l9_1120=l9_1115;
float l9_1121=l9_1117;
ssGlobals l9_1122=l9_1111;
float l9_1123=abs(dot(-l9_1122.ViewDirWS,l9_1122.VertexNormal_WorldSpace));
float l9_1124=1.0-pow(1.0-l9_1123,l9_1120);
l9_1124=fast::max(l9_1124,0.0);
l9_1124*=l9_1121;
l9_1119=l9_1124;
float4 l9_1125=float4(0.0);
float l9_1126=0.0;
float4 l9_1127=float4(0.0);
float4 l9_1128=float4(0.0);
ssGlobals l9_1129=l9_1111;
float l9_1130=0.0;
float l9_1131=float((*sc_set0.UserUniforms).patternOnOffId03!=0);
l9_1130=l9_1131;
l9_1126=l9_1130;
float4 l9_1132;
if ((l9_1126*1.0)!=0.0)
{
float4 l9_1133=float4(0.0);
float4 l9_1134=(*sc_set0.UserUniforms).patternColorId03;
l9_1133=l9_1134;
float4 l9_1135=float4(0.0);
float l9_1136=0.0;
float4 l9_1137=float4(0.0);
float4 l9_1138=float4(0.0);
ssGlobals l9_1139=l9_1129;
float l9_1140=0.0;
float l9_1141=float((*sc_set0.UserUniforms).pngPatternId03!=0);
l9_1140=l9_1141;
l9_1136=l9_1140;
float4 l9_1142;
if ((l9_1136*1.0)!=0.0)
{
float2 l9_1143=float2(0.0);
l9_1143=l9_1139.Surface_UVCoord0;
float2 l9_1144=float2(0.0);
float2 l9_1145=(*sc_set0.UserUniforms).patternScaleId03;
l9_1144=l9_1145;
float2 l9_1146=float2(0.0);
l9_1146=((l9_1143-(*sc_set0.UserUniforms).Port_Center_N379)*l9_1144)+(*sc_set0.UserUniforms).Port_Center_N379;
float2 l9_1147=float2(0.0);
float2 l9_1148=(*sc_set0.UserUniforms).patternOffsetId03;
l9_1147=l9_1148;
float2 l9_1149=float2(0.0);
l9_1149=l9_1146+l9_1147;
float l9_1150=0.0;
float l9_1151=(*sc_set0.UserUniforms).patternRotateId03;
l9_1150=l9_1151;
float2 l9_1152=float2(0.0);
float2 l9_1153=l9_1149;
float l9_1154=l9_1150;
float2 l9_1155=(*sc_set0.UserUniforms).Port_Center_N383;
float l9_1156=sin(radians(l9_1154));
float l9_1157=cos(radians(l9_1154));
float2 l9_1158=l9_1153-l9_1155;
l9_1158=float2(dot(float2(l9_1157,l9_1156),l9_1158),dot(float2(-l9_1156,l9_1157),l9_1158))+l9_1155;
l9_1152=l9_1158;
float4 l9_1159=float4(0.0);
int l9_1160;
if ((int(patternTextureId03HasSwappedViews_tmp)!=0))
{
int l9_1161=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1161=0;
}
else
{
l9_1161=in.varStereoViewID;
}
int l9_1162=l9_1161;
l9_1160=1-l9_1162;
}
else
{
int l9_1163=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1163=0;
}
else
{
l9_1163=in.varStereoViewID;
}
int l9_1164=l9_1163;
l9_1160=l9_1164;
}
int l9_1165=l9_1160;
int l9_1166=patternTextureId03Layout_tmp;
int l9_1167=l9_1165;
float2 l9_1168=l9_1152;
bool l9_1169=(int(SC_USE_UV_TRANSFORM_patternTextureId03_tmp)!=0);
float3x3 l9_1170=(*sc_set0.UserUniforms).patternTextureId03Transform;
int2 l9_1171=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId03_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId03_tmp);
bool l9_1172=(int(SC_USE_UV_MIN_MAX_patternTextureId03_tmp)!=0);
float4 l9_1173=(*sc_set0.UserUniforms).patternTextureId03UvMinMax;
bool l9_1174=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId03_tmp)!=0);
float4 l9_1175=(*sc_set0.UserUniforms).patternTextureId03BorderColor;
float l9_1176=0.0;
bool l9_1177=l9_1174&&(!l9_1172);
float l9_1178=1.0;
float l9_1179=l9_1168.x;
int l9_1180=l9_1171.x;
if (l9_1180==1)
{
l9_1179=fract(l9_1179);
}
else
{
if (l9_1180==2)
{
float l9_1181=fract(l9_1179);
float l9_1182=l9_1179-l9_1181;
float l9_1183=step(0.25,fract(l9_1182*0.5));
l9_1179=mix(l9_1181,1.0-l9_1181,fast::clamp(l9_1183,0.0,1.0));
}
}
l9_1168.x=l9_1179;
float l9_1184=l9_1168.y;
int l9_1185=l9_1171.y;
if (l9_1185==1)
{
l9_1184=fract(l9_1184);
}
else
{
if (l9_1185==2)
{
float l9_1186=fract(l9_1184);
float l9_1187=l9_1184-l9_1186;
float l9_1188=step(0.25,fract(l9_1187*0.5));
l9_1184=mix(l9_1186,1.0-l9_1186,fast::clamp(l9_1188,0.0,1.0));
}
}
l9_1168.y=l9_1184;
if (l9_1172)
{
bool l9_1189=l9_1174;
bool l9_1190;
if (l9_1189)
{
l9_1190=l9_1171.x==3;
}
else
{
l9_1190=l9_1189;
}
float l9_1191=l9_1168.x;
float l9_1192=l9_1173.x;
float l9_1193=l9_1173.z;
bool l9_1194=l9_1190;
float l9_1195=l9_1178;
float l9_1196=fast::clamp(l9_1191,l9_1192,l9_1193);
float l9_1197=step(abs(l9_1191-l9_1196),9.9999997e-06);
l9_1195*=(l9_1197+((1.0-float(l9_1194))*(1.0-l9_1197)));
l9_1191=l9_1196;
l9_1168.x=l9_1191;
l9_1178=l9_1195;
bool l9_1198=l9_1174;
bool l9_1199;
if (l9_1198)
{
l9_1199=l9_1171.y==3;
}
else
{
l9_1199=l9_1198;
}
float l9_1200=l9_1168.y;
float l9_1201=l9_1173.y;
float l9_1202=l9_1173.w;
bool l9_1203=l9_1199;
float l9_1204=l9_1178;
float l9_1205=fast::clamp(l9_1200,l9_1201,l9_1202);
float l9_1206=step(abs(l9_1200-l9_1205),9.9999997e-06);
l9_1204*=(l9_1206+((1.0-float(l9_1203))*(1.0-l9_1206)));
l9_1200=l9_1205;
l9_1168.y=l9_1200;
l9_1178=l9_1204;
}
float2 l9_1207=l9_1168;
bool l9_1208=l9_1169;
float3x3 l9_1209=l9_1170;
if (l9_1208)
{
l9_1207=float2((l9_1209*float3(l9_1207,1.0)).xy);
}
float2 l9_1210=l9_1207;
l9_1168=l9_1210;
float l9_1211=l9_1168.x;
int l9_1212=l9_1171.x;
bool l9_1213=l9_1177;
float l9_1214=l9_1178;
if ((l9_1212==0)||(l9_1212==3))
{
float l9_1215=l9_1211;
float l9_1216=0.0;
float l9_1217=1.0;
bool l9_1218=l9_1213;
float l9_1219=l9_1214;
float l9_1220=fast::clamp(l9_1215,l9_1216,l9_1217);
float l9_1221=step(abs(l9_1215-l9_1220),9.9999997e-06);
l9_1219*=(l9_1221+((1.0-float(l9_1218))*(1.0-l9_1221)));
l9_1215=l9_1220;
l9_1211=l9_1215;
l9_1214=l9_1219;
}
l9_1168.x=l9_1211;
l9_1178=l9_1214;
float l9_1222=l9_1168.y;
int l9_1223=l9_1171.y;
bool l9_1224=l9_1177;
float l9_1225=l9_1178;
if ((l9_1223==0)||(l9_1223==3))
{
float l9_1226=l9_1222;
float l9_1227=0.0;
float l9_1228=1.0;
bool l9_1229=l9_1224;
float l9_1230=l9_1225;
float l9_1231=fast::clamp(l9_1226,l9_1227,l9_1228);
float l9_1232=step(abs(l9_1226-l9_1231),9.9999997e-06);
l9_1230*=(l9_1232+((1.0-float(l9_1229))*(1.0-l9_1232)));
l9_1226=l9_1231;
l9_1222=l9_1226;
l9_1225=l9_1230;
}
l9_1168.y=l9_1222;
l9_1178=l9_1225;
float2 l9_1233=l9_1168;
int l9_1234=l9_1166;
int l9_1235=l9_1167;
float l9_1236=l9_1176;
float2 l9_1237=l9_1233;
int l9_1238=l9_1234;
int l9_1239=l9_1235;
float3 l9_1240=float3(0.0);
if (l9_1238==0)
{
l9_1240=float3(l9_1237,0.0);
}
else
{
if (l9_1238==1)
{
l9_1240=float3(l9_1237.x,(l9_1237.y*0.5)+(0.5-(float(l9_1239)*0.5)),0.0);
}
else
{
l9_1240=float3(l9_1237,float(l9_1239));
}
}
float3 l9_1241=l9_1240;
float3 l9_1242=l9_1241;
float4 l9_1243=sc_set0.patternTextureId03.sample(sc_set0.patternTextureId03SmpSC,l9_1242.xy,bias(l9_1236));
float4 l9_1244=l9_1243;
if (l9_1174)
{
l9_1244=mix(l9_1175,l9_1244,float4(l9_1178));
}
float4 l9_1245=l9_1244;
l9_1159=l9_1245;
l9_1137=l9_1159;
l9_1142=l9_1137;
}
else
{
float2 l9_1246=float2(0.0);
l9_1246=l9_1139.Surface_UVCoord0;
float2 l9_1247=float2(0.0);
float2 l9_1248=(*sc_set0.UserUniforms).patternScaleId03;
l9_1247=l9_1248;
float2 l9_1249=float2(0.0);
l9_1249=((l9_1246-(*sc_set0.UserUniforms).Port_Center_N379)*l9_1247)+(*sc_set0.UserUniforms).Port_Center_N379;
float2 l9_1250=float2(0.0);
float2 l9_1251=(*sc_set0.UserUniforms).patternOffsetId03;
l9_1250=l9_1251;
float2 l9_1252=float2(0.0);
l9_1252=l9_1249+l9_1250;
float l9_1253=0.0;
float l9_1254=(*sc_set0.UserUniforms).patternRotateId03;
l9_1253=l9_1254;
float2 l9_1255=float2(0.0);
float2 l9_1256=l9_1252;
float l9_1257=l9_1253;
float2 l9_1258=(*sc_set0.UserUniforms).Port_Center_N383;
float l9_1259=sin(radians(l9_1257));
float l9_1260=cos(radians(l9_1257));
float2 l9_1261=l9_1256-l9_1258;
l9_1261=float2(dot(float2(l9_1260,l9_1259),l9_1261),dot(float2(-l9_1259,l9_1260),l9_1261))+l9_1258;
l9_1255=l9_1261;
float4 l9_1262=float4(0.0);
int l9_1263;
if ((int(patternTextureId03HasSwappedViews_tmp)!=0))
{
int l9_1264=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1264=0;
}
else
{
l9_1264=in.varStereoViewID;
}
int l9_1265=l9_1264;
l9_1263=1-l9_1265;
}
else
{
int l9_1266=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1266=0;
}
else
{
l9_1266=in.varStereoViewID;
}
int l9_1267=l9_1266;
l9_1263=l9_1267;
}
int l9_1268=l9_1263;
int l9_1269=patternTextureId03Layout_tmp;
int l9_1270=l9_1268;
float2 l9_1271=l9_1255;
bool l9_1272=(int(SC_USE_UV_TRANSFORM_patternTextureId03_tmp)!=0);
float3x3 l9_1273=(*sc_set0.UserUniforms).patternTextureId03Transform;
int2 l9_1274=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId03_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId03_tmp);
bool l9_1275=(int(SC_USE_UV_MIN_MAX_patternTextureId03_tmp)!=0);
float4 l9_1276=(*sc_set0.UserUniforms).patternTextureId03UvMinMax;
bool l9_1277=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId03_tmp)!=0);
float4 l9_1278=(*sc_set0.UserUniforms).patternTextureId03BorderColor;
float l9_1279=0.0;
bool l9_1280=l9_1277&&(!l9_1275);
float l9_1281=1.0;
float l9_1282=l9_1271.x;
int l9_1283=l9_1274.x;
if (l9_1283==1)
{
l9_1282=fract(l9_1282);
}
else
{
if (l9_1283==2)
{
float l9_1284=fract(l9_1282);
float l9_1285=l9_1282-l9_1284;
float l9_1286=step(0.25,fract(l9_1285*0.5));
l9_1282=mix(l9_1284,1.0-l9_1284,fast::clamp(l9_1286,0.0,1.0));
}
}
l9_1271.x=l9_1282;
float l9_1287=l9_1271.y;
int l9_1288=l9_1274.y;
if (l9_1288==1)
{
l9_1287=fract(l9_1287);
}
else
{
if (l9_1288==2)
{
float l9_1289=fract(l9_1287);
float l9_1290=l9_1287-l9_1289;
float l9_1291=step(0.25,fract(l9_1290*0.5));
l9_1287=mix(l9_1289,1.0-l9_1289,fast::clamp(l9_1291,0.0,1.0));
}
}
l9_1271.y=l9_1287;
if (l9_1275)
{
bool l9_1292=l9_1277;
bool l9_1293;
if (l9_1292)
{
l9_1293=l9_1274.x==3;
}
else
{
l9_1293=l9_1292;
}
float l9_1294=l9_1271.x;
float l9_1295=l9_1276.x;
float l9_1296=l9_1276.z;
bool l9_1297=l9_1293;
float l9_1298=l9_1281;
float l9_1299=fast::clamp(l9_1294,l9_1295,l9_1296);
float l9_1300=step(abs(l9_1294-l9_1299),9.9999997e-06);
l9_1298*=(l9_1300+((1.0-float(l9_1297))*(1.0-l9_1300)));
l9_1294=l9_1299;
l9_1271.x=l9_1294;
l9_1281=l9_1298;
bool l9_1301=l9_1277;
bool l9_1302;
if (l9_1301)
{
l9_1302=l9_1274.y==3;
}
else
{
l9_1302=l9_1301;
}
float l9_1303=l9_1271.y;
float l9_1304=l9_1276.y;
float l9_1305=l9_1276.w;
bool l9_1306=l9_1302;
float l9_1307=l9_1281;
float l9_1308=fast::clamp(l9_1303,l9_1304,l9_1305);
float l9_1309=step(abs(l9_1303-l9_1308),9.9999997e-06);
l9_1307*=(l9_1309+((1.0-float(l9_1306))*(1.0-l9_1309)));
l9_1303=l9_1308;
l9_1271.y=l9_1303;
l9_1281=l9_1307;
}
float2 l9_1310=l9_1271;
bool l9_1311=l9_1272;
float3x3 l9_1312=l9_1273;
if (l9_1311)
{
l9_1310=float2((l9_1312*float3(l9_1310,1.0)).xy);
}
float2 l9_1313=l9_1310;
l9_1271=l9_1313;
float l9_1314=l9_1271.x;
int l9_1315=l9_1274.x;
bool l9_1316=l9_1280;
float l9_1317=l9_1281;
if ((l9_1315==0)||(l9_1315==3))
{
float l9_1318=l9_1314;
float l9_1319=0.0;
float l9_1320=1.0;
bool l9_1321=l9_1316;
float l9_1322=l9_1317;
float l9_1323=fast::clamp(l9_1318,l9_1319,l9_1320);
float l9_1324=step(abs(l9_1318-l9_1323),9.9999997e-06);
l9_1322*=(l9_1324+((1.0-float(l9_1321))*(1.0-l9_1324)));
l9_1318=l9_1323;
l9_1314=l9_1318;
l9_1317=l9_1322;
}
l9_1271.x=l9_1314;
l9_1281=l9_1317;
float l9_1325=l9_1271.y;
int l9_1326=l9_1274.y;
bool l9_1327=l9_1280;
float l9_1328=l9_1281;
if ((l9_1326==0)||(l9_1326==3))
{
float l9_1329=l9_1325;
float l9_1330=0.0;
float l9_1331=1.0;
bool l9_1332=l9_1327;
float l9_1333=l9_1328;
float l9_1334=fast::clamp(l9_1329,l9_1330,l9_1331);
float l9_1335=step(abs(l9_1329-l9_1334),9.9999997e-06);
l9_1333*=(l9_1335+((1.0-float(l9_1332))*(1.0-l9_1335)));
l9_1329=l9_1334;
l9_1325=l9_1329;
l9_1328=l9_1333;
}
l9_1271.y=l9_1325;
l9_1281=l9_1328;
float2 l9_1336=l9_1271;
int l9_1337=l9_1269;
int l9_1338=l9_1270;
float l9_1339=l9_1279;
float2 l9_1340=l9_1336;
int l9_1341=l9_1337;
int l9_1342=l9_1338;
float3 l9_1343=float3(0.0);
if (l9_1341==0)
{
l9_1343=float3(l9_1340,0.0);
}
else
{
if (l9_1341==1)
{
l9_1343=float3(l9_1340.x,(l9_1340.y*0.5)+(0.5-(float(l9_1342)*0.5)),0.0);
}
else
{
l9_1343=float3(l9_1340,float(l9_1342));
}
}
float3 l9_1344=l9_1343;
float3 l9_1345=l9_1344;
float4 l9_1346=sc_set0.patternTextureId03.sample(sc_set0.patternTextureId03SmpSC,l9_1345.xy,bias(l9_1339));
float4 l9_1347=l9_1346;
if (l9_1277)
{
l9_1347=mix(l9_1278,l9_1347,float4(l9_1281));
}
float4 l9_1348=l9_1347;
l9_1262=l9_1348;
float l9_1349=0.0;
float3 l9_1350=l9_1262.xyz;
float l9_1351=l9_1350.x;
l9_1349=l9_1351;
l9_1138=float4(l9_1349);
l9_1142=l9_1138;
}
l9_1135=l9_1142;
float4 l9_1352=float4(0.0);
l9_1352=l9_1133*l9_1135;
l9_1127=l9_1352;
l9_1132=l9_1127;
}
else
{
float4 l9_1353=float4(0.0);
float4 l9_1354=(*sc_set0.UserUniforms).colorId03;
l9_1353=l9_1354;
float4 l9_1355=float4(0.0);
float l9_1356=0.0;
float4 l9_1357=float4(0.0);
float4 l9_1358=(*sc_set0.UserUniforms).Port_Default_N358;
ssGlobals l9_1359=l9_1129;
float l9_1360=0.0;
float l9_1361=float((*sc_set0.UserUniforms).ColorOnOffid03!=0);
l9_1360=l9_1361;
l9_1356=l9_1360;
float4 l9_1362;
if ((l9_1356*1.0)!=0.0)
{
float2 l9_1363=float2(0.0);
l9_1363=l9_1359.Surface_UVCoord0;
float4 l9_1364=float4(0.0);
int l9_1365;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_1366=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1366=0;
}
else
{
l9_1366=in.varStereoViewID;
}
int l9_1367=l9_1366;
l9_1365=1-l9_1367;
}
else
{
int l9_1368=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1368=0;
}
else
{
l9_1368=in.varStereoViewID;
}
int l9_1369=l9_1368;
l9_1365=l9_1369;
}
int l9_1370=l9_1365;
int l9_1371=greyMaskIdLayout_tmp;
int l9_1372=l9_1370;
float2 l9_1373=l9_1363;
bool l9_1374=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_1375=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_1376=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_1377=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_1378=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_1379=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_1380=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_1381=0.0;
bool l9_1382=l9_1379&&(!l9_1377);
float l9_1383=1.0;
float l9_1384=l9_1373.x;
int l9_1385=l9_1376.x;
if (l9_1385==1)
{
l9_1384=fract(l9_1384);
}
else
{
if (l9_1385==2)
{
float l9_1386=fract(l9_1384);
float l9_1387=l9_1384-l9_1386;
float l9_1388=step(0.25,fract(l9_1387*0.5));
l9_1384=mix(l9_1386,1.0-l9_1386,fast::clamp(l9_1388,0.0,1.0));
}
}
l9_1373.x=l9_1384;
float l9_1389=l9_1373.y;
int l9_1390=l9_1376.y;
if (l9_1390==1)
{
l9_1389=fract(l9_1389);
}
else
{
if (l9_1390==2)
{
float l9_1391=fract(l9_1389);
float l9_1392=l9_1389-l9_1391;
float l9_1393=step(0.25,fract(l9_1392*0.5));
l9_1389=mix(l9_1391,1.0-l9_1391,fast::clamp(l9_1393,0.0,1.0));
}
}
l9_1373.y=l9_1389;
if (l9_1377)
{
bool l9_1394=l9_1379;
bool l9_1395;
if (l9_1394)
{
l9_1395=l9_1376.x==3;
}
else
{
l9_1395=l9_1394;
}
float l9_1396=l9_1373.x;
float l9_1397=l9_1378.x;
float l9_1398=l9_1378.z;
bool l9_1399=l9_1395;
float l9_1400=l9_1383;
float l9_1401=fast::clamp(l9_1396,l9_1397,l9_1398);
float l9_1402=step(abs(l9_1396-l9_1401),9.9999997e-06);
l9_1400*=(l9_1402+((1.0-float(l9_1399))*(1.0-l9_1402)));
l9_1396=l9_1401;
l9_1373.x=l9_1396;
l9_1383=l9_1400;
bool l9_1403=l9_1379;
bool l9_1404;
if (l9_1403)
{
l9_1404=l9_1376.y==3;
}
else
{
l9_1404=l9_1403;
}
float l9_1405=l9_1373.y;
float l9_1406=l9_1378.y;
float l9_1407=l9_1378.w;
bool l9_1408=l9_1404;
float l9_1409=l9_1383;
float l9_1410=fast::clamp(l9_1405,l9_1406,l9_1407);
float l9_1411=step(abs(l9_1405-l9_1410),9.9999997e-06);
l9_1409*=(l9_1411+((1.0-float(l9_1408))*(1.0-l9_1411)));
l9_1405=l9_1410;
l9_1373.y=l9_1405;
l9_1383=l9_1409;
}
float2 l9_1412=l9_1373;
bool l9_1413=l9_1374;
float3x3 l9_1414=l9_1375;
if (l9_1413)
{
l9_1412=float2((l9_1414*float3(l9_1412,1.0)).xy);
}
float2 l9_1415=l9_1412;
l9_1373=l9_1415;
float l9_1416=l9_1373.x;
int l9_1417=l9_1376.x;
bool l9_1418=l9_1382;
float l9_1419=l9_1383;
if ((l9_1417==0)||(l9_1417==3))
{
float l9_1420=l9_1416;
float l9_1421=0.0;
float l9_1422=1.0;
bool l9_1423=l9_1418;
float l9_1424=l9_1419;
float l9_1425=fast::clamp(l9_1420,l9_1421,l9_1422);
float l9_1426=step(abs(l9_1420-l9_1425),9.9999997e-06);
l9_1424*=(l9_1426+((1.0-float(l9_1423))*(1.0-l9_1426)));
l9_1420=l9_1425;
l9_1416=l9_1420;
l9_1419=l9_1424;
}
l9_1373.x=l9_1416;
l9_1383=l9_1419;
float l9_1427=l9_1373.y;
int l9_1428=l9_1376.y;
bool l9_1429=l9_1382;
float l9_1430=l9_1383;
if ((l9_1428==0)||(l9_1428==3))
{
float l9_1431=l9_1427;
float l9_1432=0.0;
float l9_1433=1.0;
bool l9_1434=l9_1429;
float l9_1435=l9_1430;
float l9_1436=fast::clamp(l9_1431,l9_1432,l9_1433);
float l9_1437=step(abs(l9_1431-l9_1436),9.9999997e-06);
l9_1435*=(l9_1437+((1.0-float(l9_1434))*(1.0-l9_1437)));
l9_1431=l9_1436;
l9_1427=l9_1431;
l9_1430=l9_1435;
}
l9_1373.y=l9_1427;
l9_1383=l9_1430;
float2 l9_1438=l9_1373;
int l9_1439=l9_1371;
int l9_1440=l9_1372;
float l9_1441=l9_1381;
float2 l9_1442=l9_1438;
int l9_1443=l9_1439;
int l9_1444=l9_1440;
float3 l9_1445=float3(0.0);
if (l9_1443==0)
{
l9_1445=float3(l9_1442,0.0);
}
else
{
if (l9_1443==1)
{
l9_1445=float3(l9_1442.x,(l9_1442.y*0.5)+(0.5-(float(l9_1444)*0.5)),0.0);
}
else
{
l9_1445=float3(l9_1442,float(l9_1444));
}
}
float3 l9_1446=l9_1445;
float3 l9_1447=l9_1446;
float4 l9_1448=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_1447.xy,bias(l9_1441));
float4 l9_1449=l9_1448;
if (l9_1379)
{
l9_1449=mix(l9_1380,l9_1449,float4(l9_1383));
}
float4 l9_1450=l9_1449;
l9_1364=l9_1450;
float l9_1451=0.0;
l9_1451=l9_1364.x;
float l9_1452=0.0;
l9_1452=step(l9_1451,(*sc_set0.UserUniforms).Port_Input1_N006);
float l9_1453=0.0;
l9_1453=step(l9_1451,(*sc_set0.UserUniforms).Port_Input1_N009);
float l9_1454=0.0;
l9_1454=l9_1452-l9_1453;
l9_1357=float4(l9_1454);
l9_1362=l9_1357;
}
else
{
l9_1362=l9_1358;
}
l9_1355=l9_1362;
float4 l9_1455=float4(0.0);
l9_1455=l9_1353*l9_1355;
l9_1128=l9_1455;
l9_1132=l9_1128;
}
l9_1125=l9_1132;
float4 l9_1456=float4(0.0);
float l9_1457=0.0;
float4 l9_1458=float4(0.0);
float4 l9_1459=(*sc_set0.UserUniforms).Port_Default_N358;
ssGlobals l9_1460=l9_1111;
float l9_1461=0.0;
float l9_1462=float((*sc_set0.UserUniforms).ColorOnOffid03!=0);
l9_1461=l9_1462;
l9_1457=l9_1461;
float4 l9_1463;
if ((l9_1457*1.0)!=0.0)
{
float2 l9_1464=float2(0.0);
l9_1464=l9_1460.Surface_UVCoord0;
float4 l9_1465=float4(0.0);
int l9_1466;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_1467=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1467=0;
}
else
{
l9_1467=in.varStereoViewID;
}
int l9_1468=l9_1467;
l9_1466=1-l9_1468;
}
else
{
int l9_1469=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1469=0;
}
else
{
l9_1469=in.varStereoViewID;
}
int l9_1470=l9_1469;
l9_1466=l9_1470;
}
int l9_1471=l9_1466;
int l9_1472=greyMaskIdLayout_tmp;
int l9_1473=l9_1471;
float2 l9_1474=l9_1464;
bool l9_1475=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_1476=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_1477=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_1478=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_1479=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_1480=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_1481=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_1482=0.0;
bool l9_1483=l9_1480&&(!l9_1478);
float l9_1484=1.0;
float l9_1485=l9_1474.x;
int l9_1486=l9_1477.x;
if (l9_1486==1)
{
l9_1485=fract(l9_1485);
}
else
{
if (l9_1486==2)
{
float l9_1487=fract(l9_1485);
float l9_1488=l9_1485-l9_1487;
float l9_1489=step(0.25,fract(l9_1488*0.5));
l9_1485=mix(l9_1487,1.0-l9_1487,fast::clamp(l9_1489,0.0,1.0));
}
}
l9_1474.x=l9_1485;
float l9_1490=l9_1474.y;
int l9_1491=l9_1477.y;
if (l9_1491==1)
{
l9_1490=fract(l9_1490);
}
else
{
if (l9_1491==2)
{
float l9_1492=fract(l9_1490);
float l9_1493=l9_1490-l9_1492;
float l9_1494=step(0.25,fract(l9_1493*0.5));
l9_1490=mix(l9_1492,1.0-l9_1492,fast::clamp(l9_1494,0.0,1.0));
}
}
l9_1474.y=l9_1490;
if (l9_1478)
{
bool l9_1495=l9_1480;
bool l9_1496;
if (l9_1495)
{
l9_1496=l9_1477.x==3;
}
else
{
l9_1496=l9_1495;
}
float l9_1497=l9_1474.x;
float l9_1498=l9_1479.x;
float l9_1499=l9_1479.z;
bool l9_1500=l9_1496;
float l9_1501=l9_1484;
float l9_1502=fast::clamp(l9_1497,l9_1498,l9_1499);
float l9_1503=step(abs(l9_1497-l9_1502),9.9999997e-06);
l9_1501*=(l9_1503+((1.0-float(l9_1500))*(1.0-l9_1503)));
l9_1497=l9_1502;
l9_1474.x=l9_1497;
l9_1484=l9_1501;
bool l9_1504=l9_1480;
bool l9_1505;
if (l9_1504)
{
l9_1505=l9_1477.y==3;
}
else
{
l9_1505=l9_1504;
}
float l9_1506=l9_1474.y;
float l9_1507=l9_1479.y;
float l9_1508=l9_1479.w;
bool l9_1509=l9_1505;
float l9_1510=l9_1484;
float l9_1511=fast::clamp(l9_1506,l9_1507,l9_1508);
float l9_1512=step(abs(l9_1506-l9_1511),9.9999997e-06);
l9_1510*=(l9_1512+((1.0-float(l9_1509))*(1.0-l9_1512)));
l9_1506=l9_1511;
l9_1474.y=l9_1506;
l9_1484=l9_1510;
}
float2 l9_1513=l9_1474;
bool l9_1514=l9_1475;
float3x3 l9_1515=l9_1476;
if (l9_1514)
{
l9_1513=float2((l9_1515*float3(l9_1513,1.0)).xy);
}
float2 l9_1516=l9_1513;
l9_1474=l9_1516;
float l9_1517=l9_1474.x;
int l9_1518=l9_1477.x;
bool l9_1519=l9_1483;
float l9_1520=l9_1484;
if ((l9_1518==0)||(l9_1518==3))
{
float l9_1521=l9_1517;
float l9_1522=0.0;
float l9_1523=1.0;
bool l9_1524=l9_1519;
float l9_1525=l9_1520;
float l9_1526=fast::clamp(l9_1521,l9_1522,l9_1523);
float l9_1527=step(abs(l9_1521-l9_1526),9.9999997e-06);
l9_1525*=(l9_1527+((1.0-float(l9_1524))*(1.0-l9_1527)));
l9_1521=l9_1526;
l9_1517=l9_1521;
l9_1520=l9_1525;
}
l9_1474.x=l9_1517;
l9_1484=l9_1520;
float l9_1528=l9_1474.y;
int l9_1529=l9_1477.y;
bool l9_1530=l9_1483;
float l9_1531=l9_1484;
if ((l9_1529==0)||(l9_1529==3))
{
float l9_1532=l9_1528;
float l9_1533=0.0;
float l9_1534=1.0;
bool l9_1535=l9_1530;
float l9_1536=l9_1531;
float l9_1537=fast::clamp(l9_1532,l9_1533,l9_1534);
float l9_1538=step(abs(l9_1532-l9_1537),9.9999997e-06);
l9_1536*=(l9_1538+((1.0-float(l9_1535))*(1.0-l9_1538)));
l9_1532=l9_1537;
l9_1528=l9_1532;
l9_1531=l9_1536;
}
l9_1474.y=l9_1528;
l9_1484=l9_1531;
float2 l9_1539=l9_1474;
int l9_1540=l9_1472;
int l9_1541=l9_1473;
float l9_1542=l9_1482;
float2 l9_1543=l9_1539;
int l9_1544=l9_1540;
int l9_1545=l9_1541;
float3 l9_1546=float3(0.0);
if (l9_1544==0)
{
l9_1546=float3(l9_1543,0.0);
}
else
{
if (l9_1544==1)
{
l9_1546=float3(l9_1543.x,(l9_1543.y*0.5)+(0.5-(float(l9_1545)*0.5)),0.0);
}
else
{
l9_1546=float3(l9_1543,float(l9_1545));
}
}
float3 l9_1547=l9_1546;
float3 l9_1548=l9_1547;
float4 l9_1549=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_1548.xy,bias(l9_1542));
float4 l9_1550=l9_1549;
if (l9_1480)
{
l9_1550=mix(l9_1481,l9_1550,float4(l9_1484));
}
float4 l9_1551=l9_1550;
l9_1465=l9_1551;
float l9_1552=0.0;
l9_1552=l9_1465.x;
float l9_1553=0.0;
l9_1553=step(l9_1552,(*sc_set0.UserUniforms).Port_Input1_N006);
float l9_1554=0.0;
l9_1554=step(l9_1552,(*sc_set0.UserUniforms).Port_Input1_N009);
float l9_1555=0.0;
l9_1555=l9_1553-l9_1554;
l9_1458=float4(l9_1555);
l9_1463=l9_1458;
}
else
{
l9_1463=l9_1459;
}
l9_1456=l9_1463;
float4 l9_1556=float4(0.0);
l9_1556=l9_1125*l9_1456;
float4 l9_1557=float4(0.0);
float4 l9_1558=(*sc_set0.UserUniforms).colorId03;
l9_1557=l9_1558;
float4 l9_1559=float4(0.0);
l9_1559=l9_1557*l9_1456;
float4 l9_1560=float4(0.0);
float4 l9_1561=l9_1556;
float4 l9_1562=l9_1559;
float4 l9_1563=l9_1561;
float4 l9_1564=l9_1562;
float3 l9_1565=l9_1563.xyz*l9_1563.w;
l9_1563=float4(l9_1565.x,l9_1565.y,l9_1565.z,l9_1563.w);
float4 l9_1566=l9_1563+(l9_1564*(1.0-l9_1563.w));
l9_1560=l9_1566;
float4 l9_1567=float4(0.0);
l9_1567=float4(l9_1119)*l9_1560;
float4 l9_1568=float4(0.0);
l9_1568=l9_1567+l9_1560;
l9_1109=l9_1568;
l9_1114=l9_1109;
}
else
{
float4 l9_1569=float4(0.0);
float l9_1570=0.0;
float4 l9_1571=float4(0.0);
float4 l9_1572=float4(0.0);
ssGlobals l9_1573=l9_1111;
float l9_1574=0.0;
float l9_1575=float((*sc_set0.UserUniforms).patternOnOffId03!=0);
l9_1574=l9_1575;
l9_1570=l9_1574;
float4 l9_1576;
if ((l9_1570*1.0)!=0.0)
{
float4 l9_1577=float4(0.0);
float4 l9_1578=(*sc_set0.UserUniforms).patternColorId03;
l9_1577=l9_1578;
float4 l9_1579=float4(0.0);
float l9_1580=0.0;
float4 l9_1581=float4(0.0);
float4 l9_1582=float4(0.0);
ssGlobals l9_1583=l9_1573;
float l9_1584=0.0;
float l9_1585=float((*sc_set0.UserUniforms).pngPatternId03!=0);
l9_1584=l9_1585;
l9_1580=l9_1584;
float4 l9_1586;
if ((l9_1580*1.0)!=0.0)
{
float2 l9_1587=float2(0.0);
l9_1587=l9_1583.Surface_UVCoord0;
float2 l9_1588=float2(0.0);
float2 l9_1589=(*sc_set0.UserUniforms).patternScaleId03;
l9_1588=l9_1589;
float2 l9_1590=float2(0.0);
l9_1590=((l9_1587-(*sc_set0.UserUniforms).Port_Center_N379)*l9_1588)+(*sc_set0.UserUniforms).Port_Center_N379;
float2 l9_1591=float2(0.0);
float2 l9_1592=(*sc_set0.UserUniforms).patternOffsetId03;
l9_1591=l9_1592;
float2 l9_1593=float2(0.0);
l9_1593=l9_1590+l9_1591;
float l9_1594=0.0;
float l9_1595=(*sc_set0.UserUniforms).patternRotateId03;
l9_1594=l9_1595;
float2 l9_1596=float2(0.0);
float2 l9_1597=l9_1593;
float l9_1598=l9_1594;
float2 l9_1599=(*sc_set0.UserUniforms).Port_Center_N383;
float l9_1600=sin(radians(l9_1598));
float l9_1601=cos(radians(l9_1598));
float2 l9_1602=l9_1597-l9_1599;
l9_1602=float2(dot(float2(l9_1601,l9_1600),l9_1602),dot(float2(-l9_1600,l9_1601),l9_1602))+l9_1599;
l9_1596=l9_1602;
float4 l9_1603=float4(0.0);
int l9_1604;
if ((int(patternTextureId03HasSwappedViews_tmp)!=0))
{
int l9_1605=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1605=0;
}
else
{
l9_1605=in.varStereoViewID;
}
int l9_1606=l9_1605;
l9_1604=1-l9_1606;
}
else
{
int l9_1607=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1607=0;
}
else
{
l9_1607=in.varStereoViewID;
}
int l9_1608=l9_1607;
l9_1604=l9_1608;
}
int l9_1609=l9_1604;
int l9_1610=patternTextureId03Layout_tmp;
int l9_1611=l9_1609;
float2 l9_1612=l9_1596;
bool l9_1613=(int(SC_USE_UV_TRANSFORM_patternTextureId03_tmp)!=0);
float3x3 l9_1614=(*sc_set0.UserUniforms).patternTextureId03Transform;
int2 l9_1615=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId03_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId03_tmp);
bool l9_1616=(int(SC_USE_UV_MIN_MAX_patternTextureId03_tmp)!=0);
float4 l9_1617=(*sc_set0.UserUniforms).patternTextureId03UvMinMax;
bool l9_1618=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId03_tmp)!=0);
float4 l9_1619=(*sc_set0.UserUniforms).patternTextureId03BorderColor;
float l9_1620=0.0;
bool l9_1621=l9_1618&&(!l9_1616);
float l9_1622=1.0;
float l9_1623=l9_1612.x;
int l9_1624=l9_1615.x;
if (l9_1624==1)
{
l9_1623=fract(l9_1623);
}
else
{
if (l9_1624==2)
{
float l9_1625=fract(l9_1623);
float l9_1626=l9_1623-l9_1625;
float l9_1627=step(0.25,fract(l9_1626*0.5));
l9_1623=mix(l9_1625,1.0-l9_1625,fast::clamp(l9_1627,0.0,1.0));
}
}
l9_1612.x=l9_1623;
float l9_1628=l9_1612.y;
int l9_1629=l9_1615.y;
if (l9_1629==1)
{
l9_1628=fract(l9_1628);
}
else
{
if (l9_1629==2)
{
float l9_1630=fract(l9_1628);
float l9_1631=l9_1628-l9_1630;
float l9_1632=step(0.25,fract(l9_1631*0.5));
l9_1628=mix(l9_1630,1.0-l9_1630,fast::clamp(l9_1632,0.0,1.0));
}
}
l9_1612.y=l9_1628;
if (l9_1616)
{
bool l9_1633=l9_1618;
bool l9_1634;
if (l9_1633)
{
l9_1634=l9_1615.x==3;
}
else
{
l9_1634=l9_1633;
}
float l9_1635=l9_1612.x;
float l9_1636=l9_1617.x;
float l9_1637=l9_1617.z;
bool l9_1638=l9_1634;
float l9_1639=l9_1622;
float l9_1640=fast::clamp(l9_1635,l9_1636,l9_1637);
float l9_1641=step(abs(l9_1635-l9_1640),9.9999997e-06);
l9_1639*=(l9_1641+((1.0-float(l9_1638))*(1.0-l9_1641)));
l9_1635=l9_1640;
l9_1612.x=l9_1635;
l9_1622=l9_1639;
bool l9_1642=l9_1618;
bool l9_1643;
if (l9_1642)
{
l9_1643=l9_1615.y==3;
}
else
{
l9_1643=l9_1642;
}
float l9_1644=l9_1612.y;
float l9_1645=l9_1617.y;
float l9_1646=l9_1617.w;
bool l9_1647=l9_1643;
float l9_1648=l9_1622;
float l9_1649=fast::clamp(l9_1644,l9_1645,l9_1646);
float l9_1650=step(abs(l9_1644-l9_1649),9.9999997e-06);
l9_1648*=(l9_1650+((1.0-float(l9_1647))*(1.0-l9_1650)));
l9_1644=l9_1649;
l9_1612.y=l9_1644;
l9_1622=l9_1648;
}
float2 l9_1651=l9_1612;
bool l9_1652=l9_1613;
float3x3 l9_1653=l9_1614;
if (l9_1652)
{
l9_1651=float2((l9_1653*float3(l9_1651,1.0)).xy);
}
float2 l9_1654=l9_1651;
l9_1612=l9_1654;
float l9_1655=l9_1612.x;
int l9_1656=l9_1615.x;
bool l9_1657=l9_1621;
float l9_1658=l9_1622;
if ((l9_1656==0)||(l9_1656==3))
{
float l9_1659=l9_1655;
float l9_1660=0.0;
float l9_1661=1.0;
bool l9_1662=l9_1657;
float l9_1663=l9_1658;
float l9_1664=fast::clamp(l9_1659,l9_1660,l9_1661);
float l9_1665=step(abs(l9_1659-l9_1664),9.9999997e-06);
l9_1663*=(l9_1665+((1.0-float(l9_1662))*(1.0-l9_1665)));
l9_1659=l9_1664;
l9_1655=l9_1659;
l9_1658=l9_1663;
}
l9_1612.x=l9_1655;
l9_1622=l9_1658;
float l9_1666=l9_1612.y;
int l9_1667=l9_1615.y;
bool l9_1668=l9_1621;
float l9_1669=l9_1622;
if ((l9_1667==0)||(l9_1667==3))
{
float l9_1670=l9_1666;
float l9_1671=0.0;
float l9_1672=1.0;
bool l9_1673=l9_1668;
float l9_1674=l9_1669;
float l9_1675=fast::clamp(l9_1670,l9_1671,l9_1672);
float l9_1676=step(abs(l9_1670-l9_1675),9.9999997e-06);
l9_1674*=(l9_1676+((1.0-float(l9_1673))*(1.0-l9_1676)));
l9_1670=l9_1675;
l9_1666=l9_1670;
l9_1669=l9_1674;
}
l9_1612.y=l9_1666;
l9_1622=l9_1669;
float2 l9_1677=l9_1612;
int l9_1678=l9_1610;
int l9_1679=l9_1611;
float l9_1680=l9_1620;
float2 l9_1681=l9_1677;
int l9_1682=l9_1678;
int l9_1683=l9_1679;
float3 l9_1684=float3(0.0);
if (l9_1682==0)
{
l9_1684=float3(l9_1681,0.0);
}
else
{
if (l9_1682==1)
{
l9_1684=float3(l9_1681.x,(l9_1681.y*0.5)+(0.5-(float(l9_1683)*0.5)),0.0);
}
else
{
l9_1684=float3(l9_1681,float(l9_1683));
}
}
float3 l9_1685=l9_1684;
float3 l9_1686=l9_1685;
float4 l9_1687=sc_set0.patternTextureId03.sample(sc_set0.patternTextureId03SmpSC,l9_1686.xy,bias(l9_1680));
float4 l9_1688=l9_1687;
if (l9_1618)
{
l9_1688=mix(l9_1619,l9_1688,float4(l9_1622));
}
float4 l9_1689=l9_1688;
l9_1603=l9_1689;
l9_1581=l9_1603;
l9_1586=l9_1581;
}
else
{
float2 l9_1690=float2(0.0);
l9_1690=l9_1583.Surface_UVCoord0;
float2 l9_1691=float2(0.0);
float2 l9_1692=(*sc_set0.UserUniforms).patternScaleId03;
l9_1691=l9_1692;
float2 l9_1693=float2(0.0);
l9_1693=((l9_1690-(*sc_set0.UserUniforms).Port_Center_N379)*l9_1691)+(*sc_set0.UserUniforms).Port_Center_N379;
float2 l9_1694=float2(0.0);
float2 l9_1695=(*sc_set0.UserUniforms).patternOffsetId03;
l9_1694=l9_1695;
float2 l9_1696=float2(0.0);
l9_1696=l9_1693+l9_1694;
float l9_1697=0.0;
float l9_1698=(*sc_set0.UserUniforms).patternRotateId03;
l9_1697=l9_1698;
float2 l9_1699=float2(0.0);
float2 l9_1700=l9_1696;
float l9_1701=l9_1697;
float2 l9_1702=(*sc_set0.UserUniforms).Port_Center_N383;
float l9_1703=sin(radians(l9_1701));
float l9_1704=cos(radians(l9_1701));
float2 l9_1705=l9_1700-l9_1702;
l9_1705=float2(dot(float2(l9_1704,l9_1703),l9_1705),dot(float2(-l9_1703,l9_1704),l9_1705))+l9_1702;
l9_1699=l9_1705;
float4 l9_1706=float4(0.0);
int l9_1707;
if ((int(patternTextureId03HasSwappedViews_tmp)!=0))
{
int l9_1708=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1708=0;
}
else
{
l9_1708=in.varStereoViewID;
}
int l9_1709=l9_1708;
l9_1707=1-l9_1709;
}
else
{
int l9_1710=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1710=0;
}
else
{
l9_1710=in.varStereoViewID;
}
int l9_1711=l9_1710;
l9_1707=l9_1711;
}
int l9_1712=l9_1707;
int l9_1713=patternTextureId03Layout_tmp;
int l9_1714=l9_1712;
float2 l9_1715=l9_1699;
bool l9_1716=(int(SC_USE_UV_TRANSFORM_patternTextureId03_tmp)!=0);
float3x3 l9_1717=(*sc_set0.UserUniforms).patternTextureId03Transform;
int2 l9_1718=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId03_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId03_tmp);
bool l9_1719=(int(SC_USE_UV_MIN_MAX_patternTextureId03_tmp)!=0);
float4 l9_1720=(*sc_set0.UserUniforms).patternTextureId03UvMinMax;
bool l9_1721=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId03_tmp)!=0);
float4 l9_1722=(*sc_set0.UserUniforms).patternTextureId03BorderColor;
float l9_1723=0.0;
bool l9_1724=l9_1721&&(!l9_1719);
float l9_1725=1.0;
float l9_1726=l9_1715.x;
int l9_1727=l9_1718.x;
if (l9_1727==1)
{
l9_1726=fract(l9_1726);
}
else
{
if (l9_1727==2)
{
float l9_1728=fract(l9_1726);
float l9_1729=l9_1726-l9_1728;
float l9_1730=step(0.25,fract(l9_1729*0.5));
l9_1726=mix(l9_1728,1.0-l9_1728,fast::clamp(l9_1730,0.0,1.0));
}
}
l9_1715.x=l9_1726;
float l9_1731=l9_1715.y;
int l9_1732=l9_1718.y;
if (l9_1732==1)
{
l9_1731=fract(l9_1731);
}
else
{
if (l9_1732==2)
{
float l9_1733=fract(l9_1731);
float l9_1734=l9_1731-l9_1733;
float l9_1735=step(0.25,fract(l9_1734*0.5));
l9_1731=mix(l9_1733,1.0-l9_1733,fast::clamp(l9_1735,0.0,1.0));
}
}
l9_1715.y=l9_1731;
if (l9_1719)
{
bool l9_1736=l9_1721;
bool l9_1737;
if (l9_1736)
{
l9_1737=l9_1718.x==3;
}
else
{
l9_1737=l9_1736;
}
float l9_1738=l9_1715.x;
float l9_1739=l9_1720.x;
float l9_1740=l9_1720.z;
bool l9_1741=l9_1737;
float l9_1742=l9_1725;
float l9_1743=fast::clamp(l9_1738,l9_1739,l9_1740);
float l9_1744=step(abs(l9_1738-l9_1743),9.9999997e-06);
l9_1742*=(l9_1744+((1.0-float(l9_1741))*(1.0-l9_1744)));
l9_1738=l9_1743;
l9_1715.x=l9_1738;
l9_1725=l9_1742;
bool l9_1745=l9_1721;
bool l9_1746;
if (l9_1745)
{
l9_1746=l9_1718.y==3;
}
else
{
l9_1746=l9_1745;
}
float l9_1747=l9_1715.y;
float l9_1748=l9_1720.y;
float l9_1749=l9_1720.w;
bool l9_1750=l9_1746;
float l9_1751=l9_1725;
float l9_1752=fast::clamp(l9_1747,l9_1748,l9_1749);
float l9_1753=step(abs(l9_1747-l9_1752),9.9999997e-06);
l9_1751*=(l9_1753+((1.0-float(l9_1750))*(1.0-l9_1753)));
l9_1747=l9_1752;
l9_1715.y=l9_1747;
l9_1725=l9_1751;
}
float2 l9_1754=l9_1715;
bool l9_1755=l9_1716;
float3x3 l9_1756=l9_1717;
if (l9_1755)
{
l9_1754=float2((l9_1756*float3(l9_1754,1.0)).xy);
}
float2 l9_1757=l9_1754;
l9_1715=l9_1757;
float l9_1758=l9_1715.x;
int l9_1759=l9_1718.x;
bool l9_1760=l9_1724;
float l9_1761=l9_1725;
if ((l9_1759==0)||(l9_1759==3))
{
float l9_1762=l9_1758;
float l9_1763=0.0;
float l9_1764=1.0;
bool l9_1765=l9_1760;
float l9_1766=l9_1761;
float l9_1767=fast::clamp(l9_1762,l9_1763,l9_1764);
float l9_1768=step(abs(l9_1762-l9_1767),9.9999997e-06);
l9_1766*=(l9_1768+((1.0-float(l9_1765))*(1.0-l9_1768)));
l9_1762=l9_1767;
l9_1758=l9_1762;
l9_1761=l9_1766;
}
l9_1715.x=l9_1758;
l9_1725=l9_1761;
float l9_1769=l9_1715.y;
int l9_1770=l9_1718.y;
bool l9_1771=l9_1724;
float l9_1772=l9_1725;
if ((l9_1770==0)||(l9_1770==3))
{
float l9_1773=l9_1769;
float l9_1774=0.0;
float l9_1775=1.0;
bool l9_1776=l9_1771;
float l9_1777=l9_1772;
float l9_1778=fast::clamp(l9_1773,l9_1774,l9_1775);
float l9_1779=step(abs(l9_1773-l9_1778),9.9999997e-06);
l9_1777*=(l9_1779+((1.0-float(l9_1776))*(1.0-l9_1779)));
l9_1773=l9_1778;
l9_1769=l9_1773;
l9_1772=l9_1777;
}
l9_1715.y=l9_1769;
l9_1725=l9_1772;
float2 l9_1780=l9_1715;
int l9_1781=l9_1713;
int l9_1782=l9_1714;
float l9_1783=l9_1723;
float2 l9_1784=l9_1780;
int l9_1785=l9_1781;
int l9_1786=l9_1782;
float3 l9_1787=float3(0.0);
if (l9_1785==0)
{
l9_1787=float3(l9_1784,0.0);
}
else
{
if (l9_1785==1)
{
l9_1787=float3(l9_1784.x,(l9_1784.y*0.5)+(0.5-(float(l9_1786)*0.5)),0.0);
}
else
{
l9_1787=float3(l9_1784,float(l9_1786));
}
}
float3 l9_1788=l9_1787;
float3 l9_1789=l9_1788;
float4 l9_1790=sc_set0.patternTextureId03.sample(sc_set0.patternTextureId03SmpSC,l9_1789.xy,bias(l9_1783));
float4 l9_1791=l9_1790;
if (l9_1721)
{
l9_1791=mix(l9_1722,l9_1791,float4(l9_1725));
}
float4 l9_1792=l9_1791;
l9_1706=l9_1792;
float l9_1793=0.0;
float3 l9_1794=l9_1706.xyz;
float l9_1795=l9_1794.x;
l9_1793=l9_1795;
l9_1582=float4(l9_1793);
l9_1586=l9_1582;
}
l9_1579=l9_1586;
float4 l9_1796=float4(0.0);
l9_1796=l9_1577*l9_1579;
l9_1571=l9_1796;
l9_1576=l9_1571;
}
else
{
float4 l9_1797=float4(0.0);
float4 l9_1798=(*sc_set0.UserUniforms).colorId03;
l9_1797=l9_1798;
float4 l9_1799=float4(0.0);
float l9_1800=0.0;
float4 l9_1801=float4(0.0);
float4 l9_1802=(*sc_set0.UserUniforms).Port_Default_N358;
ssGlobals l9_1803=l9_1573;
float l9_1804=0.0;
float l9_1805=float((*sc_set0.UserUniforms).ColorOnOffid03!=0);
l9_1804=l9_1805;
l9_1800=l9_1804;
float4 l9_1806;
if ((l9_1800*1.0)!=0.0)
{
float2 l9_1807=float2(0.0);
l9_1807=l9_1803.Surface_UVCoord0;
float4 l9_1808=float4(0.0);
int l9_1809;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_1810=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1810=0;
}
else
{
l9_1810=in.varStereoViewID;
}
int l9_1811=l9_1810;
l9_1809=1-l9_1811;
}
else
{
int l9_1812=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1812=0;
}
else
{
l9_1812=in.varStereoViewID;
}
int l9_1813=l9_1812;
l9_1809=l9_1813;
}
int l9_1814=l9_1809;
int l9_1815=greyMaskIdLayout_tmp;
int l9_1816=l9_1814;
float2 l9_1817=l9_1807;
bool l9_1818=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_1819=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_1820=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_1821=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_1822=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_1823=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_1824=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_1825=0.0;
bool l9_1826=l9_1823&&(!l9_1821);
float l9_1827=1.0;
float l9_1828=l9_1817.x;
int l9_1829=l9_1820.x;
if (l9_1829==1)
{
l9_1828=fract(l9_1828);
}
else
{
if (l9_1829==2)
{
float l9_1830=fract(l9_1828);
float l9_1831=l9_1828-l9_1830;
float l9_1832=step(0.25,fract(l9_1831*0.5));
l9_1828=mix(l9_1830,1.0-l9_1830,fast::clamp(l9_1832,0.0,1.0));
}
}
l9_1817.x=l9_1828;
float l9_1833=l9_1817.y;
int l9_1834=l9_1820.y;
if (l9_1834==1)
{
l9_1833=fract(l9_1833);
}
else
{
if (l9_1834==2)
{
float l9_1835=fract(l9_1833);
float l9_1836=l9_1833-l9_1835;
float l9_1837=step(0.25,fract(l9_1836*0.5));
l9_1833=mix(l9_1835,1.0-l9_1835,fast::clamp(l9_1837,0.0,1.0));
}
}
l9_1817.y=l9_1833;
if (l9_1821)
{
bool l9_1838=l9_1823;
bool l9_1839;
if (l9_1838)
{
l9_1839=l9_1820.x==3;
}
else
{
l9_1839=l9_1838;
}
float l9_1840=l9_1817.x;
float l9_1841=l9_1822.x;
float l9_1842=l9_1822.z;
bool l9_1843=l9_1839;
float l9_1844=l9_1827;
float l9_1845=fast::clamp(l9_1840,l9_1841,l9_1842);
float l9_1846=step(abs(l9_1840-l9_1845),9.9999997e-06);
l9_1844*=(l9_1846+((1.0-float(l9_1843))*(1.0-l9_1846)));
l9_1840=l9_1845;
l9_1817.x=l9_1840;
l9_1827=l9_1844;
bool l9_1847=l9_1823;
bool l9_1848;
if (l9_1847)
{
l9_1848=l9_1820.y==3;
}
else
{
l9_1848=l9_1847;
}
float l9_1849=l9_1817.y;
float l9_1850=l9_1822.y;
float l9_1851=l9_1822.w;
bool l9_1852=l9_1848;
float l9_1853=l9_1827;
float l9_1854=fast::clamp(l9_1849,l9_1850,l9_1851);
float l9_1855=step(abs(l9_1849-l9_1854),9.9999997e-06);
l9_1853*=(l9_1855+((1.0-float(l9_1852))*(1.0-l9_1855)));
l9_1849=l9_1854;
l9_1817.y=l9_1849;
l9_1827=l9_1853;
}
float2 l9_1856=l9_1817;
bool l9_1857=l9_1818;
float3x3 l9_1858=l9_1819;
if (l9_1857)
{
l9_1856=float2((l9_1858*float3(l9_1856,1.0)).xy);
}
float2 l9_1859=l9_1856;
l9_1817=l9_1859;
float l9_1860=l9_1817.x;
int l9_1861=l9_1820.x;
bool l9_1862=l9_1826;
float l9_1863=l9_1827;
if ((l9_1861==0)||(l9_1861==3))
{
float l9_1864=l9_1860;
float l9_1865=0.0;
float l9_1866=1.0;
bool l9_1867=l9_1862;
float l9_1868=l9_1863;
float l9_1869=fast::clamp(l9_1864,l9_1865,l9_1866);
float l9_1870=step(abs(l9_1864-l9_1869),9.9999997e-06);
l9_1868*=(l9_1870+((1.0-float(l9_1867))*(1.0-l9_1870)));
l9_1864=l9_1869;
l9_1860=l9_1864;
l9_1863=l9_1868;
}
l9_1817.x=l9_1860;
l9_1827=l9_1863;
float l9_1871=l9_1817.y;
int l9_1872=l9_1820.y;
bool l9_1873=l9_1826;
float l9_1874=l9_1827;
if ((l9_1872==0)||(l9_1872==3))
{
float l9_1875=l9_1871;
float l9_1876=0.0;
float l9_1877=1.0;
bool l9_1878=l9_1873;
float l9_1879=l9_1874;
float l9_1880=fast::clamp(l9_1875,l9_1876,l9_1877);
float l9_1881=step(abs(l9_1875-l9_1880),9.9999997e-06);
l9_1879*=(l9_1881+((1.0-float(l9_1878))*(1.0-l9_1881)));
l9_1875=l9_1880;
l9_1871=l9_1875;
l9_1874=l9_1879;
}
l9_1817.y=l9_1871;
l9_1827=l9_1874;
float2 l9_1882=l9_1817;
int l9_1883=l9_1815;
int l9_1884=l9_1816;
float l9_1885=l9_1825;
float2 l9_1886=l9_1882;
int l9_1887=l9_1883;
int l9_1888=l9_1884;
float3 l9_1889=float3(0.0);
if (l9_1887==0)
{
l9_1889=float3(l9_1886,0.0);
}
else
{
if (l9_1887==1)
{
l9_1889=float3(l9_1886.x,(l9_1886.y*0.5)+(0.5-(float(l9_1888)*0.5)),0.0);
}
else
{
l9_1889=float3(l9_1886,float(l9_1888));
}
}
float3 l9_1890=l9_1889;
float3 l9_1891=l9_1890;
float4 l9_1892=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_1891.xy,bias(l9_1885));
float4 l9_1893=l9_1892;
if (l9_1823)
{
l9_1893=mix(l9_1824,l9_1893,float4(l9_1827));
}
float4 l9_1894=l9_1893;
l9_1808=l9_1894;
float l9_1895=0.0;
l9_1895=l9_1808.x;
float l9_1896=0.0;
l9_1896=step(l9_1895,(*sc_set0.UserUniforms).Port_Input1_N006);
float l9_1897=0.0;
l9_1897=step(l9_1895,(*sc_set0.UserUniforms).Port_Input1_N009);
float l9_1898=0.0;
l9_1898=l9_1896-l9_1897;
l9_1801=float4(l9_1898);
l9_1806=l9_1801;
}
else
{
l9_1806=l9_1802;
}
l9_1799=l9_1806;
float4 l9_1899=float4(0.0);
l9_1899=l9_1797*l9_1799;
l9_1572=l9_1899;
l9_1576=l9_1572;
}
l9_1569=l9_1576;
float4 l9_1900=float4(0.0);
float l9_1901=0.0;
float4 l9_1902=float4(0.0);
float4 l9_1903=(*sc_set0.UserUniforms).Port_Default_N358;
ssGlobals l9_1904=l9_1111;
float l9_1905=0.0;
float l9_1906=float((*sc_set0.UserUniforms).ColorOnOffid03!=0);
l9_1905=l9_1906;
l9_1901=l9_1905;
float4 l9_1907;
if ((l9_1901*1.0)!=0.0)
{
float2 l9_1908=float2(0.0);
l9_1908=l9_1904.Surface_UVCoord0;
float4 l9_1909=float4(0.0);
int l9_1910;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_1911=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1911=0;
}
else
{
l9_1911=in.varStereoViewID;
}
int l9_1912=l9_1911;
l9_1910=1-l9_1912;
}
else
{
int l9_1913=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1913=0;
}
else
{
l9_1913=in.varStereoViewID;
}
int l9_1914=l9_1913;
l9_1910=l9_1914;
}
int l9_1915=l9_1910;
int l9_1916=greyMaskIdLayout_tmp;
int l9_1917=l9_1915;
float2 l9_1918=l9_1908;
bool l9_1919=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_1920=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_1921=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_1922=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_1923=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_1924=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_1925=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_1926=0.0;
bool l9_1927=l9_1924&&(!l9_1922);
float l9_1928=1.0;
float l9_1929=l9_1918.x;
int l9_1930=l9_1921.x;
if (l9_1930==1)
{
l9_1929=fract(l9_1929);
}
else
{
if (l9_1930==2)
{
float l9_1931=fract(l9_1929);
float l9_1932=l9_1929-l9_1931;
float l9_1933=step(0.25,fract(l9_1932*0.5));
l9_1929=mix(l9_1931,1.0-l9_1931,fast::clamp(l9_1933,0.0,1.0));
}
}
l9_1918.x=l9_1929;
float l9_1934=l9_1918.y;
int l9_1935=l9_1921.y;
if (l9_1935==1)
{
l9_1934=fract(l9_1934);
}
else
{
if (l9_1935==2)
{
float l9_1936=fract(l9_1934);
float l9_1937=l9_1934-l9_1936;
float l9_1938=step(0.25,fract(l9_1937*0.5));
l9_1934=mix(l9_1936,1.0-l9_1936,fast::clamp(l9_1938,0.0,1.0));
}
}
l9_1918.y=l9_1934;
if (l9_1922)
{
bool l9_1939=l9_1924;
bool l9_1940;
if (l9_1939)
{
l9_1940=l9_1921.x==3;
}
else
{
l9_1940=l9_1939;
}
float l9_1941=l9_1918.x;
float l9_1942=l9_1923.x;
float l9_1943=l9_1923.z;
bool l9_1944=l9_1940;
float l9_1945=l9_1928;
float l9_1946=fast::clamp(l9_1941,l9_1942,l9_1943);
float l9_1947=step(abs(l9_1941-l9_1946),9.9999997e-06);
l9_1945*=(l9_1947+((1.0-float(l9_1944))*(1.0-l9_1947)));
l9_1941=l9_1946;
l9_1918.x=l9_1941;
l9_1928=l9_1945;
bool l9_1948=l9_1924;
bool l9_1949;
if (l9_1948)
{
l9_1949=l9_1921.y==3;
}
else
{
l9_1949=l9_1948;
}
float l9_1950=l9_1918.y;
float l9_1951=l9_1923.y;
float l9_1952=l9_1923.w;
bool l9_1953=l9_1949;
float l9_1954=l9_1928;
float l9_1955=fast::clamp(l9_1950,l9_1951,l9_1952);
float l9_1956=step(abs(l9_1950-l9_1955),9.9999997e-06);
l9_1954*=(l9_1956+((1.0-float(l9_1953))*(1.0-l9_1956)));
l9_1950=l9_1955;
l9_1918.y=l9_1950;
l9_1928=l9_1954;
}
float2 l9_1957=l9_1918;
bool l9_1958=l9_1919;
float3x3 l9_1959=l9_1920;
if (l9_1958)
{
l9_1957=float2((l9_1959*float3(l9_1957,1.0)).xy);
}
float2 l9_1960=l9_1957;
l9_1918=l9_1960;
float l9_1961=l9_1918.x;
int l9_1962=l9_1921.x;
bool l9_1963=l9_1927;
float l9_1964=l9_1928;
if ((l9_1962==0)||(l9_1962==3))
{
float l9_1965=l9_1961;
float l9_1966=0.0;
float l9_1967=1.0;
bool l9_1968=l9_1963;
float l9_1969=l9_1964;
float l9_1970=fast::clamp(l9_1965,l9_1966,l9_1967);
float l9_1971=step(abs(l9_1965-l9_1970),9.9999997e-06);
l9_1969*=(l9_1971+((1.0-float(l9_1968))*(1.0-l9_1971)));
l9_1965=l9_1970;
l9_1961=l9_1965;
l9_1964=l9_1969;
}
l9_1918.x=l9_1961;
l9_1928=l9_1964;
float l9_1972=l9_1918.y;
int l9_1973=l9_1921.y;
bool l9_1974=l9_1927;
float l9_1975=l9_1928;
if ((l9_1973==0)||(l9_1973==3))
{
float l9_1976=l9_1972;
float l9_1977=0.0;
float l9_1978=1.0;
bool l9_1979=l9_1974;
float l9_1980=l9_1975;
float l9_1981=fast::clamp(l9_1976,l9_1977,l9_1978);
float l9_1982=step(abs(l9_1976-l9_1981),9.9999997e-06);
l9_1980*=(l9_1982+((1.0-float(l9_1979))*(1.0-l9_1982)));
l9_1976=l9_1981;
l9_1972=l9_1976;
l9_1975=l9_1980;
}
l9_1918.y=l9_1972;
l9_1928=l9_1975;
float2 l9_1983=l9_1918;
int l9_1984=l9_1916;
int l9_1985=l9_1917;
float l9_1986=l9_1926;
float2 l9_1987=l9_1983;
int l9_1988=l9_1984;
int l9_1989=l9_1985;
float3 l9_1990=float3(0.0);
if (l9_1988==0)
{
l9_1990=float3(l9_1987,0.0);
}
else
{
if (l9_1988==1)
{
l9_1990=float3(l9_1987.x,(l9_1987.y*0.5)+(0.5-(float(l9_1989)*0.5)),0.0);
}
else
{
l9_1990=float3(l9_1987,float(l9_1989));
}
}
float3 l9_1991=l9_1990;
float3 l9_1992=l9_1991;
float4 l9_1993=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_1992.xy,bias(l9_1986));
float4 l9_1994=l9_1993;
if (l9_1924)
{
l9_1994=mix(l9_1925,l9_1994,float4(l9_1928));
}
float4 l9_1995=l9_1994;
l9_1909=l9_1995;
float l9_1996=0.0;
l9_1996=l9_1909.x;
float l9_1997=0.0;
l9_1997=step(l9_1996,(*sc_set0.UserUniforms).Port_Input1_N006);
float l9_1998=0.0;
l9_1998=step(l9_1996,(*sc_set0.UserUniforms).Port_Input1_N009);
float l9_1999=0.0;
l9_1999=l9_1997-l9_1998;
l9_1902=float4(l9_1999);
l9_1907=l9_1902;
}
else
{
l9_1907=l9_1903;
}
l9_1900=l9_1907;
float4 l9_2000=float4(0.0);
l9_2000=l9_1569*l9_1900;
float4 l9_2001=float4(0.0);
float4 l9_2002=(*sc_set0.UserUniforms).colorId03;
l9_2001=l9_2002;
float4 l9_2003=float4(0.0);
l9_2003=l9_2001*l9_1900;
float4 l9_2004=float4(0.0);
float4 l9_2005=l9_2000;
float4 l9_2006=l9_2003;
float4 l9_2007=l9_2005;
float4 l9_2008=l9_2006;
float3 l9_2009=l9_2007.xyz*l9_2007.w;
l9_2007=float4(l9_2009.x,l9_2009.y,l9_2009.z,l9_2007.w);
float4 l9_2010=l9_2007+(l9_2008*(1.0-l9_2007.w));
l9_2004=l9_2010;
l9_1110=l9_2004;
l9_1114=l9_1110;
}
l9_1107=l9_1114;
l9_170=l9_1107;
l9_174=l9_170;
}
l9_167=l9_174;
float4 l9_2011=float4(0.0);
float l9_2012=0.0;
float4 l9_2013=float4(0.0);
float4 l9_2014=(*sc_set0.UserUniforms).Port_Default_N358;
ssGlobals l9_2015=param_32;
float l9_2016=0.0;
float l9_2017=float((*sc_set0.UserUniforms).ColorOnOffid03!=0);
l9_2016=l9_2017;
l9_2012=l9_2016;
float4 l9_2018;
if ((l9_2012*1.0)!=0.0)
{
float2 l9_2019=float2(0.0);
l9_2019=l9_2015.Surface_UVCoord0;
float4 l9_2020=float4(0.0);
int l9_2021;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_2022=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2022=0;
}
else
{
l9_2022=in.varStereoViewID;
}
int l9_2023=l9_2022;
l9_2021=1-l9_2023;
}
else
{
int l9_2024=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2024=0;
}
else
{
l9_2024=in.varStereoViewID;
}
int l9_2025=l9_2024;
l9_2021=l9_2025;
}
int l9_2026=l9_2021;
int l9_2027=greyMaskIdLayout_tmp;
int l9_2028=l9_2026;
float2 l9_2029=l9_2019;
bool l9_2030=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_2031=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_2032=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_2033=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_2034=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_2035=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_2036=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_2037=0.0;
bool l9_2038=l9_2035&&(!l9_2033);
float l9_2039=1.0;
float l9_2040=l9_2029.x;
int l9_2041=l9_2032.x;
if (l9_2041==1)
{
l9_2040=fract(l9_2040);
}
else
{
if (l9_2041==2)
{
float l9_2042=fract(l9_2040);
float l9_2043=l9_2040-l9_2042;
float l9_2044=step(0.25,fract(l9_2043*0.5));
l9_2040=mix(l9_2042,1.0-l9_2042,fast::clamp(l9_2044,0.0,1.0));
}
}
l9_2029.x=l9_2040;
float l9_2045=l9_2029.y;
int l9_2046=l9_2032.y;
if (l9_2046==1)
{
l9_2045=fract(l9_2045);
}
else
{
if (l9_2046==2)
{
float l9_2047=fract(l9_2045);
float l9_2048=l9_2045-l9_2047;
float l9_2049=step(0.25,fract(l9_2048*0.5));
l9_2045=mix(l9_2047,1.0-l9_2047,fast::clamp(l9_2049,0.0,1.0));
}
}
l9_2029.y=l9_2045;
if (l9_2033)
{
bool l9_2050=l9_2035;
bool l9_2051;
if (l9_2050)
{
l9_2051=l9_2032.x==3;
}
else
{
l9_2051=l9_2050;
}
float l9_2052=l9_2029.x;
float l9_2053=l9_2034.x;
float l9_2054=l9_2034.z;
bool l9_2055=l9_2051;
float l9_2056=l9_2039;
float l9_2057=fast::clamp(l9_2052,l9_2053,l9_2054);
float l9_2058=step(abs(l9_2052-l9_2057),9.9999997e-06);
l9_2056*=(l9_2058+((1.0-float(l9_2055))*(1.0-l9_2058)));
l9_2052=l9_2057;
l9_2029.x=l9_2052;
l9_2039=l9_2056;
bool l9_2059=l9_2035;
bool l9_2060;
if (l9_2059)
{
l9_2060=l9_2032.y==3;
}
else
{
l9_2060=l9_2059;
}
float l9_2061=l9_2029.y;
float l9_2062=l9_2034.y;
float l9_2063=l9_2034.w;
bool l9_2064=l9_2060;
float l9_2065=l9_2039;
float l9_2066=fast::clamp(l9_2061,l9_2062,l9_2063);
float l9_2067=step(abs(l9_2061-l9_2066),9.9999997e-06);
l9_2065*=(l9_2067+((1.0-float(l9_2064))*(1.0-l9_2067)));
l9_2061=l9_2066;
l9_2029.y=l9_2061;
l9_2039=l9_2065;
}
float2 l9_2068=l9_2029;
bool l9_2069=l9_2030;
float3x3 l9_2070=l9_2031;
if (l9_2069)
{
l9_2068=float2((l9_2070*float3(l9_2068,1.0)).xy);
}
float2 l9_2071=l9_2068;
l9_2029=l9_2071;
float l9_2072=l9_2029.x;
int l9_2073=l9_2032.x;
bool l9_2074=l9_2038;
float l9_2075=l9_2039;
if ((l9_2073==0)||(l9_2073==3))
{
float l9_2076=l9_2072;
float l9_2077=0.0;
float l9_2078=1.0;
bool l9_2079=l9_2074;
float l9_2080=l9_2075;
float l9_2081=fast::clamp(l9_2076,l9_2077,l9_2078);
float l9_2082=step(abs(l9_2076-l9_2081),9.9999997e-06);
l9_2080*=(l9_2082+((1.0-float(l9_2079))*(1.0-l9_2082)));
l9_2076=l9_2081;
l9_2072=l9_2076;
l9_2075=l9_2080;
}
l9_2029.x=l9_2072;
l9_2039=l9_2075;
float l9_2083=l9_2029.y;
int l9_2084=l9_2032.y;
bool l9_2085=l9_2038;
float l9_2086=l9_2039;
if ((l9_2084==0)||(l9_2084==3))
{
float l9_2087=l9_2083;
float l9_2088=0.0;
float l9_2089=1.0;
bool l9_2090=l9_2085;
float l9_2091=l9_2086;
float l9_2092=fast::clamp(l9_2087,l9_2088,l9_2089);
float l9_2093=step(abs(l9_2087-l9_2092),9.9999997e-06);
l9_2091*=(l9_2093+((1.0-float(l9_2090))*(1.0-l9_2093)));
l9_2087=l9_2092;
l9_2083=l9_2087;
l9_2086=l9_2091;
}
l9_2029.y=l9_2083;
l9_2039=l9_2086;
float2 l9_2094=l9_2029;
int l9_2095=l9_2027;
int l9_2096=l9_2028;
float l9_2097=l9_2037;
float2 l9_2098=l9_2094;
int l9_2099=l9_2095;
int l9_2100=l9_2096;
float3 l9_2101=float3(0.0);
if (l9_2099==0)
{
l9_2101=float3(l9_2098,0.0);
}
else
{
if (l9_2099==1)
{
l9_2101=float3(l9_2098.x,(l9_2098.y*0.5)+(0.5-(float(l9_2100)*0.5)),0.0);
}
else
{
l9_2101=float3(l9_2098,float(l9_2100));
}
}
float3 l9_2102=l9_2101;
float3 l9_2103=l9_2102;
float4 l9_2104=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_2103.xy,bias(l9_2097));
float4 l9_2105=l9_2104;
if (l9_2035)
{
l9_2105=mix(l9_2036,l9_2105,float4(l9_2039));
}
float4 l9_2106=l9_2105;
l9_2020=l9_2106;
float l9_2107=0.0;
l9_2107=l9_2020.x;
float l9_2108=0.0;
l9_2108=step(l9_2107,(*sc_set0.UserUniforms).Port_Input1_N006);
float l9_2109=0.0;
l9_2109=step(l9_2107,(*sc_set0.UserUniforms).Port_Input1_N009);
float l9_2110=0.0;
l9_2110=l9_2108-l9_2109;
l9_2013=float4(l9_2110);
l9_2018=l9_2013;
}
else
{
l9_2018=l9_2014;
}
l9_2011=l9_2018;
float4 l9_2111=float4(0.0);
l9_2111=l9_167*l9_2011;
float4 l9_2112=float4(0.0);
float l9_2113=0.0;
float4 l9_2114=float4(0.0);
float4 l9_2115=float4(0.0);
ssGlobals l9_2116=param_32;
float l9_2117=0.0;
float l9_2118=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_2117=l9_2118;
l9_2113=l9_2117;
float4 l9_2119;
if ((l9_2113*1.0)!=0.0)
{
float4 l9_2120=float4(0.0);
float l9_2121=0.0;
float4 l9_2122=float4(0.0);
float4 l9_2123=float4(0.0);
ssGlobals l9_2124=l9_2116;
float l9_2125=0.0;
float l9_2126=float((*sc_set0.UserUniforms).pbrOnOffId02!=0);
l9_2125=l9_2126;
l9_2121=l9_2125;
float4 l9_2127;
if ((l9_2121*1.0)!=0.0)
{
float4 l9_2128=float4(0.0);
float l9_2129=0.0;
float4 l9_2130=float4(0.0);
float4 l9_2131=float4(0.0);
ssGlobals l9_2132=l9_2124;
float l9_2133=0.0;
float l9_2134=float((*sc_set0.UserUniforms).rimOnOffId02!=0);
l9_2133=l9_2134;
l9_2129=l9_2133;
float4 l9_2135;
if ((l9_2129*1.0)!=0.0)
{
float l9_2136=0.0;
float l9_2137=(*sc_set0.UserUniforms).rimExpId02;
l9_2136=l9_2137;
float l9_2138=0.0;
float l9_2139=(*sc_set0.UserUniforms).rimIntId02;
l9_2138=l9_2139;
float l9_2140=0.0;
float l9_2141=l9_2136;
float l9_2142=l9_2138;
ssGlobals l9_2143=l9_2132;
float l9_2144=abs(dot(-l9_2143.ViewDirWS,l9_2143.VertexNormal_WorldSpace));
float l9_2145=1.0-pow(1.0-l9_2144,l9_2141);
l9_2145=fast::max(l9_2145,0.0);
l9_2145*=l9_2142;
l9_2140=l9_2145;
float4 l9_2146=float4(0.0);
float l9_2147=0.0;
float4 l9_2148=float4(0.0);
float4 l9_2149=float4(0.0);
ssGlobals l9_2150=l9_2132;
float l9_2151=0.0;
float l9_2152=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_2151=l9_2152;
l9_2147=l9_2151;
float4 l9_2153;
if ((l9_2147*1.0)!=0.0)
{
float4 l9_2154=float4(0.0);
float4 l9_2155=(*sc_set0.UserUniforms).patternColorId02;
l9_2154=l9_2155;
float4 l9_2156=float4(0.0);
float l9_2157=0.0;
float4 l9_2158=float4(0.0);
float4 l9_2159=float4(0.0);
ssGlobals l9_2160=l9_2150;
float l9_2161=0.0;
float l9_2162=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_2161=l9_2162;
l9_2157=l9_2161;
float4 l9_2163;
if ((l9_2157*1.0)!=0.0)
{
float2 l9_2164=float2(0.0);
l9_2164=l9_2160.Surface_UVCoord0;
float2 l9_2165=float2(0.0);
float2 l9_2166=(*sc_set0.UserUniforms).patternScaleId02;
l9_2165=l9_2166;
float2 l9_2167=float2(0.0);
l9_2167=((l9_2164-(*sc_set0.UserUniforms).Port_Center_N282)*l9_2165)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_2168=float2(0.0);
float2 l9_2169=(*sc_set0.UserUniforms).patternOffsetId02;
l9_2168=l9_2169;
float2 l9_2170=float2(0.0);
l9_2170=l9_2167+l9_2168;
float l9_2171=0.0;
float l9_2172=(*sc_set0.UserUniforms).patternRotateId02;
l9_2171=l9_2172;
float2 l9_2173=float2(0.0);
float2 l9_2174=l9_2170;
float l9_2175=l9_2171;
float2 l9_2176=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_2177=sin(radians(l9_2175));
float l9_2178=cos(radians(l9_2175));
float2 l9_2179=l9_2174-l9_2176;
l9_2179=float2(dot(float2(l9_2178,l9_2177),l9_2179),dot(float2(-l9_2177,l9_2178),l9_2179))+l9_2176;
l9_2173=l9_2179;
float4 l9_2180=float4(0.0);
int l9_2181;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_2182=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2182=0;
}
else
{
l9_2182=in.varStereoViewID;
}
int l9_2183=l9_2182;
l9_2181=1-l9_2183;
}
else
{
int l9_2184=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2184=0;
}
else
{
l9_2184=in.varStereoViewID;
}
int l9_2185=l9_2184;
l9_2181=l9_2185;
}
int l9_2186=l9_2181;
int l9_2187=patternTextureId02Layout_tmp;
int l9_2188=l9_2186;
float2 l9_2189=l9_2173;
bool l9_2190=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_2191=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_2192=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_2193=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_2194=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_2195=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_2196=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_2197=0.0;
bool l9_2198=l9_2195&&(!l9_2193);
float l9_2199=1.0;
float l9_2200=l9_2189.x;
int l9_2201=l9_2192.x;
if (l9_2201==1)
{
l9_2200=fract(l9_2200);
}
else
{
if (l9_2201==2)
{
float l9_2202=fract(l9_2200);
float l9_2203=l9_2200-l9_2202;
float l9_2204=step(0.25,fract(l9_2203*0.5));
l9_2200=mix(l9_2202,1.0-l9_2202,fast::clamp(l9_2204,0.0,1.0));
}
}
l9_2189.x=l9_2200;
float l9_2205=l9_2189.y;
int l9_2206=l9_2192.y;
if (l9_2206==1)
{
l9_2205=fract(l9_2205);
}
else
{
if (l9_2206==2)
{
float l9_2207=fract(l9_2205);
float l9_2208=l9_2205-l9_2207;
float l9_2209=step(0.25,fract(l9_2208*0.5));
l9_2205=mix(l9_2207,1.0-l9_2207,fast::clamp(l9_2209,0.0,1.0));
}
}
l9_2189.y=l9_2205;
if (l9_2193)
{
bool l9_2210=l9_2195;
bool l9_2211;
if (l9_2210)
{
l9_2211=l9_2192.x==3;
}
else
{
l9_2211=l9_2210;
}
float l9_2212=l9_2189.x;
float l9_2213=l9_2194.x;
float l9_2214=l9_2194.z;
bool l9_2215=l9_2211;
float l9_2216=l9_2199;
float l9_2217=fast::clamp(l9_2212,l9_2213,l9_2214);
float l9_2218=step(abs(l9_2212-l9_2217),9.9999997e-06);
l9_2216*=(l9_2218+((1.0-float(l9_2215))*(1.0-l9_2218)));
l9_2212=l9_2217;
l9_2189.x=l9_2212;
l9_2199=l9_2216;
bool l9_2219=l9_2195;
bool l9_2220;
if (l9_2219)
{
l9_2220=l9_2192.y==3;
}
else
{
l9_2220=l9_2219;
}
float l9_2221=l9_2189.y;
float l9_2222=l9_2194.y;
float l9_2223=l9_2194.w;
bool l9_2224=l9_2220;
float l9_2225=l9_2199;
float l9_2226=fast::clamp(l9_2221,l9_2222,l9_2223);
float l9_2227=step(abs(l9_2221-l9_2226),9.9999997e-06);
l9_2225*=(l9_2227+((1.0-float(l9_2224))*(1.0-l9_2227)));
l9_2221=l9_2226;
l9_2189.y=l9_2221;
l9_2199=l9_2225;
}
float2 l9_2228=l9_2189;
bool l9_2229=l9_2190;
float3x3 l9_2230=l9_2191;
if (l9_2229)
{
l9_2228=float2((l9_2230*float3(l9_2228,1.0)).xy);
}
float2 l9_2231=l9_2228;
l9_2189=l9_2231;
float l9_2232=l9_2189.x;
int l9_2233=l9_2192.x;
bool l9_2234=l9_2198;
float l9_2235=l9_2199;
if ((l9_2233==0)||(l9_2233==3))
{
float l9_2236=l9_2232;
float l9_2237=0.0;
float l9_2238=1.0;
bool l9_2239=l9_2234;
float l9_2240=l9_2235;
float l9_2241=fast::clamp(l9_2236,l9_2237,l9_2238);
float l9_2242=step(abs(l9_2236-l9_2241),9.9999997e-06);
l9_2240*=(l9_2242+((1.0-float(l9_2239))*(1.0-l9_2242)));
l9_2236=l9_2241;
l9_2232=l9_2236;
l9_2235=l9_2240;
}
l9_2189.x=l9_2232;
l9_2199=l9_2235;
float l9_2243=l9_2189.y;
int l9_2244=l9_2192.y;
bool l9_2245=l9_2198;
float l9_2246=l9_2199;
if ((l9_2244==0)||(l9_2244==3))
{
float l9_2247=l9_2243;
float l9_2248=0.0;
float l9_2249=1.0;
bool l9_2250=l9_2245;
float l9_2251=l9_2246;
float l9_2252=fast::clamp(l9_2247,l9_2248,l9_2249);
float l9_2253=step(abs(l9_2247-l9_2252),9.9999997e-06);
l9_2251*=(l9_2253+((1.0-float(l9_2250))*(1.0-l9_2253)));
l9_2247=l9_2252;
l9_2243=l9_2247;
l9_2246=l9_2251;
}
l9_2189.y=l9_2243;
l9_2199=l9_2246;
float2 l9_2254=l9_2189;
int l9_2255=l9_2187;
int l9_2256=l9_2188;
float l9_2257=l9_2197;
float2 l9_2258=l9_2254;
int l9_2259=l9_2255;
int l9_2260=l9_2256;
float3 l9_2261=float3(0.0);
if (l9_2259==0)
{
l9_2261=float3(l9_2258,0.0);
}
else
{
if (l9_2259==1)
{
l9_2261=float3(l9_2258.x,(l9_2258.y*0.5)+(0.5-(float(l9_2260)*0.5)),0.0);
}
else
{
l9_2261=float3(l9_2258,float(l9_2260));
}
}
float3 l9_2262=l9_2261;
float3 l9_2263=l9_2262;
float4 l9_2264=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_2263.xy,bias(l9_2257));
float4 l9_2265=l9_2264;
if (l9_2195)
{
l9_2265=mix(l9_2196,l9_2265,float4(l9_2199));
}
float4 l9_2266=l9_2265;
l9_2180=l9_2266;
l9_2158=l9_2180;
l9_2163=l9_2158;
}
else
{
float2 l9_2267=float2(0.0);
l9_2267=l9_2160.Surface_UVCoord0;
float2 l9_2268=float2(0.0);
float2 l9_2269=(*sc_set0.UserUniforms).patternScaleId02;
l9_2268=l9_2269;
float2 l9_2270=float2(0.0);
l9_2270=((l9_2267-(*sc_set0.UserUniforms).Port_Center_N282)*l9_2268)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_2271=float2(0.0);
float2 l9_2272=(*sc_set0.UserUniforms).patternOffsetId02;
l9_2271=l9_2272;
float2 l9_2273=float2(0.0);
l9_2273=l9_2270+l9_2271;
float l9_2274=0.0;
float l9_2275=(*sc_set0.UserUniforms).patternRotateId02;
l9_2274=l9_2275;
float2 l9_2276=float2(0.0);
float2 l9_2277=l9_2273;
float l9_2278=l9_2274;
float2 l9_2279=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_2280=sin(radians(l9_2278));
float l9_2281=cos(radians(l9_2278));
float2 l9_2282=l9_2277-l9_2279;
l9_2282=float2(dot(float2(l9_2281,l9_2280),l9_2282),dot(float2(-l9_2280,l9_2281),l9_2282))+l9_2279;
l9_2276=l9_2282;
float4 l9_2283=float4(0.0);
int l9_2284;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_2285=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2285=0;
}
else
{
l9_2285=in.varStereoViewID;
}
int l9_2286=l9_2285;
l9_2284=1-l9_2286;
}
else
{
int l9_2287=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2287=0;
}
else
{
l9_2287=in.varStereoViewID;
}
int l9_2288=l9_2287;
l9_2284=l9_2288;
}
int l9_2289=l9_2284;
int l9_2290=patternTextureId02Layout_tmp;
int l9_2291=l9_2289;
float2 l9_2292=l9_2276;
bool l9_2293=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_2294=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_2295=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_2296=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_2297=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_2298=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_2299=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_2300=0.0;
bool l9_2301=l9_2298&&(!l9_2296);
float l9_2302=1.0;
float l9_2303=l9_2292.x;
int l9_2304=l9_2295.x;
if (l9_2304==1)
{
l9_2303=fract(l9_2303);
}
else
{
if (l9_2304==2)
{
float l9_2305=fract(l9_2303);
float l9_2306=l9_2303-l9_2305;
float l9_2307=step(0.25,fract(l9_2306*0.5));
l9_2303=mix(l9_2305,1.0-l9_2305,fast::clamp(l9_2307,0.0,1.0));
}
}
l9_2292.x=l9_2303;
float l9_2308=l9_2292.y;
int l9_2309=l9_2295.y;
if (l9_2309==1)
{
l9_2308=fract(l9_2308);
}
else
{
if (l9_2309==2)
{
float l9_2310=fract(l9_2308);
float l9_2311=l9_2308-l9_2310;
float l9_2312=step(0.25,fract(l9_2311*0.5));
l9_2308=mix(l9_2310,1.0-l9_2310,fast::clamp(l9_2312,0.0,1.0));
}
}
l9_2292.y=l9_2308;
if (l9_2296)
{
bool l9_2313=l9_2298;
bool l9_2314;
if (l9_2313)
{
l9_2314=l9_2295.x==3;
}
else
{
l9_2314=l9_2313;
}
float l9_2315=l9_2292.x;
float l9_2316=l9_2297.x;
float l9_2317=l9_2297.z;
bool l9_2318=l9_2314;
float l9_2319=l9_2302;
float l9_2320=fast::clamp(l9_2315,l9_2316,l9_2317);
float l9_2321=step(abs(l9_2315-l9_2320),9.9999997e-06);
l9_2319*=(l9_2321+((1.0-float(l9_2318))*(1.0-l9_2321)));
l9_2315=l9_2320;
l9_2292.x=l9_2315;
l9_2302=l9_2319;
bool l9_2322=l9_2298;
bool l9_2323;
if (l9_2322)
{
l9_2323=l9_2295.y==3;
}
else
{
l9_2323=l9_2322;
}
float l9_2324=l9_2292.y;
float l9_2325=l9_2297.y;
float l9_2326=l9_2297.w;
bool l9_2327=l9_2323;
float l9_2328=l9_2302;
float l9_2329=fast::clamp(l9_2324,l9_2325,l9_2326);
float l9_2330=step(abs(l9_2324-l9_2329),9.9999997e-06);
l9_2328*=(l9_2330+((1.0-float(l9_2327))*(1.0-l9_2330)));
l9_2324=l9_2329;
l9_2292.y=l9_2324;
l9_2302=l9_2328;
}
float2 l9_2331=l9_2292;
bool l9_2332=l9_2293;
float3x3 l9_2333=l9_2294;
if (l9_2332)
{
l9_2331=float2((l9_2333*float3(l9_2331,1.0)).xy);
}
float2 l9_2334=l9_2331;
l9_2292=l9_2334;
float l9_2335=l9_2292.x;
int l9_2336=l9_2295.x;
bool l9_2337=l9_2301;
float l9_2338=l9_2302;
if ((l9_2336==0)||(l9_2336==3))
{
float l9_2339=l9_2335;
float l9_2340=0.0;
float l9_2341=1.0;
bool l9_2342=l9_2337;
float l9_2343=l9_2338;
float l9_2344=fast::clamp(l9_2339,l9_2340,l9_2341);
float l9_2345=step(abs(l9_2339-l9_2344),9.9999997e-06);
l9_2343*=(l9_2345+((1.0-float(l9_2342))*(1.0-l9_2345)));
l9_2339=l9_2344;
l9_2335=l9_2339;
l9_2338=l9_2343;
}
l9_2292.x=l9_2335;
l9_2302=l9_2338;
float l9_2346=l9_2292.y;
int l9_2347=l9_2295.y;
bool l9_2348=l9_2301;
float l9_2349=l9_2302;
if ((l9_2347==0)||(l9_2347==3))
{
float l9_2350=l9_2346;
float l9_2351=0.0;
float l9_2352=1.0;
bool l9_2353=l9_2348;
float l9_2354=l9_2349;
float l9_2355=fast::clamp(l9_2350,l9_2351,l9_2352);
float l9_2356=step(abs(l9_2350-l9_2355),9.9999997e-06);
l9_2354*=(l9_2356+((1.0-float(l9_2353))*(1.0-l9_2356)));
l9_2350=l9_2355;
l9_2346=l9_2350;
l9_2349=l9_2354;
}
l9_2292.y=l9_2346;
l9_2302=l9_2349;
float2 l9_2357=l9_2292;
int l9_2358=l9_2290;
int l9_2359=l9_2291;
float l9_2360=l9_2300;
float2 l9_2361=l9_2357;
int l9_2362=l9_2358;
int l9_2363=l9_2359;
float3 l9_2364=float3(0.0);
if (l9_2362==0)
{
l9_2364=float3(l9_2361,0.0);
}
else
{
if (l9_2362==1)
{
l9_2364=float3(l9_2361.x,(l9_2361.y*0.5)+(0.5-(float(l9_2363)*0.5)),0.0);
}
else
{
l9_2364=float3(l9_2361,float(l9_2363));
}
}
float3 l9_2365=l9_2364;
float3 l9_2366=l9_2365;
float4 l9_2367=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_2366.xy,bias(l9_2360));
float4 l9_2368=l9_2367;
if (l9_2298)
{
l9_2368=mix(l9_2299,l9_2368,float4(l9_2302));
}
float4 l9_2369=l9_2368;
l9_2283=l9_2369;
float l9_2370=0.0;
float3 l9_2371=l9_2283.xyz;
float l9_2372=l9_2371.x;
l9_2370=l9_2372;
l9_2159=float4(l9_2370);
l9_2163=l9_2159;
}
l9_2156=l9_2163;
float4 l9_2373=float4(0.0);
l9_2373=l9_2154*l9_2156;
l9_2148=l9_2373;
l9_2153=l9_2148;
}
else
{
float4 l9_2374=float4(0.0);
float4 l9_2375=(*sc_set0.UserUniforms).colorId02;
l9_2374=l9_2375;
float4 l9_2376=float4(0.0);
float l9_2377=0.0;
float4 l9_2378=float4(0.0);
float4 l9_2379=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_2380=l9_2150;
float l9_2381=0.0;
float l9_2382=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_2381=l9_2382;
l9_2377=l9_2381;
float4 l9_2383;
if ((l9_2377*1.0)!=0.0)
{
float2 l9_2384=float2(0.0);
l9_2384=l9_2380.Surface_UVCoord0;
float4 l9_2385=float4(0.0);
int l9_2386;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_2387=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2387=0;
}
else
{
l9_2387=in.varStereoViewID;
}
int l9_2388=l9_2387;
l9_2386=1-l9_2388;
}
else
{
int l9_2389=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2389=0;
}
else
{
l9_2389=in.varStereoViewID;
}
int l9_2390=l9_2389;
l9_2386=l9_2390;
}
int l9_2391=l9_2386;
int l9_2392=greyMaskIdLayout_tmp;
int l9_2393=l9_2391;
float2 l9_2394=l9_2384;
bool l9_2395=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_2396=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_2397=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_2398=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_2399=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_2400=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_2401=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_2402=0.0;
bool l9_2403=l9_2400&&(!l9_2398);
float l9_2404=1.0;
float l9_2405=l9_2394.x;
int l9_2406=l9_2397.x;
if (l9_2406==1)
{
l9_2405=fract(l9_2405);
}
else
{
if (l9_2406==2)
{
float l9_2407=fract(l9_2405);
float l9_2408=l9_2405-l9_2407;
float l9_2409=step(0.25,fract(l9_2408*0.5));
l9_2405=mix(l9_2407,1.0-l9_2407,fast::clamp(l9_2409,0.0,1.0));
}
}
l9_2394.x=l9_2405;
float l9_2410=l9_2394.y;
int l9_2411=l9_2397.y;
if (l9_2411==1)
{
l9_2410=fract(l9_2410);
}
else
{
if (l9_2411==2)
{
float l9_2412=fract(l9_2410);
float l9_2413=l9_2410-l9_2412;
float l9_2414=step(0.25,fract(l9_2413*0.5));
l9_2410=mix(l9_2412,1.0-l9_2412,fast::clamp(l9_2414,0.0,1.0));
}
}
l9_2394.y=l9_2410;
if (l9_2398)
{
bool l9_2415=l9_2400;
bool l9_2416;
if (l9_2415)
{
l9_2416=l9_2397.x==3;
}
else
{
l9_2416=l9_2415;
}
float l9_2417=l9_2394.x;
float l9_2418=l9_2399.x;
float l9_2419=l9_2399.z;
bool l9_2420=l9_2416;
float l9_2421=l9_2404;
float l9_2422=fast::clamp(l9_2417,l9_2418,l9_2419);
float l9_2423=step(abs(l9_2417-l9_2422),9.9999997e-06);
l9_2421*=(l9_2423+((1.0-float(l9_2420))*(1.0-l9_2423)));
l9_2417=l9_2422;
l9_2394.x=l9_2417;
l9_2404=l9_2421;
bool l9_2424=l9_2400;
bool l9_2425;
if (l9_2424)
{
l9_2425=l9_2397.y==3;
}
else
{
l9_2425=l9_2424;
}
float l9_2426=l9_2394.y;
float l9_2427=l9_2399.y;
float l9_2428=l9_2399.w;
bool l9_2429=l9_2425;
float l9_2430=l9_2404;
float l9_2431=fast::clamp(l9_2426,l9_2427,l9_2428);
float l9_2432=step(abs(l9_2426-l9_2431),9.9999997e-06);
l9_2430*=(l9_2432+((1.0-float(l9_2429))*(1.0-l9_2432)));
l9_2426=l9_2431;
l9_2394.y=l9_2426;
l9_2404=l9_2430;
}
float2 l9_2433=l9_2394;
bool l9_2434=l9_2395;
float3x3 l9_2435=l9_2396;
if (l9_2434)
{
l9_2433=float2((l9_2435*float3(l9_2433,1.0)).xy);
}
float2 l9_2436=l9_2433;
l9_2394=l9_2436;
float l9_2437=l9_2394.x;
int l9_2438=l9_2397.x;
bool l9_2439=l9_2403;
float l9_2440=l9_2404;
if ((l9_2438==0)||(l9_2438==3))
{
float l9_2441=l9_2437;
float l9_2442=0.0;
float l9_2443=1.0;
bool l9_2444=l9_2439;
float l9_2445=l9_2440;
float l9_2446=fast::clamp(l9_2441,l9_2442,l9_2443);
float l9_2447=step(abs(l9_2441-l9_2446),9.9999997e-06);
l9_2445*=(l9_2447+((1.0-float(l9_2444))*(1.0-l9_2447)));
l9_2441=l9_2446;
l9_2437=l9_2441;
l9_2440=l9_2445;
}
l9_2394.x=l9_2437;
l9_2404=l9_2440;
float l9_2448=l9_2394.y;
int l9_2449=l9_2397.y;
bool l9_2450=l9_2403;
float l9_2451=l9_2404;
if ((l9_2449==0)||(l9_2449==3))
{
float l9_2452=l9_2448;
float l9_2453=0.0;
float l9_2454=1.0;
bool l9_2455=l9_2450;
float l9_2456=l9_2451;
float l9_2457=fast::clamp(l9_2452,l9_2453,l9_2454);
float l9_2458=step(abs(l9_2452-l9_2457),9.9999997e-06);
l9_2456*=(l9_2458+((1.0-float(l9_2455))*(1.0-l9_2458)));
l9_2452=l9_2457;
l9_2448=l9_2452;
l9_2451=l9_2456;
}
l9_2394.y=l9_2448;
l9_2404=l9_2451;
float2 l9_2459=l9_2394;
int l9_2460=l9_2392;
int l9_2461=l9_2393;
float l9_2462=l9_2402;
float2 l9_2463=l9_2459;
int l9_2464=l9_2460;
int l9_2465=l9_2461;
float3 l9_2466=float3(0.0);
if (l9_2464==0)
{
l9_2466=float3(l9_2463,0.0);
}
else
{
if (l9_2464==1)
{
l9_2466=float3(l9_2463.x,(l9_2463.y*0.5)+(0.5-(float(l9_2465)*0.5)),0.0);
}
else
{
l9_2466=float3(l9_2463,float(l9_2465));
}
}
float3 l9_2467=l9_2466;
float3 l9_2468=l9_2467;
float4 l9_2469=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_2468.xy,bias(l9_2462));
float4 l9_2470=l9_2469;
if (l9_2400)
{
l9_2470=mix(l9_2401,l9_2470,float4(l9_2404));
}
float4 l9_2471=l9_2470;
l9_2385=l9_2471;
float l9_2472=0.0;
l9_2472=l9_2385.x;
float l9_2473=0.0;
l9_2473=step(l9_2472,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_2474=0.0;
l9_2474=step(l9_2472,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_2475=0.0;
l9_2475=l9_2473-l9_2474;
l9_2378=float4(l9_2475);
l9_2383=l9_2378;
}
else
{
l9_2383=l9_2379;
}
l9_2376=l9_2383;
float4 l9_2476=float4(0.0);
l9_2476=l9_2374*l9_2376;
l9_2149=l9_2476;
l9_2153=l9_2149;
}
l9_2146=l9_2153;
float4 l9_2477=float4(0.0);
float l9_2478=0.0;
float4 l9_2479=float4(0.0);
float4 l9_2480=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_2481=l9_2132;
float l9_2482=0.0;
float l9_2483=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_2482=l9_2483;
l9_2478=l9_2482;
float4 l9_2484;
if ((l9_2478*1.0)!=0.0)
{
float2 l9_2485=float2(0.0);
l9_2485=l9_2481.Surface_UVCoord0;
float4 l9_2486=float4(0.0);
int l9_2487;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_2488=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2488=0;
}
else
{
l9_2488=in.varStereoViewID;
}
int l9_2489=l9_2488;
l9_2487=1-l9_2489;
}
else
{
int l9_2490=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2490=0;
}
else
{
l9_2490=in.varStereoViewID;
}
int l9_2491=l9_2490;
l9_2487=l9_2491;
}
int l9_2492=l9_2487;
int l9_2493=greyMaskIdLayout_tmp;
int l9_2494=l9_2492;
float2 l9_2495=l9_2485;
bool l9_2496=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_2497=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_2498=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_2499=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_2500=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_2501=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_2502=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_2503=0.0;
bool l9_2504=l9_2501&&(!l9_2499);
float l9_2505=1.0;
float l9_2506=l9_2495.x;
int l9_2507=l9_2498.x;
if (l9_2507==1)
{
l9_2506=fract(l9_2506);
}
else
{
if (l9_2507==2)
{
float l9_2508=fract(l9_2506);
float l9_2509=l9_2506-l9_2508;
float l9_2510=step(0.25,fract(l9_2509*0.5));
l9_2506=mix(l9_2508,1.0-l9_2508,fast::clamp(l9_2510,0.0,1.0));
}
}
l9_2495.x=l9_2506;
float l9_2511=l9_2495.y;
int l9_2512=l9_2498.y;
if (l9_2512==1)
{
l9_2511=fract(l9_2511);
}
else
{
if (l9_2512==2)
{
float l9_2513=fract(l9_2511);
float l9_2514=l9_2511-l9_2513;
float l9_2515=step(0.25,fract(l9_2514*0.5));
l9_2511=mix(l9_2513,1.0-l9_2513,fast::clamp(l9_2515,0.0,1.0));
}
}
l9_2495.y=l9_2511;
if (l9_2499)
{
bool l9_2516=l9_2501;
bool l9_2517;
if (l9_2516)
{
l9_2517=l9_2498.x==3;
}
else
{
l9_2517=l9_2516;
}
float l9_2518=l9_2495.x;
float l9_2519=l9_2500.x;
float l9_2520=l9_2500.z;
bool l9_2521=l9_2517;
float l9_2522=l9_2505;
float l9_2523=fast::clamp(l9_2518,l9_2519,l9_2520);
float l9_2524=step(abs(l9_2518-l9_2523),9.9999997e-06);
l9_2522*=(l9_2524+((1.0-float(l9_2521))*(1.0-l9_2524)));
l9_2518=l9_2523;
l9_2495.x=l9_2518;
l9_2505=l9_2522;
bool l9_2525=l9_2501;
bool l9_2526;
if (l9_2525)
{
l9_2526=l9_2498.y==3;
}
else
{
l9_2526=l9_2525;
}
float l9_2527=l9_2495.y;
float l9_2528=l9_2500.y;
float l9_2529=l9_2500.w;
bool l9_2530=l9_2526;
float l9_2531=l9_2505;
float l9_2532=fast::clamp(l9_2527,l9_2528,l9_2529);
float l9_2533=step(abs(l9_2527-l9_2532),9.9999997e-06);
l9_2531*=(l9_2533+((1.0-float(l9_2530))*(1.0-l9_2533)));
l9_2527=l9_2532;
l9_2495.y=l9_2527;
l9_2505=l9_2531;
}
float2 l9_2534=l9_2495;
bool l9_2535=l9_2496;
float3x3 l9_2536=l9_2497;
if (l9_2535)
{
l9_2534=float2((l9_2536*float3(l9_2534,1.0)).xy);
}
float2 l9_2537=l9_2534;
l9_2495=l9_2537;
float l9_2538=l9_2495.x;
int l9_2539=l9_2498.x;
bool l9_2540=l9_2504;
float l9_2541=l9_2505;
if ((l9_2539==0)||(l9_2539==3))
{
float l9_2542=l9_2538;
float l9_2543=0.0;
float l9_2544=1.0;
bool l9_2545=l9_2540;
float l9_2546=l9_2541;
float l9_2547=fast::clamp(l9_2542,l9_2543,l9_2544);
float l9_2548=step(abs(l9_2542-l9_2547),9.9999997e-06);
l9_2546*=(l9_2548+((1.0-float(l9_2545))*(1.0-l9_2548)));
l9_2542=l9_2547;
l9_2538=l9_2542;
l9_2541=l9_2546;
}
l9_2495.x=l9_2538;
l9_2505=l9_2541;
float l9_2549=l9_2495.y;
int l9_2550=l9_2498.y;
bool l9_2551=l9_2504;
float l9_2552=l9_2505;
if ((l9_2550==0)||(l9_2550==3))
{
float l9_2553=l9_2549;
float l9_2554=0.0;
float l9_2555=1.0;
bool l9_2556=l9_2551;
float l9_2557=l9_2552;
float l9_2558=fast::clamp(l9_2553,l9_2554,l9_2555);
float l9_2559=step(abs(l9_2553-l9_2558),9.9999997e-06);
l9_2557*=(l9_2559+((1.0-float(l9_2556))*(1.0-l9_2559)));
l9_2553=l9_2558;
l9_2549=l9_2553;
l9_2552=l9_2557;
}
l9_2495.y=l9_2549;
l9_2505=l9_2552;
float2 l9_2560=l9_2495;
int l9_2561=l9_2493;
int l9_2562=l9_2494;
float l9_2563=l9_2503;
float2 l9_2564=l9_2560;
int l9_2565=l9_2561;
int l9_2566=l9_2562;
float3 l9_2567=float3(0.0);
if (l9_2565==0)
{
l9_2567=float3(l9_2564,0.0);
}
else
{
if (l9_2565==1)
{
l9_2567=float3(l9_2564.x,(l9_2564.y*0.5)+(0.5-(float(l9_2566)*0.5)),0.0);
}
else
{
l9_2567=float3(l9_2564,float(l9_2566));
}
}
float3 l9_2568=l9_2567;
float3 l9_2569=l9_2568;
float4 l9_2570=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_2569.xy,bias(l9_2563));
float4 l9_2571=l9_2570;
if (l9_2501)
{
l9_2571=mix(l9_2502,l9_2571,float4(l9_2505));
}
float4 l9_2572=l9_2571;
l9_2486=l9_2572;
float l9_2573=0.0;
l9_2573=l9_2486.x;
float l9_2574=0.0;
l9_2574=step(l9_2573,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_2575=0.0;
l9_2575=step(l9_2573,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_2576=0.0;
l9_2576=l9_2574-l9_2575;
l9_2479=float4(l9_2576);
l9_2484=l9_2479;
}
else
{
l9_2484=l9_2480;
}
l9_2477=l9_2484;
float4 l9_2577=float4(0.0);
l9_2577=l9_2146*l9_2477;
float4 l9_2578=float4(0.0);
float4 l9_2579=(*sc_set0.UserUniforms).colorId02;
l9_2578=l9_2579;
float4 l9_2580=float4(0.0);
l9_2580=l9_2578*l9_2477;
float4 l9_2581=float4(0.0);
float4 l9_2582=l9_2577;
float4 l9_2583=l9_2580;
float4 l9_2584=l9_2582;
float4 l9_2585=l9_2583;
float3 l9_2586=l9_2584.xyz*l9_2584.w;
l9_2584=float4(l9_2586.x,l9_2586.y,l9_2586.z,l9_2584.w);
float4 l9_2587=l9_2584+(l9_2585*(1.0-l9_2584.w));
l9_2581=l9_2587;
float4 l9_2588=float4(0.0);
l9_2588=float4(l9_2140)*l9_2581;
float4 l9_2589=float4(0.0);
l9_2589=l9_2588+l9_2581;
l9_2130=l9_2589;
l9_2135=l9_2130;
}
else
{
float4 l9_2590=float4(0.0);
float l9_2591=0.0;
float4 l9_2592=float4(0.0);
float4 l9_2593=float4(0.0);
ssGlobals l9_2594=l9_2132;
float l9_2595=0.0;
float l9_2596=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_2595=l9_2596;
l9_2591=l9_2595;
float4 l9_2597;
if ((l9_2591*1.0)!=0.0)
{
float4 l9_2598=float4(0.0);
float4 l9_2599=(*sc_set0.UserUniforms).patternColorId02;
l9_2598=l9_2599;
float4 l9_2600=float4(0.0);
float l9_2601=0.0;
float4 l9_2602=float4(0.0);
float4 l9_2603=float4(0.0);
ssGlobals l9_2604=l9_2594;
float l9_2605=0.0;
float l9_2606=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_2605=l9_2606;
l9_2601=l9_2605;
float4 l9_2607;
if ((l9_2601*1.0)!=0.0)
{
float2 l9_2608=float2(0.0);
l9_2608=l9_2604.Surface_UVCoord0;
float2 l9_2609=float2(0.0);
float2 l9_2610=(*sc_set0.UserUniforms).patternScaleId02;
l9_2609=l9_2610;
float2 l9_2611=float2(0.0);
l9_2611=((l9_2608-(*sc_set0.UserUniforms).Port_Center_N282)*l9_2609)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_2612=float2(0.0);
float2 l9_2613=(*sc_set0.UserUniforms).patternOffsetId02;
l9_2612=l9_2613;
float2 l9_2614=float2(0.0);
l9_2614=l9_2611+l9_2612;
float l9_2615=0.0;
float l9_2616=(*sc_set0.UserUniforms).patternRotateId02;
l9_2615=l9_2616;
float2 l9_2617=float2(0.0);
float2 l9_2618=l9_2614;
float l9_2619=l9_2615;
float2 l9_2620=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_2621=sin(radians(l9_2619));
float l9_2622=cos(radians(l9_2619));
float2 l9_2623=l9_2618-l9_2620;
l9_2623=float2(dot(float2(l9_2622,l9_2621),l9_2623),dot(float2(-l9_2621,l9_2622),l9_2623))+l9_2620;
l9_2617=l9_2623;
float4 l9_2624=float4(0.0);
int l9_2625;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_2626=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2626=0;
}
else
{
l9_2626=in.varStereoViewID;
}
int l9_2627=l9_2626;
l9_2625=1-l9_2627;
}
else
{
int l9_2628=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2628=0;
}
else
{
l9_2628=in.varStereoViewID;
}
int l9_2629=l9_2628;
l9_2625=l9_2629;
}
int l9_2630=l9_2625;
int l9_2631=patternTextureId02Layout_tmp;
int l9_2632=l9_2630;
float2 l9_2633=l9_2617;
bool l9_2634=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_2635=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_2636=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_2637=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_2638=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_2639=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_2640=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_2641=0.0;
bool l9_2642=l9_2639&&(!l9_2637);
float l9_2643=1.0;
float l9_2644=l9_2633.x;
int l9_2645=l9_2636.x;
if (l9_2645==1)
{
l9_2644=fract(l9_2644);
}
else
{
if (l9_2645==2)
{
float l9_2646=fract(l9_2644);
float l9_2647=l9_2644-l9_2646;
float l9_2648=step(0.25,fract(l9_2647*0.5));
l9_2644=mix(l9_2646,1.0-l9_2646,fast::clamp(l9_2648,0.0,1.0));
}
}
l9_2633.x=l9_2644;
float l9_2649=l9_2633.y;
int l9_2650=l9_2636.y;
if (l9_2650==1)
{
l9_2649=fract(l9_2649);
}
else
{
if (l9_2650==2)
{
float l9_2651=fract(l9_2649);
float l9_2652=l9_2649-l9_2651;
float l9_2653=step(0.25,fract(l9_2652*0.5));
l9_2649=mix(l9_2651,1.0-l9_2651,fast::clamp(l9_2653,0.0,1.0));
}
}
l9_2633.y=l9_2649;
if (l9_2637)
{
bool l9_2654=l9_2639;
bool l9_2655;
if (l9_2654)
{
l9_2655=l9_2636.x==3;
}
else
{
l9_2655=l9_2654;
}
float l9_2656=l9_2633.x;
float l9_2657=l9_2638.x;
float l9_2658=l9_2638.z;
bool l9_2659=l9_2655;
float l9_2660=l9_2643;
float l9_2661=fast::clamp(l9_2656,l9_2657,l9_2658);
float l9_2662=step(abs(l9_2656-l9_2661),9.9999997e-06);
l9_2660*=(l9_2662+((1.0-float(l9_2659))*(1.0-l9_2662)));
l9_2656=l9_2661;
l9_2633.x=l9_2656;
l9_2643=l9_2660;
bool l9_2663=l9_2639;
bool l9_2664;
if (l9_2663)
{
l9_2664=l9_2636.y==3;
}
else
{
l9_2664=l9_2663;
}
float l9_2665=l9_2633.y;
float l9_2666=l9_2638.y;
float l9_2667=l9_2638.w;
bool l9_2668=l9_2664;
float l9_2669=l9_2643;
float l9_2670=fast::clamp(l9_2665,l9_2666,l9_2667);
float l9_2671=step(abs(l9_2665-l9_2670),9.9999997e-06);
l9_2669*=(l9_2671+((1.0-float(l9_2668))*(1.0-l9_2671)));
l9_2665=l9_2670;
l9_2633.y=l9_2665;
l9_2643=l9_2669;
}
float2 l9_2672=l9_2633;
bool l9_2673=l9_2634;
float3x3 l9_2674=l9_2635;
if (l9_2673)
{
l9_2672=float2((l9_2674*float3(l9_2672,1.0)).xy);
}
float2 l9_2675=l9_2672;
l9_2633=l9_2675;
float l9_2676=l9_2633.x;
int l9_2677=l9_2636.x;
bool l9_2678=l9_2642;
float l9_2679=l9_2643;
if ((l9_2677==0)||(l9_2677==3))
{
float l9_2680=l9_2676;
float l9_2681=0.0;
float l9_2682=1.0;
bool l9_2683=l9_2678;
float l9_2684=l9_2679;
float l9_2685=fast::clamp(l9_2680,l9_2681,l9_2682);
float l9_2686=step(abs(l9_2680-l9_2685),9.9999997e-06);
l9_2684*=(l9_2686+((1.0-float(l9_2683))*(1.0-l9_2686)));
l9_2680=l9_2685;
l9_2676=l9_2680;
l9_2679=l9_2684;
}
l9_2633.x=l9_2676;
l9_2643=l9_2679;
float l9_2687=l9_2633.y;
int l9_2688=l9_2636.y;
bool l9_2689=l9_2642;
float l9_2690=l9_2643;
if ((l9_2688==0)||(l9_2688==3))
{
float l9_2691=l9_2687;
float l9_2692=0.0;
float l9_2693=1.0;
bool l9_2694=l9_2689;
float l9_2695=l9_2690;
float l9_2696=fast::clamp(l9_2691,l9_2692,l9_2693);
float l9_2697=step(abs(l9_2691-l9_2696),9.9999997e-06);
l9_2695*=(l9_2697+((1.0-float(l9_2694))*(1.0-l9_2697)));
l9_2691=l9_2696;
l9_2687=l9_2691;
l9_2690=l9_2695;
}
l9_2633.y=l9_2687;
l9_2643=l9_2690;
float2 l9_2698=l9_2633;
int l9_2699=l9_2631;
int l9_2700=l9_2632;
float l9_2701=l9_2641;
float2 l9_2702=l9_2698;
int l9_2703=l9_2699;
int l9_2704=l9_2700;
float3 l9_2705=float3(0.0);
if (l9_2703==0)
{
l9_2705=float3(l9_2702,0.0);
}
else
{
if (l9_2703==1)
{
l9_2705=float3(l9_2702.x,(l9_2702.y*0.5)+(0.5-(float(l9_2704)*0.5)),0.0);
}
else
{
l9_2705=float3(l9_2702,float(l9_2704));
}
}
float3 l9_2706=l9_2705;
float3 l9_2707=l9_2706;
float4 l9_2708=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_2707.xy,bias(l9_2701));
float4 l9_2709=l9_2708;
if (l9_2639)
{
l9_2709=mix(l9_2640,l9_2709,float4(l9_2643));
}
float4 l9_2710=l9_2709;
l9_2624=l9_2710;
l9_2602=l9_2624;
l9_2607=l9_2602;
}
else
{
float2 l9_2711=float2(0.0);
l9_2711=l9_2604.Surface_UVCoord0;
float2 l9_2712=float2(0.0);
float2 l9_2713=(*sc_set0.UserUniforms).patternScaleId02;
l9_2712=l9_2713;
float2 l9_2714=float2(0.0);
l9_2714=((l9_2711-(*sc_set0.UserUniforms).Port_Center_N282)*l9_2712)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_2715=float2(0.0);
float2 l9_2716=(*sc_set0.UserUniforms).patternOffsetId02;
l9_2715=l9_2716;
float2 l9_2717=float2(0.0);
l9_2717=l9_2714+l9_2715;
float l9_2718=0.0;
float l9_2719=(*sc_set0.UserUniforms).patternRotateId02;
l9_2718=l9_2719;
float2 l9_2720=float2(0.0);
float2 l9_2721=l9_2717;
float l9_2722=l9_2718;
float2 l9_2723=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_2724=sin(radians(l9_2722));
float l9_2725=cos(radians(l9_2722));
float2 l9_2726=l9_2721-l9_2723;
l9_2726=float2(dot(float2(l9_2725,l9_2724),l9_2726),dot(float2(-l9_2724,l9_2725),l9_2726))+l9_2723;
l9_2720=l9_2726;
float4 l9_2727=float4(0.0);
int l9_2728;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_2729=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2729=0;
}
else
{
l9_2729=in.varStereoViewID;
}
int l9_2730=l9_2729;
l9_2728=1-l9_2730;
}
else
{
int l9_2731=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2731=0;
}
else
{
l9_2731=in.varStereoViewID;
}
int l9_2732=l9_2731;
l9_2728=l9_2732;
}
int l9_2733=l9_2728;
int l9_2734=patternTextureId02Layout_tmp;
int l9_2735=l9_2733;
float2 l9_2736=l9_2720;
bool l9_2737=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_2738=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_2739=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_2740=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_2741=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_2742=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_2743=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_2744=0.0;
bool l9_2745=l9_2742&&(!l9_2740);
float l9_2746=1.0;
float l9_2747=l9_2736.x;
int l9_2748=l9_2739.x;
if (l9_2748==1)
{
l9_2747=fract(l9_2747);
}
else
{
if (l9_2748==2)
{
float l9_2749=fract(l9_2747);
float l9_2750=l9_2747-l9_2749;
float l9_2751=step(0.25,fract(l9_2750*0.5));
l9_2747=mix(l9_2749,1.0-l9_2749,fast::clamp(l9_2751,0.0,1.0));
}
}
l9_2736.x=l9_2747;
float l9_2752=l9_2736.y;
int l9_2753=l9_2739.y;
if (l9_2753==1)
{
l9_2752=fract(l9_2752);
}
else
{
if (l9_2753==2)
{
float l9_2754=fract(l9_2752);
float l9_2755=l9_2752-l9_2754;
float l9_2756=step(0.25,fract(l9_2755*0.5));
l9_2752=mix(l9_2754,1.0-l9_2754,fast::clamp(l9_2756,0.0,1.0));
}
}
l9_2736.y=l9_2752;
if (l9_2740)
{
bool l9_2757=l9_2742;
bool l9_2758;
if (l9_2757)
{
l9_2758=l9_2739.x==3;
}
else
{
l9_2758=l9_2757;
}
float l9_2759=l9_2736.x;
float l9_2760=l9_2741.x;
float l9_2761=l9_2741.z;
bool l9_2762=l9_2758;
float l9_2763=l9_2746;
float l9_2764=fast::clamp(l9_2759,l9_2760,l9_2761);
float l9_2765=step(abs(l9_2759-l9_2764),9.9999997e-06);
l9_2763*=(l9_2765+((1.0-float(l9_2762))*(1.0-l9_2765)));
l9_2759=l9_2764;
l9_2736.x=l9_2759;
l9_2746=l9_2763;
bool l9_2766=l9_2742;
bool l9_2767;
if (l9_2766)
{
l9_2767=l9_2739.y==3;
}
else
{
l9_2767=l9_2766;
}
float l9_2768=l9_2736.y;
float l9_2769=l9_2741.y;
float l9_2770=l9_2741.w;
bool l9_2771=l9_2767;
float l9_2772=l9_2746;
float l9_2773=fast::clamp(l9_2768,l9_2769,l9_2770);
float l9_2774=step(abs(l9_2768-l9_2773),9.9999997e-06);
l9_2772*=(l9_2774+((1.0-float(l9_2771))*(1.0-l9_2774)));
l9_2768=l9_2773;
l9_2736.y=l9_2768;
l9_2746=l9_2772;
}
float2 l9_2775=l9_2736;
bool l9_2776=l9_2737;
float3x3 l9_2777=l9_2738;
if (l9_2776)
{
l9_2775=float2((l9_2777*float3(l9_2775,1.0)).xy);
}
float2 l9_2778=l9_2775;
l9_2736=l9_2778;
float l9_2779=l9_2736.x;
int l9_2780=l9_2739.x;
bool l9_2781=l9_2745;
float l9_2782=l9_2746;
if ((l9_2780==0)||(l9_2780==3))
{
float l9_2783=l9_2779;
float l9_2784=0.0;
float l9_2785=1.0;
bool l9_2786=l9_2781;
float l9_2787=l9_2782;
float l9_2788=fast::clamp(l9_2783,l9_2784,l9_2785);
float l9_2789=step(abs(l9_2783-l9_2788),9.9999997e-06);
l9_2787*=(l9_2789+((1.0-float(l9_2786))*(1.0-l9_2789)));
l9_2783=l9_2788;
l9_2779=l9_2783;
l9_2782=l9_2787;
}
l9_2736.x=l9_2779;
l9_2746=l9_2782;
float l9_2790=l9_2736.y;
int l9_2791=l9_2739.y;
bool l9_2792=l9_2745;
float l9_2793=l9_2746;
if ((l9_2791==0)||(l9_2791==3))
{
float l9_2794=l9_2790;
float l9_2795=0.0;
float l9_2796=1.0;
bool l9_2797=l9_2792;
float l9_2798=l9_2793;
float l9_2799=fast::clamp(l9_2794,l9_2795,l9_2796);
float l9_2800=step(abs(l9_2794-l9_2799),9.9999997e-06);
l9_2798*=(l9_2800+((1.0-float(l9_2797))*(1.0-l9_2800)));
l9_2794=l9_2799;
l9_2790=l9_2794;
l9_2793=l9_2798;
}
l9_2736.y=l9_2790;
l9_2746=l9_2793;
float2 l9_2801=l9_2736;
int l9_2802=l9_2734;
int l9_2803=l9_2735;
float l9_2804=l9_2744;
float2 l9_2805=l9_2801;
int l9_2806=l9_2802;
int l9_2807=l9_2803;
float3 l9_2808=float3(0.0);
if (l9_2806==0)
{
l9_2808=float3(l9_2805,0.0);
}
else
{
if (l9_2806==1)
{
l9_2808=float3(l9_2805.x,(l9_2805.y*0.5)+(0.5-(float(l9_2807)*0.5)),0.0);
}
else
{
l9_2808=float3(l9_2805,float(l9_2807));
}
}
float3 l9_2809=l9_2808;
float3 l9_2810=l9_2809;
float4 l9_2811=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_2810.xy,bias(l9_2804));
float4 l9_2812=l9_2811;
if (l9_2742)
{
l9_2812=mix(l9_2743,l9_2812,float4(l9_2746));
}
float4 l9_2813=l9_2812;
l9_2727=l9_2813;
float l9_2814=0.0;
float3 l9_2815=l9_2727.xyz;
float l9_2816=l9_2815.x;
l9_2814=l9_2816;
l9_2603=float4(l9_2814);
l9_2607=l9_2603;
}
l9_2600=l9_2607;
float4 l9_2817=float4(0.0);
l9_2817=l9_2598*l9_2600;
l9_2592=l9_2817;
l9_2597=l9_2592;
}
else
{
float4 l9_2818=float4(0.0);
float4 l9_2819=(*sc_set0.UserUniforms).colorId02;
l9_2818=l9_2819;
float4 l9_2820=float4(0.0);
float l9_2821=0.0;
float4 l9_2822=float4(0.0);
float4 l9_2823=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_2824=l9_2594;
float l9_2825=0.0;
float l9_2826=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_2825=l9_2826;
l9_2821=l9_2825;
float4 l9_2827;
if ((l9_2821*1.0)!=0.0)
{
float2 l9_2828=float2(0.0);
l9_2828=l9_2824.Surface_UVCoord0;
float4 l9_2829=float4(0.0);
int l9_2830;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_2831=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2831=0;
}
else
{
l9_2831=in.varStereoViewID;
}
int l9_2832=l9_2831;
l9_2830=1-l9_2832;
}
else
{
int l9_2833=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2833=0;
}
else
{
l9_2833=in.varStereoViewID;
}
int l9_2834=l9_2833;
l9_2830=l9_2834;
}
int l9_2835=l9_2830;
int l9_2836=greyMaskIdLayout_tmp;
int l9_2837=l9_2835;
float2 l9_2838=l9_2828;
bool l9_2839=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_2840=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_2841=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_2842=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_2843=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_2844=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_2845=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_2846=0.0;
bool l9_2847=l9_2844&&(!l9_2842);
float l9_2848=1.0;
float l9_2849=l9_2838.x;
int l9_2850=l9_2841.x;
if (l9_2850==1)
{
l9_2849=fract(l9_2849);
}
else
{
if (l9_2850==2)
{
float l9_2851=fract(l9_2849);
float l9_2852=l9_2849-l9_2851;
float l9_2853=step(0.25,fract(l9_2852*0.5));
l9_2849=mix(l9_2851,1.0-l9_2851,fast::clamp(l9_2853,0.0,1.0));
}
}
l9_2838.x=l9_2849;
float l9_2854=l9_2838.y;
int l9_2855=l9_2841.y;
if (l9_2855==1)
{
l9_2854=fract(l9_2854);
}
else
{
if (l9_2855==2)
{
float l9_2856=fract(l9_2854);
float l9_2857=l9_2854-l9_2856;
float l9_2858=step(0.25,fract(l9_2857*0.5));
l9_2854=mix(l9_2856,1.0-l9_2856,fast::clamp(l9_2858,0.0,1.0));
}
}
l9_2838.y=l9_2854;
if (l9_2842)
{
bool l9_2859=l9_2844;
bool l9_2860;
if (l9_2859)
{
l9_2860=l9_2841.x==3;
}
else
{
l9_2860=l9_2859;
}
float l9_2861=l9_2838.x;
float l9_2862=l9_2843.x;
float l9_2863=l9_2843.z;
bool l9_2864=l9_2860;
float l9_2865=l9_2848;
float l9_2866=fast::clamp(l9_2861,l9_2862,l9_2863);
float l9_2867=step(abs(l9_2861-l9_2866),9.9999997e-06);
l9_2865*=(l9_2867+((1.0-float(l9_2864))*(1.0-l9_2867)));
l9_2861=l9_2866;
l9_2838.x=l9_2861;
l9_2848=l9_2865;
bool l9_2868=l9_2844;
bool l9_2869;
if (l9_2868)
{
l9_2869=l9_2841.y==3;
}
else
{
l9_2869=l9_2868;
}
float l9_2870=l9_2838.y;
float l9_2871=l9_2843.y;
float l9_2872=l9_2843.w;
bool l9_2873=l9_2869;
float l9_2874=l9_2848;
float l9_2875=fast::clamp(l9_2870,l9_2871,l9_2872);
float l9_2876=step(abs(l9_2870-l9_2875),9.9999997e-06);
l9_2874*=(l9_2876+((1.0-float(l9_2873))*(1.0-l9_2876)));
l9_2870=l9_2875;
l9_2838.y=l9_2870;
l9_2848=l9_2874;
}
float2 l9_2877=l9_2838;
bool l9_2878=l9_2839;
float3x3 l9_2879=l9_2840;
if (l9_2878)
{
l9_2877=float2((l9_2879*float3(l9_2877,1.0)).xy);
}
float2 l9_2880=l9_2877;
l9_2838=l9_2880;
float l9_2881=l9_2838.x;
int l9_2882=l9_2841.x;
bool l9_2883=l9_2847;
float l9_2884=l9_2848;
if ((l9_2882==0)||(l9_2882==3))
{
float l9_2885=l9_2881;
float l9_2886=0.0;
float l9_2887=1.0;
bool l9_2888=l9_2883;
float l9_2889=l9_2884;
float l9_2890=fast::clamp(l9_2885,l9_2886,l9_2887);
float l9_2891=step(abs(l9_2885-l9_2890),9.9999997e-06);
l9_2889*=(l9_2891+((1.0-float(l9_2888))*(1.0-l9_2891)));
l9_2885=l9_2890;
l9_2881=l9_2885;
l9_2884=l9_2889;
}
l9_2838.x=l9_2881;
l9_2848=l9_2884;
float l9_2892=l9_2838.y;
int l9_2893=l9_2841.y;
bool l9_2894=l9_2847;
float l9_2895=l9_2848;
if ((l9_2893==0)||(l9_2893==3))
{
float l9_2896=l9_2892;
float l9_2897=0.0;
float l9_2898=1.0;
bool l9_2899=l9_2894;
float l9_2900=l9_2895;
float l9_2901=fast::clamp(l9_2896,l9_2897,l9_2898);
float l9_2902=step(abs(l9_2896-l9_2901),9.9999997e-06);
l9_2900*=(l9_2902+((1.0-float(l9_2899))*(1.0-l9_2902)));
l9_2896=l9_2901;
l9_2892=l9_2896;
l9_2895=l9_2900;
}
l9_2838.y=l9_2892;
l9_2848=l9_2895;
float2 l9_2903=l9_2838;
int l9_2904=l9_2836;
int l9_2905=l9_2837;
float l9_2906=l9_2846;
float2 l9_2907=l9_2903;
int l9_2908=l9_2904;
int l9_2909=l9_2905;
float3 l9_2910=float3(0.0);
if (l9_2908==0)
{
l9_2910=float3(l9_2907,0.0);
}
else
{
if (l9_2908==1)
{
l9_2910=float3(l9_2907.x,(l9_2907.y*0.5)+(0.5-(float(l9_2909)*0.5)),0.0);
}
else
{
l9_2910=float3(l9_2907,float(l9_2909));
}
}
float3 l9_2911=l9_2910;
float3 l9_2912=l9_2911;
float4 l9_2913=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_2912.xy,bias(l9_2906));
float4 l9_2914=l9_2913;
if (l9_2844)
{
l9_2914=mix(l9_2845,l9_2914,float4(l9_2848));
}
float4 l9_2915=l9_2914;
l9_2829=l9_2915;
float l9_2916=0.0;
l9_2916=l9_2829.x;
float l9_2917=0.0;
l9_2917=step(l9_2916,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_2918=0.0;
l9_2918=step(l9_2916,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_2919=0.0;
l9_2919=l9_2917-l9_2918;
l9_2822=float4(l9_2919);
l9_2827=l9_2822;
}
else
{
l9_2827=l9_2823;
}
l9_2820=l9_2827;
float4 l9_2920=float4(0.0);
l9_2920=l9_2818*l9_2820;
l9_2593=l9_2920;
l9_2597=l9_2593;
}
l9_2590=l9_2597;
float4 l9_2921=float4(0.0);
float l9_2922=0.0;
float4 l9_2923=float4(0.0);
float4 l9_2924=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_2925=l9_2132;
float l9_2926=0.0;
float l9_2927=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_2926=l9_2927;
l9_2922=l9_2926;
float4 l9_2928;
if ((l9_2922*1.0)!=0.0)
{
float2 l9_2929=float2(0.0);
l9_2929=l9_2925.Surface_UVCoord0;
float4 l9_2930=float4(0.0);
int l9_2931;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_2932=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2932=0;
}
else
{
l9_2932=in.varStereoViewID;
}
int l9_2933=l9_2932;
l9_2931=1-l9_2933;
}
else
{
int l9_2934=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2934=0;
}
else
{
l9_2934=in.varStereoViewID;
}
int l9_2935=l9_2934;
l9_2931=l9_2935;
}
int l9_2936=l9_2931;
int l9_2937=greyMaskIdLayout_tmp;
int l9_2938=l9_2936;
float2 l9_2939=l9_2929;
bool l9_2940=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_2941=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_2942=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_2943=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_2944=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_2945=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_2946=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_2947=0.0;
bool l9_2948=l9_2945&&(!l9_2943);
float l9_2949=1.0;
float l9_2950=l9_2939.x;
int l9_2951=l9_2942.x;
if (l9_2951==1)
{
l9_2950=fract(l9_2950);
}
else
{
if (l9_2951==2)
{
float l9_2952=fract(l9_2950);
float l9_2953=l9_2950-l9_2952;
float l9_2954=step(0.25,fract(l9_2953*0.5));
l9_2950=mix(l9_2952,1.0-l9_2952,fast::clamp(l9_2954,0.0,1.0));
}
}
l9_2939.x=l9_2950;
float l9_2955=l9_2939.y;
int l9_2956=l9_2942.y;
if (l9_2956==1)
{
l9_2955=fract(l9_2955);
}
else
{
if (l9_2956==2)
{
float l9_2957=fract(l9_2955);
float l9_2958=l9_2955-l9_2957;
float l9_2959=step(0.25,fract(l9_2958*0.5));
l9_2955=mix(l9_2957,1.0-l9_2957,fast::clamp(l9_2959,0.0,1.0));
}
}
l9_2939.y=l9_2955;
if (l9_2943)
{
bool l9_2960=l9_2945;
bool l9_2961;
if (l9_2960)
{
l9_2961=l9_2942.x==3;
}
else
{
l9_2961=l9_2960;
}
float l9_2962=l9_2939.x;
float l9_2963=l9_2944.x;
float l9_2964=l9_2944.z;
bool l9_2965=l9_2961;
float l9_2966=l9_2949;
float l9_2967=fast::clamp(l9_2962,l9_2963,l9_2964);
float l9_2968=step(abs(l9_2962-l9_2967),9.9999997e-06);
l9_2966*=(l9_2968+((1.0-float(l9_2965))*(1.0-l9_2968)));
l9_2962=l9_2967;
l9_2939.x=l9_2962;
l9_2949=l9_2966;
bool l9_2969=l9_2945;
bool l9_2970;
if (l9_2969)
{
l9_2970=l9_2942.y==3;
}
else
{
l9_2970=l9_2969;
}
float l9_2971=l9_2939.y;
float l9_2972=l9_2944.y;
float l9_2973=l9_2944.w;
bool l9_2974=l9_2970;
float l9_2975=l9_2949;
float l9_2976=fast::clamp(l9_2971,l9_2972,l9_2973);
float l9_2977=step(abs(l9_2971-l9_2976),9.9999997e-06);
l9_2975*=(l9_2977+((1.0-float(l9_2974))*(1.0-l9_2977)));
l9_2971=l9_2976;
l9_2939.y=l9_2971;
l9_2949=l9_2975;
}
float2 l9_2978=l9_2939;
bool l9_2979=l9_2940;
float3x3 l9_2980=l9_2941;
if (l9_2979)
{
l9_2978=float2((l9_2980*float3(l9_2978,1.0)).xy);
}
float2 l9_2981=l9_2978;
l9_2939=l9_2981;
float l9_2982=l9_2939.x;
int l9_2983=l9_2942.x;
bool l9_2984=l9_2948;
float l9_2985=l9_2949;
if ((l9_2983==0)||(l9_2983==3))
{
float l9_2986=l9_2982;
float l9_2987=0.0;
float l9_2988=1.0;
bool l9_2989=l9_2984;
float l9_2990=l9_2985;
float l9_2991=fast::clamp(l9_2986,l9_2987,l9_2988);
float l9_2992=step(abs(l9_2986-l9_2991),9.9999997e-06);
l9_2990*=(l9_2992+((1.0-float(l9_2989))*(1.0-l9_2992)));
l9_2986=l9_2991;
l9_2982=l9_2986;
l9_2985=l9_2990;
}
l9_2939.x=l9_2982;
l9_2949=l9_2985;
float l9_2993=l9_2939.y;
int l9_2994=l9_2942.y;
bool l9_2995=l9_2948;
float l9_2996=l9_2949;
if ((l9_2994==0)||(l9_2994==3))
{
float l9_2997=l9_2993;
float l9_2998=0.0;
float l9_2999=1.0;
bool l9_3000=l9_2995;
float l9_3001=l9_2996;
float l9_3002=fast::clamp(l9_2997,l9_2998,l9_2999);
float l9_3003=step(abs(l9_2997-l9_3002),9.9999997e-06);
l9_3001*=(l9_3003+((1.0-float(l9_3000))*(1.0-l9_3003)));
l9_2997=l9_3002;
l9_2993=l9_2997;
l9_2996=l9_3001;
}
l9_2939.y=l9_2993;
l9_2949=l9_2996;
float2 l9_3004=l9_2939;
int l9_3005=l9_2937;
int l9_3006=l9_2938;
float l9_3007=l9_2947;
float2 l9_3008=l9_3004;
int l9_3009=l9_3005;
int l9_3010=l9_3006;
float3 l9_3011=float3(0.0);
if (l9_3009==0)
{
l9_3011=float3(l9_3008,0.0);
}
else
{
if (l9_3009==1)
{
l9_3011=float3(l9_3008.x,(l9_3008.y*0.5)+(0.5-(float(l9_3010)*0.5)),0.0);
}
else
{
l9_3011=float3(l9_3008,float(l9_3010));
}
}
float3 l9_3012=l9_3011;
float3 l9_3013=l9_3012;
float4 l9_3014=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_3013.xy,bias(l9_3007));
float4 l9_3015=l9_3014;
if (l9_2945)
{
l9_3015=mix(l9_2946,l9_3015,float4(l9_2949));
}
float4 l9_3016=l9_3015;
l9_2930=l9_3016;
float l9_3017=0.0;
l9_3017=l9_2930.x;
float l9_3018=0.0;
l9_3018=step(l9_3017,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_3019=0.0;
l9_3019=step(l9_3017,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_3020=0.0;
l9_3020=l9_3018-l9_3019;
l9_2923=float4(l9_3020);
l9_2928=l9_2923;
}
else
{
l9_2928=l9_2924;
}
l9_2921=l9_2928;
float4 l9_3021=float4(0.0);
l9_3021=l9_2590*l9_2921;
float4 l9_3022=float4(0.0);
float4 l9_3023=(*sc_set0.UserUniforms).colorId02;
l9_3022=l9_3023;
float4 l9_3024=float4(0.0);
l9_3024=l9_3022*l9_2921;
float4 l9_3025=float4(0.0);
float4 l9_3026=l9_3021;
float4 l9_3027=l9_3024;
float4 l9_3028=l9_3026;
float4 l9_3029=l9_3027;
float3 l9_3030=l9_3028.xyz*l9_3028.w;
l9_3028=float4(l9_3030.x,l9_3030.y,l9_3030.z,l9_3028.w);
float4 l9_3031=l9_3028+(l9_3029*(1.0-l9_3028.w));
l9_3025=l9_3031;
l9_2131=l9_3025;
l9_2135=l9_2131;
}
l9_2128=l9_2135;
float l9_3032=0.0;
float l9_3033=(*sc_set0.UserUniforms).metallicId02;
l9_3032=l9_3033;
float l9_3034=0.0;
float l9_3035=(*sc_set0.UserUniforms).rougnessId02;
l9_3034=l9_3035;
float4 l9_3036=float4(0.0);
float3 l9_3037=l9_2128.xyz;
float l9_3038=(*sc_set0.UserUniforms).Port_Opacity_N313;
float3 l9_3039=(*sc_set0.UserUniforms).Port_Emissive_N313;
float l9_3040=l9_3032;
float l9_3041=l9_3034;
float3 l9_3042=(*sc_set0.UserUniforms).Port_AO_N313;
float3 l9_3043=(*sc_set0.UserUniforms).Port_SpecularAO_N313;
ssGlobals l9_3044=l9_2124;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_3044.BumpedNormal=l9_3044.VertexNormal_WorldSpace;
}
float l9_3045=l9_3038;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_3045<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_3046=gl_FragCoord;
float2 l9_3047=floor(mod(l9_3046.xy,float2(4.0)));
float l9_3048=(mod(dot(l9_3047,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_3045<l9_3048)
{
discard_fragment();
}
}
l9_3037=fast::max(l9_3037,float3(0.0));
float4 l9_3049;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_3049=float4(l9_3037,l9_3038);
}
else
{
l9_3040=fast::clamp(l9_3040,0.0,1.0);
l9_3041=fast::clamp(l9_3041,0.0,1.0);
float3 l9_3050=l9_3037;
float l9_3051=l9_3038;
float3 l9_3052=l9_3044.BumpedNormal;
float3 l9_3053=l9_3044.PositionWS;
float3 l9_3054=l9_3044.ViewDirWS;
float3 l9_3055=l9_3039;
float l9_3056=l9_3040;
float l9_3057=l9_3041;
float3 l9_3058=l9_3042;
float3 l9_3059=l9_3043;
l9_3049=ngsCalculateLighting(l9_3050,l9_3051,l9_3052,l9_3053,l9_3054,l9_3055,l9_3056,l9_3057,l9_3058,l9_3059,in.varStereoViewID,sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_RayTracingReflections,sc_set0.sc_RayTracingReflectionsSmpSC,sc_set0.sc_RayTracingGlobalIllumination,sc_set0.sc_RayTracingGlobalIlluminationSmpSC,sc_set0.sc_RayTracingShadows,sc_set0.sc_RayTracingShadowsSmpSC,gl_FragCoord,(*sc_set0.UserUniforms),in.varShadowTex,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,out.sc_FragData0,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
l9_3049=fast::max(l9_3049,float4(0.0));
l9_3036=l9_3049;
l9_2122=l9_3036;
l9_2127=l9_2122;
}
else
{
float4 l9_3060=float4(0.0);
float l9_3061=0.0;
float4 l9_3062=float4(0.0);
float4 l9_3063=float4(0.0);
ssGlobals l9_3064=l9_2124;
float l9_3065=0.0;
float l9_3066=float((*sc_set0.UserUniforms).rimOnOffId02!=0);
l9_3065=l9_3066;
l9_3061=l9_3065;
float4 l9_3067;
if ((l9_3061*1.0)!=0.0)
{
float l9_3068=0.0;
float l9_3069=(*sc_set0.UserUniforms).rimExpId02;
l9_3068=l9_3069;
float l9_3070=0.0;
float l9_3071=(*sc_set0.UserUniforms).rimIntId02;
l9_3070=l9_3071;
float l9_3072=0.0;
float l9_3073=l9_3068;
float l9_3074=l9_3070;
ssGlobals l9_3075=l9_3064;
float l9_3076=abs(dot(-l9_3075.ViewDirWS,l9_3075.VertexNormal_WorldSpace));
float l9_3077=1.0-pow(1.0-l9_3076,l9_3073);
l9_3077=fast::max(l9_3077,0.0);
l9_3077*=l9_3074;
l9_3072=l9_3077;
float4 l9_3078=float4(0.0);
float l9_3079=0.0;
float4 l9_3080=float4(0.0);
float4 l9_3081=float4(0.0);
ssGlobals l9_3082=l9_3064;
float l9_3083=0.0;
float l9_3084=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_3083=l9_3084;
l9_3079=l9_3083;
float4 l9_3085;
if ((l9_3079*1.0)!=0.0)
{
float4 l9_3086=float4(0.0);
float4 l9_3087=(*sc_set0.UserUniforms).patternColorId02;
l9_3086=l9_3087;
float4 l9_3088=float4(0.0);
float l9_3089=0.0;
float4 l9_3090=float4(0.0);
float4 l9_3091=float4(0.0);
ssGlobals l9_3092=l9_3082;
float l9_3093=0.0;
float l9_3094=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_3093=l9_3094;
l9_3089=l9_3093;
float4 l9_3095;
if ((l9_3089*1.0)!=0.0)
{
float2 l9_3096=float2(0.0);
l9_3096=l9_3092.Surface_UVCoord0;
float2 l9_3097=float2(0.0);
float2 l9_3098=(*sc_set0.UserUniforms).patternScaleId02;
l9_3097=l9_3098;
float2 l9_3099=float2(0.0);
l9_3099=((l9_3096-(*sc_set0.UserUniforms).Port_Center_N282)*l9_3097)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_3100=float2(0.0);
float2 l9_3101=(*sc_set0.UserUniforms).patternOffsetId02;
l9_3100=l9_3101;
float2 l9_3102=float2(0.0);
l9_3102=l9_3099+l9_3100;
float l9_3103=0.0;
float l9_3104=(*sc_set0.UserUniforms).patternRotateId02;
l9_3103=l9_3104;
float2 l9_3105=float2(0.0);
float2 l9_3106=l9_3102;
float l9_3107=l9_3103;
float2 l9_3108=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_3109=sin(radians(l9_3107));
float l9_3110=cos(radians(l9_3107));
float2 l9_3111=l9_3106-l9_3108;
l9_3111=float2(dot(float2(l9_3110,l9_3109),l9_3111),dot(float2(-l9_3109,l9_3110),l9_3111))+l9_3108;
l9_3105=l9_3111;
float4 l9_3112=float4(0.0);
int l9_3113;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_3114=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3114=0;
}
else
{
l9_3114=in.varStereoViewID;
}
int l9_3115=l9_3114;
l9_3113=1-l9_3115;
}
else
{
int l9_3116=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3116=0;
}
else
{
l9_3116=in.varStereoViewID;
}
int l9_3117=l9_3116;
l9_3113=l9_3117;
}
int l9_3118=l9_3113;
int l9_3119=patternTextureId02Layout_tmp;
int l9_3120=l9_3118;
float2 l9_3121=l9_3105;
bool l9_3122=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_3123=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_3124=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_3125=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_3126=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_3127=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_3128=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_3129=0.0;
bool l9_3130=l9_3127&&(!l9_3125);
float l9_3131=1.0;
float l9_3132=l9_3121.x;
int l9_3133=l9_3124.x;
if (l9_3133==1)
{
l9_3132=fract(l9_3132);
}
else
{
if (l9_3133==2)
{
float l9_3134=fract(l9_3132);
float l9_3135=l9_3132-l9_3134;
float l9_3136=step(0.25,fract(l9_3135*0.5));
l9_3132=mix(l9_3134,1.0-l9_3134,fast::clamp(l9_3136,0.0,1.0));
}
}
l9_3121.x=l9_3132;
float l9_3137=l9_3121.y;
int l9_3138=l9_3124.y;
if (l9_3138==1)
{
l9_3137=fract(l9_3137);
}
else
{
if (l9_3138==2)
{
float l9_3139=fract(l9_3137);
float l9_3140=l9_3137-l9_3139;
float l9_3141=step(0.25,fract(l9_3140*0.5));
l9_3137=mix(l9_3139,1.0-l9_3139,fast::clamp(l9_3141,0.0,1.0));
}
}
l9_3121.y=l9_3137;
if (l9_3125)
{
bool l9_3142=l9_3127;
bool l9_3143;
if (l9_3142)
{
l9_3143=l9_3124.x==3;
}
else
{
l9_3143=l9_3142;
}
float l9_3144=l9_3121.x;
float l9_3145=l9_3126.x;
float l9_3146=l9_3126.z;
bool l9_3147=l9_3143;
float l9_3148=l9_3131;
float l9_3149=fast::clamp(l9_3144,l9_3145,l9_3146);
float l9_3150=step(abs(l9_3144-l9_3149),9.9999997e-06);
l9_3148*=(l9_3150+((1.0-float(l9_3147))*(1.0-l9_3150)));
l9_3144=l9_3149;
l9_3121.x=l9_3144;
l9_3131=l9_3148;
bool l9_3151=l9_3127;
bool l9_3152;
if (l9_3151)
{
l9_3152=l9_3124.y==3;
}
else
{
l9_3152=l9_3151;
}
float l9_3153=l9_3121.y;
float l9_3154=l9_3126.y;
float l9_3155=l9_3126.w;
bool l9_3156=l9_3152;
float l9_3157=l9_3131;
float l9_3158=fast::clamp(l9_3153,l9_3154,l9_3155);
float l9_3159=step(abs(l9_3153-l9_3158),9.9999997e-06);
l9_3157*=(l9_3159+((1.0-float(l9_3156))*(1.0-l9_3159)));
l9_3153=l9_3158;
l9_3121.y=l9_3153;
l9_3131=l9_3157;
}
float2 l9_3160=l9_3121;
bool l9_3161=l9_3122;
float3x3 l9_3162=l9_3123;
if (l9_3161)
{
l9_3160=float2((l9_3162*float3(l9_3160,1.0)).xy);
}
float2 l9_3163=l9_3160;
l9_3121=l9_3163;
float l9_3164=l9_3121.x;
int l9_3165=l9_3124.x;
bool l9_3166=l9_3130;
float l9_3167=l9_3131;
if ((l9_3165==0)||(l9_3165==3))
{
float l9_3168=l9_3164;
float l9_3169=0.0;
float l9_3170=1.0;
bool l9_3171=l9_3166;
float l9_3172=l9_3167;
float l9_3173=fast::clamp(l9_3168,l9_3169,l9_3170);
float l9_3174=step(abs(l9_3168-l9_3173),9.9999997e-06);
l9_3172*=(l9_3174+((1.0-float(l9_3171))*(1.0-l9_3174)));
l9_3168=l9_3173;
l9_3164=l9_3168;
l9_3167=l9_3172;
}
l9_3121.x=l9_3164;
l9_3131=l9_3167;
float l9_3175=l9_3121.y;
int l9_3176=l9_3124.y;
bool l9_3177=l9_3130;
float l9_3178=l9_3131;
if ((l9_3176==0)||(l9_3176==3))
{
float l9_3179=l9_3175;
float l9_3180=0.0;
float l9_3181=1.0;
bool l9_3182=l9_3177;
float l9_3183=l9_3178;
float l9_3184=fast::clamp(l9_3179,l9_3180,l9_3181);
float l9_3185=step(abs(l9_3179-l9_3184),9.9999997e-06);
l9_3183*=(l9_3185+((1.0-float(l9_3182))*(1.0-l9_3185)));
l9_3179=l9_3184;
l9_3175=l9_3179;
l9_3178=l9_3183;
}
l9_3121.y=l9_3175;
l9_3131=l9_3178;
float2 l9_3186=l9_3121;
int l9_3187=l9_3119;
int l9_3188=l9_3120;
float l9_3189=l9_3129;
float2 l9_3190=l9_3186;
int l9_3191=l9_3187;
int l9_3192=l9_3188;
float3 l9_3193=float3(0.0);
if (l9_3191==0)
{
l9_3193=float3(l9_3190,0.0);
}
else
{
if (l9_3191==1)
{
l9_3193=float3(l9_3190.x,(l9_3190.y*0.5)+(0.5-(float(l9_3192)*0.5)),0.0);
}
else
{
l9_3193=float3(l9_3190,float(l9_3192));
}
}
float3 l9_3194=l9_3193;
float3 l9_3195=l9_3194;
float4 l9_3196=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_3195.xy,bias(l9_3189));
float4 l9_3197=l9_3196;
if (l9_3127)
{
l9_3197=mix(l9_3128,l9_3197,float4(l9_3131));
}
float4 l9_3198=l9_3197;
l9_3112=l9_3198;
l9_3090=l9_3112;
l9_3095=l9_3090;
}
else
{
float2 l9_3199=float2(0.0);
l9_3199=l9_3092.Surface_UVCoord0;
float2 l9_3200=float2(0.0);
float2 l9_3201=(*sc_set0.UserUniforms).patternScaleId02;
l9_3200=l9_3201;
float2 l9_3202=float2(0.0);
l9_3202=((l9_3199-(*sc_set0.UserUniforms).Port_Center_N282)*l9_3200)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_3203=float2(0.0);
float2 l9_3204=(*sc_set0.UserUniforms).patternOffsetId02;
l9_3203=l9_3204;
float2 l9_3205=float2(0.0);
l9_3205=l9_3202+l9_3203;
float l9_3206=0.0;
float l9_3207=(*sc_set0.UserUniforms).patternRotateId02;
l9_3206=l9_3207;
float2 l9_3208=float2(0.0);
float2 l9_3209=l9_3205;
float l9_3210=l9_3206;
float2 l9_3211=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_3212=sin(radians(l9_3210));
float l9_3213=cos(radians(l9_3210));
float2 l9_3214=l9_3209-l9_3211;
l9_3214=float2(dot(float2(l9_3213,l9_3212),l9_3214),dot(float2(-l9_3212,l9_3213),l9_3214))+l9_3211;
l9_3208=l9_3214;
float4 l9_3215=float4(0.0);
int l9_3216;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_3217=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3217=0;
}
else
{
l9_3217=in.varStereoViewID;
}
int l9_3218=l9_3217;
l9_3216=1-l9_3218;
}
else
{
int l9_3219=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3219=0;
}
else
{
l9_3219=in.varStereoViewID;
}
int l9_3220=l9_3219;
l9_3216=l9_3220;
}
int l9_3221=l9_3216;
int l9_3222=patternTextureId02Layout_tmp;
int l9_3223=l9_3221;
float2 l9_3224=l9_3208;
bool l9_3225=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_3226=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_3227=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_3228=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_3229=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_3230=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_3231=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_3232=0.0;
bool l9_3233=l9_3230&&(!l9_3228);
float l9_3234=1.0;
float l9_3235=l9_3224.x;
int l9_3236=l9_3227.x;
if (l9_3236==1)
{
l9_3235=fract(l9_3235);
}
else
{
if (l9_3236==2)
{
float l9_3237=fract(l9_3235);
float l9_3238=l9_3235-l9_3237;
float l9_3239=step(0.25,fract(l9_3238*0.5));
l9_3235=mix(l9_3237,1.0-l9_3237,fast::clamp(l9_3239,0.0,1.0));
}
}
l9_3224.x=l9_3235;
float l9_3240=l9_3224.y;
int l9_3241=l9_3227.y;
if (l9_3241==1)
{
l9_3240=fract(l9_3240);
}
else
{
if (l9_3241==2)
{
float l9_3242=fract(l9_3240);
float l9_3243=l9_3240-l9_3242;
float l9_3244=step(0.25,fract(l9_3243*0.5));
l9_3240=mix(l9_3242,1.0-l9_3242,fast::clamp(l9_3244,0.0,1.0));
}
}
l9_3224.y=l9_3240;
if (l9_3228)
{
bool l9_3245=l9_3230;
bool l9_3246;
if (l9_3245)
{
l9_3246=l9_3227.x==3;
}
else
{
l9_3246=l9_3245;
}
float l9_3247=l9_3224.x;
float l9_3248=l9_3229.x;
float l9_3249=l9_3229.z;
bool l9_3250=l9_3246;
float l9_3251=l9_3234;
float l9_3252=fast::clamp(l9_3247,l9_3248,l9_3249);
float l9_3253=step(abs(l9_3247-l9_3252),9.9999997e-06);
l9_3251*=(l9_3253+((1.0-float(l9_3250))*(1.0-l9_3253)));
l9_3247=l9_3252;
l9_3224.x=l9_3247;
l9_3234=l9_3251;
bool l9_3254=l9_3230;
bool l9_3255;
if (l9_3254)
{
l9_3255=l9_3227.y==3;
}
else
{
l9_3255=l9_3254;
}
float l9_3256=l9_3224.y;
float l9_3257=l9_3229.y;
float l9_3258=l9_3229.w;
bool l9_3259=l9_3255;
float l9_3260=l9_3234;
float l9_3261=fast::clamp(l9_3256,l9_3257,l9_3258);
float l9_3262=step(abs(l9_3256-l9_3261),9.9999997e-06);
l9_3260*=(l9_3262+((1.0-float(l9_3259))*(1.0-l9_3262)));
l9_3256=l9_3261;
l9_3224.y=l9_3256;
l9_3234=l9_3260;
}
float2 l9_3263=l9_3224;
bool l9_3264=l9_3225;
float3x3 l9_3265=l9_3226;
if (l9_3264)
{
l9_3263=float2((l9_3265*float3(l9_3263,1.0)).xy);
}
float2 l9_3266=l9_3263;
l9_3224=l9_3266;
float l9_3267=l9_3224.x;
int l9_3268=l9_3227.x;
bool l9_3269=l9_3233;
float l9_3270=l9_3234;
if ((l9_3268==0)||(l9_3268==3))
{
float l9_3271=l9_3267;
float l9_3272=0.0;
float l9_3273=1.0;
bool l9_3274=l9_3269;
float l9_3275=l9_3270;
float l9_3276=fast::clamp(l9_3271,l9_3272,l9_3273);
float l9_3277=step(abs(l9_3271-l9_3276),9.9999997e-06);
l9_3275*=(l9_3277+((1.0-float(l9_3274))*(1.0-l9_3277)));
l9_3271=l9_3276;
l9_3267=l9_3271;
l9_3270=l9_3275;
}
l9_3224.x=l9_3267;
l9_3234=l9_3270;
float l9_3278=l9_3224.y;
int l9_3279=l9_3227.y;
bool l9_3280=l9_3233;
float l9_3281=l9_3234;
if ((l9_3279==0)||(l9_3279==3))
{
float l9_3282=l9_3278;
float l9_3283=0.0;
float l9_3284=1.0;
bool l9_3285=l9_3280;
float l9_3286=l9_3281;
float l9_3287=fast::clamp(l9_3282,l9_3283,l9_3284);
float l9_3288=step(abs(l9_3282-l9_3287),9.9999997e-06);
l9_3286*=(l9_3288+((1.0-float(l9_3285))*(1.0-l9_3288)));
l9_3282=l9_3287;
l9_3278=l9_3282;
l9_3281=l9_3286;
}
l9_3224.y=l9_3278;
l9_3234=l9_3281;
float2 l9_3289=l9_3224;
int l9_3290=l9_3222;
int l9_3291=l9_3223;
float l9_3292=l9_3232;
float2 l9_3293=l9_3289;
int l9_3294=l9_3290;
int l9_3295=l9_3291;
float3 l9_3296=float3(0.0);
if (l9_3294==0)
{
l9_3296=float3(l9_3293,0.0);
}
else
{
if (l9_3294==1)
{
l9_3296=float3(l9_3293.x,(l9_3293.y*0.5)+(0.5-(float(l9_3295)*0.5)),0.0);
}
else
{
l9_3296=float3(l9_3293,float(l9_3295));
}
}
float3 l9_3297=l9_3296;
float3 l9_3298=l9_3297;
float4 l9_3299=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_3298.xy,bias(l9_3292));
float4 l9_3300=l9_3299;
if (l9_3230)
{
l9_3300=mix(l9_3231,l9_3300,float4(l9_3234));
}
float4 l9_3301=l9_3300;
l9_3215=l9_3301;
float l9_3302=0.0;
float3 l9_3303=l9_3215.xyz;
float l9_3304=l9_3303.x;
l9_3302=l9_3304;
l9_3091=float4(l9_3302);
l9_3095=l9_3091;
}
l9_3088=l9_3095;
float4 l9_3305=float4(0.0);
l9_3305=l9_3086*l9_3088;
l9_3080=l9_3305;
l9_3085=l9_3080;
}
else
{
float4 l9_3306=float4(0.0);
float4 l9_3307=(*sc_set0.UserUniforms).colorId02;
l9_3306=l9_3307;
float4 l9_3308=float4(0.0);
float l9_3309=0.0;
float4 l9_3310=float4(0.0);
float4 l9_3311=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_3312=l9_3082;
float l9_3313=0.0;
float l9_3314=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_3313=l9_3314;
l9_3309=l9_3313;
float4 l9_3315;
if ((l9_3309*1.0)!=0.0)
{
float2 l9_3316=float2(0.0);
l9_3316=l9_3312.Surface_UVCoord0;
float4 l9_3317=float4(0.0);
int l9_3318;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_3319=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3319=0;
}
else
{
l9_3319=in.varStereoViewID;
}
int l9_3320=l9_3319;
l9_3318=1-l9_3320;
}
else
{
int l9_3321=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3321=0;
}
else
{
l9_3321=in.varStereoViewID;
}
int l9_3322=l9_3321;
l9_3318=l9_3322;
}
int l9_3323=l9_3318;
int l9_3324=greyMaskIdLayout_tmp;
int l9_3325=l9_3323;
float2 l9_3326=l9_3316;
bool l9_3327=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_3328=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_3329=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_3330=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_3331=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_3332=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_3333=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_3334=0.0;
bool l9_3335=l9_3332&&(!l9_3330);
float l9_3336=1.0;
float l9_3337=l9_3326.x;
int l9_3338=l9_3329.x;
if (l9_3338==1)
{
l9_3337=fract(l9_3337);
}
else
{
if (l9_3338==2)
{
float l9_3339=fract(l9_3337);
float l9_3340=l9_3337-l9_3339;
float l9_3341=step(0.25,fract(l9_3340*0.5));
l9_3337=mix(l9_3339,1.0-l9_3339,fast::clamp(l9_3341,0.0,1.0));
}
}
l9_3326.x=l9_3337;
float l9_3342=l9_3326.y;
int l9_3343=l9_3329.y;
if (l9_3343==1)
{
l9_3342=fract(l9_3342);
}
else
{
if (l9_3343==2)
{
float l9_3344=fract(l9_3342);
float l9_3345=l9_3342-l9_3344;
float l9_3346=step(0.25,fract(l9_3345*0.5));
l9_3342=mix(l9_3344,1.0-l9_3344,fast::clamp(l9_3346,0.0,1.0));
}
}
l9_3326.y=l9_3342;
if (l9_3330)
{
bool l9_3347=l9_3332;
bool l9_3348;
if (l9_3347)
{
l9_3348=l9_3329.x==3;
}
else
{
l9_3348=l9_3347;
}
float l9_3349=l9_3326.x;
float l9_3350=l9_3331.x;
float l9_3351=l9_3331.z;
bool l9_3352=l9_3348;
float l9_3353=l9_3336;
float l9_3354=fast::clamp(l9_3349,l9_3350,l9_3351);
float l9_3355=step(abs(l9_3349-l9_3354),9.9999997e-06);
l9_3353*=(l9_3355+((1.0-float(l9_3352))*(1.0-l9_3355)));
l9_3349=l9_3354;
l9_3326.x=l9_3349;
l9_3336=l9_3353;
bool l9_3356=l9_3332;
bool l9_3357;
if (l9_3356)
{
l9_3357=l9_3329.y==3;
}
else
{
l9_3357=l9_3356;
}
float l9_3358=l9_3326.y;
float l9_3359=l9_3331.y;
float l9_3360=l9_3331.w;
bool l9_3361=l9_3357;
float l9_3362=l9_3336;
float l9_3363=fast::clamp(l9_3358,l9_3359,l9_3360);
float l9_3364=step(abs(l9_3358-l9_3363),9.9999997e-06);
l9_3362*=(l9_3364+((1.0-float(l9_3361))*(1.0-l9_3364)));
l9_3358=l9_3363;
l9_3326.y=l9_3358;
l9_3336=l9_3362;
}
float2 l9_3365=l9_3326;
bool l9_3366=l9_3327;
float3x3 l9_3367=l9_3328;
if (l9_3366)
{
l9_3365=float2((l9_3367*float3(l9_3365,1.0)).xy);
}
float2 l9_3368=l9_3365;
l9_3326=l9_3368;
float l9_3369=l9_3326.x;
int l9_3370=l9_3329.x;
bool l9_3371=l9_3335;
float l9_3372=l9_3336;
if ((l9_3370==0)||(l9_3370==3))
{
float l9_3373=l9_3369;
float l9_3374=0.0;
float l9_3375=1.0;
bool l9_3376=l9_3371;
float l9_3377=l9_3372;
float l9_3378=fast::clamp(l9_3373,l9_3374,l9_3375);
float l9_3379=step(abs(l9_3373-l9_3378),9.9999997e-06);
l9_3377*=(l9_3379+((1.0-float(l9_3376))*(1.0-l9_3379)));
l9_3373=l9_3378;
l9_3369=l9_3373;
l9_3372=l9_3377;
}
l9_3326.x=l9_3369;
l9_3336=l9_3372;
float l9_3380=l9_3326.y;
int l9_3381=l9_3329.y;
bool l9_3382=l9_3335;
float l9_3383=l9_3336;
if ((l9_3381==0)||(l9_3381==3))
{
float l9_3384=l9_3380;
float l9_3385=0.0;
float l9_3386=1.0;
bool l9_3387=l9_3382;
float l9_3388=l9_3383;
float l9_3389=fast::clamp(l9_3384,l9_3385,l9_3386);
float l9_3390=step(abs(l9_3384-l9_3389),9.9999997e-06);
l9_3388*=(l9_3390+((1.0-float(l9_3387))*(1.0-l9_3390)));
l9_3384=l9_3389;
l9_3380=l9_3384;
l9_3383=l9_3388;
}
l9_3326.y=l9_3380;
l9_3336=l9_3383;
float2 l9_3391=l9_3326;
int l9_3392=l9_3324;
int l9_3393=l9_3325;
float l9_3394=l9_3334;
float2 l9_3395=l9_3391;
int l9_3396=l9_3392;
int l9_3397=l9_3393;
float3 l9_3398=float3(0.0);
if (l9_3396==0)
{
l9_3398=float3(l9_3395,0.0);
}
else
{
if (l9_3396==1)
{
l9_3398=float3(l9_3395.x,(l9_3395.y*0.5)+(0.5-(float(l9_3397)*0.5)),0.0);
}
else
{
l9_3398=float3(l9_3395,float(l9_3397));
}
}
float3 l9_3399=l9_3398;
float3 l9_3400=l9_3399;
float4 l9_3401=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_3400.xy,bias(l9_3394));
float4 l9_3402=l9_3401;
if (l9_3332)
{
l9_3402=mix(l9_3333,l9_3402,float4(l9_3336));
}
float4 l9_3403=l9_3402;
l9_3317=l9_3403;
float l9_3404=0.0;
l9_3404=l9_3317.x;
float l9_3405=0.0;
l9_3405=step(l9_3404,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_3406=0.0;
l9_3406=step(l9_3404,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_3407=0.0;
l9_3407=l9_3405-l9_3406;
l9_3310=float4(l9_3407);
l9_3315=l9_3310;
}
else
{
l9_3315=l9_3311;
}
l9_3308=l9_3315;
float4 l9_3408=float4(0.0);
l9_3408=l9_3306*l9_3308;
l9_3081=l9_3408;
l9_3085=l9_3081;
}
l9_3078=l9_3085;
float4 l9_3409=float4(0.0);
float l9_3410=0.0;
float4 l9_3411=float4(0.0);
float4 l9_3412=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_3413=l9_3064;
float l9_3414=0.0;
float l9_3415=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_3414=l9_3415;
l9_3410=l9_3414;
float4 l9_3416;
if ((l9_3410*1.0)!=0.0)
{
float2 l9_3417=float2(0.0);
l9_3417=l9_3413.Surface_UVCoord0;
float4 l9_3418=float4(0.0);
int l9_3419;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_3420=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3420=0;
}
else
{
l9_3420=in.varStereoViewID;
}
int l9_3421=l9_3420;
l9_3419=1-l9_3421;
}
else
{
int l9_3422=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3422=0;
}
else
{
l9_3422=in.varStereoViewID;
}
int l9_3423=l9_3422;
l9_3419=l9_3423;
}
int l9_3424=l9_3419;
int l9_3425=greyMaskIdLayout_tmp;
int l9_3426=l9_3424;
float2 l9_3427=l9_3417;
bool l9_3428=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_3429=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_3430=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_3431=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_3432=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_3433=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_3434=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_3435=0.0;
bool l9_3436=l9_3433&&(!l9_3431);
float l9_3437=1.0;
float l9_3438=l9_3427.x;
int l9_3439=l9_3430.x;
if (l9_3439==1)
{
l9_3438=fract(l9_3438);
}
else
{
if (l9_3439==2)
{
float l9_3440=fract(l9_3438);
float l9_3441=l9_3438-l9_3440;
float l9_3442=step(0.25,fract(l9_3441*0.5));
l9_3438=mix(l9_3440,1.0-l9_3440,fast::clamp(l9_3442,0.0,1.0));
}
}
l9_3427.x=l9_3438;
float l9_3443=l9_3427.y;
int l9_3444=l9_3430.y;
if (l9_3444==1)
{
l9_3443=fract(l9_3443);
}
else
{
if (l9_3444==2)
{
float l9_3445=fract(l9_3443);
float l9_3446=l9_3443-l9_3445;
float l9_3447=step(0.25,fract(l9_3446*0.5));
l9_3443=mix(l9_3445,1.0-l9_3445,fast::clamp(l9_3447,0.0,1.0));
}
}
l9_3427.y=l9_3443;
if (l9_3431)
{
bool l9_3448=l9_3433;
bool l9_3449;
if (l9_3448)
{
l9_3449=l9_3430.x==3;
}
else
{
l9_3449=l9_3448;
}
float l9_3450=l9_3427.x;
float l9_3451=l9_3432.x;
float l9_3452=l9_3432.z;
bool l9_3453=l9_3449;
float l9_3454=l9_3437;
float l9_3455=fast::clamp(l9_3450,l9_3451,l9_3452);
float l9_3456=step(abs(l9_3450-l9_3455),9.9999997e-06);
l9_3454*=(l9_3456+((1.0-float(l9_3453))*(1.0-l9_3456)));
l9_3450=l9_3455;
l9_3427.x=l9_3450;
l9_3437=l9_3454;
bool l9_3457=l9_3433;
bool l9_3458;
if (l9_3457)
{
l9_3458=l9_3430.y==3;
}
else
{
l9_3458=l9_3457;
}
float l9_3459=l9_3427.y;
float l9_3460=l9_3432.y;
float l9_3461=l9_3432.w;
bool l9_3462=l9_3458;
float l9_3463=l9_3437;
float l9_3464=fast::clamp(l9_3459,l9_3460,l9_3461);
float l9_3465=step(abs(l9_3459-l9_3464),9.9999997e-06);
l9_3463*=(l9_3465+((1.0-float(l9_3462))*(1.0-l9_3465)));
l9_3459=l9_3464;
l9_3427.y=l9_3459;
l9_3437=l9_3463;
}
float2 l9_3466=l9_3427;
bool l9_3467=l9_3428;
float3x3 l9_3468=l9_3429;
if (l9_3467)
{
l9_3466=float2((l9_3468*float3(l9_3466,1.0)).xy);
}
float2 l9_3469=l9_3466;
l9_3427=l9_3469;
float l9_3470=l9_3427.x;
int l9_3471=l9_3430.x;
bool l9_3472=l9_3436;
float l9_3473=l9_3437;
if ((l9_3471==0)||(l9_3471==3))
{
float l9_3474=l9_3470;
float l9_3475=0.0;
float l9_3476=1.0;
bool l9_3477=l9_3472;
float l9_3478=l9_3473;
float l9_3479=fast::clamp(l9_3474,l9_3475,l9_3476);
float l9_3480=step(abs(l9_3474-l9_3479),9.9999997e-06);
l9_3478*=(l9_3480+((1.0-float(l9_3477))*(1.0-l9_3480)));
l9_3474=l9_3479;
l9_3470=l9_3474;
l9_3473=l9_3478;
}
l9_3427.x=l9_3470;
l9_3437=l9_3473;
float l9_3481=l9_3427.y;
int l9_3482=l9_3430.y;
bool l9_3483=l9_3436;
float l9_3484=l9_3437;
if ((l9_3482==0)||(l9_3482==3))
{
float l9_3485=l9_3481;
float l9_3486=0.0;
float l9_3487=1.0;
bool l9_3488=l9_3483;
float l9_3489=l9_3484;
float l9_3490=fast::clamp(l9_3485,l9_3486,l9_3487);
float l9_3491=step(abs(l9_3485-l9_3490),9.9999997e-06);
l9_3489*=(l9_3491+((1.0-float(l9_3488))*(1.0-l9_3491)));
l9_3485=l9_3490;
l9_3481=l9_3485;
l9_3484=l9_3489;
}
l9_3427.y=l9_3481;
l9_3437=l9_3484;
float2 l9_3492=l9_3427;
int l9_3493=l9_3425;
int l9_3494=l9_3426;
float l9_3495=l9_3435;
float2 l9_3496=l9_3492;
int l9_3497=l9_3493;
int l9_3498=l9_3494;
float3 l9_3499=float3(0.0);
if (l9_3497==0)
{
l9_3499=float3(l9_3496,0.0);
}
else
{
if (l9_3497==1)
{
l9_3499=float3(l9_3496.x,(l9_3496.y*0.5)+(0.5-(float(l9_3498)*0.5)),0.0);
}
else
{
l9_3499=float3(l9_3496,float(l9_3498));
}
}
float3 l9_3500=l9_3499;
float3 l9_3501=l9_3500;
float4 l9_3502=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_3501.xy,bias(l9_3495));
float4 l9_3503=l9_3502;
if (l9_3433)
{
l9_3503=mix(l9_3434,l9_3503,float4(l9_3437));
}
float4 l9_3504=l9_3503;
l9_3418=l9_3504;
float l9_3505=0.0;
l9_3505=l9_3418.x;
float l9_3506=0.0;
l9_3506=step(l9_3505,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_3507=0.0;
l9_3507=step(l9_3505,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_3508=0.0;
l9_3508=l9_3506-l9_3507;
l9_3411=float4(l9_3508);
l9_3416=l9_3411;
}
else
{
l9_3416=l9_3412;
}
l9_3409=l9_3416;
float4 l9_3509=float4(0.0);
l9_3509=l9_3078*l9_3409;
float4 l9_3510=float4(0.0);
float4 l9_3511=(*sc_set0.UserUniforms).colorId02;
l9_3510=l9_3511;
float4 l9_3512=float4(0.0);
l9_3512=l9_3510*l9_3409;
float4 l9_3513=float4(0.0);
float4 l9_3514=l9_3509;
float4 l9_3515=l9_3512;
float4 l9_3516=l9_3514;
float4 l9_3517=l9_3515;
float3 l9_3518=l9_3516.xyz*l9_3516.w;
l9_3516=float4(l9_3518.x,l9_3518.y,l9_3518.z,l9_3516.w);
float4 l9_3519=l9_3516+(l9_3517*(1.0-l9_3516.w));
l9_3513=l9_3519;
float4 l9_3520=float4(0.0);
l9_3520=float4(l9_3072)*l9_3513;
float4 l9_3521=float4(0.0);
l9_3521=l9_3520+l9_3513;
l9_3062=l9_3521;
l9_3067=l9_3062;
}
else
{
float4 l9_3522=float4(0.0);
float l9_3523=0.0;
float4 l9_3524=float4(0.0);
float4 l9_3525=float4(0.0);
ssGlobals l9_3526=l9_3064;
float l9_3527=0.0;
float l9_3528=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_3527=l9_3528;
l9_3523=l9_3527;
float4 l9_3529;
if ((l9_3523*1.0)!=0.0)
{
float4 l9_3530=float4(0.0);
float4 l9_3531=(*sc_set0.UserUniforms).patternColorId02;
l9_3530=l9_3531;
float4 l9_3532=float4(0.0);
float l9_3533=0.0;
float4 l9_3534=float4(0.0);
float4 l9_3535=float4(0.0);
ssGlobals l9_3536=l9_3526;
float l9_3537=0.0;
float l9_3538=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_3537=l9_3538;
l9_3533=l9_3537;
float4 l9_3539;
if ((l9_3533*1.0)!=0.0)
{
float2 l9_3540=float2(0.0);
l9_3540=l9_3536.Surface_UVCoord0;
float2 l9_3541=float2(0.0);
float2 l9_3542=(*sc_set0.UserUniforms).patternScaleId02;
l9_3541=l9_3542;
float2 l9_3543=float2(0.0);
l9_3543=((l9_3540-(*sc_set0.UserUniforms).Port_Center_N282)*l9_3541)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_3544=float2(0.0);
float2 l9_3545=(*sc_set0.UserUniforms).patternOffsetId02;
l9_3544=l9_3545;
float2 l9_3546=float2(0.0);
l9_3546=l9_3543+l9_3544;
float l9_3547=0.0;
float l9_3548=(*sc_set0.UserUniforms).patternRotateId02;
l9_3547=l9_3548;
float2 l9_3549=float2(0.0);
float2 l9_3550=l9_3546;
float l9_3551=l9_3547;
float2 l9_3552=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_3553=sin(radians(l9_3551));
float l9_3554=cos(radians(l9_3551));
float2 l9_3555=l9_3550-l9_3552;
l9_3555=float2(dot(float2(l9_3554,l9_3553),l9_3555),dot(float2(-l9_3553,l9_3554),l9_3555))+l9_3552;
l9_3549=l9_3555;
float4 l9_3556=float4(0.0);
int l9_3557;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_3558=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3558=0;
}
else
{
l9_3558=in.varStereoViewID;
}
int l9_3559=l9_3558;
l9_3557=1-l9_3559;
}
else
{
int l9_3560=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3560=0;
}
else
{
l9_3560=in.varStereoViewID;
}
int l9_3561=l9_3560;
l9_3557=l9_3561;
}
int l9_3562=l9_3557;
int l9_3563=patternTextureId02Layout_tmp;
int l9_3564=l9_3562;
float2 l9_3565=l9_3549;
bool l9_3566=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_3567=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_3568=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_3569=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_3570=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_3571=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_3572=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_3573=0.0;
bool l9_3574=l9_3571&&(!l9_3569);
float l9_3575=1.0;
float l9_3576=l9_3565.x;
int l9_3577=l9_3568.x;
if (l9_3577==1)
{
l9_3576=fract(l9_3576);
}
else
{
if (l9_3577==2)
{
float l9_3578=fract(l9_3576);
float l9_3579=l9_3576-l9_3578;
float l9_3580=step(0.25,fract(l9_3579*0.5));
l9_3576=mix(l9_3578,1.0-l9_3578,fast::clamp(l9_3580,0.0,1.0));
}
}
l9_3565.x=l9_3576;
float l9_3581=l9_3565.y;
int l9_3582=l9_3568.y;
if (l9_3582==1)
{
l9_3581=fract(l9_3581);
}
else
{
if (l9_3582==2)
{
float l9_3583=fract(l9_3581);
float l9_3584=l9_3581-l9_3583;
float l9_3585=step(0.25,fract(l9_3584*0.5));
l9_3581=mix(l9_3583,1.0-l9_3583,fast::clamp(l9_3585,0.0,1.0));
}
}
l9_3565.y=l9_3581;
if (l9_3569)
{
bool l9_3586=l9_3571;
bool l9_3587;
if (l9_3586)
{
l9_3587=l9_3568.x==3;
}
else
{
l9_3587=l9_3586;
}
float l9_3588=l9_3565.x;
float l9_3589=l9_3570.x;
float l9_3590=l9_3570.z;
bool l9_3591=l9_3587;
float l9_3592=l9_3575;
float l9_3593=fast::clamp(l9_3588,l9_3589,l9_3590);
float l9_3594=step(abs(l9_3588-l9_3593),9.9999997e-06);
l9_3592*=(l9_3594+((1.0-float(l9_3591))*(1.0-l9_3594)));
l9_3588=l9_3593;
l9_3565.x=l9_3588;
l9_3575=l9_3592;
bool l9_3595=l9_3571;
bool l9_3596;
if (l9_3595)
{
l9_3596=l9_3568.y==3;
}
else
{
l9_3596=l9_3595;
}
float l9_3597=l9_3565.y;
float l9_3598=l9_3570.y;
float l9_3599=l9_3570.w;
bool l9_3600=l9_3596;
float l9_3601=l9_3575;
float l9_3602=fast::clamp(l9_3597,l9_3598,l9_3599);
float l9_3603=step(abs(l9_3597-l9_3602),9.9999997e-06);
l9_3601*=(l9_3603+((1.0-float(l9_3600))*(1.0-l9_3603)));
l9_3597=l9_3602;
l9_3565.y=l9_3597;
l9_3575=l9_3601;
}
float2 l9_3604=l9_3565;
bool l9_3605=l9_3566;
float3x3 l9_3606=l9_3567;
if (l9_3605)
{
l9_3604=float2((l9_3606*float3(l9_3604,1.0)).xy);
}
float2 l9_3607=l9_3604;
l9_3565=l9_3607;
float l9_3608=l9_3565.x;
int l9_3609=l9_3568.x;
bool l9_3610=l9_3574;
float l9_3611=l9_3575;
if ((l9_3609==0)||(l9_3609==3))
{
float l9_3612=l9_3608;
float l9_3613=0.0;
float l9_3614=1.0;
bool l9_3615=l9_3610;
float l9_3616=l9_3611;
float l9_3617=fast::clamp(l9_3612,l9_3613,l9_3614);
float l9_3618=step(abs(l9_3612-l9_3617),9.9999997e-06);
l9_3616*=(l9_3618+((1.0-float(l9_3615))*(1.0-l9_3618)));
l9_3612=l9_3617;
l9_3608=l9_3612;
l9_3611=l9_3616;
}
l9_3565.x=l9_3608;
l9_3575=l9_3611;
float l9_3619=l9_3565.y;
int l9_3620=l9_3568.y;
bool l9_3621=l9_3574;
float l9_3622=l9_3575;
if ((l9_3620==0)||(l9_3620==3))
{
float l9_3623=l9_3619;
float l9_3624=0.0;
float l9_3625=1.0;
bool l9_3626=l9_3621;
float l9_3627=l9_3622;
float l9_3628=fast::clamp(l9_3623,l9_3624,l9_3625);
float l9_3629=step(abs(l9_3623-l9_3628),9.9999997e-06);
l9_3627*=(l9_3629+((1.0-float(l9_3626))*(1.0-l9_3629)));
l9_3623=l9_3628;
l9_3619=l9_3623;
l9_3622=l9_3627;
}
l9_3565.y=l9_3619;
l9_3575=l9_3622;
float2 l9_3630=l9_3565;
int l9_3631=l9_3563;
int l9_3632=l9_3564;
float l9_3633=l9_3573;
float2 l9_3634=l9_3630;
int l9_3635=l9_3631;
int l9_3636=l9_3632;
float3 l9_3637=float3(0.0);
if (l9_3635==0)
{
l9_3637=float3(l9_3634,0.0);
}
else
{
if (l9_3635==1)
{
l9_3637=float3(l9_3634.x,(l9_3634.y*0.5)+(0.5-(float(l9_3636)*0.5)),0.0);
}
else
{
l9_3637=float3(l9_3634,float(l9_3636));
}
}
float3 l9_3638=l9_3637;
float3 l9_3639=l9_3638;
float4 l9_3640=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_3639.xy,bias(l9_3633));
float4 l9_3641=l9_3640;
if (l9_3571)
{
l9_3641=mix(l9_3572,l9_3641,float4(l9_3575));
}
float4 l9_3642=l9_3641;
l9_3556=l9_3642;
l9_3534=l9_3556;
l9_3539=l9_3534;
}
else
{
float2 l9_3643=float2(0.0);
l9_3643=l9_3536.Surface_UVCoord0;
float2 l9_3644=float2(0.0);
float2 l9_3645=(*sc_set0.UserUniforms).patternScaleId02;
l9_3644=l9_3645;
float2 l9_3646=float2(0.0);
l9_3646=((l9_3643-(*sc_set0.UserUniforms).Port_Center_N282)*l9_3644)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_3647=float2(0.0);
float2 l9_3648=(*sc_set0.UserUniforms).patternOffsetId02;
l9_3647=l9_3648;
float2 l9_3649=float2(0.0);
l9_3649=l9_3646+l9_3647;
float l9_3650=0.0;
float l9_3651=(*sc_set0.UserUniforms).patternRotateId02;
l9_3650=l9_3651;
float2 l9_3652=float2(0.0);
float2 l9_3653=l9_3649;
float l9_3654=l9_3650;
float2 l9_3655=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_3656=sin(radians(l9_3654));
float l9_3657=cos(radians(l9_3654));
float2 l9_3658=l9_3653-l9_3655;
l9_3658=float2(dot(float2(l9_3657,l9_3656),l9_3658),dot(float2(-l9_3656,l9_3657),l9_3658))+l9_3655;
l9_3652=l9_3658;
float4 l9_3659=float4(0.0);
int l9_3660;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_3661=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3661=0;
}
else
{
l9_3661=in.varStereoViewID;
}
int l9_3662=l9_3661;
l9_3660=1-l9_3662;
}
else
{
int l9_3663=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3663=0;
}
else
{
l9_3663=in.varStereoViewID;
}
int l9_3664=l9_3663;
l9_3660=l9_3664;
}
int l9_3665=l9_3660;
int l9_3666=patternTextureId02Layout_tmp;
int l9_3667=l9_3665;
float2 l9_3668=l9_3652;
bool l9_3669=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_3670=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_3671=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_3672=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_3673=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_3674=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_3675=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_3676=0.0;
bool l9_3677=l9_3674&&(!l9_3672);
float l9_3678=1.0;
float l9_3679=l9_3668.x;
int l9_3680=l9_3671.x;
if (l9_3680==1)
{
l9_3679=fract(l9_3679);
}
else
{
if (l9_3680==2)
{
float l9_3681=fract(l9_3679);
float l9_3682=l9_3679-l9_3681;
float l9_3683=step(0.25,fract(l9_3682*0.5));
l9_3679=mix(l9_3681,1.0-l9_3681,fast::clamp(l9_3683,0.0,1.0));
}
}
l9_3668.x=l9_3679;
float l9_3684=l9_3668.y;
int l9_3685=l9_3671.y;
if (l9_3685==1)
{
l9_3684=fract(l9_3684);
}
else
{
if (l9_3685==2)
{
float l9_3686=fract(l9_3684);
float l9_3687=l9_3684-l9_3686;
float l9_3688=step(0.25,fract(l9_3687*0.5));
l9_3684=mix(l9_3686,1.0-l9_3686,fast::clamp(l9_3688,0.0,1.0));
}
}
l9_3668.y=l9_3684;
if (l9_3672)
{
bool l9_3689=l9_3674;
bool l9_3690;
if (l9_3689)
{
l9_3690=l9_3671.x==3;
}
else
{
l9_3690=l9_3689;
}
float l9_3691=l9_3668.x;
float l9_3692=l9_3673.x;
float l9_3693=l9_3673.z;
bool l9_3694=l9_3690;
float l9_3695=l9_3678;
float l9_3696=fast::clamp(l9_3691,l9_3692,l9_3693);
float l9_3697=step(abs(l9_3691-l9_3696),9.9999997e-06);
l9_3695*=(l9_3697+((1.0-float(l9_3694))*(1.0-l9_3697)));
l9_3691=l9_3696;
l9_3668.x=l9_3691;
l9_3678=l9_3695;
bool l9_3698=l9_3674;
bool l9_3699;
if (l9_3698)
{
l9_3699=l9_3671.y==3;
}
else
{
l9_3699=l9_3698;
}
float l9_3700=l9_3668.y;
float l9_3701=l9_3673.y;
float l9_3702=l9_3673.w;
bool l9_3703=l9_3699;
float l9_3704=l9_3678;
float l9_3705=fast::clamp(l9_3700,l9_3701,l9_3702);
float l9_3706=step(abs(l9_3700-l9_3705),9.9999997e-06);
l9_3704*=(l9_3706+((1.0-float(l9_3703))*(1.0-l9_3706)));
l9_3700=l9_3705;
l9_3668.y=l9_3700;
l9_3678=l9_3704;
}
float2 l9_3707=l9_3668;
bool l9_3708=l9_3669;
float3x3 l9_3709=l9_3670;
if (l9_3708)
{
l9_3707=float2((l9_3709*float3(l9_3707,1.0)).xy);
}
float2 l9_3710=l9_3707;
l9_3668=l9_3710;
float l9_3711=l9_3668.x;
int l9_3712=l9_3671.x;
bool l9_3713=l9_3677;
float l9_3714=l9_3678;
if ((l9_3712==0)||(l9_3712==3))
{
float l9_3715=l9_3711;
float l9_3716=0.0;
float l9_3717=1.0;
bool l9_3718=l9_3713;
float l9_3719=l9_3714;
float l9_3720=fast::clamp(l9_3715,l9_3716,l9_3717);
float l9_3721=step(abs(l9_3715-l9_3720),9.9999997e-06);
l9_3719*=(l9_3721+((1.0-float(l9_3718))*(1.0-l9_3721)));
l9_3715=l9_3720;
l9_3711=l9_3715;
l9_3714=l9_3719;
}
l9_3668.x=l9_3711;
l9_3678=l9_3714;
float l9_3722=l9_3668.y;
int l9_3723=l9_3671.y;
bool l9_3724=l9_3677;
float l9_3725=l9_3678;
if ((l9_3723==0)||(l9_3723==3))
{
float l9_3726=l9_3722;
float l9_3727=0.0;
float l9_3728=1.0;
bool l9_3729=l9_3724;
float l9_3730=l9_3725;
float l9_3731=fast::clamp(l9_3726,l9_3727,l9_3728);
float l9_3732=step(abs(l9_3726-l9_3731),9.9999997e-06);
l9_3730*=(l9_3732+((1.0-float(l9_3729))*(1.0-l9_3732)));
l9_3726=l9_3731;
l9_3722=l9_3726;
l9_3725=l9_3730;
}
l9_3668.y=l9_3722;
l9_3678=l9_3725;
float2 l9_3733=l9_3668;
int l9_3734=l9_3666;
int l9_3735=l9_3667;
float l9_3736=l9_3676;
float2 l9_3737=l9_3733;
int l9_3738=l9_3734;
int l9_3739=l9_3735;
float3 l9_3740=float3(0.0);
if (l9_3738==0)
{
l9_3740=float3(l9_3737,0.0);
}
else
{
if (l9_3738==1)
{
l9_3740=float3(l9_3737.x,(l9_3737.y*0.5)+(0.5-(float(l9_3739)*0.5)),0.0);
}
else
{
l9_3740=float3(l9_3737,float(l9_3739));
}
}
float3 l9_3741=l9_3740;
float3 l9_3742=l9_3741;
float4 l9_3743=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_3742.xy,bias(l9_3736));
float4 l9_3744=l9_3743;
if (l9_3674)
{
l9_3744=mix(l9_3675,l9_3744,float4(l9_3678));
}
float4 l9_3745=l9_3744;
l9_3659=l9_3745;
float l9_3746=0.0;
float3 l9_3747=l9_3659.xyz;
float l9_3748=l9_3747.x;
l9_3746=l9_3748;
l9_3535=float4(l9_3746);
l9_3539=l9_3535;
}
l9_3532=l9_3539;
float4 l9_3749=float4(0.0);
l9_3749=l9_3530*l9_3532;
l9_3524=l9_3749;
l9_3529=l9_3524;
}
else
{
float4 l9_3750=float4(0.0);
float4 l9_3751=(*sc_set0.UserUniforms).colorId02;
l9_3750=l9_3751;
float4 l9_3752=float4(0.0);
float l9_3753=0.0;
float4 l9_3754=float4(0.0);
float4 l9_3755=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_3756=l9_3526;
float l9_3757=0.0;
float l9_3758=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_3757=l9_3758;
l9_3753=l9_3757;
float4 l9_3759;
if ((l9_3753*1.0)!=0.0)
{
float2 l9_3760=float2(0.0);
l9_3760=l9_3756.Surface_UVCoord0;
float4 l9_3761=float4(0.0);
int l9_3762;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_3763=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3763=0;
}
else
{
l9_3763=in.varStereoViewID;
}
int l9_3764=l9_3763;
l9_3762=1-l9_3764;
}
else
{
int l9_3765=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3765=0;
}
else
{
l9_3765=in.varStereoViewID;
}
int l9_3766=l9_3765;
l9_3762=l9_3766;
}
int l9_3767=l9_3762;
int l9_3768=greyMaskIdLayout_tmp;
int l9_3769=l9_3767;
float2 l9_3770=l9_3760;
bool l9_3771=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_3772=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_3773=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_3774=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_3775=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_3776=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_3777=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_3778=0.0;
bool l9_3779=l9_3776&&(!l9_3774);
float l9_3780=1.0;
float l9_3781=l9_3770.x;
int l9_3782=l9_3773.x;
if (l9_3782==1)
{
l9_3781=fract(l9_3781);
}
else
{
if (l9_3782==2)
{
float l9_3783=fract(l9_3781);
float l9_3784=l9_3781-l9_3783;
float l9_3785=step(0.25,fract(l9_3784*0.5));
l9_3781=mix(l9_3783,1.0-l9_3783,fast::clamp(l9_3785,0.0,1.0));
}
}
l9_3770.x=l9_3781;
float l9_3786=l9_3770.y;
int l9_3787=l9_3773.y;
if (l9_3787==1)
{
l9_3786=fract(l9_3786);
}
else
{
if (l9_3787==2)
{
float l9_3788=fract(l9_3786);
float l9_3789=l9_3786-l9_3788;
float l9_3790=step(0.25,fract(l9_3789*0.5));
l9_3786=mix(l9_3788,1.0-l9_3788,fast::clamp(l9_3790,0.0,1.0));
}
}
l9_3770.y=l9_3786;
if (l9_3774)
{
bool l9_3791=l9_3776;
bool l9_3792;
if (l9_3791)
{
l9_3792=l9_3773.x==3;
}
else
{
l9_3792=l9_3791;
}
float l9_3793=l9_3770.x;
float l9_3794=l9_3775.x;
float l9_3795=l9_3775.z;
bool l9_3796=l9_3792;
float l9_3797=l9_3780;
float l9_3798=fast::clamp(l9_3793,l9_3794,l9_3795);
float l9_3799=step(abs(l9_3793-l9_3798),9.9999997e-06);
l9_3797*=(l9_3799+((1.0-float(l9_3796))*(1.0-l9_3799)));
l9_3793=l9_3798;
l9_3770.x=l9_3793;
l9_3780=l9_3797;
bool l9_3800=l9_3776;
bool l9_3801;
if (l9_3800)
{
l9_3801=l9_3773.y==3;
}
else
{
l9_3801=l9_3800;
}
float l9_3802=l9_3770.y;
float l9_3803=l9_3775.y;
float l9_3804=l9_3775.w;
bool l9_3805=l9_3801;
float l9_3806=l9_3780;
float l9_3807=fast::clamp(l9_3802,l9_3803,l9_3804);
float l9_3808=step(abs(l9_3802-l9_3807),9.9999997e-06);
l9_3806*=(l9_3808+((1.0-float(l9_3805))*(1.0-l9_3808)));
l9_3802=l9_3807;
l9_3770.y=l9_3802;
l9_3780=l9_3806;
}
float2 l9_3809=l9_3770;
bool l9_3810=l9_3771;
float3x3 l9_3811=l9_3772;
if (l9_3810)
{
l9_3809=float2((l9_3811*float3(l9_3809,1.0)).xy);
}
float2 l9_3812=l9_3809;
l9_3770=l9_3812;
float l9_3813=l9_3770.x;
int l9_3814=l9_3773.x;
bool l9_3815=l9_3779;
float l9_3816=l9_3780;
if ((l9_3814==0)||(l9_3814==3))
{
float l9_3817=l9_3813;
float l9_3818=0.0;
float l9_3819=1.0;
bool l9_3820=l9_3815;
float l9_3821=l9_3816;
float l9_3822=fast::clamp(l9_3817,l9_3818,l9_3819);
float l9_3823=step(abs(l9_3817-l9_3822),9.9999997e-06);
l9_3821*=(l9_3823+((1.0-float(l9_3820))*(1.0-l9_3823)));
l9_3817=l9_3822;
l9_3813=l9_3817;
l9_3816=l9_3821;
}
l9_3770.x=l9_3813;
l9_3780=l9_3816;
float l9_3824=l9_3770.y;
int l9_3825=l9_3773.y;
bool l9_3826=l9_3779;
float l9_3827=l9_3780;
if ((l9_3825==0)||(l9_3825==3))
{
float l9_3828=l9_3824;
float l9_3829=0.0;
float l9_3830=1.0;
bool l9_3831=l9_3826;
float l9_3832=l9_3827;
float l9_3833=fast::clamp(l9_3828,l9_3829,l9_3830);
float l9_3834=step(abs(l9_3828-l9_3833),9.9999997e-06);
l9_3832*=(l9_3834+((1.0-float(l9_3831))*(1.0-l9_3834)));
l9_3828=l9_3833;
l9_3824=l9_3828;
l9_3827=l9_3832;
}
l9_3770.y=l9_3824;
l9_3780=l9_3827;
float2 l9_3835=l9_3770;
int l9_3836=l9_3768;
int l9_3837=l9_3769;
float l9_3838=l9_3778;
float2 l9_3839=l9_3835;
int l9_3840=l9_3836;
int l9_3841=l9_3837;
float3 l9_3842=float3(0.0);
if (l9_3840==0)
{
l9_3842=float3(l9_3839,0.0);
}
else
{
if (l9_3840==1)
{
l9_3842=float3(l9_3839.x,(l9_3839.y*0.5)+(0.5-(float(l9_3841)*0.5)),0.0);
}
else
{
l9_3842=float3(l9_3839,float(l9_3841));
}
}
float3 l9_3843=l9_3842;
float3 l9_3844=l9_3843;
float4 l9_3845=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_3844.xy,bias(l9_3838));
float4 l9_3846=l9_3845;
if (l9_3776)
{
l9_3846=mix(l9_3777,l9_3846,float4(l9_3780));
}
float4 l9_3847=l9_3846;
l9_3761=l9_3847;
float l9_3848=0.0;
l9_3848=l9_3761.x;
float l9_3849=0.0;
l9_3849=step(l9_3848,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_3850=0.0;
l9_3850=step(l9_3848,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_3851=0.0;
l9_3851=l9_3849-l9_3850;
l9_3754=float4(l9_3851);
l9_3759=l9_3754;
}
else
{
l9_3759=l9_3755;
}
l9_3752=l9_3759;
float4 l9_3852=float4(0.0);
l9_3852=l9_3750*l9_3752;
l9_3525=l9_3852;
l9_3529=l9_3525;
}
l9_3522=l9_3529;
float4 l9_3853=float4(0.0);
float l9_3854=0.0;
float4 l9_3855=float4(0.0);
float4 l9_3856=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_3857=l9_3064;
float l9_3858=0.0;
float l9_3859=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_3858=l9_3859;
l9_3854=l9_3858;
float4 l9_3860;
if ((l9_3854*1.0)!=0.0)
{
float2 l9_3861=float2(0.0);
l9_3861=l9_3857.Surface_UVCoord0;
float4 l9_3862=float4(0.0);
int l9_3863;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_3864=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3864=0;
}
else
{
l9_3864=in.varStereoViewID;
}
int l9_3865=l9_3864;
l9_3863=1-l9_3865;
}
else
{
int l9_3866=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3866=0;
}
else
{
l9_3866=in.varStereoViewID;
}
int l9_3867=l9_3866;
l9_3863=l9_3867;
}
int l9_3868=l9_3863;
int l9_3869=greyMaskIdLayout_tmp;
int l9_3870=l9_3868;
float2 l9_3871=l9_3861;
bool l9_3872=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_3873=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_3874=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_3875=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_3876=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_3877=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_3878=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_3879=0.0;
bool l9_3880=l9_3877&&(!l9_3875);
float l9_3881=1.0;
float l9_3882=l9_3871.x;
int l9_3883=l9_3874.x;
if (l9_3883==1)
{
l9_3882=fract(l9_3882);
}
else
{
if (l9_3883==2)
{
float l9_3884=fract(l9_3882);
float l9_3885=l9_3882-l9_3884;
float l9_3886=step(0.25,fract(l9_3885*0.5));
l9_3882=mix(l9_3884,1.0-l9_3884,fast::clamp(l9_3886,0.0,1.0));
}
}
l9_3871.x=l9_3882;
float l9_3887=l9_3871.y;
int l9_3888=l9_3874.y;
if (l9_3888==1)
{
l9_3887=fract(l9_3887);
}
else
{
if (l9_3888==2)
{
float l9_3889=fract(l9_3887);
float l9_3890=l9_3887-l9_3889;
float l9_3891=step(0.25,fract(l9_3890*0.5));
l9_3887=mix(l9_3889,1.0-l9_3889,fast::clamp(l9_3891,0.0,1.0));
}
}
l9_3871.y=l9_3887;
if (l9_3875)
{
bool l9_3892=l9_3877;
bool l9_3893;
if (l9_3892)
{
l9_3893=l9_3874.x==3;
}
else
{
l9_3893=l9_3892;
}
float l9_3894=l9_3871.x;
float l9_3895=l9_3876.x;
float l9_3896=l9_3876.z;
bool l9_3897=l9_3893;
float l9_3898=l9_3881;
float l9_3899=fast::clamp(l9_3894,l9_3895,l9_3896);
float l9_3900=step(abs(l9_3894-l9_3899),9.9999997e-06);
l9_3898*=(l9_3900+((1.0-float(l9_3897))*(1.0-l9_3900)));
l9_3894=l9_3899;
l9_3871.x=l9_3894;
l9_3881=l9_3898;
bool l9_3901=l9_3877;
bool l9_3902;
if (l9_3901)
{
l9_3902=l9_3874.y==3;
}
else
{
l9_3902=l9_3901;
}
float l9_3903=l9_3871.y;
float l9_3904=l9_3876.y;
float l9_3905=l9_3876.w;
bool l9_3906=l9_3902;
float l9_3907=l9_3881;
float l9_3908=fast::clamp(l9_3903,l9_3904,l9_3905);
float l9_3909=step(abs(l9_3903-l9_3908),9.9999997e-06);
l9_3907*=(l9_3909+((1.0-float(l9_3906))*(1.0-l9_3909)));
l9_3903=l9_3908;
l9_3871.y=l9_3903;
l9_3881=l9_3907;
}
float2 l9_3910=l9_3871;
bool l9_3911=l9_3872;
float3x3 l9_3912=l9_3873;
if (l9_3911)
{
l9_3910=float2((l9_3912*float3(l9_3910,1.0)).xy);
}
float2 l9_3913=l9_3910;
l9_3871=l9_3913;
float l9_3914=l9_3871.x;
int l9_3915=l9_3874.x;
bool l9_3916=l9_3880;
float l9_3917=l9_3881;
if ((l9_3915==0)||(l9_3915==3))
{
float l9_3918=l9_3914;
float l9_3919=0.0;
float l9_3920=1.0;
bool l9_3921=l9_3916;
float l9_3922=l9_3917;
float l9_3923=fast::clamp(l9_3918,l9_3919,l9_3920);
float l9_3924=step(abs(l9_3918-l9_3923),9.9999997e-06);
l9_3922*=(l9_3924+((1.0-float(l9_3921))*(1.0-l9_3924)));
l9_3918=l9_3923;
l9_3914=l9_3918;
l9_3917=l9_3922;
}
l9_3871.x=l9_3914;
l9_3881=l9_3917;
float l9_3925=l9_3871.y;
int l9_3926=l9_3874.y;
bool l9_3927=l9_3880;
float l9_3928=l9_3881;
if ((l9_3926==0)||(l9_3926==3))
{
float l9_3929=l9_3925;
float l9_3930=0.0;
float l9_3931=1.0;
bool l9_3932=l9_3927;
float l9_3933=l9_3928;
float l9_3934=fast::clamp(l9_3929,l9_3930,l9_3931);
float l9_3935=step(abs(l9_3929-l9_3934),9.9999997e-06);
l9_3933*=(l9_3935+((1.0-float(l9_3932))*(1.0-l9_3935)));
l9_3929=l9_3934;
l9_3925=l9_3929;
l9_3928=l9_3933;
}
l9_3871.y=l9_3925;
l9_3881=l9_3928;
float2 l9_3936=l9_3871;
int l9_3937=l9_3869;
int l9_3938=l9_3870;
float l9_3939=l9_3879;
float2 l9_3940=l9_3936;
int l9_3941=l9_3937;
int l9_3942=l9_3938;
float3 l9_3943=float3(0.0);
if (l9_3941==0)
{
l9_3943=float3(l9_3940,0.0);
}
else
{
if (l9_3941==1)
{
l9_3943=float3(l9_3940.x,(l9_3940.y*0.5)+(0.5-(float(l9_3942)*0.5)),0.0);
}
else
{
l9_3943=float3(l9_3940,float(l9_3942));
}
}
float3 l9_3944=l9_3943;
float3 l9_3945=l9_3944;
float4 l9_3946=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_3945.xy,bias(l9_3939));
float4 l9_3947=l9_3946;
if (l9_3877)
{
l9_3947=mix(l9_3878,l9_3947,float4(l9_3881));
}
float4 l9_3948=l9_3947;
l9_3862=l9_3948;
float l9_3949=0.0;
l9_3949=l9_3862.x;
float l9_3950=0.0;
l9_3950=step(l9_3949,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_3951=0.0;
l9_3951=step(l9_3949,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_3952=0.0;
l9_3952=l9_3950-l9_3951;
l9_3855=float4(l9_3952);
l9_3860=l9_3855;
}
else
{
l9_3860=l9_3856;
}
l9_3853=l9_3860;
float4 l9_3953=float4(0.0);
l9_3953=l9_3522*l9_3853;
float4 l9_3954=float4(0.0);
float4 l9_3955=(*sc_set0.UserUniforms).colorId02;
l9_3954=l9_3955;
float4 l9_3956=float4(0.0);
l9_3956=l9_3954*l9_3853;
float4 l9_3957=float4(0.0);
float4 l9_3958=l9_3953;
float4 l9_3959=l9_3956;
float4 l9_3960=l9_3958;
float4 l9_3961=l9_3959;
float3 l9_3962=l9_3960.xyz*l9_3960.w;
l9_3960=float4(l9_3962.x,l9_3962.y,l9_3962.z,l9_3960.w);
float4 l9_3963=l9_3960+(l9_3961*(1.0-l9_3960.w));
l9_3957=l9_3963;
l9_3063=l9_3957;
l9_3067=l9_3063;
}
l9_3060=l9_3067;
l9_2123=l9_3060;
l9_2127=l9_2123;
}
l9_2120=l9_2127;
float4 l9_3964=float4(0.0);
float l9_3965=0.0;
float4 l9_3966=float4(0.0);
float4 l9_3967=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_3968=l9_2116;
float l9_3969=0.0;
float l9_3970=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_3969=l9_3970;
l9_3965=l9_3969;
float4 l9_3971;
if ((l9_3965*1.0)!=0.0)
{
float2 l9_3972=float2(0.0);
l9_3972=l9_3968.Surface_UVCoord0;
float4 l9_3973=float4(0.0);
int l9_3974;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_3975=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3975=0;
}
else
{
l9_3975=in.varStereoViewID;
}
int l9_3976=l9_3975;
l9_3974=1-l9_3976;
}
else
{
int l9_3977=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3977=0;
}
else
{
l9_3977=in.varStereoViewID;
}
int l9_3978=l9_3977;
l9_3974=l9_3978;
}
int l9_3979=l9_3974;
int l9_3980=greyMaskIdLayout_tmp;
int l9_3981=l9_3979;
float2 l9_3982=l9_3972;
bool l9_3983=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_3984=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_3985=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_3986=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_3987=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_3988=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_3989=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_3990=0.0;
bool l9_3991=l9_3988&&(!l9_3986);
float l9_3992=1.0;
float l9_3993=l9_3982.x;
int l9_3994=l9_3985.x;
if (l9_3994==1)
{
l9_3993=fract(l9_3993);
}
else
{
if (l9_3994==2)
{
float l9_3995=fract(l9_3993);
float l9_3996=l9_3993-l9_3995;
float l9_3997=step(0.25,fract(l9_3996*0.5));
l9_3993=mix(l9_3995,1.0-l9_3995,fast::clamp(l9_3997,0.0,1.0));
}
}
l9_3982.x=l9_3993;
float l9_3998=l9_3982.y;
int l9_3999=l9_3985.y;
if (l9_3999==1)
{
l9_3998=fract(l9_3998);
}
else
{
if (l9_3999==2)
{
float l9_4000=fract(l9_3998);
float l9_4001=l9_3998-l9_4000;
float l9_4002=step(0.25,fract(l9_4001*0.5));
l9_3998=mix(l9_4000,1.0-l9_4000,fast::clamp(l9_4002,0.0,1.0));
}
}
l9_3982.y=l9_3998;
if (l9_3986)
{
bool l9_4003=l9_3988;
bool l9_4004;
if (l9_4003)
{
l9_4004=l9_3985.x==3;
}
else
{
l9_4004=l9_4003;
}
float l9_4005=l9_3982.x;
float l9_4006=l9_3987.x;
float l9_4007=l9_3987.z;
bool l9_4008=l9_4004;
float l9_4009=l9_3992;
float l9_4010=fast::clamp(l9_4005,l9_4006,l9_4007);
float l9_4011=step(abs(l9_4005-l9_4010),9.9999997e-06);
l9_4009*=(l9_4011+((1.0-float(l9_4008))*(1.0-l9_4011)));
l9_4005=l9_4010;
l9_3982.x=l9_4005;
l9_3992=l9_4009;
bool l9_4012=l9_3988;
bool l9_4013;
if (l9_4012)
{
l9_4013=l9_3985.y==3;
}
else
{
l9_4013=l9_4012;
}
float l9_4014=l9_3982.y;
float l9_4015=l9_3987.y;
float l9_4016=l9_3987.w;
bool l9_4017=l9_4013;
float l9_4018=l9_3992;
float l9_4019=fast::clamp(l9_4014,l9_4015,l9_4016);
float l9_4020=step(abs(l9_4014-l9_4019),9.9999997e-06);
l9_4018*=(l9_4020+((1.0-float(l9_4017))*(1.0-l9_4020)));
l9_4014=l9_4019;
l9_3982.y=l9_4014;
l9_3992=l9_4018;
}
float2 l9_4021=l9_3982;
bool l9_4022=l9_3983;
float3x3 l9_4023=l9_3984;
if (l9_4022)
{
l9_4021=float2((l9_4023*float3(l9_4021,1.0)).xy);
}
float2 l9_4024=l9_4021;
l9_3982=l9_4024;
float l9_4025=l9_3982.x;
int l9_4026=l9_3985.x;
bool l9_4027=l9_3991;
float l9_4028=l9_3992;
if ((l9_4026==0)||(l9_4026==3))
{
float l9_4029=l9_4025;
float l9_4030=0.0;
float l9_4031=1.0;
bool l9_4032=l9_4027;
float l9_4033=l9_4028;
float l9_4034=fast::clamp(l9_4029,l9_4030,l9_4031);
float l9_4035=step(abs(l9_4029-l9_4034),9.9999997e-06);
l9_4033*=(l9_4035+((1.0-float(l9_4032))*(1.0-l9_4035)));
l9_4029=l9_4034;
l9_4025=l9_4029;
l9_4028=l9_4033;
}
l9_3982.x=l9_4025;
l9_3992=l9_4028;
float l9_4036=l9_3982.y;
int l9_4037=l9_3985.y;
bool l9_4038=l9_3991;
float l9_4039=l9_3992;
if ((l9_4037==0)||(l9_4037==3))
{
float l9_4040=l9_4036;
float l9_4041=0.0;
float l9_4042=1.0;
bool l9_4043=l9_4038;
float l9_4044=l9_4039;
float l9_4045=fast::clamp(l9_4040,l9_4041,l9_4042);
float l9_4046=step(abs(l9_4040-l9_4045),9.9999997e-06);
l9_4044*=(l9_4046+((1.0-float(l9_4043))*(1.0-l9_4046)));
l9_4040=l9_4045;
l9_4036=l9_4040;
l9_4039=l9_4044;
}
l9_3982.y=l9_4036;
l9_3992=l9_4039;
float2 l9_4047=l9_3982;
int l9_4048=l9_3980;
int l9_4049=l9_3981;
float l9_4050=l9_3990;
float2 l9_4051=l9_4047;
int l9_4052=l9_4048;
int l9_4053=l9_4049;
float3 l9_4054=float3(0.0);
if (l9_4052==0)
{
l9_4054=float3(l9_4051,0.0);
}
else
{
if (l9_4052==1)
{
l9_4054=float3(l9_4051.x,(l9_4051.y*0.5)+(0.5-(float(l9_4053)*0.5)),0.0);
}
else
{
l9_4054=float3(l9_4051,float(l9_4053));
}
}
float3 l9_4055=l9_4054;
float3 l9_4056=l9_4055;
float4 l9_4057=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_4056.xy,bias(l9_4050));
float4 l9_4058=l9_4057;
if (l9_3988)
{
l9_4058=mix(l9_3989,l9_4058,float4(l9_3992));
}
float4 l9_4059=l9_4058;
l9_3973=l9_4059;
float l9_4060=0.0;
l9_4060=l9_3973.x;
float l9_4061=0.0;
l9_4061=step(l9_4060,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_4062=0.0;
l9_4062=step(l9_4060,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_4063=0.0;
l9_4063=l9_4061-l9_4062;
l9_3966=float4(l9_4063);
l9_3971=l9_3966;
}
else
{
l9_3971=l9_3967;
}
l9_3964=l9_3971;
float4 l9_4064=float4(0.0);
l9_4064=l9_2120*l9_3964;
float4 l9_4065=float4(0.0);
float l9_4066=0.0;
float4 l9_4067=float4(0.0);
float4 l9_4068=float4(0.0);
ssGlobals l9_4069=l9_2116;
float l9_4070=0.0;
float l9_4071=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
l9_4070=l9_4071;
l9_4066=l9_4070;
float4 l9_4072;
if ((l9_4066*1.0)!=0.0)
{
float4 l9_4073=float4(0.0);
float l9_4074=0.0;
float4 l9_4075=float4(0.0);
float4 l9_4076=float4(0.0);
ssGlobals l9_4077=l9_4069;
float l9_4078=0.0;
float l9_4079=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_4078=l9_4079;
l9_4074=l9_4078;
float4 l9_4080;
if ((l9_4074*1.0)!=0.0)
{
float l9_4081=0.0;
float l9_4082=(*sc_set0.UserUniforms).rimExpId01;
l9_4081=l9_4082;
float l9_4083=0.0;
float l9_4084=(*sc_set0.UserUniforms).rimIntId01;
l9_4083=l9_4084;
float l9_4085=0.0;
float l9_4086=l9_4081;
float l9_4087=l9_4083;
ssGlobals l9_4088=l9_4077;
float l9_4089=abs(dot(-l9_4088.ViewDirWS,l9_4088.VertexNormal_WorldSpace));
float l9_4090=1.0-pow(1.0-l9_4089,l9_4086);
l9_4090=fast::max(l9_4090,0.0);
l9_4090*=l9_4087;
l9_4085=l9_4090;
float4 l9_4091=float4(0.0);
float l9_4092=0.0;
float4 l9_4093=float4(0.0);
float4 l9_4094=float4(0.0);
ssGlobals l9_4095=l9_4077;
float l9_4096=0.0;
float l9_4097=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_4096=l9_4097;
l9_4092=l9_4096;
float4 l9_4098;
if ((l9_4092*1.0)!=0.0)
{
float4 l9_4099=float4(0.0);
float4 l9_4100=(*sc_set0.UserUniforms).patternColorId01;
l9_4099=l9_4100;
float4 l9_4101=float4(0.0);
float l9_4102=0.0;
float4 l9_4103=float4(0.0);
float4 l9_4104=float4(0.0);
ssGlobals l9_4105=l9_4095;
float l9_4106=0.0;
float l9_4107=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_4106=l9_4107;
l9_4102=l9_4106;
float4 l9_4108;
if ((l9_4102*1.0)!=0.0)
{
float2 l9_4109=float2(0.0);
l9_4109=l9_4105.Surface_UVCoord0;
float2 l9_4110=float2(0.0);
float2 l9_4111=(*sc_set0.UserUniforms).patternScaleId01;
l9_4110=l9_4111;
float2 l9_4112=float2(0.0);
l9_4112=((l9_4109-(*sc_set0.UserUniforms).Port_Center_N122)*l9_4110)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_4113=float2(0.0);
float2 l9_4114=(*sc_set0.UserUniforms).patternOffsetId01;
l9_4113=l9_4114;
float2 l9_4115=float2(0.0);
l9_4115=l9_4112+l9_4113;
float l9_4116=0.0;
float l9_4117=(*sc_set0.UserUniforms).patternRotateId01;
l9_4116=l9_4117;
float2 l9_4118=float2(0.0);
float2 l9_4119=l9_4115;
float l9_4120=l9_4116;
float2 l9_4121=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_4122=sin(radians(l9_4120));
float l9_4123=cos(radians(l9_4120));
float2 l9_4124=l9_4119-l9_4121;
l9_4124=float2(dot(float2(l9_4123,l9_4122),l9_4124),dot(float2(-l9_4122,l9_4123),l9_4124))+l9_4121;
l9_4118=l9_4124;
float4 l9_4125=float4(0.0);
int l9_4126;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_4127=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4127=0;
}
else
{
l9_4127=in.varStereoViewID;
}
int l9_4128=l9_4127;
l9_4126=1-l9_4128;
}
else
{
int l9_4129=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4129=0;
}
else
{
l9_4129=in.varStereoViewID;
}
int l9_4130=l9_4129;
l9_4126=l9_4130;
}
int l9_4131=l9_4126;
int l9_4132=patternTextureId01Layout_tmp;
int l9_4133=l9_4131;
float2 l9_4134=l9_4118;
bool l9_4135=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_4136=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_4137=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_4138=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_4139=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_4140=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_4141=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_4142=0.0;
bool l9_4143=l9_4140&&(!l9_4138);
float l9_4144=1.0;
float l9_4145=l9_4134.x;
int l9_4146=l9_4137.x;
if (l9_4146==1)
{
l9_4145=fract(l9_4145);
}
else
{
if (l9_4146==2)
{
float l9_4147=fract(l9_4145);
float l9_4148=l9_4145-l9_4147;
float l9_4149=step(0.25,fract(l9_4148*0.5));
l9_4145=mix(l9_4147,1.0-l9_4147,fast::clamp(l9_4149,0.0,1.0));
}
}
l9_4134.x=l9_4145;
float l9_4150=l9_4134.y;
int l9_4151=l9_4137.y;
if (l9_4151==1)
{
l9_4150=fract(l9_4150);
}
else
{
if (l9_4151==2)
{
float l9_4152=fract(l9_4150);
float l9_4153=l9_4150-l9_4152;
float l9_4154=step(0.25,fract(l9_4153*0.5));
l9_4150=mix(l9_4152,1.0-l9_4152,fast::clamp(l9_4154,0.0,1.0));
}
}
l9_4134.y=l9_4150;
if (l9_4138)
{
bool l9_4155=l9_4140;
bool l9_4156;
if (l9_4155)
{
l9_4156=l9_4137.x==3;
}
else
{
l9_4156=l9_4155;
}
float l9_4157=l9_4134.x;
float l9_4158=l9_4139.x;
float l9_4159=l9_4139.z;
bool l9_4160=l9_4156;
float l9_4161=l9_4144;
float l9_4162=fast::clamp(l9_4157,l9_4158,l9_4159);
float l9_4163=step(abs(l9_4157-l9_4162),9.9999997e-06);
l9_4161*=(l9_4163+((1.0-float(l9_4160))*(1.0-l9_4163)));
l9_4157=l9_4162;
l9_4134.x=l9_4157;
l9_4144=l9_4161;
bool l9_4164=l9_4140;
bool l9_4165;
if (l9_4164)
{
l9_4165=l9_4137.y==3;
}
else
{
l9_4165=l9_4164;
}
float l9_4166=l9_4134.y;
float l9_4167=l9_4139.y;
float l9_4168=l9_4139.w;
bool l9_4169=l9_4165;
float l9_4170=l9_4144;
float l9_4171=fast::clamp(l9_4166,l9_4167,l9_4168);
float l9_4172=step(abs(l9_4166-l9_4171),9.9999997e-06);
l9_4170*=(l9_4172+((1.0-float(l9_4169))*(1.0-l9_4172)));
l9_4166=l9_4171;
l9_4134.y=l9_4166;
l9_4144=l9_4170;
}
float2 l9_4173=l9_4134;
bool l9_4174=l9_4135;
float3x3 l9_4175=l9_4136;
if (l9_4174)
{
l9_4173=float2((l9_4175*float3(l9_4173,1.0)).xy);
}
float2 l9_4176=l9_4173;
l9_4134=l9_4176;
float l9_4177=l9_4134.x;
int l9_4178=l9_4137.x;
bool l9_4179=l9_4143;
float l9_4180=l9_4144;
if ((l9_4178==0)||(l9_4178==3))
{
float l9_4181=l9_4177;
float l9_4182=0.0;
float l9_4183=1.0;
bool l9_4184=l9_4179;
float l9_4185=l9_4180;
float l9_4186=fast::clamp(l9_4181,l9_4182,l9_4183);
float l9_4187=step(abs(l9_4181-l9_4186),9.9999997e-06);
l9_4185*=(l9_4187+((1.0-float(l9_4184))*(1.0-l9_4187)));
l9_4181=l9_4186;
l9_4177=l9_4181;
l9_4180=l9_4185;
}
l9_4134.x=l9_4177;
l9_4144=l9_4180;
float l9_4188=l9_4134.y;
int l9_4189=l9_4137.y;
bool l9_4190=l9_4143;
float l9_4191=l9_4144;
if ((l9_4189==0)||(l9_4189==3))
{
float l9_4192=l9_4188;
float l9_4193=0.0;
float l9_4194=1.0;
bool l9_4195=l9_4190;
float l9_4196=l9_4191;
float l9_4197=fast::clamp(l9_4192,l9_4193,l9_4194);
float l9_4198=step(abs(l9_4192-l9_4197),9.9999997e-06);
l9_4196*=(l9_4198+((1.0-float(l9_4195))*(1.0-l9_4198)));
l9_4192=l9_4197;
l9_4188=l9_4192;
l9_4191=l9_4196;
}
l9_4134.y=l9_4188;
l9_4144=l9_4191;
float2 l9_4199=l9_4134;
int l9_4200=l9_4132;
int l9_4201=l9_4133;
float l9_4202=l9_4142;
float2 l9_4203=l9_4199;
int l9_4204=l9_4200;
int l9_4205=l9_4201;
float3 l9_4206=float3(0.0);
if (l9_4204==0)
{
l9_4206=float3(l9_4203,0.0);
}
else
{
if (l9_4204==1)
{
l9_4206=float3(l9_4203.x,(l9_4203.y*0.5)+(0.5-(float(l9_4205)*0.5)),0.0);
}
else
{
l9_4206=float3(l9_4203,float(l9_4205));
}
}
float3 l9_4207=l9_4206;
float3 l9_4208=l9_4207;
float4 l9_4209=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_4208.xy,bias(l9_4202));
float4 l9_4210=l9_4209;
if (l9_4140)
{
l9_4210=mix(l9_4141,l9_4210,float4(l9_4144));
}
float4 l9_4211=l9_4210;
l9_4125=l9_4211;
l9_4103=l9_4125;
l9_4108=l9_4103;
}
else
{
float2 l9_4212=float2(0.0);
l9_4212=l9_4105.Surface_UVCoord0;
float2 l9_4213=float2(0.0);
float2 l9_4214=(*sc_set0.UserUniforms).patternScaleId01;
l9_4213=l9_4214;
float2 l9_4215=float2(0.0);
l9_4215=((l9_4212-(*sc_set0.UserUniforms).Port_Center_N122)*l9_4213)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_4216=float2(0.0);
float2 l9_4217=(*sc_set0.UserUniforms).patternOffsetId01;
l9_4216=l9_4217;
float2 l9_4218=float2(0.0);
l9_4218=l9_4215+l9_4216;
float l9_4219=0.0;
float l9_4220=(*sc_set0.UserUniforms).patternRotateId01;
l9_4219=l9_4220;
float2 l9_4221=float2(0.0);
float2 l9_4222=l9_4218;
float l9_4223=l9_4219;
float2 l9_4224=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_4225=sin(radians(l9_4223));
float l9_4226=cos(radians(l9_4223));
float2 l9_4227=l9_4222-l9_4224;
l9_4227=float2(dot(float2(l9_4226,l9_4225),l9_4227),dot(float2(-l9_4225,l9_4226),l9_4227))+l9_4224;
l9_4221=l9_4227;
float4 l9_4228=float4(0.0);
int l9_4229;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_4230=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4230=0;
}
else
{
l9_4230=in.varStereoViewID;
}
int l9_4231=l9_4230;
l9_4229=1-l9_4231;
}
else
{
int l9_4232=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4232=0;
}
else
{
l9_4232=in.varStereoViewID;
}
int l9_4233=l9_4232;
l9_4229=l9_4233;
}
int l9_4234=l9_4229;
int l9_4235=patternTextureId01Layout_tmp;
int l9_4236=l9_4234;
float2 l9_4237=l9_4221;
bool l9_4238=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_4239=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_4240=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_4241=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_4242=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_4243=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_4244=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_4245=0.0;
bool l9_4246=l9_4243&&(!l9_4241);
float l9_4247=1.0;
float l9_4248=l9_4237.x;
int l9_4249=l9_4240.x;
if (l9_4249==1)
{
l9_4248=fract(l9_4248);
}
else
{
if (l9_4249==2)
{
float l9_4250=fract(l9_4248);
float l9_4251=l9_4248-l9_4250;
float l9_4252=step(0.25,fract(l9_4251*0.5));
l9_4248=mix(l9_4250,1.0-l9_4250,fast::clamp(l9_4252,0.0,1.0));
}
}
l9_4237.x=l9_4248;
float l9_4253=l9_4237.y;
int l9_4254=l9_4240.y;
if (l9_4254==1)
{
l9_4253=fract(l9_4253);
}
else
{
if (l9_4254==2)
{
float l9_4255=fract(l9_4253);
float l9_4256=l9_4253-l9_4255;
float l9_4257=step(0.25,fract(l9_4256*0.5));
l9_4253=mix(l9_4255,1.0-l9_4255,fast::clamp(l9_4257,0.0,1.0));
}
}
l9_4237.y=l9_4253;
if (l9_4241)
{
bool l9_4258=l9_4243;
bool l9_4259;
if (l9_4258)
{
l9_4259=l9_4240.x==3;
}
else
{
l9_4259=l9_4258;
}
float l9_4260=l9_4237.x;
float l9_4261=l9_4242.x;
float l9_4262=l9_4242.z;
bool l9_4263=l9_4259;
float l9_4264=l9_4247;
float l9_4265=fast::clamp(l9_4260,l9_4261,l9_4262);
float l9_4266=step(abs(l9_4260-l9_4265),9.9999997e-06);
l9_4264*=(l9_4266+((1.0-float(l9_4263))*(1.0-l9_4266)));
l9_4260=l9_4265;
l9_4237.x=l9_4260;
l9_4247=l9_4264;
bool l9_4267=l9_4243;
bool l9_4268;
if (l9_4267)
{
l9_4268=l9_4240.y==3;
}
else
{
l9_4268=l9_4267;
}
float l9_4269=l9_4237.y;
float l9_4270=l9_4242.y;
float l9_4271=l9_4242.w;
bool l9_4272=l9_4268;
float l9_4273=l9_4247;
float l9_4274=fast::clamp(l9_4269,l9_4270,l9_4271);
float l9_4275=step(abs(l9_4269-l9_4274),9.9999997e-06);
l9_4273*=(l9_4275+((1.0-float(l9_4272))*(1.0-l9_4275)));
l9_4269=l9_4274;
l9_4237.y=l9_4269;
l9_4247=l9_4273;
}
float2 l9_4276=l9_4237;
bool l9_4277=l9_4238;
float3x3 l9_4278=l9_4239;
if (l9_4277)
{
l9_4276=float2((l9_4278*float3(l9_4276,1.0)).xy);
}
float2 l9_4279=l9_4276;
l9_4237=l9_4279;
float l9_4280=l9_4237.x;
int l9_4281=l9_4240.x;
bool l9_4282=l9_4246;
float l9_4283=l9_4247;
if ((l9_4281==0)||(l9_4281==3))
{
float l9_4284=l9_4280;
float l9_4285=0.0;
float l9_4286=1.0;
bool l9_4287=l9_4282;
float l9_4288=l9_4283;
float l9_4289=fast::clamp(l9_4284,l9_4285,l9_4286);
float l9_4290=step(abs(l9_4284-l9_4289),9.9999997e-06);
l9_4288*=(l9_4290+((1.0-float(l9_4287))*(1.0-l9_4290)));
l9_4284=l9_4289;
l9_4280=l9_4284;
l9_4283=l9_4288;
}
l9_4237.x=l9_4280;
l9_4247=l9_4283;
float l9_4291=l9_4237.y;
int l9_4292=l9_4240.y;
bool l9_4293=l9_4246;
float l9_4294=l9_4247;
if ((l9_4292==0)||(l9_4292==3))
{
float l9_4295=l9_4291;
float l9_4296=0.0;
float l9_4297=1.0;
bool l9_4298=l9_4293;
float l9_4299=l9_4294;
float l9_4300=fast::clamp(l9_4295,l9_4296,l9_4297);
float l9_4301=step(abs(l9_4295-l9_4300),9.9999997e-06);
l9_4299*=(l9_4301+((1.0-float(l9_4298))*(1.0-l9_4301)));
l9_4295=l9_4300;
l9_4291=l9_4295;
l9_4294=l9_4299;
}
l9_4237.y=l9_4291;
l9_4247=l9_4294;
float2 l9_4302=l9_4237;
int l9_4303=l9_4235;
int l9_4304=l9_4236;
float l9_4305=l9_4245;
float2 l9_4306=l9_4302;
int l9_4307=l9_4303;
int l9_4308=l9_4304;
float3 l9_4309=float3(0.0);
if (l9_4307==0)
{
l9_4309=float3(l9_4306,0.0);
}
else
{
if (l9_4307==1)
{
l9_4309=float3(l9_4306.x,(l9_4306.y*0.5)+(0.5-(float(l9_4308)*0.5)),0.0);
}
else
{
l9_4309=float3(l9_4306,float(l9_4308));
}
}
float3 l9_4310=l9_4309;
float3 l9_4311=l9_4310;
float4 l9_4312=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_4311.xy,bias(l9_4305));
float4 l9_4313=l9_4312;
if (l9_4243)
{
l9_4313=mix(l9_4244,l9_4313,float4(l9_4247));
}
float4 l9_4314=l9_4313;
l9_4228=l9_4314;
float l9_4315=0.0;
float3 l9_4316=l9_4228.xyz;
float l9_4317=l9_4316.x;
l9_4315=l9_4317;
l9_4104=float4(l9_4315);
l9_4108=l9_4104;
}
l9_4101=l9_4108;
float4 l9_4318=float4(0.0);
l9_4318=l9_4099*l9_4101;
l9_4093=l9_4318;
l9_4098=l9_4093;
}
else
{
float4 l9_4319=float4(0.0);
float4 l9_4320=(*sc_set0.UserUniforms).colorId01;
l9_4319=l9_4320;
float2 l9_4321=float2(0.0);
l9_4321=l9_4095.Surface_UVCoord0;
float4 l9_4322=float4(0.0);
int l9_4323;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_4324=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4324=0;
}
else
{
l9_4324=in.varStereoViewID;
}
int l9_4325=l9_4324;
l9_4323=1-l9_4325;
}
else
{
int l9_4326=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4326=0;
}
else
{
l9_4326=in.varStereoViewID;
}
int l9_4327=l9_4326;
l9_4323=l9_4327;
}
int l9_4328=l9_4323;
int l9_4329=greyMaskIdLayout_tmp;
int l9_4330=l9_4328;
float2 l9_4331=l9_4321;
bool l9_4332=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_4333=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_4334=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_4335=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_4336=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_4337=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_4338=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_4339=0.0;
bool l9_4340=l9_4337&&(!l9_4335);
float l9_4341=1.0;
float l9_4342=l9_4331.x;
int l9_4343=l9_4334.x;
if (l9_4343==1)
{
l9_4342=fract(l9_4342);
}
else
{
if (l9_4343==2)
{
float l9_4344=fract(l9_4342);
float l9_4345=l9_4342-l9_4344;
float l9_4346=step(0.25,fract(l9_4345*0.5));
l9_4342=mix(l9_4344,1.0-l9_4344,fast::clamp(l9_4346,0.0,1.0));
}
}
l9_4331.x=l9_4342;
float l9_4347=l9_4331.y;
int l9_4348=l9_4334.y;
if (l9_4348==1)
{
l9_4347=fract(l9_4347);
}
else
{
if (l9_4348==2)
{
float l9_4349=fract(l9_4347);
float l9_4350=l9_4347-l9_4349;
float l9_4351=step(0.25,fract(l9_4350*0.5));
l9_4347=mix(l9_4349,1.0-l9_4349,fast::clamp(l9_4351,0.0,1.0));
}
}
l9_4331.y=l9_4347;
if (l9_4335)
{
bool l9_4352=l9_4337;
bool l9_4353;
if (l9_4352)
{
l9_4353=l9_4334.x==3;
}
else
{
l9_4353=l9_4352;
}
float l9_4354=l9_4331.x;
float l9_4355=l9_4336.x;
float l9_4356=l9_4336.z;
bool l9_4357=l9_4353;
float l9_4358=l9_4341;
float l9_4359=fast::clamp(l9_4354,l9_4355,l9_4356);
float l9_4360=step(abs(l9_4354-l9_4359),9.9999997e-06);
l9_4358*=(l9_4360+((1.0-float(l9_4357))*(1.0-l9_4360)));
l9_4354=l9_4359;
l9_4331.x=l9_4354;
l9_4341=l9_4358;
bool l9_4361=l9_4337;
bool l9_4362;
if (l9_4361)
{
l9_4362=l9_4334.y==3;
}
else
{
l9_4362=l9_4361;
}
float l9_4363=l9_4331.y;
float l9_4364=l9_4336.y;
float l9_4365=l9_4336.w;
bool l9_4366=l9_4362;
float l9_4367=l9_4341;
float l9_4368=fast::clamp(l9_4363,l9_4364,l9_4365);
float l9_4369=step(abs(l9_4363-l9_4368),9.9999997e-06);
l9_4367*=(l9_4369+((1.0-float(l9_4366))*(1.0-l9_4369)));
l9_4363=l9_4368;
l9_4331.y=l9_4363;
l9_4341=l9_4367;
}
float2 l9_4370=l9_4331;
bool l9_4371=l9_4332;
float3x3 l9_4372=l9_4333;
if (l9_4371)
{
l9_4370=float2((l9_4372*float3(l9_4370,1.0)).xy);
}
float2 l9_4373=l9_4370;
l9_4331=l9_4373;
float l9_4374=l9_4331.x;
int l9_4375=l9_4334.x;
bool l9_4376=l9_4340;
float l9_4377=l9_4341;
if ((l9_4375==0)||(l9_4375==3))
{
float l9_4378=l9_4374;
float l9_4379=0.0;
float l9_4380=1.0;
bool l9_4381=l9_4376;
float l9_4382=l9_4377;
float l9_4383=fast::clamp(l9_4378,l9_4379,l9_4380);
float l9_4384=step(abs(l9_4378-l9_4383),9.9999997e-06);
l9_4382*=(l9_4384+((1.0-float(l9_4381))*(1.0-l9_4384)));
l9_4378=l9_4383;
l9_4374=l9_4378;
l9_4377=l9_4382;
}
l9_4331.x=l9_4374;
l9_4341=l9_4377;
float l9_4385=l9_4331.y;
int l9_4386=l9_4334.y;
bool l9_4387=l9_4340;
float l9_4388=l9_4341;
if ((l9_4386==0)||(l9_4386==3))
{
float l9_4389=l9_4385;
float l9_4390=0.0;
float l9_4391=1.0;
bool l9_4392=l9_4387;
float l9_4393=l9_4388;
float l9_4394=fast::clamp(l9_4389,l9_4390,l9_4391);
float l9_4395=step(abs(l9_4389-l9_4394),9.9999997e-06);
l9_4393*=(l9_4395+((1.0-float(l9_4392))*(1.0-l9_4395)));
l9_4389=l9_4394;
l9_4385=l9_4389;
l9_4388=l9_4393;
}
l9_4331.y=l9_4385;
l9_4341=l9_4388;
float2 l9_4396=l9_4331;
int l9_4397=l9_4329;
int l9_4398=l9_4330;
float l9_4399=l9_4339;
float2 l9_4400=l9_4396;
int l9_4401=l9_4397;
int l9_4402=l9_4398;
float3 l9_4403=float3(0.0);
if (l9_4401==0)
{
l9_4403=float3(l9_4400,0.0);
}
else
{
if (l9_4401==1)
{
l9_4403=float3(l9_4400.x,(l9_4400.y*0.5)+(0.5-(float(l9_4402)*0.5)),0.0);
}
else
{
l9_4403=float3(l9_4400,float(l9_4402));
}
}
float3 l9_4404=l9_4403;
float3 l9_4405=l9_4404;
float4 l9_4406=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_4405.xy,bias(l9_4399));
float4 l9_4407=l9_4406;
if (l9_4337)
{
l9_4407=mix(l9_4338,l9_4407,float4(l9_4341));
}
float4 l9_4408=l9_4407;
l9_4322=l9_4408;
float l9_4409=0.0;
l9_4409=l9_4322.x;
float l9_4410=0.0;
l9_4410=step(l9_4409,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_4411=float4(0.0);
l9_4411=l9_4319*float4(l9_4410);
l9_4094=l9_4411;
l9_4098=l9_4094;
}
l9_4091=l9_4098;
float2 l9_4412=float2(0.0);
l9_4412=l9_4077.Surface_UVCoord0;
float4 l9_4413=float4(0.0);
int l9_4414;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_4415=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4415=0;
}
else
{
l9_4415=in.varStereoViewID;
}
int l9_4416=l9_4415;
l9_4414=1-l9_4416;
}
else
{
int l9_4417=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4417=0;
}
else
{
l9_4417=in.varStereoViewID;
}
int l9_4418=l9_4417;
l9_4414=l9_4418;
}
int l9_4419=l9_4414;
int l9_4420=greyMaskIdLayout_tmp;
int l9_4421=l9_4419;
float2 l9_4422=l9_4412;
bool l9_4423=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_4424=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_4425=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_4426=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_4427=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_4428=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_4429=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_4430=0.0;
bool l9_4431=l9_4428&&(!l9_4426);
float l9_4432=1.0;
float l9_4433=l9_4422.x;
int l9_4434=l9_4425.x;
if (l9_4434==1)
{
l9_4433=fract(l9_4433);
}
else
{
if (l9_4434==2)
{
float l9_4435=fract(l9_4433);
float l9_4436=l9_4433-l9_4435;
float l9_4437=step(0.25,fract(l9_4436*0.5));
l9_4433=mix(l9_4435,1.0-l9_4435,fast::clamp(l9_4437,0.0,1.0));
}
}
l9_4422.x=l9_4433;
float l9_4438=l9_4422.y;
int l9_4439=l9_4425.y;
if (l9_4439==1)
{
l9_4438=fract(l9_4438);
}
else
{
if (l9_4439==2)
{
float l9_4440=fract(l9_4438);
float l9_4441=l9_4438-l9_4440;
float l9_4442=step(0.25,fract(l9_4441*0.5));
l9_4438=mix(l9_4440,1.0-l9_4440,fast::clamp(l9_4442,0.0,1.0));
}
}
l9_4422.y=l9_4438;
if (l9_4426)
{
bool l9_4443=l9_4428;
bool l9_4444;
if (l9_4443)
{
l9_4444=l9_4425.x==3;
}
else
{
l9_4444=l9_4443;
}
float l9_4445=l9_4422.x;
float l9_4446=l9_4427.x;
float l9_4447=l9_4427.z;
bool l9_4448=l9_4444;
float l9_4449=l9_4432;
float l9_4450=fast::clamp(l9_4445,l9_4446,l9_4447);
float l9_4451=step(abs(l9_4445-l9_4450),9.9999997e-06);
l9_4449*=(l9_4451+((1.0-float(l9_4448))*(1.0-l9_4451)));
l9_4445=l9_4450;
l9_4422.x=l9_4445;
l9_4432=l9_4449;
bool l9_4452=l9_4428;
bool l9_4453;
if (l9_4452)
{
l9_4453=l9_4425.y==3;
}
else
{
l9_4453=l9_4452;
}
float l9_4454=l9_4422.y;
float l9_4455=l9_4427.y;
float l9_4456=l9_4427.w;
bool l9_4457=l9_4453;
float l9_4458=l9_4432;
float l9_4459=fast::clamp(l9_4454,l9_4455,l9_4456);
float l9_4460=step(abs(l9_4454-l9_4459),9.9999997e-06);
l9_4458*=(l9_4460+((1.0-float(l9_4457))*(1.0-l9_4460)));
l9_4454=l9_4459;
l9_4422.y=l9_4454;
l9_4432=l9_4458;
}
float2 l9_4461=l9_4422;
bool l9_4462=l9_4423;
float3x3 l9_4463=l9_4424;
if (l9_4462)
{
l9_4461=float2((l9_4463*float3(l9_4461,1.0)).xy);
}
float2 l9_4464=l9_4461;
l9_4422=l9_4464;
float l9_4465=l9_4422.x;
int l9_4466=l9_4425.x;
bool l9_4467=l9_4431;
float l9_4468=l9_4432;
if ((l9_4466==0)||(l9_4466==3))
{
float l9_4469=l9_4465;
float l9_4470=0.0;
float l9_4471=1.0;
bool l9_4472=l9_4467;
float l9_4473=l9_4468;
float l9_4474=fast::clamp(l9_4469,l9_4470,l9_4471);
float l9_4475=step(abs(l9_4469-l9_4474),9.9999997e-06);
l9_4473*=(l9_4475+((1.0-float(l9_4472))*(1.0-l9_4475)));
l9_4469=l9_4474;
l9_4465=l9_4469;
l9_4468=l9_4473;
}
l9_4422.x=l9_4465;
l9_4432=l9_4468;
float l9_4476=l9_4422.y;
int l9_4477=l9_4425.y;
bool l9_4478=l9_4431;
float l9_4479=l9_4432;
if ((l9_4477==0)||(l9_4477==3))
{
float l9_4480=l9_4476;
float l9_4481=0.0;
float l9_4482=1.0;
bool l9_4483=l9_4478;
float l9_4484=l9_4479;
float l9_4485=fast::clamp(l9_4480,l9_4481,l9_4482);
float l9_4486=step(abs(l9_4480-l9_4485),9.9999997e-06);
l9_4484*=(l9_4486+((1.0-float(l9_4483))*(1.0-l9_4486)));
l9_4480=l9_4485;
l9_4476=l9_4480;
l9_4479=l9_4484;
}
l9_4422.y=l9_4476;
l9_4432=l9_4479;
float2 l9_4487=l9_4422;
int l9_4488=l9_4420;
int l9_4489=l9_4421;
float l9_4490=l9_4430;
float2 l9_4491=l9_4487;
int l9_4492=l9_4488;
int l9_4493=l9_4489;
float3 l9_4494=float3(0.0);
if (l9_4492==0)
{
l9_4494=float3(l9_4491,0.0);
}
else
{
if (l9_4492==1)
{
l9_4494=float3(l9_4491.x,(l9_4491.y*0.5)+(0.5-(float(l9_4493)*0.5)),0.0);
}
else
{
l9_4494=float3(l9_4491,float(l9_4493));
}
}
float3 l9_4495=l9_4494;
float3 l9_4496=l9_4495;
float4 l9_4497=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_4496.xy,bias(l9_4490));
float4 l9_4498=l9_4497;
if (l9_4428)
{
l9_4498=mix(l9_4429,l9_4498,float4(l9_4432));
}
float4 l9_4499=l9_4498;
l9_4413=l9_4499;
float l9_4500=0.0;
l9_4500=l9_4413.x;
float l9_4501=0.0;
l9_4501=step(l9_4500,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_4502=float4(0.0);
l9_4502=l9_4091*float4(l9_4501);
float4 l9_4503=float4(0.0);
float4 l9_4504=(*sc_set0.UserUniforms).colorId01;
l9_4503=l9_4504;
float4 l9_4505=float4(0.0);
l9_4505=l9_4503*float4(l9_4501);
float4 l9_4506=float4(0.0);
float4 l9_4507=l9_4502;
float4 l9_4508=l9_4505;
float4 l9_4509=l9_4507;
float4 l9_4510=l9_4508;
float3 l9_4511=l9_4509.xyz*l9_4509.w;
l9_4509=float4(l9_4511.x,l9_4511.y,l9_4511.z,l9_4509.w);
float4 l9_4512=l9_4509+(l9_4510*(1.0-l9_4509.w));
l9_4506=l9_4512;
float4 l9_4513=float4(0.0);
l9_4513=float4(l9_4085)*l9_4506;
float4 l9_4514=float4(0.0);
l9_4514=l9_4513+l9_4506;
l9_4075=l9_4514;
l9_4080=l9_4075;
}
else
{
float4 l9_4515=float4(0.0);
float l9_4516=0.0;
float4 l9_4517=float4(0.0);
float4 l9_4518=float4(0.0);
ssGlobals l9_4519=l9_4077;
float l9_4520=0.0;
float l9_4521=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_4520=l9_4521;
l9_4516=l9_4520;
float4 l9_4522;
if ((l9_4516*1.0)!=0.0)
{
float4 l9_4523=float4(0.0);
float4 l9_4524=(*sc_set0.UserUniforms).patternColorId01;
l9_4523=l9_4524;
float4 l9_4525=float4(0.0);
float l9_4526=0.0;
float4 l9_4527=float4(0.0);
float4 l9_4528=float4(0.0);
ssGlobals l9_4529=l9_4519;
float l9_4530=0.0;
float l9_4531=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_4530=l9_4531;
l9_4526=l9_4530;
float4 l9_4532;
if ((l9_4526*1.0)!=0.0)
{
float2 l9_4533=float2(0.0);
l9_4533=l9_4529.Surface_UVCoord0;
float2 l9_4534=float2(0.0);
float2 l9_4535=(*sc_set0.UserUniforms).patternScaleId01;
l9_4534=l9_4535;
float2 l9_4536=float2(0.0);
l9_4536=((l9_4533-(*sc_set0.UserUniforms).Port_Center_N122)*l9_4534)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_4537=float2(0.0);
float2 l9_4538=(*sc_set0.UserUniforms).patternOffsetId01;
l9_4537=l9_4538;
float2 l9_4539=float2(0.0);
l9_4539=l9_4536+l9_4537;
float l9_4540=0.0;
float l9_4541=(*sc_set0.UserUniforms).patternRotateId01;
l9_4540=l9_4541;
float2 l9_4542=float2(0.0);
float2 l9_4543=l9_4539;
float l9_4544=l9_4540;
float2 l9_4545=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_4546=sin(radians(l9_4544));
float l9_4547=cos(radians(l9_4544));
float2 l9_4548=l9_4543-l9_4545;
l9_4548=float2(dot(float2(l9_4547,l9_4546),l9_4548),dot(float2(-l9_4546,l9_4547),l9_4548))+l9_4545;
l9_4542=l9_4548;
float4 l9_4549=float4(0.0);
int l9_4550;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_4551=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4551=0;
}
else
{
l9_4551=in.varStereoViewID;
}
int l9_4552=l9_4551;
l9_4550=1-l9_4552;
}
else
{
int l9_4553=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4553=0;
}
else
{
l9_4553=in.varStereoViewID;
}
int l9_4554=l9_4553;
l9_4550=l9_4554;
}
int l9_4555=l9_4550;
int l9_4556=patternTextureId01Layout_tmp;
int l9_4557=l9_4555;
float2 l9_4558=l9_4542;
bool l9_4559=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_4560=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_4561=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_4562=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_4563=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_4564=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_4565=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_4566=0.0;
bool l9_4567=l9_4564&&(!l9_4562);
float l9_4568=1.0;
float l9_4569=l9_4558.x;
int l9_4570=l9_4561.x;
if (l9_4570==1)
{
l9_4569=fract(l9_4569);
}
else
{
if (l9_4570==2)
{
float l9_4571=fract(l9_4569);
float l9_4572=l9_4569-l9_4571;
float l9_4573=step(0.25,fract(l9_4572*0.5));
l9_4569=mix(l9_4571,1.0-l9_4571,fast::clamp(l9_4573,0.0,1.0));
}
}
l9_4558.x=l9_4569;
float l9_4574=l9_4558.y;
int l9_4575=l9_4561.y;
if (l9_4575==1)
{
l9_4574=fract(l9_4574);
}
else
{
if (l9_4575==2)
{
float l9_4576=fract(l9_4574);
float l9_4577=l9_4574-l9_4576;
float l9_4578=step(0.25,fract(l9_4577*0.5));
l9_4574=mix(l9_4576,1.0-l9_4576,fast::clamp(l9_4578,0.0,1.0));
}
}
l9_4558.y=l9_4574;
if (l9_4562)
{
bool l9_4579=l9_4564;
bool l9_4580;
if (l9_4579)
{
l9_4580=l9_4561.x==3;
}
else
{
l9_4580=l9_4579;
}
float l9_4581=l9_4558.x;
float l9_4582=l9_4563.x;
float l9_4583=l9_4563.z;
bool l9_4584=l9_4580;
float l9_4585=l9_4568;
float l9_4586=fast::clamp(l9_4581,l9_4582,l9_4583);
float l9_4587=step(abs(l9_4581-l9_4586),9.9999997e-06);
l9_4585*=(l9_4587+((1.0-float(l9_4584))*(1.0-l9_4587)));
l9_4581=l9_4586;
l9_4558.x=l9_4581;
l9_4568=l9_4585;
bool l9_4588=l9_4564;
bool l9_4589;
if (l9_4588)
{
l9_4589=l9_4561.y==3;
}
else
{
l9_4589=l9_4588;
}
float l9_4590=l9_4558.y;
float l9_4591=l9_4563.y;
float l9_4592=l9_4563.w;
bool l9_4593=l9_4589;
float l9_4594=l9_4568;
float l9_4595=fast::clamp(l9_4590,l9_4591,l9_4592);
float l9_4596=step(abs(l9_4590-l9_4595),9.9999997e-06);
l9_4594*=(l9_4596+((1.0-float(l9_4593))*(1.0-l9_4596)));
l9_4590=l9_4595;
l9_4558.y=l9_4590;
l9_4568=l9_4594;
}
float2 l9_4597=l9_4558;
bool l9_4598=l9_4559;
float3x3 l9_4599=l9_4560;
if (l9_4598)
{
l9_4597=float2((l9_4599*float3(l9_4597,1.0)).xy);
}
float2 l9_4600=l9_4597;
l9_4558=l9_4600;
float l9_4601=l9_4558.x;
int l9_4602=l9_4561.x;
bool l9_4603=l9_4567;
float l9_4604=l9_4568;
if ((l9_4602==0)||(l9_4602==3))
{
float l9_4605=l9_4601;
float l9_4606=0.0;
float l9_4607=1.0;
bool l9_4608=l9_4603;
float l9_4609=l9_4604;
float l9_4610=fast::clamp(l9_4605,l9_4606,l9_4607);
float l9_4611=step(abs(l9_4605-l9_4610),9.9999997e-06);
l9_4609*=(l9_4611+((1.0-float(l9_4608))*(1.0-l9_4611)));
l9_4605=l9_4610;
l9_4601=l9_4605;
l9_4604=l9_4609;
}
l9_4558.x=l9_4601;
l9_4568=l9_4604;
float l9_4612=l9_4558.y;
int l9_4613=l9_4561.y;
bool l9_4614=l9_4567;
float l9_4615=l9_4568;
if ((l9_4613==0)||(l9_4613==3))
{
float l9_4616=l9_4612;
float l9_4617=0.0;
float l9_4618=1.0;
bool l9_4619=l9_4614;
float l9_4620=l9_4615;
float l9_4621=fast::clamp(l9_4616,l9_4617,l9_4618);
float l9_4622=step(abs(l9_4616-l9_4621),9.9999997e-06);
l9_4620*=(l9_4622+((1.0-float(l9_4619))*(1.0-l9_4622)));
l9_4616=l9_4621;
l9_4612=l9_4616;
l9_4615=l9_4620;
}
l9_4558.y=l9_4612;
l9_4568=l9_4615;
float2 l9_4623=l9_4558;
int l9_4624=l9_4556;
int l9_4625=l9_4557;
float l9_4626=l9_4566;
float2 l9_4627=l9_4623;
int l9_4628=l9_4624;
int l9_4629=l9_4625;
float3 l9_4630=float3(0.0);
if (l9_4628==0)
{
l9_4630=float3(l9_4627,0.0);
}
else
{
if (l9_4628==1)
{
l9_4630=float3(l9_4627.x,(l9_4627.y*0.5)+(0.5-(float(l9_4629)*0.5)),0.0);
}
else
{
l9_4630=float3(l9_4627,float(l9_4629));
}
}
float3 l9_4631=l9_4630;
float3 l9_4632=l9_4631;
float4 l9_4633=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_4632.xy,bias(l9_4626));
float4 l9_4634=l9_4633;
if (l9_4564)
{
l9_4634=mix(l9_4565,l9_4634,float4(l9_4568));
}
float4 l9_4635=l9_4634;
l9_4549=l9_4635;
l9_4527=l9_4549;
l9_4532=l9_4527;
}
else
{
float2 l9_4636=float2(0.0);
l9_4636=l9_4529.Surface_UVCoord0;
float2 l9_4637=float2(0.0);
float2 l9_4638=(*sc_set0.UserUniforms).patternScaleId01;
l9_4637=l9_4638;
float2 l9_4639=float2(0.0);
l9_4639=((l9_4636-(*sc_set0.UserUniforms).Port_Center_N122)*l9_4637)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_4640=float2(0.0);
float2 l9_4641=(*sc_set0.UserUniforms).patternOffsetId01;
l9_4640=l9_4641;
float2 l9_4642=float2(0.0);
l9_4642=l9_4639+l9_4640;
float l9_4643=0.0;
float l9_4644=(*sc_set0.UserUniforms).patternRotateId01;
l9_4643=l9_4644;
float2 l9_4645=float2(0.0);
float2 l9_4646=l9_4642;
float l9_4647=l9_4643;
float2 l9_4648=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_4649=sin(radians(l9_4647));
float l9_4650=cos(radians(l9_4647));
float2 l9_4651=l9_4646-l9_4648;
l9_4651=float2(dot(float2(l9_4650,l9_4649),l9_4651),dot(float2(-l9_4649,l9_4650),l9_4651))+l9_4648;
l9_4645=l9_4651;
float4 l9_4652=float4(0.0);
int l9_4653;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_4654=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4654=0;
}
else
{
l9_4654=in.varStereoViewID;
}
int l9_4655=l9_4654;
l9_4653=1-l9_4655;
}
else
{
int l9_4656=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4656=0;
}
else
{
l9_4656=in.varStereoViewID;
}
int l9_4657=l9_4656;
l9_4653=l9_4657;
}
int l9_4658=l9_4653;
int l9_4659=patternTextureId01Layout_tmp;
int l9_4660=l9_4658;
float2 l9_4661=l9_4645;
bool l9_4662=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_4663=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_4664=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_4665=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_4666=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_4667=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_4668=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_4669=0.0;
bool l9_4670=l9_4667&&(!l9_4665);
float l9_4671=1.0;
float l9_4672=l9_4661.x;
int l9_4673=l9_4664.x;
if (l9_4673==1)
{
l9_4672=fract(l9_4672);
}
else
{
if (l9_4673==2)
{
float l9_4674=fract(l9_4672);
float l9_4675=l9_4672-l9_4674;
float l9_4676=step(0.25,fract(l9_4675*0.5));
l9_4672=mix(l9_4674,1.0-l9_4674,fast::clamp(l9_4676,0.0,1.0));
}
}
l9_4661.x=l9_4672;
float l9_4677=l9_4661.y;
int l9_4678=l9_4664.y;
if (l9_4678==1)
{
l9_4677=fract(l9_4677);
}
else
{
if (l9_4678==2)
{
float l9_4679=fract(l9_4677);
float l9_4680=l9_4677-l9_4679;
float l9_4681=step(0.25,fract(l9_4680*0.5));
l9_4677=mix(l9_4679,1.0-l9_4679,fast::clamp(l9_4681,0.0,1.0));
}
}
l9_4661.y=l9_4677;
if (l9_4665)
{
bool l9_4682=l9_4667;
bool l9_4683;
if (l9_4682)
{
l9_4683=l9_4664.x==3;
}
else
{
l9_4683=l9_4682;
}
float l9_4684=l9_4661.x;
float l9_4685=l9_4666.x;
float l9_4686=l9_4666.z;
bool l9_4687=l9_4683;
float l9_4688=l9_4671;
float l9_4689=fast::clamp(l9_4684,l9_4685,l9_4686);
float l9_4690=step(abs(l9_4684-l9_4689),9.9999997e-06);
l9_4688*=(l9_4690+((1.0-float(l9_4687))*(1.0-l9_4690)));
l9_4684=l9_4689;
l9_4661.x=l9_4684;
l9_4671=l9_4688;
bool l9_4691=l9_4667;
bool l9_4692;
if (l9_4691)
{
l9_4692=l9_4664.y==3;
}
else
{
l9_4692=l9_4691;
}
float l9_4693=l9_4661.y;
float l9_4694=l9_4666.y;
float l9_4695=l9_4666.w;
bool l9_4696=l9_4692;
float l9_4697=l9_4671;
float l9_4698=fast::clamp(l9_4693,l9_4694,l9_4695);
float l9_4699=step(abs(l9_4693-l9_4698),9.9999997e-06);
l9_4697*=(l9_4699+((1.0-float(l9_4696))*(1.0-l9_4699)));
l9_4693=l9_4698;
l9_4661.y=l9_4693;
l9_4671=l9_4697;
}
float2 l9_4700=l9_4661;
bool l9_4701=l9_4662;
float3x3 l9_4702=l9_4663;
if (l9_4701)
{
l9_4700=float2((l9_4702*float3(l9_4700,1.0)).xy);
}
float2 l9_4703=l9_4700;
l9_4661=l9_4703;
float l9_4704=l9_4661.x;
int l9_4705=l9_4664.x;
bool l9_4706=l9_4670;
float l9_4707=l9_4671;
if ((l9_4705==0)||(l9_4705==3))
{
float l9_4708=l9_4704;
float l9_4709=0.0;
float l9_4710=1.0;
bool l9_4711=l9_4706;
float l9_4712=l9_4707;
float l9_4713=fast::clamp(l9_4708,l9_4709,l9_4710);
float l9_4714=step(abs(l9_4708-l9_4713),9.9999997e-06);
l9_4712*=(l9_4714+((1.0-float(l9_4711))*(1.0-l9_4714)));
l9_4708=l9_4713;
l9_4704=l9_4708;
l9_4707=l9_4712;
}
l9_4661.x=l9_4704;
l9_4671=l9_4707;
float l9_4715=l9_4661.y;
int l9_4716=l9_4664.y;
bool l9_4717=l9_4670;
float l9_4718=l9_4671;
if ((l9_4716==0)||(l9_4716==3))
{
float l9_4719=l9_4715;
float l9_4720=0.0;
float l9_4721=1.0;
bool l9_4722=l9_4717;
float l9_4723=l9_4718;
float l9_4724=fast::clamp(l9_4719,l9_4720,l9_4721);
float l9_4725=step(abs(l9_4719-l9_4724),9.9999997e-06);
l9_4723*=(l9_4725+((1.0-float(l9_4722))*(1.0-l9_4725)));
l9_4719=l9_4724;
l9_4715=l9_4719;
l9_4718=l9_4723;
}
l9_4661.y=l9_4715;
l9_4671=l9_4718;
float2 l9_4726=l9_4661;
int l9_4727=l9_4659;
int l9_4728=l9_4660;
float l9_4729=l9_4669;
float2 l9_4730=l9_4726;
int l9_4731=l9_4727;
int l9_4732=l9_4728;
float3 l9_4733=float3(0.0);
if (l9_4731==0)
{
l9_4733=float3(l9_4730,0.0);
}
else
{
if (l9_4731==1)
{
l9_4733=float3(l9_4730.x,(l9_4730.y*0.5)+(0.5-(float(l9_4732)*0.5)),0.0);
}
else
{
l9_4733=float3(l9_4730,float(l9_4732));
}
}
float3 l9_4734=l9_4733;
float3 l9_4735=l9_4734;
float4 l9_4736=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_4735.xy,bias(l9_4729));
float4 l9_4737=l9_4736;
if (l9_4667)
{
l9_4737=mix(l9_4668,l9_4737,float4(l9_4671));
}
float4 l9_4738=l9_4737;
l9_4652=l9_4738;
float l9_4739=0.0;
float3 l9_4740=l9_4652.xyz;
float l9_4741=l9_4740.x;
l9_4739=l9_4741;
l9_4528=float4(l9_4739);
l9_4532=l9_4528;
}
l9_4525=l9_4532;
float4 l9_4742=float4(0.0);
l9_4742=l9_4523*l9_4525;
l9_4517=l9_4742;
l9_4522=l9_4517;
}
else
{
float4 l9_4743=float4(0.0);
float4 l9_4744=(*sc_set0.UserUniforms).colorId01;
l9_4743=l9_4744;
float2 l9_4745=float2(0.0);
l9_4745=l9_4519.Surface_UVCoord0;
float4 l9_4746=float4(0.0);
int l9_4747;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_4748=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4748=0;
}
else
{
l9_4748=in.varStereoViewID;
}
int l9_4749=l9_4748;
l9_4747=1-l9_4749;
}
else
{
int l9_4750=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4750=0;
}
else
{
l9_4750=in.varStereoViewID;
}
int l9_4751=l9_4750;
l9_4747=l9_4751;
}
int l9_4752=l9_4747;
int l9_4753=greyMaskIdLayout_tmp;
int l9_4754=l9_4752;
float2 l9_4755=l9_4745;
bool l9_4756=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_4757=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_4758=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_4759=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_4760=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_4761=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_4762=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_4763=0.0;
bool l9_4764=l9_4761&&(!l9_4759);
float l9_4765=1.0;
float l9_4766=l9_4755.x;
int l9_4767=l9_4758.x;
if (l9_4767==1)
{
l9_4766=fract(l9_4766);
}
else
{
if (l9_4767==2)
{
float l9_4768=fract(l9_4766);
float l9_4769=l9_4766-l9_4768;
float l9_4770=step(0.25,fract(l9_4769*0.5));
l9_4766=mix(l9_4768,1.0-l9_4768,fast::clamp(l9_4770,0.0,1.0));
}
}
l9_4755.x=l9_4766;
float l9_4771=l9_4755.y;
int l9_4772=l9_4758.y;
if (l9_4772==1)
{
l9_4771=fract(l9_4771);
}
else
{
if (l9_4772==2)
{
float l9_4773=fract(l9_4771);
float l9_4774=l9_4771-l9_4773;
float l9_4775=step(0.25,fract(l9_4774*0.5));
l9_4771=mix(l9_4773,1.0-l9_4773,fast::clamp(l9_4775,0.0,1.0));
}
}
l9_4755.y=l9_4771;
if (l9_4759)
{
bool l9_4776=l9_4761;
bool l9_4777;
if (l9_4776)
{
l9_4777=l9_4758.x==3;
}
else
{
l9_4777=l9_4776;
}
float l9_4778=l9_4755.x;
float l9_4779=l9_4760.x;
float l9_4780=l9_4760.z;
bool l9_4781=l9_4777;
float l9_4782=l9_4765;
float l9_4783=fast::clamp(l9_4778,l9_4779,l9_4780);
float l9_4784=step(abs(l9_4778-l9_4783),9.9999997e-06);
l9_4782*=(l9_4784+((1.0-float(l9_4781))*(1.0-l9_4784)));
l9_4778=l9_4783;
l9_4755.x=l9_4778;
l9_4765=l9_4782;
bool l9_4785=l9_4761;
bool l9_4786;
if (l9_4785)
{
l9_4786=l9_4758.y==3;
}
else
{
l9_4786=l9_4785;
}
float l9_4787=l9_4755.y;
float l9_4788=l9_4760.y;
float l9_4789=l9_4760.w;
bool l9_4790=l9_4786;
float l9_4791=l9_4765;
float l9_4792=fast::clamp(l9_4787,l9_4788,l9_4789);
float l9_4793=step(abs(l9_4787-l9_4792),9.9999997e-06);
l9_4791*=(l9_4793+((1.0-float(l9_4790))*(1.0-l9_4793)));
l9_4787=l9_4792;
l9_4755.y=l9_4787;
l9_4765=l9_4791;
}
float2 l9_4794=l9_4755;
bool l9_4795=l9_4756;
float3x3 l9_4796=l9_4757;
if (l9_4795)
{
l9_4794=float2((l9_4796*float3(l9_4794,1.0)).xy);
}
float2 l9_4797=l9_4794;
l9_4755=l9_4797;
float l9_4798=l9_4755.x;
int l9_4799=l9_4758.x;
bool l9_4800=l9_4764;
float l9_4801=l9_4765;
if ((l9_4799==0)||(l9_4799==3))
{
float l9_4802=l9_4798;
float l9_4803=0.0;
float l9_4804=1.0;
bool l9_4805=l9_4800;
float l9_4806=l9_4801;
float l9_4807=fast::clamp(l9_4802,l9_4803,l9_4804);
float l9_4808=step(abs(l9_4802-l9_4807),9.9999997e-06);
l9_4806*=(l9_4808+((1.0-float(l9_4805))*(1.0-l9_4808)));
l9_4802=l9_4807;
l9_4798=l9_4802;
l9_4801=l9_4806;
}
l9_4755.x=l9_4798;
l9_4765=l9_4801;
float l9_4809=l9_4755.y;
int l9_4810=l9_4758.y;
bool l9_4811=l9_4764;
float l9_4812=l9_4765;
if ((l9_4810==0)||(l9_4810==3))
{
float l9_4813=l9_4809;
float l9_4814=0.0;
float l9_4815=1.0;
bool l9_4816=l9_4811;
float l9_4817=l9_4812;
float l9_4818=fast::clamp(l9_4813,l9_4814,l9_4815);
float l9_4819=step(abs(l9_4813-l9_4818),9.9999997e-06);
l9_4817*=(l9_4819+((1.0-float(l9_4816))*(1.0-l9_4819)));
l9_4813=l9_4818;
l9_4809=l9_4813;
l9_4812=l9_4817;
}
l9_4755.y=l9_4809;
l9_4765=l9_4812;
float2 l9_4820=l9_4755;
int l9_4821=l9_4753;
int l9_4822=l9_4754;
float l9_4823=l9_4763;
float2 l9_4824=l9_4820;
int l9_4825=l9_4821;
int l9_4826=l9_4822;
float3 l9_4827=float3(0.0);
if (l9_4825==0)
{
l9_4827=float3(l9_4824,0.0);
}
else
{
if (l9_4825==1)
{
l9_4827=float3(l9_4824.x,(l9_4824.y*0.5)+(0.5-(float(l9_4826)*0.5)),0.0);
}
else
{
l9_4827=float3(l9_4824,float(l9_4826));
}
}
float3 l9_4828=l9_4827;
float3 l9_4829=l9_4828;
float4 l9_4830=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_4829.xy,bias(l9_4823));
float4 l9_4831=l9_4830;
if (l9_4761)
{
l9_4831=mix(l9_4762,l9_4831,float4(l9_4765));
}
float4 l9_4832=l9_4831;
l9_4746=l9_4832;
float l9_4833=0.0;
l9_4833=l9_4746.x;
float l9_4834=0.0;
l9_4834=step(l9_4833,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_4835=float4(0.0);
l9_4835=l9_4743*float4(l9_4834);
l9_4518=l9_4835;
l9_4522=l9_4518;
}
l9_4515=l9_4522;
float2 l9_4836=float2(0.0);
l9_4836=l9_4077.Surface_UVCoord0;
float4 l9_4837=float4(0.0);
int l9_4838;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_4839=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4839=0;
}
else
{
l9_4839=in.varStereoViewID;
}
int l9_4840=l9_4839;
l9_4838=1-l9_4840;
}
else
{
int l9_4841=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4841=0;
}
else
{
l9_4841=in.varStereoViewID;
}
int l9_4842=l9_4841;
l9_4838=l9_4842;
}
int l9_4843=l9_4838;
int l9_4844=greyMaskIdLayout_tmp;
int l9_4845=l9_4843;
float2 l9_4846=l9_4836;
bool l9_4847=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_4848=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_4849=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_4850=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_4851=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_4852=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_4853=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_4854=0.0;
bool l9_4855=l9_4852&&(!l9_4850);
float l9_4856=1.0;
float l9_4857=l9_4846.x;
int l9_4858=l9_4849.x;
if (l9_4858==1)
{
l9_4857=fract(l9_4857);
}
else
{
if (l9_4858==2)
{
float l9_4859=fract(l9_4857);
float l9_4860=l9_4857-l9_4859;
float l9_4861=step(0.25,fract(l9_4860*0.5));
l9_4857=mix(l9_4859,1.0-l9_4859,fast::clamp(l9_4861,0.0,1.0));
}
}
l9_4846.x=l9_4857;
float l9_4862=l9_4846.y;
int l9_4863=l9_4849.y;
if (l9_4863==1)
{
l9_4862=fract(l9_4862);
}
else
{
if (l9_4863==2)
{
float l9_4864=fract(l9_4862);
float l9_4865=l9_4862-l9_4864;
float l9_4866=step(0.25,fract(l9_4865*0.5));
l9_4862=mix(l9_4864,1.0-l9_4864,fast::clamp(l9_4866,0.0,1.0));
}
}
l9_4846.y=l9_4862;
if (l9_4850)
{
bool l9_4867=l9_4852;
bool l9_4868;
if (l9_4867)
{
l9_4868=l9_4849.x==3;
}
else
{
l9_4868=l9_4867;
}
float l9_4869=l9_4846.x;
float l9_4870=l9_4851.x;
float l9_4871=l9_4851.z;
bool l9_4872=l9_4868;
float l9_4873=l9_4856;
float l9_4874=fast::clamp(l9_4869,l9_4870,l9_4871);
float l9_4875=step(abs(l9_4869-l9_4874),9.9999997e-06);
l9_4873*=(l9_4875+((1.0-float(l9_4872))*(1.0-l9_4875)));
l9_4869=l9_4874;
l9_4846.x=l9_4869;
l9_4856=l9_4873;
bool l9_4876=l9_4852;
bool l9_4877;
if (l9_4876)
{
l9_4877=l9_4849.y==3;
}
else
{
l9_4877=l9_4876;
}
float l9_4878=l9_4846.y;
float l9_4879=l9_4851.y;
float l9_4880=l9_4851.w;
bool l9_4881=l9_4877;
float l9_4882=l9_4856;
float l9_4883=fast::clamp(l9_4878,l9_4879,l9_4880);
float l9_4884=step(abs(l9_4878-l9_4883),9.9999997e-06);
l9_4882*=(l9_4884+((1.0-float(l9_4881))*(1.0-l9_4884)));
l9_4878=l9_4883;
l9_4846.y=l9_4878;
l9_4856=l9_4882;
}
float2 l9_4885=l9_4846;
bool l9_4886=l9_4847;
float3x3 l9_4887=l9_4848;
if (l9_4886)
{
l9_4885=float2((l9_4887*float3(l9_4885,1.0)).xy);
}
float2 l9_4888=l9_4885;
l9_4846=l9_4888;
float l9_4889=l9_4846.x;
int l9_4890=l9_4849.x;
bool l9_4891=l9_4855;
float l9_4892=l9_4856;
if ((l9_4890==0)||(l9_4890==3))
{
float l9_4893=l9_4889;
float l9_4894=0.0;
float l9_4895=1.0;
bool l9_4896=l9_4891;
float l9_4897=l9_4892;
float l9_4898=fast::clamp(l9_4893,l9_4894,l9_4895);
float l9_4899=step(abs(l9_4893-l9_4898),9.9999997e-06);
l9_4897*=(l9_4899+((1.0-float(l9_4896))*(1.0-l9_4899)));
l9_4893=l9_4898;
l9_4889=l9_4893;
l9_4892=l9_4897;
}
l9_4846.x=l9_4889;
l9_4856=l9_4892;
float l9_4900=l9_4846.y;
int l9_4901=l9_4849.y;
bool l9_4902=l9_4855;
float l9_4903=l9_4856;
if ((l9_4901==0)||(l9_4901==3))
{
float l9_4904=l9_4900;
float l9_4905=0.0;
float l9_4906=1.0;
bool l9_4907=l9_4902;
float l9_4908=l9_4903;
float l9_4909=fast::clamp(l9_4904,l9_4905,l9_4906);
float l9_4910=step(abs(l9_4904-l9_4909),9.9999997e-06);
l9_4908*=(l9_4910+((1.0-float(l9_4907))*(1.0-l9_4910)));
l9_4904=l9_4909;
l9_4900=l9_4904;
l9_4903=l9_4908;
}
l9_4846.y=l9_4900;
l9_4856=l9_4903;
float2 l9_4911=l9_4846;
int l9_4912=l9_4844;
int l9_4913=l9_4845;
float l9_4914=l9_4854;
float2 l9_4915=l9_4911;
int l9_4916=l9_4912;
int l9_4917=l9_4913;
float3 l9_4918=float3(0.0);
if (l9_4916==0)
{
l9_4918=float3(l9_4915,0.0);
}
else
{
if (l9_4916==1)
{
l9_4918=float3(l9_4915.x,(l9_4915.y*0.5)+(0.5-(float(l9_4917)*0.5)),0.0);
}
else
{
l9_4918=float3(l9_4915,float(l9_4917));
}
}
float3 l9_4919=l9_4918;
float3 l9_4920=l9_4919;
float4 l9_4921=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_4920.xy,bias(l9_4914));
float4 l9_4922=l9_4921;
if (l9_4852)
{
l9_4922=mix(l9_4853,l9_4922,float4(l9_4856));
}
float4 l9_4923=l9_4922;
l9_4837=l9_4923;
float l9_4924=0.0;
l9_4924=l9_4837.x;
float l9_4925=0.0;
l9_4925=step(l9_4924,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_4926=float4(0.0);
l9_4926=l9_4515*float4(l9_4925);
float4 l9_4927=float4(0.0);
float4 l9_4928=(*sc_set0.UserUniforms).colorId01;
l9_4927=l9_4928;
float4 l9_4929=float4(0.0);
l9_4929=l9_4927*float4(l9_4925);
float4 l9_4930=float4(0.0);
float4 l9_4931=l9_4926;
float4 l9_4932=l9_4929;
float4 l9_4933=l9_4931;
float4 l9_4934=l9_4932;
float3 l9_4935=l9_4933.xyz*l9_4933.w;
l9_4933=float4(l9_4935.x,l9_4935.y,l9_4935.z,l9_4933.w);
float4 l9_4936=l9_4933+(l9_4934*(1.0-l9_4933.w));
l9_4930=l9_4936;
l9_4076=l9_4930;
l9_4080=l9_4076;
}
l9_4073=l9_4080;
float l9_4937=0.0;
float l9_4938=(*sc_set0.UserUniforms).metallicId01;
l9_4937=l9_4938;
float l9_4939=0.0;
float l9_4940=(*sc_set0.UserUniforms).rougnessId01;
l9_4939=l9_4940;
float4 l9_4941=float4(0.0);
float3 l9_4942=l9_4073.xyz;
float l9_4943=(*sc_set0.UserUniforms).Port_Opacity_N152;
float3 l9_4944=(*sc_set0.UserUniforms).Port_Emissive_N152;
float l9_4945=l9_4937;
float l9_4946=l9_4939;
float3 l9_4947=(*sc_set0.UserUniforms).Port_AO_N152;
float3 l9_4948=(*sc_set0.UserUniforms).Port_SpecularAO_N152;
ssGlobals l9_4949=l9_4069;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_4949.BumpedNormal=l9_4949.VertexNormal_WorldSpace;
}
float l9_4950=l9_4943;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_4950<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_4951=gl_FragCoord;
float2 l9_4952=floor(mod(l9_4951.xy,float2(4.0)));
float l9_4953=(mod(dot(l9_4952,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_4950<l9_4953)
{
discard_fragment();
}
}
l9_4942=fast::max(l9_4942,float3(0.0));
float4 l9_4954;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_4954=float4(l9_4942,l9_4943);
}
else
{
l9_4945=fast::clamp(l9_4945,0.0,1.0);
l9_4946=fast::clamp(l9_4946,0.0,1.0);
float3 l9_4955=l9_4942;
float l9_4956=l9_4943;
float3 l9_4957=l9_4949.BumpedNormal;
float3 l9_4958=l9_4949.PositionWS;
float3 l9_4959=l9_4949.ViewDirWS;
float3 l9_4960=l9_4944;
float l9_4961=l9_4945;
float l9_4962=l9_4946;
float3 l9_4963=l9_4947;
float3 l9_4964=l9_4948;
l9_4954=ngsCalculateLighting(l9_4955,l9_4956,l9_4957,l9_4958,l9_4959,l9_4960,l9_4961,l9_4962,l9_4963,l9_4964,in.varStereoViewID,sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_RayTracingReflections,sc_set0.sc_RayTracingReflectionsSmpSC,sc_set0.sc_RayTracingGlobalIllumination,sc_set0.sc_RayTracingGlobalIlluminationSmpSC,sc_set0.sc_RayTracingShadows,sc_set0.sc_RayTracingShadowsSmpSC,gl_FragCoord,(*sc_set0.UserUniforms),in.varShadowTex,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,out.sc_FragData0,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
l9_4954=fast::max(l9_4954,float4(0.0));
l9_4941=l9_4954;
l9_4067=l9_4941;
l9_4072=l9_4067;
}
else
{
float4 l9_4965=float4(0.0);
float l9_4966=0.0;
float4 l9_4967=float4(0.0);
float4 l9_4968=float4(0.0);
ssGlobals l9_4969=l9_4069;
float l9_4970=0.0;
float l9_4971=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_4970=l9_4971;
l9_4966=l9_4970;
float4 l9_4972;
if ((l9_4966*1.0)!=0.0)
{
float l9_4973=0.0;
float l9_4974=(*sc_set0.UserUniforms).rimExpId01;
l9_4973=l9_4974;
float l9_4975=0.0;
float l9_4976=(*sc_set0.UserUniforms).rimIntId01;
l9_4975=l9_4976;
float l9_4977=0.0;
float l9_4978=l9_4973;
float l9_4979=l9_4975;
ssGlobals l9_4980=l9_4969;
float l9_4981=abs(dot(-l9_4980.ViewDirWS,l9_4980.VertexNormal_WorldSpace));
float l9_4982=1.0-pow(1.0-l9_4981,l9_4978);
l9_4982=fast::max(l9_4982,0.0);
l9_4982*=l9_4979;
l9_4977=l9_4982;
float4 l9_4983=float4(0.0);
float l9_4984=0.0;
float4 l9_4985=float4(0.0);
float4 l9_4986=float4(0.0);
ssGlobals l9_4987=l9_4969;
float l9_4988=0.0;
float l9_4989=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_4988=l9_4989;
l9_4984=l9_4988;
float4 l9_4990;
if ((l9_4984*1.0)!=0.0)
{
float4 l9_4991=float4(0.0);
float4 l9_4992=(*sc_set0.UserUniforms).patternColorId01;
l9_4991=l9_4992;
float4 l9_4993=float4(0.0);
float l9_4994=0.0;
float4 l9_4995=float4(0.0);
float4 l9_4996=float4(0.0);
ssGlobals l9_4997=l9_4987;
float l9_4998=0.0;
float l9_4999=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_4998=l9_4999;
l9_4994=l9_4998;
float4 l9_5000;
if ((l9_4994*1.0)!=0.0)
{
float2 l9_5001=float2(0.0);
l9_5001=l9_4997.Surface_UVCoord0;
float2 l9_5002=float2(0.0);
float2 l9_5003=(*sc_set0.UserUniforms).patternScaleId01;
l9_5002=l9_5003;
float2 l9_5004=float2(0.0);
l9_5004=((l9_5001-(*sc_set0.UserUniforms).Port_Center_N122)*l9_5002)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_5005=float2(0.0);
float2 l9_5006=(*sc_set0.UserUniforms).patternOffsetId01;
l9_5005=l9_5006;
float2 l9_5007=float2(0.0);
l9_5007=l9_5004+l9_5005;
float l9_5008=0.0;
float l9_5009=(*sc_set0.UserUniforms).patternRotateId01;
l9_5008=l9_5009;
float2 l9_5010=float2(0.0);
float2 l9_5011=l9_5007;
float l9_5012=l9_5008;
float2 l9_5013=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_5014=sin(radians(l9_5012));
float l9_5015=cos(radians(l9_5012));
float2 l9_5016=l9_5011-l9_5013;
l9_5016=float2(dot(float2(l9_5015,l9_5014),l9_5016),dot(float2(-l9_5014,l9_5015),l9_5016))+l9_5013;
l9_5010=l9_5016;
float4 l9_5017=float4(0.0);
int l9_5018;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_5019=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5019=0;
}
else
{
l9_5019=in.varStereoViewID;
}
int l9_5020=l9_5019;
l9_5018=1-l9_5020;
}
else
{
int l9_5021=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5021=0;
}
else
{
l9_5021=in.varStereoViewID;
}
int l9_5022=l9_5021;
l9_5018=l9_5022;
}
int l9_5023=l9_5018;
int l9_5024=patternTextureId01Layout_tmp;
int l9_5025=l9_5023;
float2 l9_5026=l9_5010;
bool l9_5027=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_5028=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_5029=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_5030=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_5031=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_5032=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_5033=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_5034=0.0;
bool l9_5035=l9_5032&&(!l9_5030);
float l9_5036=1.0;
float l9_5037=l9_5026.x;
int l9_5038=l9_5029.x;
if (l9_5038==1)
{
l9_5037=fract(l9_5037);
}
else
{
if (l9_5038==2)
{
float l9_5039=fract(l9_5037);
float l9_5040=l9_5037-l9_5039;
float l9_5041=step(0.25,fract(l9_5040*0.5));
l9_5037=mix(l9_5039,1.0-l9_5039,fast::clamp(l9_5041,0.0,1.0));
}
}
l9_5026.x=l9_5037;
float l9_5042=l9_5026.y;
int l9_5043=l9_5029.y;
if (l9_5043==1)
{
l9_5042=fract(l9_5042);
}
else
{
if (l9_5043==2)
{
float l9_5044=fract(l9_5042);
float l9_5045=l9_5042-l9_5044;
float l9_5046=step(0.25,fract(l9_5045*0.5));
l9_5042=mix(l9_5044,1.0-l9_5044,fast::clamp(l9_5046,0.0,1.0));
}
}
l9_5026.y=l9_5042;
if (l9_5030)
{
bool l9_5047=l9_5032;
bool l9_5048;
if (l9_5047)
{
l9_5048=l9_5029.x==3;
}
else
{
l9_5048=l9_5047;
}
float l9_5049=l9_5026.x;
float l9_5050=l9_5031.x;
float l9_5051=l9_5031.z;
bool l9_5052=l9_5048;
float l9_5053=l9_5036;
float l9_5054=fast::clamp(l9_5049,l9_5050,l9_5051);
float l9_5055=step(abs(l9_5049-l9_5054),9.9999997e-06);
l9_5053*=(l9_5055+((1.0-float(l9_5052))*(1.0-l9_5055)));
l9_5049=l9_5054;
l9_5026.x=l9_5049;
l9_5036=l9_5053;
bool l9_5056=l9_5032;
bool l9_5057;
if (l9_5056)
{
l9_5057=l9_5029.y==3;
}
else
{
l9_5057=l9_5056;
}
float l9_5058=l9_5026.y;
float l9_5059=l9_5031.y;
float l9_5060=l9_5031.w;
bool l9_5061=l9_5057;
float l9_5062=l9_5036;
float l9_5063=fast::clamp(l9_5058,l9_5059,l9_5060);
float l9_5064=step(abs(l9_5058-l9_5063),9.9999997e-06);
l9_5062*=(l9_5064+((1.0-float(l9_5061))*(1.0-l9_5064)));
l9_5058=l9_5063;
l9_5026.y=l9_5058;
l9_5036=l9_5062;
}
float2 l9_5065=l9_5026;
bool l9_5066=l9_5027;
float3x3 l9_5067=l9_5028;
if (l9_5066)
{
l9_5065=float2((l9_5067*float3(l9_5065,1.0)).xy);
}
float2 l9_5068=l9_5065;
l9_5026=l9_5068;
float l9_5069=l9_5026.x;
int l9_5070=l9_5029.x;
bool l9_5071=l9_5035;
float l9_5072=l9_5036;
if ((l9_5070==0)||(l9_5070==3))
{
float l9_5073=l9_5069;
float l9_5074=0.0;
float l9_5075=1.0;
bool l9_5076=l9_5071;
float l9_5077=l9_5072;
float l9_5078=fast::clamp(l9_5073,l9_5074,l9_5075);
float l9_5079=step(abs(l9_5073-l9_5078),9.9999997e-06);
l9_5077*=(l9_5079+((1.0-float(l9_5076))*(1.0-l9_5079)));
l9_5073=l9_5078;
l9_5069=l9_5073;
l9_5072=l9_5077;
}
l9_5026.x=l9_5069;
l9_5036=l9_5072;
float l9_5080=l9_5026.y;
int l9_5081=l9_5029.y;
bool l9_5082=l9_5035;
float l9_5083=l9_5036;
if ((l9_5081==0)||(l9_5081==3))
{
float l9_5084=l9_5080;
float l9_5085=0.0;
float l9_5086=1.0;
bool l9_5087=l9_5082;
float l9_5088=l9_5083;
float l9_5089=fast::clamp(l9_5084,l9_5085,l9_5086);
float l9_5090=step(abs(l9_5084-l9_5089),9.9999997e-06);
l9_5088*=(l9_5090+((1.0-float(l9_5087))*(1.0-l9_5090)));
l9_5084=l9_5089;
l9_5080=l9_5084;
l9_5083=l9_5088;
}
l9_5026.y=l9_5080;
l9_5036=l9_5083;
float2 l9_5091=l9_5026;
int l9_5092=l9_5024;
int l9_5093=l9_5025;
float l9_5094=l9_5034;
float2 l9_5095=l9_5091;
int l9_5096=l9_5092;
int l9_5097=l9_5093;
float3 l9_5098=float3(0.0);
if (l9_5096==0)
{
l9_5098=float3(l9_5095,0.0);
}
else
{
if (l9_5096==1)
{
l9_5098=float3(l9_5095.x,(l9_5095.y*0.5)+(0.5-(float(l9_5097)*0.5)),0.0);
}
else
{
l9_5098=float3(l9_5095,float(l9_5097));
}
}
float3 l9_5099=l9_5098;
float3 l9_5100=l9_5099;
float4 l9_5101=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_5100.xy,bias(l9_5094));
float4 l9_5102=l9_5101;
if (l9_5032)
{
l9_5102=mix(l9_5033,l9_5102,float4(l9_5036));
}
float4 l9_5103=l9_5102;
l9_5017=l9_5103;
l9_4995=l9_5017;
l9_5000=l9_4995;
}
else
{
float2 l9_5104=float2(0.0);
l9_5104=l9_4997.Surface_UVCoord0;
float2 l9_5105=float2(0.0);
float2 l9_5106=(*sc_set0.UserUniforms).patternScaleId01;
l9_5105=l9_5106;
float2 l9_5107=float2(0.0);
l9_5107=((l9_5104-(*sc_set0.UserUniforms).Port_Center_N122)*l9_5105)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_5108=float2(0.0);
float2 l9_5109=(*sc_set0.UserUniforms).patternOffsetId01;
l9_5108=l9_5109;
float2 l9_5110=float2(0.0);
l9_5110=l9_5107+l9_5108;
float l9_5111=0.0;
float l9_5112=(*sc_set0.UserUniforms).patternRotateId01;
l9_5111=l9_5112;
float2 l9_5113=float2(0.0);
float2 l9_5114=l9_5110;
float l9_5115=l9_5111;
float2 l9_5116=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_5117=sin(radians(l9_5115));
float l9_5118=cos(radians(l9_5115));
float2 l9_5119=l9_5114-l9_5116;
l9_5119=float2(dot(float2(l9_5118,l9_5117),l9_5119),dot(float2(-l9_5117,l9_5118),l9_5119))+l9_5116;
l9_5113=l9_5119;
float4 l9_5120=float4(0.0);
int l9_5121;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_5122=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5122=0;
}
else
{
l9_5122=in.varStereoViewID;
}
int l9_5123=l9_5122;
l9_5121=1-l9_5123;
}
else
{
int l9_5124=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5124=0;
}
else
{
l9_5124=in.varStereoViewID;
}
int l9_5125=l9_5124;
l9_5121=l9_5125;
}
int l9_5126=l9_5121;
int l9_5127=patternTextureId01Layout_tmp;
int l9_5128=l9_5126;
float2 l9_5129=l9_5113;
bool l9_5130=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_5131=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_5132=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_5133=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_5134=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_5135=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_5136=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_5137=0.0;
bool l9_5138=l9_5135&&(!l9_5133);
float l9_5139=1.0;
float l9_5140=l9_5129.x;
int l9_5141=l9_5132.x;
if (l9_5141==1)
{
l9_5140=fract(l9_5140);
}
else
{
if (l9_5141==2)
{
float l9_5142=fract(l9_5140);
float l9_5143=l9_5140-l9_5142;
float l9_5144=step(0.25,fract(l9_5143*0.5));
l9_5140=mix(l9_5142,1.0-l9_5142,fast::clamp(l9_5144,0.0,1.0));
}
}
l9_5129.x=l9_5140;
float l9_5145=l9_5129.y;
int l9_5146=l9_5132.y;
if (l9_5146==1)
{
l9_5145=fract(l9_5145);
}
else
{
if (l9_5146==2)
{
float l9_5147=fract(l9_5145);
float l9_5148=l9_5145-l9_5147;
float l9_5149=step(0.25,fract(l9_5148*0.5));
l9_5145=mix(l9_5147,1.0-l9_5147,fast::clamp(l9_5149,0.0,1.0));
}
}
l9_5129.y=l9_5145;
if (l9_5133)
{
bool l9_5150=l9_5135;
bool l9_5151;
if (l9_5150)
{
l9_5151=l9_5132.x==3;
}
else
{
l9_5151=l9_5150;
}
float l9_5152=l9_5129.x;
float l9_5153=l9_5134.x;
float l9_5154=l9_5134.z;
bool l9_5155=l9_5151;
float l9_5156=l9_5139;
float l9_5157=fast::clamp(l9_5152,l9_5153,l9_5154);
float l9_5158=step(abs(l9_5152-l9_5157),9.9999997e-06);
l9_5156*=(l9_5158+((1.0-float(l9_5155))*(1.0-l9_5158)));
l9_5152=l9_5157;
l9_5129.x=l9_5152;
l9_5139=l9_5156;
bool l9_5159=l9_5135;
bool l9_5160;
if (l9_5159)
{
l9_5160=l9_5132.y==3;
}
else
{
l9_5160=l9_5159;
}
float l9_5161=l9_5129.y;
float l9_5162=l9_5134.y;
float l9_5163=l9_5134.w;
bool l9_5164=l9_5160;
float l9_5165=l9_5139;
float l9_5166=fast::clamp(l9_5161,l9_5162,l9_5163);
float l9_5167=step(abs(l9_5161-l9_5166),9.9999997e-06);
l9_5165*=(l9_5167+((1.0-float(l9_5164))*(1.0-l9_5167)));
l9_5161=l9_5166;
l9_5129.y=l9_5161;
l9_5139=l9_5165;
}
float2 l9_5168=l9_5129;
bool l9_5169=l9_5130;
float3x3 l9_5170=l9_5131;
if (l9_5169)
{
l9_5168=float2((l9_5170*float3(l9_5168,1.0)).xy);
}
float2 l9_5171=l9_5168;
l9_5129=l9_5171;
float l9_5172=l9_5129.x;
int l9_5173=l9_5132.x;
bool l9_5174=l9_5138;
float l9_5175=l9_5139;
if ((l9_5173==0)||(l9_5173==3))
{
float l9_5176=l9_5172;
float l9_5177=0.0;
float l9_5178=1.0;
bool l9_5179=l9_5174;
float l9_5180=l9_5175;
float l9_5181=fast::clamp(l9_5176,l9_5177,l9_5178);
float l9_5182=step(abs(l9_5176-l9_5181),9.9999997e-06);
l9_5180*=(l9_5182+((1.0-float(l9_5179))*(1.0-l9_5182)));
l9_5176=l9_5181;
l9_5172=l9_5176;
l9_5175=l9_5180;
}
l9_5129.x=l9_5172;
l9_5139=l9_5175;
float l9_5183=l9_5129.y;
int l9_5184=l9_5132.y;
bool l9_5185=l9_5138;
float l9_5186=l9_5139;
if ((l9_5184==0)||(l9_5184==3))
{
float l9_5187=l9_5183;
float l9_5188=0.0;
float l9_5189=1.0;
bool l9_5190=l9_5185;
float l9_5191=l9_5186;
float l9_5192=fast::clamp(l9_5187,l9_5188,l9_5189);
float l9_5193=step(abs(l9_5187-l9_5192),9.9999997e-06);
l9_5191*=(l9_5193+((1.0-float(l9_5190))*(1.0-l9_5193)));
l9_5187=l9_5192;
l9_5183=l9_5187;
l9_5186=l9_5191;
}
l9_5129.y=l9_5183;
l9_5139=l9_5186;
float2 l9_5194=l9_5129;
int l9_5195=l9_5127;
int l9_5196=l9_5128;
float l9_5197=l9_5137;
float2 l9_5198=l9_5194;
int l9_5199=l9_5195;
int l9_5200=l9_5196;
float3 l9_5201=float3(0.0);
if (l9_5199==0)
{
l9_5201=float3(l9_5198,0.0);
}
else
{
if (l9_5199==1)
{
l9_5201=float3(l9_5198.x,(l9_5198.y*0.5)+(0.5-(float(l9_5200)*0.5)),0.0);
}
else
{
l9_5201=float3(l9_5198,float(l9_5200));
}
}
float3 l9_5202=l9_5201;
float3 l9_5203=l9_5202;
float4 l9_5204=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_5203.xy,bias(l9_5197));
float4 l9_5205=l9_5204;
if (l9_5135)
{
l9_5205=mix(l9_5136,l9_5205,float4(l9_5139));
}
float4 l9_5206=l9_5205;
l9_5120=l9_5206;
float l9_5207=0.0;
float3 l9_5208=l9_5120.xyz;
float l9_5209=l9_5208.x;
l9_5207=l9_5209;
l9_4996=float4(l9_5207);
l9_5000=l9_4996;
}
l9_4993=l9_5000;
float4 l9_5210=float4(0.0);
l9_5210=l9_4991*l9_4993;
l9_4985=l9_5210;
l9_4990=l9_4985;
}
else
{
float4 l9_5211=float4(0.0);
float4 l9_5212=(*sc_set0.UserUniforms).colorId01;
l9_5211=l9_5212;
float2 l9_5213=float2(0.0);
l9_5213=l9_4987.Surface_UVCoord0;
float4 l9_5214=float4(0.0);
int l9_5215;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_5216=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5216=0;
}
else
{
l9_5216=in.varStereoViewID;
}
int l9_5217=l9_5216;
l9_5215=1-l9_5217;
}
else
{
int l9_5218=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5218=0;
}
else
{
l9_5218=in.varStereoViewID;
}
int l9_5219=l9_5218;
l9_5215=l9_5219;
}
int l9_5220=l9_5215;
int l9_5221=greyMaskIdLayout_tmp;
int l9_5222=l9_5220;
float2 l9_5223=l9_5213;
bool l9_5224=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_5225=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_5226=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_5227=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_5228=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_5229=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_5230=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_5231=0.0;
bool l9_5232=l9_5229&&(!l9_5227);
float l9_5233=1.0;
float l9_5234=l9_5223.x;
int l9_5235=l9_5226.x;
if (l9_5235==1)
{
l9_5234=fract(l9_5234);
}
else
{
if (l9_5235==2)
{
float l9_5236=fract(l9_5234);
float l9_5237=l9_5234-l9_5236;
float l9_5238=step(0.25,fract(l9_5237*0.5));
l9_5234=mix(l9_5236,1.0-l9_5236,fast::clamp(l9_5238,0.0,1.0));
}
}
l9_5223.x=l9_5234;
float l9_5239=l9_5223.y;
int l9_5240=l9_5226.y;
if (l9_5240==1)
{
l9_5239=fract(l9_5239);
}
else
{
if (l9_5240==2)
{
float l9_5241=fract(l9_5239);
float l9_5242=l9_5239-l9_5241;
float l9_5243=step(0.25,fract(l9_5242*0.5));
l9_5239=mix(l9_5241,1.0-l9_5241,fast::clamp(l9_5243,0.0,1.0));
}
}
l9_5223.y=l9_5239;
if (l9_5227)
{
bool l9_5244=l9_5229;
bool l9_5245;
if (l9_5244)
{
l9_5245=l9_5226.x==3;
}
else
{
l9_5245=l9_5244;
}
float l9_5246=l9_5223.x;
float l9_5247=l9_5228.x;
float l9_5248=l9_5228.z;
bool l9_5249=l9_5245;
float l9_5250=l9_5233;
float l9_5251=fast::clamp(l9_5246,l9_5247,l9_5248);
float l9_5252=step(abs(l9_5246-l9_5251),9.9999997e-06);
l9_5250*=(l9_5252+((1.0-float(l9_5249))*(1.0-l9_5252)));
l9_5246=l9_5251;
l9_5223.x=l9_5246;
l9_5233=l9_5250;
bool l9_5253=l9_5229;
bool l9_5254;
if (l9_5253)
{
l9_5254=l9_5226.y==3;
}
else
{
l9_5254=l9_5253;
}
float l9_5255=l9_5223.y;
float l9_5256=l9_5228.y;
float l9_5257=l9_5228.w;
bool l9_5258=l9_5254;
float l9_5259=l9_5233;
float l9_5260=fast::clamp(l9_5255,l9_5256,l9_5257);
float l9_5261=step(abs(l9_5255-l9_5260),9.9999997e-06);
l9_5259*=(l9_5261+((1.0-float(l9_5258))*(1.0-l9_5261)));
l9_5255=l9_5260;
l9_5223.y=l9_5255;
l9_5233=l9_5259;
}
float2 l9_5262=l9_5223;
bool l9_5263=l9_5224;
float3x3 l9_5264=l9_5225;
if (l9_5263)
{
l9_5262=float2((l9_5264*float3(l9_5262,1.0)).xy);
}
float2 l9_5265=l9_5262;
l9_5223=l9_5265;
float l9_5266=l9_5223.x;
int l9_5267=l9_5226.x;
bool l9_5268=l9_5232;
float l9_5269=l9_5233;
if ((l9_5267==0)||(l9_5267==3))
{
float l9_5270=l9_5266;
float l9_5271=0.0;
float l9_5272=1.0;
bool l9_5273=l9_5268;
float l9_5274=l9_5269;
float l9_5275=fast::clamp(l9_5270,l9_5271,l9_5272);
float l9_5276=step(abs(l9_5270-l9_5275),9.9999997e-06);
l9_5274*=(l9_5276+((1.0-float(l9_5273))*(1.0-l9_5276)));
l9_5270=l9_5275;
l9_5266=l9_5270;
l9_5269=l9_5274;
}
l9_5223.x=l9_5266;
l9_5233=l9_5269;
float l9_5277=l9_5223.y;
int l9_5278=l9_5226.y;
bool l9_5279=l9_5232;
float l9_5280=l9_5233;
if ((l9_5278==0)||(l9_5278==3))
{
float l9_5281=l9_5277;
float l9_5282=0.0;
float l9_5283=1.0;
bool l9_5284=l9_5279;
float l9_5285=l9_5280;
float l9_5286=fast::clamp(l9_5281,l9_5282,l9_5283);
float l9_5287=step(abs(l9_5281-l9_5286),9.9999997e-06);
l9_5285*=(l9_5287+((1.0-float(l9_5284))*(1.0-l9_5287)));
l9_5281=l9_5286;
l9_5277=l9_5281;
l9_5280=l9_5285;
}
l9_5223.y=l9_5277;
l9_5233=l9_5280;
float2 l9_5288=l9_5223;
int l9_5289=l9_5221;
int l9_5290=l9_5222;
float l9_5291=l9_5231;
float2 l9_5292=l9_5288;
int l9_5293=l9_5289;
int l9_5294=l9_5290;
float3 l9_5295=float3(0.0);
if (l9_5293==0)
{
l9_5295=float3(l9_5292,0.0);
}
else
{
if (l9_5293==1)
{
l9_5295=float3(l9_5292.x,(l9_5292.y*0.5)+(0.5-(float(l9_5294)*0.5)),0.0);
}
else
{
l9_5295=float3(l9_5292,float(l9_5294));
}
}
float3 l9_5296=l9_5295;
float3 l9_5297=l9_5296;
float4 l9_5298=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_5297.xy,bias(l9_5291));
float4 l9_5299=l9_5298;
if (l9_5229)
{
l9_5299=mix(l9_5230,l9_5299,float4(l9_5233));
}
float4 l9_5300=l9_5299;
l9_5214=l9_5300;
float l9_5301=0.0;
l9_5301=l9_5214.x;
float l9_5302=0.0;
l9_5302=step(l9_5301,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_5303=float4(0.0);
l9_5303=l9_5211*float4(l9_5302);
l9_4986=l9_5303;
l9_4990=l9_4986;
}
l9_4983=l9_4990;
float2 l9_5304=float2(0.0);
l9_5304=l9_4969.Surface_UVCoord0;
float4 l9_5305=float4(0.0);
int l9_5306;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_5307=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5307=0;
}
else
{
l9_5307=in.varStereoViewID;
}
int l9_5308=l9_5307;
l9_5306=1-l9_5308;
}
else
{
int l9_5309=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5309=0;
}
else
{
l9_5309=in.varStereoViewID;
}
int l9_5310=l9_5309;
l9_5306=l9_5310;
}
int l9_5311=l9_5306;
int l9_5312=greyMaskIdLayout_tmp;
int l9_5313=l9_5311;
float2 l9_5314=l9_5304;
bool l9_5315=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_5316=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_5317=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_5318=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_5319=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_5320=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_5321=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_5322=0.0;
bool l9_5323=l9_5320&&(!l9_5318);
float l9_5324=1.0;
float l9_5325=l9_5314.x;
int l9_5326=l9_5317.x;
if (l9_5326==1)
{
l9_5325=fract(l9_5325);
}
else
{
if (l9_5326==2)
{
float l9_5327=fract(l9_5325);
float l9_5328=l9_5325-l9_5327;
float l9_5329=step(0.25,fract(l9_5328*0.5));
l9_5325=mix(l9_5327,1.0-l9_5327,fast::clamp(l9_5329,0.0,1.0));
}
}
l9_5314.x=l9_5325;
float l9_5330=l9_5314.y;
int l9_5331=l9_5317.y;
if (l9_5331==1)
{
l9_5330=fract(l9_5330);
}
else
{
if (l9_5331==2)
{
float l9_5332=fract(l9_5330);
float l9_5333=l9_5330-l9_5332;
float l9_5334=step(0.25,fract(l9_5333*0.5));
l9_5330=mix(l9_5332,1.0-l9_5332,fast::clamp(l9_5334,0.0,1.0));
}
}
l9_5314.y=l9_5330;
if (l9_5318)
{
bool l9_5335=l9_5320;
bool l9_5336;
if (l9_5335)
{
l9_5336=l9_5317.x==3;
}
else
{
l9_5336=l9_5335;
}
float l9_5337=l9_5314.x;
float l9_5338=l9_5319.x;
float l9_5339=l9_5319.z;
bool l9_5340=l9_5336;
float l9_5341=l9_5324;
float l9_5342=fast::clamp(l9_5337,l9_5338,l9_5339);
float l9_5343=step(abs(l9_5337-l9_5342),9.9999997e-06);
l9_5341*=(l9_5343+((1.0-float(l9_5340))*(1.0-l9_5343)));
l9_5337=l9_5342;
l9_5314.x=l9_5337;
l9_5324=l9_5341;
bool l9_5344=l9_5320;
bool l9_5345;
if (l9_5344)
{
l9_5345=l9_5317.y==3;
}
else
{
l9_5345=l9_5344;
}
float l9_5346=l9_5314.y;
float l9_5347=l9_5319.y;
float l9_5348=l9_5319.w;
bool l9_5349=l9_5345;
float l9_5350=l9_5324;
float l9_5351=fast::clamp(l9_5346,l9_5347,l9_5348);
float l9_5352=step(abs(l9_5346-l9_5351),9.9999997e-06);
l9_5350*=(l9_5352+((1.0-float(l9_5349))*(1.0-l9_5352)));
l9_5346=l9_5351;
l9_5314.y=l9_5346;
l9_5324=l9_5350;
}
float2 l9_5353=l9_5314;
bool l9_5354=l9_5315;
float3x3 l9_5355=l9_5316;
if (l9_5354)
{
l9_5353=float2((l9_5355*float3(l9_5353,1.0)).xy);
}
float2 l9_5356=l9_5353;
l9_5314=l9_5356;
float l9_5357=l9_5314.x;
int l9_5358=l9_5317.x;
bool l9_5359=l9_5323;
float l9_5360=l9_5324;
if ((l9_5358==0)||(l9_5358==3))
{
float l9_5361=l9_5357;
float l9_5362=0.0;
float l9_5363=1.0;
bool l9_5364=l9_5359;
float l9_5365=l9_5360;
float l9_5366=fast::clamp(l9_5361,l9_5362,l9_5363);
float l9_5367=step(abs(l9_5361-l9_5366),9.9999997e-06);
l9_5365*=(l9_5367+((1.0-float(l9_5364))*(1.0-l9_5367)));
l9_5361=l9_5366;
l9_5357=l9_5361;
l9_5360=l9_5365;
}
l9_5314.x=l9_5357;
l9_5324=l9_5360;
float l9_5368=l9_5314.y;
int l9_5369=l9_5317.y;
bool l9_5370=l9_5323;
float l9_5371=l9_5324;
if ((l9_5369==0)||(l9_5369==3))
{
float l9_5372=l9_5368;
float l9_5373=0.0;
float l9_5374=1.0;
bool l9_5375=l9_5370;
float l9_5376=l9_5371;
float l9_5377=fast::clamp(l9_5372,l9_5373,l9_5374);
float l9_5378=step(abs(l9_5372-l9_5377),9.9999997e-06);
l9_5376*=(l9_5378+((1.0-float(l9_5375))*(1.0-l9_5378)));
l9_5372=l9_5377;
l9_5368=l9_5372;
l9_5371=l9_5376;
}
l9_5314.y=l9_5368;
l9_5324=l9_5371;
float2 l9_5379=l9_5314;
int l9_5380=l9_5312;
int l9_5381=l9_5313;
float l9_5382=l9_5322;
float2 l9_5383=l9_5379;
int l9_5384=l9_5380;
int l9_5385=l9_5381;
float3 l9_5386=float3(0.0);
if (l9_5384==0)
{
l9_5386=float3(l9_5383,0.0);
}
else
{
if (l9_5384==1)
{
l9_5386=float3(l9_5383.x,(l9_5383.y*0.5)+(0.5-(float(l9_5385)*0.5)),0.0);
}
else
{
l9_5386=float3(l9_5383,float(l9_5385));
}
}
float3 l9_5387=l9_5386;
float3 l9_5388=l9_5387;
float4 l9_5389=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_5388.xy,bias(l9_5382));
float4 l9_5390=l9_5389;
if (l9_5320)
{
l9_5390=mix(l9_5321,l9_5390,float4(l9_5324));
}
float4 l9_5391=l9_5390;
l9_5305=l9_5391;
float l9_5392=0.0;
l9_5392=l9_5305.x;
float l9_5393=0.0;
l9_5393=step(l9_5392,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_5394=float4(0.0);
l9_5394=l9_4983*float4(l9_5393);
float4 l9_5395=float4(0.0);
float4 l9_5396=(*sc_set0.UserUniforms).colorId01;
l9_5395=l9_5396;
float4 l9_5397=float4(0.0);
l9_5397=l9_5395*float4(l9_5393);
float4 l9_5398=float4(0.0);
float4 l9_5399=l9_5394;
float4 l9_5400=l9_5397;
float4 l9_5401=l9_5399;
float4 l9_5402=l9_5400;
float3 l9_5403=l9_5401.xyz*l9_5401.w;
l9_5401=float4(l9_5403.x,l9_5403.y,l9_5403.z,l9_5401.w);
float4 l9_5404=l9_5401+(l9_5402*(1.0-l9_5401.w));
l9_5398=l9_5404;
float4 l9_5405=float4(0.0);
l9_5405=float4(l9_4977)*l9_5398;
float4 l9_5406=float4(0.0);
l9_5406=l9_5405+l9_5398;
l9_4967=l9_5406;
l9_4972=l9_4967;
}
else
{
float4 l9_5407=float4(0.0);
float l9_5408=0.0;
float4 l9_5409=float4(0.0);
float4 l9_5410=float4(0.0);
ssGlobals l9_5411=l9_4969;
float l9_5412=0.0;
float l9_5413=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_5412=l9_5413;
l9_5408=l9_5412;
float4 l9_5414;
if ((l9_5408*1.0)!=0.0)
{
float4 l9_5415=float4(0.0);
float4 l9_5416=(*sc_set0.UserUniforms).patternColorId01;
l9_5415=l9_5416;
float4 l9_5417=float4(0.0);
float l9_5418=0.0;
float4 l9_5419=float4(0.0);
float4 l9_5420=float4(0.0);
ssGlobals l9_5421=l9_5411;
float l9_5422=0.0;
float l9_5423=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_5422=l9_5423;
l9_5418=l9_5422;
float4 l9_5424;
if ((l9_5418*1.0)!=0.0)
{
float2 l9_5425=float2(0.0);
l9_5425=l9_5421.Surface_UVCoord0;
float2 l9_5426=float2(0.0);
float2 l9_5427=(*sc_set0.UserUniforms).patternScaleId01;
l9_5426=l9_5427;
float2 l9_5428=float2(0.0);
l9_5428=((l9_5425-(*sc_set0.UserUniforms).Port_Center_N122)*l9_5426)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_5429=float2(0.0);
float2 l9_5430=(*sc_set0.UserUniforms).patternOffsetId01;
l9_5429=l9_5430;
float2 l9_5431=float2(0.0);
l9_5431=l9_5428+l9_5429;
float l9_5432=0.0;
float l9_5433=(*sc_set0.UserUniforms).patternRotateId01;
l9_5432=l9_5433;
float2 l9_5434=float2(0.0);
float2 l9_5435=l9_5431;
float l9_5436=l9_5432;
float2 l9_5437=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_5438=sin(radians(l9_5436));
float l9_5439=cos(radians(l9_5436));
float2 l9_5440=l9_5435-l9_5437;
l9_5440=float2(dot(float2(l9_5439,l9_5438),l9_5440),dot(float2(-l9_5438,l9_5439),l9_5440))+l9_5437;
l9_5434=l9_5440;
float4 l9_5441=float4(0.0);
int l9_5442;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_5443=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5443=0;
}
else
{
l9_5443=in.varStereoViewID;
}
int l9_5444=l9_5443;
l9_5442=1-l9_5444;
}
else
{
int l9_5445=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5445=0;
}
else
{
l9_5445=in.varStereoViewID;
}
int l9_5446=l9_5445;
l9_5442=l9_5446;
}
int l9_5447=l9_5442;
int l9_5448=patternTextureId01Layout_tmp;
int l9_5449=l9_5447;
float2 l9_5450=l9_5434;
bool l9_5451=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_5452=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_5453=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_5454=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_5455=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_5456=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_5457=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_5458=0.0;
bool l9_5459=l9_5456&&(!l9_5454);
float l9_5460=1.0;
float l9_5461=l9_5450.x;
int l9_5462=l9_5453.x;
if (l9_5462==1)
{
l9_5461=fract(l9_5461);
}
else
{
if (l9_5462==2)
{
float l9_5463=fract(l9_5461);
float l9_5464=l9_5461-l9_5463;
float l9_5465=step(0.25,fract(l9_5464*0.5));
l9_5461=mix(l9_5463,1.0-l9_5463,fast::clamp(l9_5465,0.0,1.0));
}
}
l9_5450.x=l9_5461;
float l9_5466=l9_5450.y;
int l9_5467=l9_5453.y;
if (l9_5467==1)
{
l9_5466=fract(l9_5466);
}
else
{
if (l9_5467==2)
{
float l9_5468=fract(l9_5466);
float l9_5469=l9_5466-l9_5468;
float l9_5470=step(0.25,fract(l9_5469*0.5));
l9_5466=mix(l9_5468,1.0-l9_5468,fast::clamp(l9_5470,0.0,1.0));
}
}
l9_5450.y=l9_5466;
if (l9_5454)
{
bool l9_5471=l9_5456;
bool l9_5472;
if (l9_5471)
{
l9_5472=l9_5453.x==3;
}
else
{
l9_5472=l9_5471;
}
float l9_5473=l9_5450.x;
float l9_5474=l9_5455.x;
float l9_5475=l9_5455.z;
bool l9_5476=l9_5472;
float l9_5477=l9_5460;
float l9_5478=fast::clamp(l9_5473,l9_5474,l9_5475);
float l9_5479=step(abs(l9_5473-l9_5478),9.9999997e-06);
l9_5477*=(l9_5479+((1.0-float(l9_5476))*(1.0-l9_5479)));
l9_5473=l9_5478;
l9_5450.x=l9_5473;
l9_5460=l9_5477;
bool l9_5480=l9_5456;
bool l9_5481;
if (l9_5480)
{
l9_5481=l9_5453.y==3;
}
else
{
l9_5481=l9_5480;
}
float l9_5482=l9_5450.y;
float l9_5483=l9_5455.y;
float l9_5484=l9_5455.w;
bool l9_5485=l9_5481;
float l9_5486=l9_5460;
float l9_5487=fast::clamp(l9_5482,l9_5483,l9_5484);
float l9_5488=step(abs(l9_5482-l9_5487),9.9999997e-06);
l9_5486*=(l9_5488+((1.0-float(l9_5485))*(1.0-l9_5488)));
l9_5482=l9_5487;
l9_5450.y=l9_5482;
l9_5460=l9_5486;
}
float2 l9_5489=l9_5450;
bool l9_5490=l9_5451;
float3x3 l9_5491=l9_5452;
if (l9_5490)
{
l9_5489=float2((l9_5491*float3(l9_5489,1.0)).xy);
}
float2 l9_5492=l9_5489;
l9_5450=l9_5492;
float l9_5493=l9_5450.x;
int l9_5494=l9_5453.x;
bool l9_5495=l9_5459;
float l9_5496=l9_5460;
if ((l9_5494==0)||(l9_5494==3))
{
float l9_5497=l9_5493;
float l9_5498=0.0;
float l9_5499=1.0;
bool l9_5500=l9_5495;
float l9_5501=l9_5496;
float l9_5502=fast::clamp(l9_5497,l9_5498,l9_5499);
float l9_5503=step(abs(l9_5497-l9_5502),9.9999997e-06);
l9_5501*=(l9_5503+((1.0-float(l9_5500))*(1.0-l9_5503)));
l9_5497=l9_5502;
l9_5493=l9_5497;
l9_5496=l9_5501;
}
l9_5450.x=l9_5493;
l9_5460=l9_5496;
float l9_5504=l9_5450.y;
int l9_5505=l9_5453.y;
bool l9_5506=l9_5459;
float l9_5507=l9_5460;
if ((l9_5505==0)||(l9_5505==3))
{
float l9_5508=l9_5504;
float l9_5509=0.0;
float l9_5510=1.0;
bool l9_5511=l9_5506;
float l9_5512=l9_5507;
float l9_5513=fast::clamp(l9_5508,l9_5509,l9_5510);
float l9_5514=step(abs(l9_5508-l9_5513),9.9999997e-06);
l9_5512*=(l9_5514+((1.0-float(l9_5511))*(1.0-l9_5514)));
l9_5508=l9_5513;
l9_5504=l9_5508;
l9_5507=l9_5512;
}
l9_5450.y=l9_5504;
l9_5460=l9_5507;
float2 l9_5515=l9_5450;
int l9_5516=l9_5448;
int l9_5517=l9_5449;
float l9_5518=l9_5458;
float2 l9_5519=l9_5515;
int l9_5520=l9_5516;
int l9_5521=l9_5517;
float3 l9_5522=float3(0.0);
if (l9_5520==0)
{
l9_5522=float3(l9_5519,0.0);
}
else
{
if (l9_5520==1)
{
l9_5522=float3(l9_5519.x,(l9_5519.y*0.5)+(0.5-(float(l9_5521)*0.5)),0.0);
}
else
{
l9_5522=float3(l9_5519,float(l9_5521));
}
}
float3 l9_5523=l9_5522;
float3 l9_5524=l9_5523;
float4 l9_5525=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_5524.xy,bias(l9_5518));
float4 l9_5526=l9_5525;
if (l9_5456)
{
l9_5526=mix(l9_5457,l9_5526,float4(l9_5460));
}
float4 l9_5527=l9_5526;
l9_5441=l9_5527;
l9_5419=l9_5441;
l9_5424=l9_5419;
}
else
{
float2 l9_5528=float2(0.0);
l9_5528=l9_5421.Surface_UVCoord0;
float2 l9_5529=float2(0.0);
float2 l9_5530=(*sc_set0.UserUniforms).patternScaleId01;
l9_5529=l9_5530;
float2 l9_5531=float2(0.0);
l9_5531=((l9_5528-(*sc_set0.UserUniforms).Port_Center_N122)*l9_5529)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_5532=float2(0.0);
float2 l9_5533=(*sc_set0.UserUniforms).patternOffsetId01;
l9_5532=l9_5533;
float2 l9_5534=float2(0.0);
l9_5534=l9_5531+l9_5532;
float l9_5535=0.0;
float l9_5536=(*sc_set0.UserUniforms).patternRotateId01;
l9_5535=l9_5536;
float2 l9_5537=float2(0.0);
float2 l9_5538=l9_5534;
float l9_5539=l9_5535;
float2 l9_5540=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_5541=sin(radians(l9_5539));
float l9_5542=cos(radians(l9_5539));
float2 l9_5543=l9_5538-l9_5540;
l9_5543=float2(dot(float2(l9_5542,l9_5541),l9_5543),dot(float2(-l9_5541,l9_5542),l9_5543))+l9_5540;
l9_5537=l9_5543;
float4 l9_5544=float4(0.0);
int l9_5545;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_5546=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5546=0;
}
else
{
l9_5546=in.varStereoViewID;
}
int l9_5547=l9_5546;
l9_5545=1-l9_5547;
}
else
{
int l9_5548=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5548=0;
}
else
{
l9_5548=in.varStereoViewID;
}
int l9_5549=l9_5548;
l9_5545=l9_5549;
}
int l9_5550=l9_5545;
int l9_5551=patternTextureId01Layout_tmp;
int l9_5552=l9_5550;
float2 l9_5553=l9_5537;
bool l9_5554=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_5555=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_5556=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_5557=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_5558=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_5559=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_5560=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_5561=0.0;
bool l9_5562=l9_5559&&(!l9_5557);
float l9_5563=1.0;
float l9_5564=l9_5553.x;
int l9_5565=l9_5556.x;
if (l9_5565==1)
{
l9_5564=fract(l9_5564);
}
else
{
if (l9_5565==2)
{
float l9_5566=fract(l9_5564);
float l9_5567=l9_5564-l9_5566;
float l9_5568=step(0.25,fract(l9_5567*0.5));
l9_5564=mix(l9_5566,1.0-l9_5566,fast::clamp(l9_5568,0.0,1.0));
}
}
l9_5553.x=l9_5564;
float l9_5569=l9_5553.y;
int l9_5570=l9_5556.y;
if (l9_5570==1)
{
l9_5569=fract(l9_5569);
}
else
{
if (l9_5570==2)
{
float l9_5571=fract(l9_5569);
float l9_5572=l9_5569-l9_5571;
float l9_5573=step(0.25,fract(l9_5572*0.5));
l9_5569=mix(l9_5571,1.0-l9_5571,fast::clamp(l9_5573,0.0,1.0));
}
}
l9_5553.y=l9_5569;
if (l9_5557)
{
bool l9_5574=l9_5559;
bool l9_5575;
if (l9_5574)
{
l9_5575=l9_5556.x==3;
}
else
{
l9_5575=l9_5574;
}
float l9_5576=l9_5553.x;
float l9_5577=l9_5558.x;
float l9_5578=l9_5558.z;
bool l9_5579=l9_5575;
float l9_5580=l9_5563;
float l9_5581=fast::clamp(l9_5576,l9_5577,l9_5578);
float l9_5582=step(abs(l9_5576-l9_5581),9.9999997e-06);
l9_5580*=(l9_5582+((1.0-float(l9_5579))*(1.0-l9_5582)));
l9_5576=l9_5581;
l9_5553.x=l9_5576;
l9_5563=l9_5580;
bool l9_5583=l9_5559;
bool l9_5584;
if (l9_5583)
{
l9_5584=l9_5556.y==3;
}
else
{
l9_5584=l9_5583;
}
float l9_5585=l9_5553.y;
float l9_5586=l9_5558.y;
float l9_5587=l9_5558.w;
bool l9_5588=l9_5584;
float l9_5589=l9_5563;
float l9_5590=fast::clamp(l9_5585,l9_5586,l9_5587);
float l9_5591=step(abs(l9_5585-l9_5590),9.9999997e-06);
l9_5589*=(l9_5591+((1.0-float(l9_5588))*(1.0-l9_5591)));
l9_5585=l9_5590;
l9_5553.y=l9_5585;
l9_5563=l9_5589;
}
float2 l9_5592=l9_5553;
bool l9_5593=l9_5554;
float3x3 l9_5594=l9_5555;
if (l9_5593)
{
l9_5592=float2((l9_5594*float3(l9_5592,1.0)).xy);
}
float2 l9_5595=l9_5592;
l9_5553=l9_5595;
float l9_5596=l9_5553.x;
int l9_5597=l9_5556.x;
bool l9_5598=l9_5562;
float l9_5599=l9_5563;
if ((l9_5597==0)||(l9_5597==3))
{
float l9_5600=l9_5596;
float l9_5601=0.0;
float l9_5602=1.0;
bool l9_5603=l9_5598;
float l9_5604=l9_5599;
float l9_5605=fast::clamp(l9_5600,l9_5601,l9_5602);
float l9_5606=step(abs(l9_5600-l9_5605),9.9999997e-06);
l9_5604*=(l9_5606+((1.0-float(l9_5603))*(1.0-l9_5606)));
l9_5600=l9_5605;
l9_5596=l9_5600;
l9_5599=l9_5604;
}
l9_5553.x=l9_5596;
l9_5563=l9_5599;
float l9_5607=l9_5553.y;
int l9_5608=l9_5556.y;
bool l9_5609=l9_5562;
float l9_5610=l9_5563;
if ((l9_5608==0)||(l9_5608==3))
{
float l9_5611=l9_5607;
float l9_5612=0.0;
float l9_5613=1.0;
bool l9_5614=l9_5609;
float l9_5615=l9_5610;
float l9_5616=fast::clamp(l9_5611,l9_5612,l9_5613);
float l9_5617=step(abs(l9_5611-l9_5616),9.9999997e-06);
l9_5615*=(l9_5617+((1.0-float(l9_5614))*(1.0-l9_5617)));
l9_5611=l9_5616;
l9_5607=l9_5611;
l9_5610=l9_5615;
}
l9_5553.y=l9_5607;
l9_5563=l9_5610;
float2 l9_5618=l9_5553;
int l9_5619=l9_5551;
int l9_5620=l9_5552;
float l9_5621=l9_5561;
float2 l9_5622=l9_5618;
int l9_5623=l9_5619;
int l9_5624=l9_5620;
float3 l9_5625=float3(0.0);
if (l9_5623==0)
{
l9_5625=float3(l9_5622,0.0);
}
else
{
if (l9_5623==1)
{
l9_5625=float3(l9_5622.x,(l9_5622.y*0.5)+(0.5-(float(l9_5624)*0.5)),0.0);
}
else
{
l9_5625=float3(l9_5622,float(l9_5624));
}
}
float3 l9_5626=l9_5625;
float3 l9_5627=l9_5626;
float4 l9_5628=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_5627.xy,bias(l9_5621));
float4 l9_5629=l9_5628;
if (l9_5559)
{
l9_5629=mix(l9_5560,l9_5629,float4(l9_5563));
}
float4 l9_5630=l9_5629;
l9_5544=l9_5630;
float l9_5631=0.0;
float3 l9_5632=l9_5544.xyz;
float l9_5633=l9_5632.x;
l9_5631=l9_5633;
l9_5420=float4(l9_5631);
l9_5424=l9_5420;
}
l9_5417=l9_5424;
float4 l9_5634=float4(0.0);
l9_5634=l9_5415*l9_5417;
l9_5409=l9_5634;
l9_5414=l9_5409;
}
else
{
float4 l9_5635=float4(0.0);
float4 l9_5636=(*sc_set0.UserUniforms).colorId01;
l9_5635=l9_5636;
float2 l9_5637=float2(0.0);
l9_5637=l9_5411.Surface_UVCoord0;
float4 l9_5638=float4(0.0);
int l9_5639;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_5640=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5640=0;
}
else
{
l9_5640=in.varStereoViewID;
}
int l9_5641=l9_5640;
l9_5639=1-l9_5641;
}
else
{
int l9_5642=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5642=0;
}
else
{
l9_5642=in.varStereoViewID;
}
int l9_5643=l9_5642;
l9_5639=l9_5643;
}
int l9_5644=l9_5639;
int l9_5645=greyMaskIdLayout_tmp;
int l9_5646=l9_5644;
float2 l9_5647=l9_5637;
bool l9_5648=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_5649=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_5650=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_5651=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_5652=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_5653=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_5654=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_5655=0.0;
bool l9_5656=l9_5653&&(!l9_5651);
float l9_5657=1.0;
float l9_5658=l9_5647.x;
int l9_5659=l9_5650.x;
if (l9_5659==1)
{
l9_5658=fract(l9_5658);
}
else
{
if (l9_5659==2)
{
float l9_5660=fract(l9_5658);
float l9_5661=l9_5658-l9_5660;
float l9_5662=step(0.25,fract(l9_5661*0.5));
l9_5658=mix(l9_5660,1.0-l9_5660,fast::clamp(l9_5662,0.0,1.0));
}
}
l9_5647.x=l9_5658;
float l9_5663=l9_5647.y;
int l9_5664=l9_5650.y;
if (l9_5664==1)
{
l9_5663=fract(l9_5663);
}
else
{
if (l9_5664==2)
{
float l9_5665=fract(l9_5663);
float l9_5666=l9_5663-l9_5665;
float l9_5667=step(0.25,fract(l9_5666*0.5));
l9_5663=mix(l9_5665,1.0-l9_5665,fast::clamp(l9_5667,0.0,1.0));
}
}
l9_5647.y=l9_5663;
if (l9_5651)
{
bool l9_5668=l9_5653;
bool l9_5669;
if (l9_5668)
{
l9_5669=l9_5650.x==3;
}
else
{
l9_5669=l9_5668;
}
float l9_5670=l9_5647.x;
float l9_5671=l9_5652.x;
float l9_5672=l9_5652.z;
bool l9_5673=l9_5669;
float l9_5674=l9_5657;
float l9_5675=fast::clamp(l9_5670,l9_5671,l9_5672);
float l9_5676=step(abs(l9_5670-l9_5675),9.9999997e-06);
l9_5674*=(l9_5676+((1.0-float(l9_5673))*(1.0-l9_5676)));
l9_5670=l9_5675;
l9_5647.x=l9_5670;
l9_5657=l9_5674;
bool l9_5677=l9_5653;
bool l9_5678;
if (l9_5677)
{
l9_5678=l9_5650.y==3;
}
else
{
l9_5678=l9_5677;
}
float l9_5679=l9_5647.y;
float l9_5680=l9_5652.y;
float l9_5681=l9_5652.w;
bool l9_5682=l9_5678;
float l9_5683=l9_5657;
float l9_5684=fast::clamp(l9_5679,l9_5680,l9_5681);
float l9_5685=step(abs(l9_5679-l9_5684),9.9999997e-06);
l9_5683*=(l9_5685+((1.0-float(l9_5682))*(1.0-l9_5685)));
l9_5679=l9_5684;
l9_5647.y=l9_5679;
l9_5657=l9_5683;
}
float2 l9_5686=l9_5647;
bool l9_5687=l9_5648;
float3x3 l9_5688=l9_5649;
if (l9_5687)
{
l9_5686=float2((l9_5688*float3(l9_5686,1.0)).xy);
}
float2 l9_5689=l9_5686;
l9_5647=l9_5689;
float l9_5690=l9_5647.x;
int l9_5691=l9_5650.x;
bool l9_5692=l9_5656;
float l9_5693=l9_5657;
if ((l9_5691==0)||(l9_5691==3))
{
float l9_5694=l9_5690;
float l9_5695=0.0;
float l9_5696=1.0;
bool l9_5697=l9_5692;
float l9_5698=l9_5693;
float l9_5699=fast::clamp(l9_5694,l9_5695,l9_5696);
float l9_5700=step(abs(l9_5694-l9_5699),9.9999997e-06);
l9_5698*=(l9_5700+((1.0-float(l9_5697))*(1.0-l9_5700)));
l9_5694=l9_5699;
l9_5690=l9_5694;
l9_5693=l9_5698;
}
l9_5647.x=l9_5690;
l9_5657=l9_5693;
float l9_5701=l9_5647.y;
int l9_5702=l9_5650.y;
bool l9_5703=l9_5656;
float l9_5704=l9_5657;
if ((l9_5702==0)||(l9_5702==3))
{
float l9_5705=l9_5701;
float l9_5706=0.0;
float l9_5707=1.0;
bool l9_5708=l9_5703;
float l9_5709=l9_5704;
float l9_5710=fast::clamp(l9_5705,l9_5706,l9_5707);
float l9_5711=step(abs(l9_5705-l9_5710),9.9999997e-06);
l9_5709*=(l9_5711+((1.0-float(l9_5708))*(1.0-l9_5711)));
l9_5705=l9_5710;
l9_5701=l9_5705;
l9_5704=l9_5709;
}
l9_5647.y=l9_5701;
l9_5657=l9_5704;
float2 l9_5712=l9_5647;
int l9_5713=l9_5645;
int l9_5714=l9_5646;
float l9_5715=l9_5655;
float2 l9_5716=l9_5712;
int l9_5717=l9_5713;
int l9_5718=l9_5714;
float3 l9_5719=float3(0.0);
if (l9_5717==0)
{
l9_5719=float3(l9_5716,0.0);
}
else
{
if (l9_5717==1)
{
l9_5719=float3(l9_5716.x,(l9_5716.y*0.5)+(0.5-(float(l9_5718)*0.5)),0.0);
}
else
{
l9_5719=float3(l9_5716,float(l9_5718));
}
}
float3 l9_5720=l9_5719;
float3 l9_5721=l9_5720;
float4 l9_5722=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_5721.xy,bias(l9_5715));
float4 l9_5723=l9_5722;
if (l9_5653)
{
l9_5723=mix(l9_5654,l9_5723,float4(l9_5657));
}
float4 l9_5724=l9_5723;
l9_5638=l9_5724;
float l9_5725=0.0;
l9_5725=l9_5638.x;
float l9_5726=0.0;
l9_5726=step(l9_5725,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_5727=float4(0.0);
l9_5727=l9_5635*float4(l9_5726);
l9_5410=l9_5727;
l9_5414=l9_5410;
}
l9_5407=l9_5414;
float2 l9_5728=float2(0.0);
l9_5728=l9_4969.Surface_UVCoord0;
float4 l9_5729=float4(0.0);
int l9_5730;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_5731=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5731=0;
}
else
{
l9_5731=in.varStereoViewID;
}
int l9_5732=l9_5731;
l9_5730=1-l9_5732;
}
else
{
int l9_5733=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5733=0;
}
else
{
l9_5733=in.varStereoViewID;
}
int l9_5734=l9_5733;
l9_5730=l9_5734;
}
int l9_5735=l9_5730;
int l9_5736=greyMaskIdLayout_tmp;
int l9_5737=l9_5735;
float2 l9_5738=l9_5728;
bool l9_5739=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_5740=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_5741=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_5742=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_5743=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_5744=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_5745=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_5746=0.0;
bool l9_5747=l9_5744&&(!l9_5742);
float l9_5748=1.0;
float l9_5749=l9_5738.x;
int l9_5750=l9_5741.x;
if (l9_5750==1)
{
l9_5749=fract(l9_5749);
}
else
{
if (l9_5750==2)
{
float l9_5751=fract(l9_5749);
float l9_5752=l9_5749-l9_5751;
float l9_5753=step(0.25,fract(l9_5752*0.5));
l9_5749=mix(l9_5751,1.0-l9_5751,fast::clamp(l9_5753,0.0,1.0));
}
}
l9_5738.x=l9_5749;
float l9_5754=l9_5738.y;
int l9_5755=l9_5741.y;
if (l9_5755==1)
{
l9_5754=fract(l9_5754);
}
else
{
if (l9_5755==2)
{
float l9_5756=fract(l9_5754);
float l9_5757=l9_5754-l9_5756;
float l9_5758=step(0.25,fract(l9_5757*0.5));
l9_5754=mix(l9_5756,1.0-l9_5756,fast::clamp(l9_5758,0.0,1.0));
}
}
l9_5738.y=l9_5754;
if (l9_5742)
{
bool l9_5759=l9_5744;
bool l9_5760;
if (l9_5759)
{
l9_5760=l9_5741.x==3;
}
else
{
l9_5760=l9_5759;
}
float l9_5761=l9_5738.x;
float l9_5762=l9_5743.x;
float l9_5763=l9_5743.z;
bool l9_5764=l9_5760;
float l9_5765=l9_5748;
float l9_5766=fast::clamp(l9_5761,l9_5762,l9_5763);
float l9_5767=step(abs(l9_5761-l9_5766),9.9999997e-06);
l9_5765*=(l9_5767+((1.0-float(l9_5764))*(1.0-l9_5767)));
l9_5761=l9_5766;
l9_5738.x=l9_5761;
l9_5748=l9_5765;
bool l9_5768=l9_5744;
bool l9_5769;
if (l9_5768)
{
l9_5769=l9_5741.y==3;
}
else
{
l9_5769=l9_5768;
}
float l9_5770=l9_5738.y;
float l9_5771=l9_5743.y;
float l9_5772=l9_5743.w;
bool l9_5773=l9_5769;
float l9_5774=l9_5748;
float l9_5775=fast::clamp(l9_5770,l9_5771,l9_5772);
float l9_5776=step(abs(l9_5770-l9_5775),9.9999997e-06);
l9_5774*=(l9_5776+((1.0-float(l9_5773))*(1.0-l9_5776)));
l9_5770=l9_5775;
l9_5738.y=l9_5770;
l9_5748=l9_5774;
}
float2 l9_5777=l9_5738;
bool l9_5778=l9_5739;
float3x3 l9_5779=l9_5740;
if (l9_5778)
{
l9_5777=float2((l9_5779*float3(l9_5777,1.0)).xy);
}
float2 l9_5780=l9_5777;
l9_5738=l9_5780;
float l9_5781=l9_5738.x;
int l9_5782=l9_5741.x;
bool l9_5783=l9_5747;
float l9_5784=l9_5748;
if ((l9_5782==0)||(l9_5782==3))
{
float l9_5785=l9_5781;
float l9_5786=0.0;
float l9_5787=1.0;
bool l9_5788=l9_5783;
float l9_5789=l9_5784;
float l9_5790=fast::clamp(l9_5785,l9_5786,l9_5787);
float l9_5791=step(abs(l9_5785-l9_5790),9.9999997e-06);
l9_5789*=(l9_5791+((1.0-float(l9_5788))*(1.0-l9_5791)));
l9_5785=l9_5790;
l9_5781=l9_5785;
l9_5784=l9_5789;
}
l9_5738.x=l9_5781;
l9_5748=l9_5784;
float l9_5792=l9_5738.y;
int l9_5793=l9_5741.y;
bool l9_5794=l9_5747;
float l9_5795=l9_5748;
if ((l9_5793==0)||(l9_5793==3))
{
float l9_5796=l9_5792;
float l9_5797=0.0;
float l9_5798=1.0;
bool l9_5799=l9_5794;
float l9_5800=l9_5795;
float l9_5801=fast::clamp(l9_5796,l9_5797,l9_5798);
float l9_5802=step(abs(l9_5796-l9_5801),9.9999997e-06);
l9_5800*=(l9_5802+((1.0-float(l9_5799))*(1.0-l9_5802)));
l9_5796=l9_5801;
l9_5792=l9_5796;
l9_5795=l9_5800;
}
l9_5738.y=l9_5792;
l9_5748=l9_5795;
float2 l9_5803=l9_5738;
int l9_5804=l9_5736;
int l9_5805=l9_5737;
float l9_5806=l9_5746;
float2 l9_5807=l9_5803;
int l9_5808=l9_5804;
int l9_5809=l9_5805;
float3 l9_5810=float3(0.0);
if (l9_5808==0)
{
l9_5810=float3(l9_5807,0.0);
}
else
{
if (l9_5808==1)
{
l9_5810=float3(l9_5807.x,(l9_5807.y*0.5)+(0.5-(float(l9_5809)*0.5)),0.0);
}
else
{
l9_5810=float3(l9_5807,float(l9_5809));
}
}
float3 l9_5811=l9_5810;
float3 l9_5812=l9_5811;
float4 l9_5813=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_5812.xy,bias(l9_5806));
float4 l9_5814=l9_5813;
if (l9_5744)
{
l9_5814=mix(l9_5745,l9_5814,float4(l9_5748));
}
float4 l9_5815=l9_5814;
l9_5729=l9_5815;
float l9_5816=0.0;
l9_5816=l9_5729.x;
float l9_5817=0.0;
l9_5817=step(l9_5816,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_5818=float4(0.0);
l9_5818=l9_5407*float4(l9_5817);
float4 l9_5819=float4(0.0);
float4 l9_5820=(*sc_set0.UserUniforms).colorId01;
l9_5819=l9_5820;
float4 l9_5821=float4(0.0);
l9_5821=l9_5819*float4(l9_5817);
float4 l9_5822=float4(0.0);
float4 l9_5823=l9_5818;
float4 l9_5824=l9_5821;
float4 l9_5825=l9_5823;
float4 l9_5826=l9_5824;
float3 l9_5827=l9_5825.xyz*l9_5825.w;
l9_5825=float4(l9_5827.x,l9_5827.y,l9_5827.z,l9_5825.w);
float4 l9_5828=l9_5825+(l9_5826*(1.0-l9_5825.w));
l9_5822=l9_5828;
l9_4968=l9_5822;
l9_4972=l9_4968;
}
l9_4965=l9_4972;
l9_4068=l9_4965;
l9_4072=l9_4068;
}
l9_4065=l9_4072;
float2 l9_5829=float2(0.0);
l9_5829=l9_2116.Surface_UVCoord0;
float4 l9_5830=float4(0.0);
int l9_5831;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_5832=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5832=0;
}
else
{
l9_5832=in.varStereoViewID;
}
int l9_5833=l9_5832;
l9_5831=1-l9_5833;
}
else
{
int l9_5834=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5834=0;
}
else
{
l9_5834=in.varStereoViewID;
}
int l9_5835=l9_5834;
l9_5831=l9_5835;
}
int l9_5836=l9_5831;
int l9_5837=greyMaskIdLayout_tmp;
int l9_5838=l9_5836;
float2 l9_5839=l9_5829;
bool l9_5840=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_5841=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_5842=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_5843=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_5844=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_5845=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_5846=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_5847=0.0;
bool l9_5848=l9_5845&&(!l9_5843);
float l9_5849=1.0;
float l9_5850=l9_5839.x;
int l9_5851=l9_5842.x;
if (l9_5851==1)
{
l9_5850=fract(l9_5850);
}
else
{
if (l9_5851==2)
{
float l9_5852=fract(l9_5850);
float l9_5853=l9_5850-l9_5852;
float l9_5854=step(0.25,fract(l9_5853*0.5));
l9_5850=mix(l9_5852,1.0-l9_5852,fast::clamp(l9_5854,0.0,1.0));
}
}
l9_5839.x=l9_5850;
float l9_5855=l9_5839.y;
int l9_5856=l9_5842.y;
if (l9_5856==1)
{
l9_5855=fract(l9_5855);
}
else
{
if (l9_5856==2)
{
float l9_5857=fract(l9_5855);
float l9_5858=l9_5855-l9_5857;
float l9_5859=step(0.25,fract(l9_5858*0.5));
l9_5855=mix(l9_5857,1.0-l9_5857,fast::clamp(l9_5859,0.0,1.0));
}
}
l9_5839.y=l9_5855;
if (l9_5843)
{
bool l9_5860=l9_5845;
bool l9_5861;
if (l9_5860)
{
l9_5861=l9_5842.x==3;
}
else
{
l9_5861=l9_5860;
}
float l9_5862=l9_5839.x;
float l9_5863=l9_5844.x;
float l9_5864=l9_5844.z;
bool l9_5865=l9_5861;
float l9_5866=l9_5849;
float l9_5867=fast::clamp(l9_5862,l9_5863,l9_5864);
float l9_5868=step(abs(l9_5862-l9_5867),9.9999997e-06);
l9_5866*=(l9_5868+((1.0-float(l9_5865))*(1.0-l9_5868)));
l9_5862=l9_5867;
l9_5839.x=l9_5862;
l9_5849=l9_5866;
bool l9_5869=l9_5845;
bool l9_5870;
if (l9_5869)
{
l9_5870=l9_5842.y==3;
}
else
{
l9_5870=l9_5869;
}
float l9_5871=l9_5839.y;
float l9_5872=l9_5844.y;
float l9_5873=l9_5844.w;
bool l9_5874=l9_5870;
float l9_5875=l9_5849;
float l9_5876=fast::clamp(l9_5871,l9_5872,l9_5873);
float l9_5877=step(abs(l9_5871-l9_5876),9.9999997e-06);
l9_5875*=(l9_5877+((1.0-float(l9_5874))*(1.0-l9_5877)));
l9_5871=l9_5876;
l9_5839.y=l9_5871;
l9_5849=l9_5875;
}
float2 l9_5878=l9_5839;
bool l9_5879=l9_5840;
float3x3 l9_5880=l9_5841;
if (l9_5879)
{
l9_5878=float2((l9_5880*float3(l9_5878,1.0)).xy);
}
float2 l9_5881=l9_5878;
l9_5839=l9_5881;
float l9_5882=l9_5839.x;
int l9_5883=l9_5842.x;
bool l9_5884=l9_5848;
float l9_5885=l9_5849;
if ((l9_5883==0)||(l9_5883==3))
{
float l9_5886=l9_5882;
float l9_5887=0.0;
float l9_5888=1.0;
bool l9_5889=l9_5884;
float l9_5890=l9_5885;
float l9_5891=fast::clamp(l9_5886,l9_5887,l9_5888);
float l9_5892=step(abs(l9_5886-l9_5891),9.9999997e-06);
l9_5890*=(l9_5892+((1.0-float(l9_5889))*(1.0-l9_5892)));
l9_5886=l9_5891;
l9_5882=l9_5886;
l9_5885=l9_5890;
}
l9_5839.x=l9_5882;
l9_5849=l9_5885;
float l9_5893=l9_5839.y;
int l9_5894=l9_5842.y;
bool l9_5895=l9_5848;
float l9_5896=l9_5849;
if ((l9_5894==0)||(l9_5894==3))
{
float l9_5897=l9_5893;
float l9_5898=0.0;
float l9_5899=1.0;
bool l9_5900=l9_5895;
float l9_5901=l9_5896;
float l9_5902=fast::clamp(l9_5897,l9_5898,l9_5899);
float l9_5903=step(abs(l9_5897-l9_5902),9.9999997e-06);
l9_5901*=(l9_5903+((1.0-float(l9_5900))*(1.0-l9_5903)));
l9_5897=l9_5902;
l9_5893=l9_5897;
l9_5896=l9_5901;
}
l9_5839.y=l9_5893;
l9_5849=l9_5896;
float2 l9_5904=l9_5839;
int l9_5905=l9_5837;
int l9_5906=l9_5838;
float l9_5907=l9_5847;
float2 l9_5908=l9_5904;
int l9_5909=l9_5905;
int l9_5910=l9_5906;
float3 l9_5911=float3(0.0);
if (l9_5909==0)
{
l9_5911=float3(l9_5908,0.0);
}
else
{
if (l9_5909==1)
{
l9_5911=float3(l9_5908.x,(l9_5908.y*0.5)+(0.5-(float(l9_5910)*0.5)),0.0);
}
else
{
l9_5911=float3(l9_5908,float(l9_5910));
}
}
float3 l9_5912=l9_5911;
float3 l9_5913=l9_5912;
float4 l9_5914=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_5913.xy,bias(l9_5907));
float4 l9_5915=l9_5914;
if (l9_5845)
{
l9_5915=mix(l9_5846,l9_5915,float4(l9_5849));
}
float4 l9_5916=l9_5915;
l9_5830=l9_5916;
float l9_5917=0.0;
l9_5917=l9_5830.x;
float l9_5918=0.0;
l9_5918=step(l9_5917,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_5919=float4(0.0);
l9_5919=l9_4065*float4(l9_5918);
float4 l9_5920=float4(0.0);
float4 l9_5921=l9_4064;
float4 l9_5922=l9_5919;
float4 l9_5923=l9_5921;
float4 l9_5924=l9_5922;
float3 l9_5925=l9_5923.xyz*l9_5923.w;
l9_5923=float4(l9_5925.x,l9_5925.y,l9_5925.z,l9_5923.w);
float4 l9_5926=l9_5923+(l9_5924*(1.0-l9_5923.w));
l9_5920=l9_5926;
l9_2114=l9_5920;
l9_2119=l9_2114;
}
else
{
float4 l9_5927=float4(0.0);
float l9_5928=0.0;
float4 l9_5929=float4(0.0);
float4 l9_5930=float4(0.0);
ssGlobals l9_5931=l9_2116;
float l9_5932=0.0;
float l9_5933=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
l9_5932=l9_5933;
l9_5928=l9_5932;
float4 l9_5934;
if ((l9_5928*1.0)!=0.0)
{
float4 l9_5935=float4(0.0);
float l9_5936=0.0;
float4 l9_5937=float4(0.0);
float4 l9_5938=float4(0.0);
ssGlobals l9_5939=l9_5931;
float l9_5940=0.0;
float l9_5941=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_5940=l9_5941;
l9_5936=l9_5940;
float4 l9_5942;
if ((l9_5936*1.0)!=0.0)
{
float l9_5943=0.0;
float l9_5944=(*sc_set0.UserUniforms).rimExpId01;
l9_5943=l9_5944;
float l9_5945=0.0;
float l9_5946=(*sc_set0.UserUniforms).rimIntId01;
l9_5945=l9_5946;
float l9_5947=0.0;
float l9_5948=l9_5943;
float l9_5949=l9_5945;
ssGlobals l9_5950=l9_5939;
float l9_5951=abs(dot(-l9_5950.ViewDirWS,l9_5950.VertexNormal_WorldSpace));
float l9_5952=1.0-pow(1.0-l9_5951,l9_5948);
l9_5952=fast::max(l9_5952,0.0);
l9_5952*=l9_5949;
l9_5947=l9_5952;
float4 l9_5953=float4(0.0);
float l9_5954=0.0;
float4 l9_5955=float4(0.0);
float4 l9_5956=float4(0.0);
ssGlobals l9_5957=l9_5939;
float l9_5958=0.0;
float l9_5959=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_5958=l9_5959;
l9_5954=l9_5958;
float4 l9_5960;
if ((l9_5954*1.0)!=0.0)
{
float4 l9_5961=float4(0.0);
float4 l9_5962=(*sc_set0.UserUniforms).patternColorId01;
l9_5961=l9_5962;
float4 l9_5963=float4(0.0);
float l9_5964=0.0;
float4 l9_5965=float4(0.0);
float4 l9_5966=float4(0.0);
ssGlobals l9_5967=l9_5957;
float l9_5968=0.0;
float l9_5969=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_5968=l9_5969;
l9_5964=l9_5968;
float4 l9_5970;
if ((l9_5964*1.0)!=0.0)
{
float2 l9_5971=float2(0.0);
l9_5971=l9_5967.Surface_UVCoord0;
float2 l9_5972=float2(0.0);
float2 l9_5973=(*sc_set0.UserUniforms).patternScaleId01;
l9_5972=l9_5973;
float2 l9_5974=float2(0.0);
l9_5974=((l9_5971-(*sc_set0.UserUniforms).Port_Center_N122)*l9_5972)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_5975=float2(0.0);
float2 l9_5976=(*sc_set0.UserUniforms).patternOffsetId01;
l9_5975=l9_5976;
float2 l9_5977=float2(0.0);
l9_5977=l9_5974+l9_5975;
float l9_5978=0.0;
float l9_5979=(*sc_set0.UserUniforms).patternRotateId01;
l9_5978=l9_5979;
float2 l9_5980=float2(0.0);
float2 l9_5981=l9_5977;
float l9_5982=l9_5978;
float2 l9_5983=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_5984=sin(radians(l9_5982));
float l9_5985=cos(radians(l9_5982));
float2 l9_5986=l9_5981-l9_5983;
l9_5986=float2(dot(float2(l9_5985,l9_5984),l9_5986),dot(float2(-l9_5984,l9_5985),l9_5986))+l9_5983;
l9_5980=l9_5986;
float4 l9_5987=float4(0.0);
int l9_5988;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_5989=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5989=0;
}
else
{
l9_5989=in.varStereoViewID;
}
int l9_5990=l9_5989;
l9_5988=1-l9_5990;
}
else
{
int l9_5991=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5991=0;
}
else
{
l9_5991=in.varStereoViewID;
}
int l9_5992=l9_5991;
l9_5988=l9_5992;
}
int l9_5993=l9_5988;
int l9_5994=patternTextureId01Layout_tmp;
int l9_5995=l9_5993;
float2 l9_5996=l9_5980;
bool l9_5997=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_5998=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_5999=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_6000=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_6001=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_6002=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_6003=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_6004=0.0;
bool l9_6005=l9_6002&&(!l9_6000);
float l9_6006=1.0;
float l9_6007=l9_5996.x;
int l9_6008=l9_5999.x;
if (l9_6008==1)
{
l9_6007=fract(l9_6007);
}
else
{
if (l9_6008==2)
{
float l9_6009=fract(l9_6007);
float l9_6010=l9_6007-l9_6009;
float l9_6011=step(0.25,fract(l9_6010*0.5));
l9_6007=mix(l9_6009,1.0-l9_6009,fast::clamp(l9_6011,0.0,1.0));
}
}
l9_5996.x=l9_6007;
float l9_6012=l9_5996.y;
int l9_6013=l9_5999.y;
if (l9_6013==1)
{
l9_6012=fract(l9_6012);
}
else
{
if (l9_6013==2)
{
float l9_6014=fract(l9_6012);
float l9_6015=l9_6012-l9_6014;
float l9_6016=step(0.25,fract(l9_6015*0.5));
l9_6012=mix(l9_6014,1.0-l9_6014,fast::clamp(l9_6016,0.0,1.0));
}
}
l9_5996.y=l9_6012;
if (l9_6000)
{
bool l9_6017=l9_6002;
bool l9_6018;
if (l9_6017)
{
l9_6018=l9_5999.x==3;
}
else
{
l9_6018=l9_6017;
}
float l9_6019=l9_5996.x;
float l9_6020=l9_6001.x;
float l9_6021=l9_6001.z;
bool l9_6022=l9_6018;
float l9_6023=l9_6006;
float l9_6024=fast::clamp(l9_6019,l9_6020,l9_6021);
float l9_6025=step(abs(l9_6019-l9_6024),9.9999997e-06);
l9_6023*=(l9_6025+((1.0-float(l9_6022))*(1.0-l9_6025)));
l9_6019=l9_6024;
l9_5996.x=l9_6019;
l9_6006=l9_6023;
bool l9_6026=l9_6002;
bool l9_6027;
if (l9_6026)
{
l9_6027=l9_5999.y==3;
}
else
{
l9_6027=l9_6026;
}
float l9_6028=l9_5996.y;
float l9_6029=l9_6001.y;
float l9_6030=l9_6001.w;
bool l9_6031=l9_6027;
float l9_6032=l9_6006;
float l9_6033=fast::clamp(l9_6028,l9_6029,l9_6030);
float l9_6034=step(abs(l9_6028-l9_6033),9.9999997e-06);
l9_6032*=(l9_6034+((1.0-float(l9_6031))*(1.0-l9_6034)));
l9_6028=l9_6033;
l9_5996.y=l9_6028;
l9_6006=l9_6032;
}
float2 l9_6035=l9_5996;
bool l9_6036=l9_5997;
float3x3 l9_6037=l9_5998;
if (l9_6036)
{
l9_6035=float2((l9_6037*float3(l9_6035,1.0)).xy);
}
float2 l9_6038=l9_6035;
l9_5996=l9_6038;
float l9_6039=l9_5996.x;
int l9_6040=l9_5999.x;
bool l9_6041=l9_6005;
float l9_6042=l9_6006;
if ((l9_6040==0)||(l9_6040==3))
{
float l9_6043=l9_6039;
float l9_6044=0.0;
float l9_6045=1.0;
bool l9_6046=l9_6041;
float l9_6047=l9_6042;
float l9_6048=fast::clamp(l9_6043,l9_6044,l9_6045);
float l9_6049=step(abs(l9_6043-l9_6048),9.9999997e-06);
l9_6047*=(l9_6049+((1.0-float(l9_6046))*(1.0-l9_6049)));
l9_6043=l9_6048;
l9_6039=l9_6043;
l9_6042=l9_6047;
}
l9_5996.x=l9_6039;
l9_6006=l9_6042;
float l9_6050=l9_5996.y;
int l9_6051=l9_5999.y;
bool l9_6052=l9_6005;
float l9_6053=l9_6006;
if ((l9_6051==0)||(l9_6051==3))
{
float l9_6054=l9_6050;
float l9_6055=0.0;
float l9_6056=1.0;
bool l9_6057=l9_6052;
float l9_6058=l9_6053;
float l9_6059=fast::clamp(l9_6054,l9_6055,l9_6056);
float l9_6060=step(abs(l9_6054-l9_6059),9.9999997e-06);
l9_6058*=(l9_6060+((1.0-float(l9_6057))*(1.0-l9_6060)));
l9_6054=l9_6059;
l9_6050=l9_6054;
l9_6053=l9_6058;
}
l9_5996.y=l9_6050;
l9_6006=l9_6053;
float2 l9_6061=l9_5996;
int l9_6062=l9_5994;
int l9_6063=l9_5995;
float l9_6064=l9_6004;
float2 l9_6065=l9_6061;
int l9_6066=l9_6062;
int l9_6067=l9_6063;
float3 l9_6068=float3(0.0);
if (l9_6066==0)
{
l9_6068=float3(l9_6065,0.0);
}
else
{
if (l9_6066==1)
{
l9_6068=float3(l9_6065.x,(l9_6065.y*0.5)+(0.5-(float(l9_6067)*0.5)),0.0);
}
else
{
l9_6068=float3(l9_6065,float(l9_6067));
}
}
float3 l9_6069=l9_6068;
float3 l9_6070=l9_6069;
float4 l9_6071=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_6070.xy,bias(l9_6064));
float4 l9_6072=l9_6071;
if (l9_6002)
{
l9_6072=mix(l9_6003,l9_6072,float4(l9_6006));
}
float4 l9_6073=l9_6072;
l9_5987=l9_6073;
l9_5965=l9_5987;
l9_5970=l9_5965;
}
else
{
float2 l9_6074=float2(0.0);
l9_6074=l9_5967.Surface_UVCoord0;
float2 l9_6075=float2(0.0);
float2 l9_6076=(*sc_set0.UserUniforms).patternScaleId01;
l9_6075=l9_6076;
float2 l9_6077=float2(0.0);
l9_6077=((l9_6074-(*sc_set0.UserUniforms).Port_Center_N122)*l9_6075)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_6078=float2(0.0);
float2 l9_6079=(*sc_set0.UserUniforms).patternOffsetId01;
l9_6078=l9_6079;
float2 l9_6080=float2(0.0);
l9_6080=l9_6077+l9_6078;
float l9_6081=0.0;
float l9_6082=(*sc_set0.UserUniforms).patternRotateId01;
l9_6081=l9_6082;
float2 l9_6083=float2(0.0);
float2 l9_6084=l9_6080;
float l9_6085=l9_6081;
float2 l9_6086=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_6087=sin(radians(l9_6085));
float l9_6088=cos(radians(l9_6085));
float2 l9_6089=l9_6084-l9_6086;
l9_6089=float2(dot(float2(l9_6088,l9_6087),l9_6089),dot(float2(-l9_6087,l9_6088),l9_6089))+l9_6086;
l9_6083=l9_6089;
float4 l9_6090=float4(0.0);
int l9_6091;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_6092=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6092=0;
}
else
{
l9_6092=in.varStereoViewID;
}
int l9_6093=l9_6092;
l9_6091=1-l9_6093;
}
else
{
int l9_6094=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6094=0;
}
else
{
l9_6094=in.varStereoViewID;
}
int l9_6095=l9_6094;
l9_6091=l9_6095;
}
int l9_6096=l9_6091;
int l9_6097=patternTextureId01Layout_tmp;
int l9_6098=l9_6096;
float2 l9_6099=l9_6083;
bool l9_6100=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_6101=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_6102=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_6103=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_6104=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_6105=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_6106=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_6107=0.0;
bool l9_6108=l9_6105&&(!l9_6103);
float l9_6109=1.0;
float l9_6110=l9_6099.x;
int l9_6111=l9_6102.x;
if (l9_6111==1)
{
l9_6110=fract(l9_6110);
}
else
{
if (l9_6111==2)
{
float l9_6112=fract(l9_6110);
float l9_6113=l9_6110-l9_6112;
float l9_6114=step(0.25,fract(l9_6113*0.5));
l9_6110=mix(l9_6112,1.0-l9_6112,fast::clamp(l9_6114,0.0,1.0));
}
}
l9_6099.x=l9_6110;
float l9_6115=l9_6099.y;
int l9_6116=l9_6102.y;
if (l9_6116==1)
{
l9_6115=fract(l9_6115);
}
else
{
if (l9_6116==2)
{
float l9_6117=fract(l9_6115);
float l9_6118=l9_6115-l9_6117;
float l9_6119=step(0.25,fract(l9_6118*0.5));
l9_6115=mix(l9_6117,1.0-l9_6117,fast::clamp(l9_6119,0.0,1.0));
}
}
l9_6099.y=l9_6115;
if (l9_6103)
{
bool l9_6120=l9_6105;
bool l9_6121;
if (l9_6120)
{
l9_6121=l9_6102.x==3;
}
else
{
l9_6121=l9_6120;
}
float l9_6122=l9_6099.x;
float l9_6123=l9_6104.x;
float l9_6124=l9_6104.z;
bool l9_6125=l9_6121;
float l9_6126=l9_6109;
float l9_6127=fast::clamp(l9_6122,l9_6123,l9_6124);
float l9_6128=step(abs(l9_6122-l9_6127),9.9999997e-06);
l9_6126*=(l9_6128+((1.0-float(l9_6125))*(1.0-l9_6128)));
l9_6122=l9_6127;
l9_6099.x=l9_6122;
l9_6109=l9_6126;
bool l9_6129=l9_6105;
bool l9_6130;
if (l9_6129)
{
l9_6130=l9_6102.y==3;
}
else
{
l9_6130=l9_6129;
}
float l9_6131=l9_6099.y;
float l9_6132=l9_6104.y;
float l9_6133=l9_6104.w;
bool l9_6134=l9_6130;
float l9_6135=l9_6109;
float l9_6136=fast::clamp(l9_6131,l9_6132,l9_6133);
float l9_6137=step(abs(l9_6131-l9_6136),9.9999997e-06);
l9_6135*=(l9_6137+((1.0-float(l9_6134))*(1.0-l9_6137)));
l9_6131=l9_6136;
l9_6099.y=l9_6131;
l9_6109=l9_6135;
}
float2 l9_6138=l9_6099;
bool l9_6139=l9_6100;
float3x3 l9_6140=l9_6101;
if (l9_6139)
{
l9_6138=float2((l9_6140*float3(l9_6138,1.0)).xy);
}
float2 l9_6141=l9_6138;
l9_6099=l9_6141;
float l9_6142=l9_6099.x;
int l9_6143=l9_6102.x;
bool l9_6144=l9_6108;
float l9_6145=l9_6109;
if ((l9_6143==0)||(l9_6143==3))
{
float l9_6146=l9_6142;
float l9_6147=0.0;
float l9_6148=1.0;
bool l9_6149=l9_6144;
float l9_6150=l9_6145;
float l9_6151=fast::clamp(l9_6146,l9_6147,l9_6148);
float l9_6152=step(abs(l9_6146-l9_6151),9.9999997e-06);
l9_6150*=(l9_6152+((1.0-float(l9_6149))*(1.0-l9_6152)));
l9_6146=l9_6151;
l9_6142=l9_6146;
l9_6145=l9_6150;
}
l9_6099.x=l9_6142;
l9_6109=l9_6145;
float l9_6153=l9_6099.y;
int l9_6154=l9_6102.y;
bool l9_6155=l9_6108;
float l9_6156=l9_6109;
if ((l9_6154==0)||(l9_6154==3))
{
float l9_6157=l9_6153;
float l9_6158=0.0;
float l9_6159=1.0;
bool l9_6160=l9_6155;
float l9_6161=l9_6156;
float l9_6162=fast::clamp(l9_6157,l9_6158,l9_6159);
float l9_6163=step(abs(l9_6157-l9_6162),9.9999997e-06);
l9_6161*=(l9_6163+((1.0-float(l9_6160))*(1.0-l9_6163)));
l9_6157=l9_6162;
l9_6153=l9_6157;
l9_6156=l9_6161;
}
l9_6099.y=l9_6153;
l9_6109=l9_6156;
float2 l9_6164=l9_6099;
int l9_6165=l9_6097;
int l9_6166=l9_6098;
float l9_6167=l9_6107;
float2 l9_6168=l9_6164;
int l9_6169=l9_6165;
int l9_6170=l9_6166;
float3 l9_6171=float3(0.0);
if (l9_6169==0)
{
l9_6171=float3(l9_6168,0.0);
}
else
{
if (l9_6169==1)
{
l9_6171=float3(l9_6168.x,(l9_6168.y*0.5)+(0.5-(float(l9_6170)*0.5)),0.0);
}
else
{
l9_6171=float3(l9_6168,float(l9_6170));
}
}
float3 l9_6172=l9_6171;
float3 l9_6173=l9_6172;
float4 l9_6174=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_6173.xy,bias(l9_6167));
float4 l9_6175=l9_6174;
if (l9_6105)
{
l9_6175=mix(l9_6106,l9_6175,float4(l9_6109));
}
float4 l9_6176=l9_6175;
l9_6090=l9_6176;
float l9_6177=0.0;
float3 l9_6178=l9_6090.xyz;
float l9_6179=l9_6178.x;
l9_6177=l9_6179;
l9_5966=float4(l9_6177);
l9_5970=l9_5966;
}
l9_5963=l9_5970;
float4 l9_6180=float4(0.0);
l9_6180=l9_5961*l9_5963;
l9_5955=l9_6180;
l9_5960=l9_5955;
}
else
{
float4 l9_6181=float4(0.0);
float4 l9_6182=(*sc_set0.UserUniforms).colorId01;
l9_6181=l9_6182;
float2 l9_6183=float2(0.0);
l9_6183=l9_5957.Surface_UVCoord0;
float4 l9_6184=float4(0.0);
int l9_6185;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_6186=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6186=0;
}
else
{
l9_6186=in.varStereoViewID;
}
int l9_6187=l9_6186;
l9_6185=1-l9_6187;
}
else
{
int l9_6188=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6188=0;
}
else
{
l9_6188=in.varStereoViewID;
}
int l9_6189=l9_6188;
l9_6185=l9_6189;
}
int l9_6190=l9_6185;
int l9_6191=greyMaskIdLayout_tmp;
int l9_6192=l9_6190;
float2 l9_6193=l9_6183;
bool l9_6194=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_6195=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_6196=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_6197=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_6198=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_6199=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_6200=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_6201=0.0;
bool l9_6202=l9_6199&&(!l9_6197);
float l9_6203=1.0;
float l9_6204=l9_6193.x;
int l9_6205=l9_6196.x;
if (l9_6205==1)
{
l9_6204=fract(l9_6204);
}
else
{
if (l9_6205==2)
{
float l9_6206=fract(l9_6204);
float l9_6207=l9_6204-l9_6206;
float l9_6208=step(0.25,fract(l9_6207*0.5));
l9_6204=mix(l9_6206,1.0-l9_6206,fast::clamp(l9_6208,0.0,1.0));
}
}
l9_6193.x=l9_6204;
float l9_6209=l9_6193.y;
int l9_6210=l9_6196.y;
if (l9_6210==1)
{
l9_6209=fract(l9_6209);
}
else
{
if (l9_6210==2)
{
float l9_6211=fract(l9_6209);
float l9_6212=l9_6209-l9_6211;
float l9_6213=step(0.25,fract(l9_6212*0.5));
l9_6209=mix(l9_6211,1.0-l9_6211,fast::clamp(l9_6213,0.0,1.0));
}
}
l9_6193.y=l9_6209;
if (l9_6197)
{
bool l9_6214=l9_6199;
bool l9_6215;
if (l9_6214)
{
l9_6215=l9_6196.x==3;
}
else
{
l9_6215=l9_6214;
}
float l9_6216=l9_6193.x;
float l9_6217=l9_6198.x;
float l9_6218=l9_6198.z;
bool l9_6219=l9_6215;
float l9_6220=l9_6203;
float l9_6221=fast::clamp(l9_6216,l9_6217,l9_6218);
float l9_6222=step(abs(l9_6216-l9_6221),9.9999997e-06);
l9_6220*=(l9_6222+((1.0-float(l9_6219))*(1.0-l9_6222)));
l9_6216=l9_6221;
l9_6193.x=l9_6216;
l9_6203=l9_6220;
bool l9_6223=l9_6199;
bool l9_6224;
if (l9_6223)
{
l9_6224=l9_6196.y==3;
}
else
{
l9_6224=l9_6223;
}
float l9_6225=l9_6193.y;
float l9_6226=l9_6198.y;
float l9_6227=l9_6198.w;
bool l9_6228=l9_6224;
float l9_6229=l9_6203;
float l9_6230=fast::clamp(l9_6225,l9_6226,l9_6227);
float l9_6231=step(abs(l9_6225-l9_6230),9.9999997e-06);
l9_6229*=(l9_6231+((1.0-float(l9_6228))*(1.0-l9_6231)));
l9_6225=l9_6230;
l9_6193.y=l9_6225;
l9_6203=l9_6229;
}
float2 l9_6232=l9_6193;
bool l9_6233=l9_6194;
float3x3 l9_6234=l9_6195;
if (l9_6233)
{
l9_6232=float2((l9_6234*float3(l9_6232,1.0)).xy);
}
float2 l9_6235=l9_6232;
l9_6193=l9_6235;
float l9_6236=l9_6193.x;
int l9_6237=l9_6196.x;
bool l9_6238=l9_6202;
float l9_6239=l9_6203;
if ((l9_6237==0)||(l9_6237==3))
{
float l9_6240=l9_6236;
float l9_6241=0.0;
float l9_6242=1.0;
bool l9_6243=l9_6238;
float l9_6244=l9_6239;
float l9_6245=fast::clamp(l9_6240,l9_6241,l9_6242);
float l9_6246=step(abs(l9_6240-l9_6245),9.9999997e-06);
l9_6244*=(l9_6246+((1.0-float(l9_6243))*(1.0-l9_6246)));
l9_6240=l9_6245;
l9_6236=l9_6240;
l9_6239=l9_6244;
}
l9_6193.x=l9_6236;
l9_6203=l9_6239;
float l9_6247=l9_6193.y;
int l9_6248=l9_6196.y;
bool l9_6249=l9_6202;
float l9_6250=l9_6203;
if ((l9_6248==0)||(l9_6248==3))
{
float l9_6251=l9_6247;
float l9_6252=0.0;
float l9_6253=1.0;
bool l9_6254=l9_6249;
float l9_6255=l9_6250;
float l9_6256=fast::clamp(l9_6251,l9_6252,l9_6253);
float l9_6257=step(abs(l9_6251-l9_6256),9.9999997e-06);
l9_6255*=(l9_6257+((1.0-float(l9_6254))*(1.0-l9_6257)));
l9_6251=l9_6256;
l9_6247=l9_6251;
l9_6250=l9_6255;
}
l9_6193.y=l9_6247;
l9_6203=l9_6250;
float2 l9_6258=l9_6193;
int l9_6259=l9_6191;
int l9_6260=l9_6192;
float l9_6261=l9_6201;
float2 l9_6262=l9_6258;
int l9_6263=l9_6259;
int l9_6264=l9_6260;
float3 l9_6265=float3(0.0);
if (l9_6263==0)
{
l9_6265=float3(l9_6262,0.0);
}
else
{
if (l9_6263==1)
{
l9_6265=float3(l9_6262.x,(l9_6262.y*0.5)+(0.5-(float(l9_6264)*0.5)),0.0);
}
else
{
l9_6265=float3(l9_6262,float(l9_6264));
}
}
float3 l9_6266=l9_6265;
float3 l9_6267=l9_6266;
float4 l9_6268=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_6267.xy,bias(l9_6261));
float4 l9_6269=l9_6268;
if (l9_6199)
{
l9_6269=mix(l9_6200,l9_6269,float4(l9_6203));
}
float4 l9_6270=l9_6269;
l9_6184=l9_6270;
float l9_6271=0.0;
l9_6271=l9_6184.x;
float l9_6272=0.0;
l9_6272=step(l9_6271,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_6273=float4(0.0);
l9_6273=l9_6181*float4(l9_6272);
l9_5956=l9_6273;
l9_5960=l9_5956;
}
l9_5953=l9_5960;
float2 l9_6274=float2(0.0);
l9_6274=l9_5939.Surface_UVCoord0;
float4 l9_6275=float4(0.0);
int l9_6276;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_6277=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6277=0;
}
else
{
l9_6277=in.varStereoViewID;
}
int l9_6278=l9_6277;
l9_6276=1-l9_6278;
}
else
{
int l9_6279=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6279=0;
}
else
{
l9_6279=in.varStereoViewID;
}
int l9_6280=l9_6279;
l9_6276=l9_6280;
}
int l9_6281=l9_6276;
int l9_6282=greyMaskIdLayout_tmp;
int l9_6283=l9_6281;
float2 l9_6284=l9_6274;
bool l9_6285=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_6286=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_6287=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_6288=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_6289=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_6290=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_6291=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_6292=0.0;
bool l9_6293=l9_6290&&(!l9_6288);
float l9_6294=1.0;
float l9_6295=l9_6284.x;
int l9_6296=l9_6287.x;
if (l9_6296==1)
{
l9_6295=fract(l9_6295);
}
else
{
if (l9_6296==2)
{
float l9_6297=fract(l9_6295);
float l9_6298=l9_6295-l9_6297;
float l9_6299=step(0.25,fract(l9_6298*0.5));
l9_6295=mix(l9_6297,1.0-l9_6297,fast::clamp(l9_6299,0.0,1.0));
}
}
l9_6284.x=l9_6295;
float l9_6300=l9_6284.y;
int l9_6301=l9_6287.y;
if (l9_6301==1)
{
l9_6300=fract(l9_6300);
}
else
{
if (l9_6301==2)
{
float l9_6302=fract(l9_6300);
float l9_6303=l9_6300-l9_6302;
float l9_6304=step(0.25,fract(l9_6303*0.5));
l9_6300=mix(l9_6302,1.0-l9_6302,fast::clamp(l9_6304,0.0,1.0));
}
}
l9_6284.y=l9_6300;
if (l9_6288)
{
bool l9_6305=l9_6290;
bool l9_6306;
if (l9_6305)
{
l9_6306=l9_6287.x==3;
}
else
{
l9_6306=l9_6305;
}
float l9_6307=l9_6284.x;
float l9_6308=l9_6289.x;
float l9_6309=l9_6289.z;
bool l9_6310=l9_6306;
float l9_6311=l9_6294;
float l9_6312=fast::clamp(l9_6307,l9_6308,l9_6309);
float l9_6313=step(abs(l9_6307-l9_6312),9.9999997e-06);
l9_6311*=(l9_6313+((1.0-float(l9_6310))*(1.0-l9_6313)));
l9_6307=l9_6312;
l9_6284.x=l9_6307;
l9_6294=l9_6311;
bool l9_6314=l9_6290;
bool l9_6315;
if (l9_6314)
{
l9_6315=l9_6287.y==3;
}
else
{
l9_6315=l9_6314;
}
float l9_6316=l9_6284.y;
float l9_6317=l9_6289.y;
float l9_6318=l9_6289.w;
bool l9_6319=l9_6315;
float l9_6320=l9_6294;
float l9_6321=fast::clamp(l9_6316,l9_6317,l9_6318);
float l9_6322=step(abs(l9_6316-l9_6321),9.9999997e-06);
l9_6320*=(l9_6322+((1.0-float(l9_6319))*(1.0-l9_6322)));
l9_6316=l9_6321;
l9_6284.y=l9_6316;
l9_6294=l9_6320;
}
float2 l9_6323=l9_6284;
bool l9_6324=l9_6285;
float3x3 l9_6325=l9_6286;
if (l9_6324)
{
l9_6323=float2((l9_6325*float3(l9_6323,1.0)).xy);
}
float2 l9_6326=l9_6323;
l9_6284=l9_6326;
float l9_6327=l9_6284.x;
int l9_6328=l9_6287.x;
bool l9_6329=l9_6293;
float l9_6330=l9_6294;
if ((l9_6328==0)||(l9_6328==3))
{
float l9_6331=l9_6327;
float l9_6332=0.0;
float l9_6333=1.0;
bool l9_6334=l9_6329;
float l9_6335=l9_6330;
float l9_6336=fast::clamp(l9_6331,l9_6332,l9_6333);
float l9_6337=step(abs(l9_6331-l9_6336),9.9999997e-06);
l9_6335*=(l9_6337+((1.0-float(l9_6334))*(1.0-l9_6337)));
l9_6331=l9_6336;
l9_6327=l9_6331;
l9_6330=l9_6335;
}
l9_6284.x=l9_6327;
l9_6294=l9_6330;
float l9_6338=l9_6284.y;
int l9_6339=l9_6287.y;
bool l9_6340=l9_6293;
float l9_6341=l9_6294;
if ((l9_6339==0)||(l9_6339==3))
{
float l9_6342=l9_6338;
float l9_6343=0.0;
float l9_6344=1.0;
bool l9_6345=l9_6340;
float l9_6346=l9_6341;
float l9_6347=fast::clamp(l9_6342,l9_6343,l9_6344);
float l9_6348=step(abs(l9_6342-l9_6347),9.9999997e-06);
l9_6346*=(l9_6348+((1.0-float(l9_6345))*(1.0-l9_6348)));
l9_6342=l9_6347;
l9_6338=l9_6342;
l9_6341=l9_6346;
}
l9_6284.y=l9_6338;
l9_6294=l9_6341;
float2 l9_6349=l9_6284;
int l9_6350=l9_6282;
int l9_6351=l9_6283;
float l9_6352=l9_6292;
float2 l9_6353=l9_6349;
int l9_6354=l9_6350;
int l9_6355=l9_6351;
float3 l9_6356=float3(0.0);
if (l9_6354==0)
{
l9_6356=float3(l9_6353,0.0);
}
else
{
if (l9_6354==1)
{
l9_6356=float3(l9_6353.x,(l9_6353.y*0.5)+(0.5-(float(l9_6355)*0.5)),0.0);
}
else
{
l9_6356=float3(l9_6353,float(l9_6355));
}
}
float3 l9_6357=l9_6356;
float3 l9_6358=l9_6357;
float4 l9_6359=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_6358.xy,bias(l9_6352));
float4 l9_6360=l9_6359;
if (l9_6290)
{
l9_6360=mix(l9_6291,l9_6360,float4(l9_6294));
}
float4 l9_6361=l9_6360;
l9_6275=l9_6361;
float l9_6362=0.0;
l9_6362=l9_6275.x;
float l9_6363=0.0;
l9_6363=step(l9_6362,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_6364=float4(0.0);
l9_6364=l9_5953*float4(l9_6363);
float4 l9_6365=float4(0.0);
float4 l9_6366=(*sc_set0.UserUniforms).colorId01;
l9_6365=l9_6366;
float4 l9_6367=float4(0.0);
l9_6367=l9_6365*float4(l9_6363);
float4 l9_6368=float4(0.0);
float4 l9_6369=l9_6364;
float4 l9_6370=l9_6367;
float4 l9_6371=l9_6369;
float4 l9_6372=l9_6370;
float3 l9_6373=l9_6371.xyz*l9_6371.w;
l9_6371=float4(l9_6373.x,l9_6373.y,l9_6373.z,l9_6371.w);
float4 l9_6374=l9_6371+(l9_6372*(1.0-l9_6371.w));
l9_6368=l9_6374;
float4 l9_6375=float4(0.0);
l9_6375=float4(l9_5947)*l9_6368;
float4 l9_6376=float4(0.0);
l9_6376=l9_6375+l9_6368;
l9_5937=l9_6376;
l9_5942=l9_5937;
}
else
{
float4 l9_6377=float4(0.0);
float l9_6378=0.0;
float4 l9_6379=float4(0.0);
float4 l9_6380=float4(0.0);
ssGlobals l9_6381=l9_5939;
float l9_6382=0.0;
float l9_6383=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_6382=l9_6383;
l9_6378=l9_6382;
float4 l9_6384;
if ((l9_6378*1.0)!=0.0)
{
float4 l9_6385=float4(0.0);
float4 l9_6386=(*sc_set0.UserUniforms).patternColorId01;
l9_6385=l9_6386;
float4 l9_6387=float4(0.0);
float l9_6388=0.0;
float4 l9_6389=float4(0.0);
float4 l9_6390=float4(0.0);
ssGlobals l9_6391=l9_6381;
float l9_6392=0.0;
float l9_6393=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_6392=l9_6393;
l9_6388=l9_6392;
float4 l9_6394;
if ((l9_6388*1.0)!=0.0)
{
float2 l9_6395=float2(0.0);
l9_6395=l9_6391.Surface_UVCoord0;
float2 l9_6396=float2(0.0);
float2 l9_6397=(*sc_set0.UserUniforms).patternScaleId01;
l9_6396=l9_6397;
float2 l9_6398=float2(0.0);
l9_6398=((l9_6395-(*sc_set0.UserUniforms).Port_Center_N122)*l9_6396)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_6399=float2(0.0);
float2 l9_6400=(*sc_set0.UserUniforms).patternOffsetId01;
l9_6399=l9_6400;
float2 l9_6401=float2(0.0);
l9_6401=l9_6398+l9_6399;
float l9_6402=0.0;
float l9_6403=(*sc_set0.UserUniforms).patternRotateId01;
l9_6402=l9_6403;
float2 l9_6404=float2(0.0);
float2 l9_6405=l9_6401;
float l9_6406=l9_6402;
float2 l9_6407=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_6408=sin(radians(l9_6406));
float l9_6409=cos(radians(l9_6406));
float2 l9_6410=l9_6405-l9_6407;
l9_6410=float2(dot(float2(l9_6409,l9_6408),l9_6410),dot(float2(-l9_6408,l9_6409),l9_6410))+l9_6407;
l9_6404=l9_6410;
float4 l9_6411=float4(0.0);
int l9_6412;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_6413=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6413=0;
}
else
{
l9_6413=in.varStereoViewID;
}
int l9_6414=l9_6413;
l9_6412=1-l9_6414;
}
else
{
int l9_6415=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6415=0;
}
else
{
l9_6415=in.varStereoViewID;
}
int l9_6416=l9_6415;
l9_6412=l9_6416;
}
int l9_6417=l9_6412;
int l9_6418=patternTextureId01Layout_tmp;
int l9_6419=l9_6417;
float2 l9_6420=l9_6404;
bool l9_6421=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_6422=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_6423=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_6424=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_6425=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_6426=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_6427=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_6428=0.0;
bool l9_6429=l9_6426&&(!l9_6424);
float l9_6430=1.0;
float l9_6431=l9_6420.x;
int l9_6432=l9_6423.x;
if (l9_6432==1)
{
l9_6431=fract(l9_6431);
}
else
{
if (l9_6432==2)
{
float l9_6433=fract(l9_6431);
float l9_6434=l9_6431-l9_6433;
float l9_6435=step(0.25,fract(l9_6434*0.5));
l9_6431=mix(l9_6433,1.0-l9_6433,fast::clamp(l9_6435,0.0,1.0));
}
}
l9_6420.x=l9_6431;
float l9_6436=l9_6420.y;
int l9_6437=l9_6423.y;
if (l9_6437==1)
{
l9_6436=fract(l9_6436);
}
else
{
if (l9_6437==2)
{
float l9_6438=fract(l9_6436);
float l9_6439=l9_6436-l9_6438;
float l9_6440=step(0.25,fract(l9_6439*0.5));
l9_6436=mix(l9_6438,1.0-l9_6438,fast::clamp(l9_6440,0.0,1.0));
}
}
l9_6420.y=l9_6436;
if (l9_6424)
{
bool l9_6441=l9_6426;
bool l9_6442;
if (l9_6441)
{
l9_6442=l9_6423.x==3;
}
else
{
l9_6442=l9_6441;
}
float l9_6443=l9_6420.x;
float l9_6444=l9_6425.x;
float l9_6445=l9_6425.z;
bool l9_6446=l9_6442;
float l9_6447=l9_6430;
float l9_6448=fast::clamp(l9_6443,l9_6444,l9_6445);
float l9_6449=step(abs(l9_6443-l9_6448),9.9999997e-06);
l9_6447*=(l9_6449+((1.0-float(l9_6446))*(1.0-l9_6449)));
l9_6443=l9_6448;
l9_6420.x=l9_6443;
l9_6430=l9_6447;
bool l9_6450=l9_6426;
bool l9_6451;
if (l9_6450)
{
l9_6451=l9_6423.y==3;
}
else
{
l9_6451=l9_6450;
}
float l9_6452=l9_6420.y;
float l9_6453=l9_6425.y;
float l9_6454=l9_6425.w;
bool l9_6455=l9_6451;
float l9_6456=l9_6430;
float l9_6457=fast::clamp(l9_6452,l9_6453,l9_6454);
float l9_6458=step(abs(l9_6452-l9_6457),9.9999997e-06);
l9_6456*=(l9_6458+((1.0-float(l9_6455))*(1.0-l9_6458)));
l9_6452=l9_6457;
l9_6420.y=l9_6452;
l9_6430=l9_6456;
}
float2 l9_6459=l9_6420;
bool l9_6460=l9_6421;
float3x3 l9_6461=l9_6422;
if (l9_6460)
{
l9_6459=float2((l9_6461*float3(l9_6459,1.0)).xy);
}
float2 l9_6462=l9_6459;
l9_6420=l9_6462;
float l9_6463=l9_6420.x;
int l9_6464=l9_6423.x;
bool l9_6465=l9_6429;
float l9_6466=l9_6430;
if ((l9_6464==0)||(l9_6464==3))
{
float l9_6467=l9_6463;
float l9_6468=0.0;
float l9_6469=1.0;
bool l9_6470=l9_6465;
float l9_6471=l9_6466;
float l9_6472=fast::clamp(l9_6467,l9_6468,l9_6469);
float l9_6473=step(abs(l9_6467-l9_6472),9.9999997e-06);
l9_6471*=(l9_6473+((1.0-float(l9_6470))*(1.0-l9_6473)));
l9_6467=l9_6472;
l9_6463=l9_6467;
l9_6466=l9_6471;
}
l9_6420.x=l9_6463;
l9_6430=l9_6466;
float l9_6474=l9_6420.y;
int l9_6475=l9_6423.y;
bool l9_6476=l9_6429;
float l9_6477=l9_6430;
if ((l9_6475==0)||(l9_6475==3))
{
float l9_6478=l9_6474;
float l9_6479=0.0;
float l9_6480=1.0;
bool l9_6481=l9_6476;
float l9_6482=l9_6477;
float l9_6483=fast::clamp(l9_6478,l9_6479,l9_6480);
float l9_6484=step(abs(l9_6478-l9_6483),9.9999997e-06);
l9_6482*=(l9_6484+((1.0-float(l9_6481))*(1.0-l9_6484)));
l9_6478=l9_6483;
l9_6474=l9_6478;
l9_6477=l9_6482;
}
l9_6420.y=l9_6474;
l9_6430=l9_6477;
float2 l9_6485=l9_6420;
int l9_6486=l9_6418;
int l9_6487=l9_6419;
float l9_6488=l9_6428;
float2 l9_6489=l9_6485;
int l9_6490=l9_6486;
int l9_6491=l9_6487;
float3 l9_6492=float3(0.0);
if (l9_6490==0)
{
l9_6492=float3(l9_6489,0.0);
}
else
{
if (l9_6490==1)
{
l9_6492=float3(l9_6489.x,(l9_6489.y*0.5)+(0.5-(float(l9_6491)*0.5)),0.0);
}
else
{
l9_6492=float3(l9_6489,float(l9_6491));
}
}
float3 l9_6493=l9_6492;
float3 l9_6494=l9_6493;
float4 l9_6495=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_6494.xy,bias(l9_6488));
float4 l9_6496=l9_6495;
if (l9_6426)
{
l9_6496=mix(l9_6427,l9_6496,float4(l9_6430));
}
float4 l9_6497=l9_6496;
l9_6411=l9_6497;
l9_6389=l9_6411;
l9_6394=l9_6389;
}
else
{
float2 l9_6498=float2(0.0);
l9_6498=l9_6391.Surface_UVCoord0;
float2 l9_6499=float2(0.0);
float2 l9_6500=(*sc_set0.UserUniforms).patternScaleId01;
l9_6499=l9_6500;
float2 l9_6501=float2(0.0);
l9_6501=((l9_6498-(*sc_set0.UserUniforms).Port_Center_N122)*l9_6499)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_6502=float2(0.0);
float2 l9_6503=(*sc_set0.UserUniforms).patternOffsetId01;
l9_6502=l9_6503;
float2 l9_6504=float2(0.0);
l9_6504=l9_6501+l9_6502;
float l9_6505=0.0;
float l9_6506=(*sc_set0.UserUniforms).patternRotateId01;
l9_6505=l9_6506;
float2 l9_6507=float2(0.0);
float2 l9_6508=l9_6504;
float l9_6509=l9_6505;
float2 l9_6510=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_6511=sin(radians(l9_6509));
float l9_6512=cos(radians(l9_6509));
float2 l9_6513=l9_6508-l9_6510;
l9_6513=float2(dot(float2(l9_6512,l9_6511),l9_6513),dot(float2(-l9_6511,l9_6512),l9_6513))+l9_6510;
l9_6507=l9_6513;
float4 l9_6514=float4(0.0);
int l9_6515;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_6516=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6516=0;
}
else
{
l9_6516=in.varStereoViewID;
}
int l9_6517=l9_6516;
l9_6515=1-l9_6517;
}
else
{
int l9_6518=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6518=0;
}
else
{
l9_6518=in.varStereoViewID;
}
int l9_6519=l9_6518;
l9_6515=l9_6519;
}
int l9_6520=l9_6515;
int l9_6521=patternTextureId01Layout_tmp;
int l9_6522=l9_6520;
float2 l9_6523=l9_6507;
bool l9_6524=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_6525=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_6526=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_6527=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_6528=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_6529=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_6530=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_6531=0.0;
bool l9_6532=l9_6529&&(!l9_6527);
float l9_6533=1.0;
float l9_6534=l9_6523.x;
int l9_6535=l9_6526.x;
if (l9_6535==1)
{
l9_6534=fract(l9_6534);
}
else
{
if (l9_6535==2)
{
float l9_6536=fract(l9_6534);
float l9_6537=l9_6534-l9_6536;
float l9_6538=step(0.25,fract(l9_6537*0.5));
l9_6534=mix(l9_6536,1.0-l9_6536,fast::clamp(l9_6538,0.0,1.0));
}
}
l9_6523.x=l9_6534;
float l9_6539=l9_6523.y;
int l9_6540=l9_6526.y;
if (l9_6540==1)
{
l9_6539=fract(l9_6539);
}
else
{
if (l9_6540==2)
{
float l9_6541=fract(l9_6539);
float l9_6542=l9_6539-l9_6541;
float l9_6543=step(0.25,fract(l9_6542*0.5));
l9_6539=mix(l9_6541,1.0-l9_6541,fast::clamp(l9_6543,0.0,1.0));
}
}
l9_6523.y=l9_6539;
if (l9_6527)
{
bool l9_6544=l9_6529;
bool l9_6545;
if (l9_6544)
{
l9_6545=l9_6526.x==3;
}
else
{
l9_6545=l9_6544;
}
float l9_6546=l9_6523.x;
float l9_6547=l9_6528.x;
float l9_6548=l9_6528.z;
bool l9_6549=l9_6545;
float l9_6550=l9_6533;
float l9_6551=fast::clamp(l9_6546,l9_6547,l9_6548);
float l9_6552=step(abs(l9_6546-l9_6551),9.9999997e-06);
l9_6550*=(l9_6552+((1.0-float(l9_6549))*(1.0-l9_6552)));
l9_6546=l9_6551;
l9_6523.x=l9_6546;
l9_6533=l9_6550;
bool l9_6553=l9_6529;
bool l9_6554;
if (l9_6553)
{
l9_6554=l9_6526.y==3;
}
else
{
l9_6554=l9_6553;
}
float l9_6555=l9_6523.y;
float l9_6556=l9_6528.y;
float l9_6557=l9_6528.w;
bool l9_6558=l9_6554;
float l9_6559=l9_6533;
float l9_6560=fast::clamp(l9_6555,l9_6556,l9_6557);
float l9_6561=step(abs(l9_6555-l9_6560),9.9999997e-06);
l9_6559*=(l9_6561+((1.0-float(l9_6558))*(1.0-l9_6561)));
l9_6555=l9_6560;
l9_6523.y=l9_6555;
l9_6533=l9_6559;
}
float2 l9_6562=l9_6523;
bool l9_6563=l9_6524;
float3x3 l9_6564=l9_6525;
if (l9_6563)
{
l9_6562=float2((l9_6564*float3(l9_6562,1.0)).xy);
}
float2 l9_6565=l9_6562;
l9_6523=l9_6565;
float l9_6566=l9_6523.x;
int l9_6567=l9_6526.x;
bool l9_6568=l9_6532;
float l9_6569=l9_6533;
if ((l9_6567==0)||(l9_6567==3))
{
float l9_6570=l9_6566;
float l9_6571=0.0;
float l9_6572=1.0;
bool l9_6573=l9_6568;
float l9_6574=l9_6569;
float l9_6575=fast::clamp(l9_6570,l9_6571,l9_6572);
float l9_6576=step(abs(l9_6570-l9_6575),9.9999997e-06);
l9_6574*=(l9_6576+((1.0-float(l9_6573))*(1.0-l9_6576)));
l9_6570=l9_6575;
l9_6566=l9_6570;
l9_6569=l9_6574;
}
l9_6523.x=l9_6566;
l9_6533=l9_6569;
float l9_6577=l9_6523.y;
int l9_6578=l9_6526.y;
bool l9_6579=l9_6532;
float l9_6580=l9_6533;
if ((l9_6578==0)||(l9_6578==3))
{
float l9_6581=l9_6577;
float l9_6582=0.0;
float l9_6583=1.0;
bool l9_6584=l9_6579;
float l9_6585=l9_6580;
float l9_6586=fast::clamp(l9_6581,l9_6582,l9_6583);
float l9_6587=step(abs(l9_6581-l9_6586),9.9999997e-06);
l9_6585*=(l9_6587+((1.0-float(l9_6584))*(1.0-l9_6587)));
l9_6581=l9_6586;
l9_6577=l9_6581;
l9_6580=l9_6585;
}
l9_6523.y=l9_6577;
l9_6533=l9_6580;
float2 l9_6588=l9_6523;
int l9_6589=l9_6521;
int l9_6590=l9_6522;
float l9_6591=l9_6531;
float2 l9_6592=l9_6588;
int l9_6593=l9_6589;
int l9_6594=l9_6590;
float3 l9_6595=float3(0.0);
if (l9_6593==0)
{
l9_6595=float3(l9_6592,0.0);
}
else
{
if (l9_6593==1)
{
l9_6595=float3(l9_6592.x,(l9_6592.y*0.5)+(0.5-(float(l9_6594)*0.5)),0.0);
}
else
{
l9_6595=float3(l9_6592,float(l9_6594));
}
}
float3 l9_6596=l9_6595;
float3 l9_6597=l9_6596;
float4 l9_6598=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_6597.xy,bias(l9_6591));
float4 l9_6599=l9_6598;
if (l9_6529)
{
l9_6599=mix(l9_6530,l9_6599,float4(l9_6533));
}
float4 l9_6600=l9_6599;
l9_6514=l9_6600;
float l9_6601=0.0;
float3 l9_6602=l9_6514.xyz;
float l9_6603=l9_6602.x;
l9_6601=l9_6603;
l9_6390=float4(l9_6601);
l9_6394=l9_6390;
}
l9_6387=l9_6394;
float4 l9_6604=float4(0.0);
l9_6604=l9_6385*l9_6387;
l9_6379=l9_6604;
l9_6384=l9_6379;
}
else
{
float4 l9_6605=float4(0.0);
float4 l9_6606=(*sc_set0.UserUniforms).colorId01;
l9_6605=l9_6606;
float2 l9_6607=float2(0.0);
l9_6607=l9_6381.Surface_UVCoord0;
float4 l9_6608=float4(0.0);
int l9_6609;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_6610=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6610=0;
}
else
{
l9_6610=in.varStereoViewID;
}
int l9_6611=l9_6610;
l9_6609=1-l9_6611;
}
else
{
int l9_6612=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6612=0;
}
else
{
l9_6612=in.varStereoViewID;
}
int l9_6613=l9_6612;
l9_6609=l9_6613;
}
int l9_6614=l9_6609;
int l9_6615=greyMaskIdLayout_tmp;
int l9_6616=l9_6614;
float2 l9_6617=l9_6607;
bool l9_6618=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_6619=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_6620=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_6621=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_6622=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_6623=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_6624=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_6625=0.0;
bool l9_6626=l9_6623&&(!l9_6621);
float l9_6627=1.0;
float l9_6628=l9_6617.x;
int l9_6629=l9_6620.x;
if (l9_6629==1)
{
l9_6628=fract(l9_6628);
}
else
{
if (l9_6629==2)
{
float l9_6630=fract(l9_6628);
float l9_6631=l9_6628-l9_6630;
float l9_6632=step(0.25,fract(l9_6631*0.5));
l9_6628=mix(l9_6630,1.0-l9_6630,fast::clamp(l9_6632,0.0,1.0));
}
}
l9_6617.x=l9_6628;
float l9_6633=l9_6617.y;
int l9_6634=l9_6620.y;
if (l9_6634==1)
{
l9_6633=fract(l9_6633);
}
else
{
if (l9_6634==2)
{
float l9_6635=fract(l9_6633);
float l9_6636=l9_6633-l9_6635;
float l9_6637=step(0.25,fract(l9_6636*0.5));
l9_6633=mix(l9_6635,1.0-l9_6635,fast::clamp(l9_6637,0.0,1.0));
}
}
l9_6617.y=l9_6633;
if (l9_6621)
{
bool l9_6638=l9_6623;
bool l9_6639;
if (l9_6638)
{
l9_6639=l9_6620.x==3;
}
else
{
l9_6639=l9_6638;
}
float l9_6640=l9_6617.x;
float l9_6641=l9_6622.x;
float l9_6642=l9_6622.z;
bool l9_6643=l9_6639;
float l9_6644=l9_6627;
float l9_6645=fast::clamp(l9_6640,l9_6641,l9_6642);
float l9_6646=step(abs(l9_6640-l9_6645),9.9999997e-06);
l9_6644*=(l9_6646+((1.0-float(l9_6643))*(1.0-l9_6646)));
l9_6640=l9_6645;
l9_6617.x=l9_6640;
l9_6627=l9_6644;
bool l9_6647=l9_6623;
bool l9_6648;
if (l9_6647)
{
l9_6648=l9_6620.y==3;
}
else
{
l9_6648=l9_6647;
}
float l9_6649=l9_6617.y;
float l9_6650=l9_6622.y;
float l9_6651=l9_6622.w;
bool l9_6652=l9_6648;
float l9_6653=l9_6627;
float l9_6654=fast::clamp(l9_6649,l9_6650,l9_6651);
float l9_6655=step(abs(l9_6649-l9_6654),9.9999997e-06);
l9_6653*=(l9_6655+((1.0-float(l9_6652))*(1.0-l9_6655)));
l9_6649=l9_6654;
l9_6617.y=l9_6649;
l9_6627=l9_6653;
}
float2 l9_6656=l9_6617;
bool l9_6657=l9_6618;
float3x3 l9_6658=l9_6619;
if (l9_6657)
{
l9_6656=float2((l9_6658*float3(l9_6656,1.0)).xy);
}
float2 l9_6659=l9_6656;
l9_6617=l9_6659;
float l9_6660=l9_6617.x;
int l9_6661=l9_6620.x;
bool l9_6662=l9_6626;
float l9_6663=l9_6627;
if ((l9_6661==0)||(l9_6661==3))
{
float l9_6664=l9_6660;
float l9_6665=0.0;
float l9_6666=1.0;
bool l9_6667=l9_6662;
float l9_6668=l9_6663;
float l9_6669=fast::clamp(l9_6664,l9_6665,l9_6666);
float l9_6670=step(abs(l9_6664-l9_6669),9.9999997e-06);
l9_6668*=(l9_6670+((1.0-float(l9_6667))*(1.0-l9_6670)));
l9_6664=l9_6669;
l9_6660=l9_6664;
l9_6663=l9_6668;
}
l9_6617.x=l9_6660;
l9_6627=l9_6663;
float l9_6671=l9_6617.y;
int l9_6672=l9_6620.y;
bool l9_6673=l9_6626;
float l9_6674=l9_6627;
if ((l9_6672==0)||(l9_6672==3))
{
float l9_6675=l9_6671;
float l9_6676=0.0;
float l9_6677=1.0;
bool l9_6678=l9_6673;
float l9_6679=l9_6674;
float l9_6680=fast::clamp(l9_6675,l9_6676,l9_6677);
float l9_6681=step(abs(l9_6675-l9_6680),9.9999997e-06);
l9_6679*=(l9_6681+((1.0-float(l9_6678))*(1.0-l9_6681)));
l9_6675=l9_6680;
l9_6671=l9_6675;
l9_6674=l9_6679;
}
l9_6617.y=l9_6671;
l9_6627=l9_6674;
float2 l9_6682=l9_6617;
int l9_6683=l9_6615;
int l9_6684=l9_6616;
float l9_6685=l9_6625;
float2 l9_6686=l9_6682;
int l9_6687=l9_6683;
int l9_6688=l9_6684;
float3 l9_6689=float3(0.0);
if (l9_6687==0)
{
l9_6689=float3(l9_6686,0.0);
}
else
{
if (l9_6687==1)
{
l9_6689=float3(l9_6686.x,(l9_6686.y*0.5)+(0.5-(float(l9_6688)*0.5)),0.0);
}
else
{
l9_6689=float3(l9_6686,float(l9_6688));
}
}
float3 l9_6690=l9_6689;
float3 l9_6691=l9_6690;
float4 l9_6692=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_6691.xy,bias(l9_6685));
float4 l9_6693=l9_6692;
if (l9_6623)
{
l9_6693=mix(l9_6624,l9_6693,float4(l9_6627));
}
float4 l9_6694=l9_6693;
l9_6608=l9_6694;
float l9_6695=0.0;
l9_6695=l9_6608.x;
float l9_6696=0.0;
l9_6696=step(l9_6695,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_6697=float4(0.0);
l9_6697=l9_6605*float4(l9_6696);
l9_6380=l9_6697;
l9_6384=l9_6380;
}
l9_6377=l9_6384;
float2 l9_6698=float2(0.0);
l9_6698=l9_5939.Surface_UVCoord0;
float4 l9_6699=float4(0.0);
int l9_6700;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_6701=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6701=0;
}
else
{
l9_6701=in.varStereoViewID;
}
int l9_6702=l9_6701;
l9_6700=1-l9_6702;
}
else
{
int l9_6703=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6703=0;
}
else
{
l9_6703=in.varStereoViewID;
}
int l9_6704=l9_6703;
l9_6700=l9_6704;
}
int l9_6705=l9_6700;
int l9_6706=greyMaskIdLayout_tmp;
int l9_6707=l9_6705;
float2 l9_6708=l9_6698;
bool l9_6709=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_6710=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_6711=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_6712=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_6713=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_6714=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_6715=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_6716=0.0;
bool l9_6717=l9_6714&&(!l9_6712);
float l9_6718=1.0;
float l9_6719=l9_6708.x;
int l9_6720=l9_6711.x;
if (l9_6720==1)
{
l9_6719=fract(l9_6719);
}
else
{
if (l9_6720==2)
{
float l9_6721=fract(l9_6719);
float l9_6722=l9_6719-l9_6721;
float l9_6723=step(0.25,fract(l9_6722*0.5));
l9_6719=mix(l9_6721,1.0-l9_6721,fast::clamp(l9_6723,0.0,1.0));
}
}
l9_6708.x=l9_6719;
float l9_6724=l9_6708.y;
int l9_6725=l9_6711.y;
if (l9_6725==1)
{
l9_6724=fract(l9_6724);
}
else
{
if (l9_6725==2)
{
float l9_6726=fract(l9_6724);
float l9_6727=l9_6724-l9_6726;
float l9_6728=step(0.25,fract(l9_6727*0.5));
l9_6724=mix(l9_6726,1.0-l9_6726,fast::clamp(l9_6728,0.0,1.0));
}
}
l9_6708.y=l9_6724;
if (l9_6712)
{
bool l9_6729=l9_6714;
bool l9_6730;
if (l9_6729)
{
l9_6730=l9_6711.x==3;
}
else
{
l9_6730=l9_6729;
}
float l9_6731=l9_6708.x;
float l9_6732=l9_6713.x;
float l9_6733=l9_6713.z;
bool l9_6734=l9_6730;
float l9_6735=l9_6718;
float l9_6736=fast::clamp(l9_6731,l9_6732,l9_6733);
float l9_6737=step(abs(l9_6731-l9_6736),9.9999997e-06);
l9_6735*=(l9_6737+((1.0-float(l9_6734))*(1.0-l9_6737)));
l9_6731=l9_6736;
l9_6708.x=l9_6731;
l9_6718=l9_6735;
bool l9_6738=l9_6714;
bool l9_6739;
if (l9_6738)
{
l9_6739=l9_6711.y==3;
}
else
{
l9_6739=l9_6738;
}
float l9_6740=l9_6708.y;
float l9_6741=l9_6713.y;
float l9_6742=l9_6713.w;
bool l9_6743=l9_6739;
float l9_6744=l9_6718;
float l9_6745=fast::clamp(l9_6740,l9_6741,l9_6742);
float l9_6746=step(abs(l9_6740-l9_6745),9.9999997e-06);
l9_6744*=(l9_6746+((1.0-float(l9_6743))*(1.0-l9_6746)));
l9_6740=l9_6745;
l9_6708.y=l9_6740;
l9_6718=l9_6744;
}
float2 l9_6747=l9_6708;
bool l9_6748=l9_6709;
float3x3 l9_6749=l9_6710;
if (l9_6748)
{
l9_6747=float2((l9_6749*float3(l9_6747,1.0)).xy);
}
float2 l9_6750=l9_6747;
l9_6708=l9_6750;
float l9_6751=l9_6708.x;
int l9_6752=l9_6711.x;
bool l9_6753=l9_6717;
float l9_6754=l9_6718;
if ((l9_6752==0)||(l9_6752==3))
{
float l9_6755=l9_6751;
float l9_6756=0.0;
float l9_6757=1.0;
bool l9_6758=l9_6753;
float l9_6759=l9_6754;
float l9_6760=fast::clamp(l9_6755,l9_6756,l9_6757);
float l9_6761=step(abs(l9_6755-l9_6760),9.9999997e-06);
l9_6759*=(l9_6761+((1.0-float(l9_6758))*(1.0-l9_6761)));
l9_6755=l9_6760;
l9_6751=l9_6755;
l9_6754=l9_6759;
}
l9_6708.x=l9_6751;
l9_6718=l9_6754;
float l9_6762=l9_6708.y;
int l9_6763=l9_6711.y;
bool l9_6764=l9_6717;
float l9_6765=l9_6718;
if ((l9_6763==0)||(l9_6763==3))
{
float l9_6766=l9_6762;
float l9_6767=0.0;
float l9_6768=1.0;
bool l9_6769=l9_6764;
float l9_6770=l9_6765;
float l9_6771=fast::clamp(l9_6766,l9_6767,l9_6768);
float l9_6772=step(abs(l9_6766-l9_6771),9.9999997e-06);
l9_6770*=(l9_6772+((1.0-float(l9_6769))*(1.0-l9_6772)));
l9_6766=l9_6771;
l9_6762=l9_6766;
l9_6765=l9_6770;
}
l9_6708.y=l9_6762;
l9_6718=l9_6765;
float2 l9_6773=l9_6708;
int l9_6774=l9_6706;
int l9_6775=l9_6707;
float l9_6776=l9_6716;
float2 l9_6777=l9_6773;
int l9_6778=l9_6774;
int l9_6779=l9_6775;
float3 l9_6780=float3(0.0);
if (l9_6778==0)
{
l9_6780=float3(l9_6777,0.0);
}
else
{
if (l9_6778==1)
{
l9_6780=float3(l9_6777.x,(l9_6777.y*0.5)+(0.5-(float(l9_6779)*0.5)),0.0);
}
else
{
l9_6780=float3(l9_6777,float(l9_6779));
}
}
float3 l9_6781=l9_6780;
float3 l9_6782=l9_6781;
float4 l9_6783=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_6782.xy,bias(l9_6776));
float4 l9_6784=l9_6783;
if (l9_6714)
{
l9_6784=mix(l9_6715,l9_6784,float4(l9_6718));
}
float4 l9_6785=l9_6784;
l9_6699=l9_6785;
float l9_6786=0.0;
l9_6786=l9_6699.x;
float l9_6787=0.0;
l9_6787=step(l9_6786,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_6788=float4(0.0);
l9_6788=l9_6377*float4(l9_6787);
float4 l9_6789=float4(0.0);
float4 l9_6790=(*sc_set0.UserUniforms).colorId01;
l9_6789=l9_6790;
float4 l9_6791=float4(0.0);
l9_6791=l9_6789*float4(l9_6787);
float4 l9_6792=float4(0.0);
float4 l9_6793=l9_6788;
float4 l9_6794=l9_6791;
float4 l9_6795=l9_6793;
float4 l9_6796=l9_6794;
float3 l9_6797=l9_6795.xyz*l9_6795.w;
l9_6795=float4(l9_6797.x,l9_6797.y,l9_6797.z,l9_6795.w);
float4 l9_6798=l9_6795+(l9_6796*(1.0-l9_6795.w));
l9_6792=l9_6798;
l9_5938=l9_6792;
l9_5942=l9_5938;
}
l9_5935=l9_5942;
float l9_6799=0.0;
float l9_6800=(*sc_set0.UserUniforms).metallicId01;
l9_6799=l9_6800;
float l9_6801=0.0;
float l9_6802=(*sc_set0.UserUniforms).rougnessId01;
l9_6801=l9_6802;
float4 l9_6803=float4(0.0);
float3 l9_6804=l9_5935.xyz;
float l9_6805=(*sc_set0.UserUniforms).Port_Opacity_N152;
float3 l9_6806=(*sc_set0.UserUniforms).Port_Emissive_N152;
float l9_6807=l9_6799;
float l9_6808=l9_6801;
float3 l9_6809=(*sc_set0.UserUniforms).Port_AO_N152;
float3 l9_6810=(*sc_set0.UserUniforms).Port_SpecularAO_N152;
ssGlobals l9_6811=l9_5931;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_6811.BumpedNormal=l9_6811.VertexNormal_WorldSpace;
}
float l9_6812=l9_6805;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_6812<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_6813=gl_FragCoord;
float2 l9_6814=floor(mod(l9_6813.xy,float2(4.0)));
float l9_6815=(mod(dot(l9_6814,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_6812<l9_6815)
{
discard_fragment();
}
}
l9_6804=fast::max(l9_6804,float3(0.0));
float4 l9_6816;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_6816=float4(l9_6804,l9_6805);
}
else
{
l9_6807=fast::clamp(l9_6807,0.0,1.0);
l9_6808=fast::clamp(l9_6808,0.0,1.0);
float3 l9_6817=l9_6804;
float l9_6818=l9_6805;
float3 l9_6819=l9_6811.BumpedNormal;
float3 l9_6820=l9_6811.PositionWS;
float3 l9_6821=l9_6811.ViewDirWS;
float3 l9_6822=l9_6806;
float l9_6823=l9_6807;
float l9_6824=l9_6808;
float3 l9_6825=l9_6809;
float3 l9_6826=l9_6810;
l9_6816=ngsCalculateLighting(l9_6817,l9_6818,l9_6819,l9_6820,l9_6821,l9_6822,l9_6823,l9_6824,l9_6825,l9_6826,in.varStereoViewID,sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_RayTracingReflections,sc_set0.sc_RayTracingReflectionsSmpSC,sc_set0.sc_RayTracingGlobalIllumination,sc_set0.sc_RayTracingGlobalIlluminationSmpSC,sc_set0.sc_RayTracingShadows,sc_set0.sc_RayTracingShadowsSmpSC,gl_FragCoord,(*sc_set0.UserUniforms),in.varShadowTex,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,out.sc_FragData0,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
l9_6816=fast::max(l9_6816,float4(0.0));
l9_6803=l9_6816;
l9_5929=l9_6803;
l9_5934=l9_5929;
}
else
{
float4 l9_6827=float4(0.0);
float l9_6828=0.0;
float4 l9_6829=float4(0.0);
float4 l9_6830=float4(0.0);
ssGlobals l9_6831=l9_5931;
float l9_6832=0.0;
float l9_6833=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_6832=l9_6833;
l9_6828=l9_6832;
float4 l9_6834;
if ((l9_6828*1.0)!=0.0)
{
float l9_6835=0.0;
float l9_6836=(*sc_set0.UserUniforms).rimExpId01;
l9_6835=l9_6836;
float l9_6837=0.0;
float l9_6838=(*sc_set0.UserUniforms).rimIntId01;
l9_6837=l9_6838;
float l9_6839=0.0;
float l9_6840=l9_6835;
float l9_6841=l9_6837;
ssGlobals l9_6842=l9_6831;
float l9_6843=abs(dot(-l9_6842.ViewDirWS,l9_6842.VertexNormal_WorldSpace));
float l9_6844=1.0-pow(1.0-l9_6843,l9_6840);
l9_6844=fast::max(l9_6844,0.0);
l9_6844*=l9_6841;
l9_6839=l9_6844;
float4 l9_6845=float4(0.0);
float l9_6846=0.0;
float4 l9_6847=float4(0.0);
float4 l9_6848=float4(0.0);
ssGlobals l9_6849=l9_6831;
float l9_6850=0.0;
float l9_6851=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_6850=l9_6851;
l9_6846=l9_6850;
float4 l9_6852;
if ((l9_6846*1.0)!=0.0)
{
float4 l9_6853=float4(0.0);
float4 l9_6854=(*sc_set0.UserUniforms).patternColorId01;
l9_6853=l9_6854;
float4 l9_6855=float4(0.0);
float l9_6856=0.0;
float4 l9_6857=float4(0.0);
float4 l9_6858=float4(0.0);
ssGlobals l9_6859=l9_6849;
float l9_6860=0.0;
float l9_6861=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_6860=l9_6861;
l9_6856=l9_6860;
float4 l9_6862;
if ((l9_6856*1.0)!=0.0)
{
float2 l9_6863=float2(0.0);
l9_6863=l9_6859.Surface_UVCoord0;
float2 l9_6864=float2(0.0);
float2 l9_6865=(*sc_set0.UserUniforms).patternScaleId01;
l9_6864=l9_6865;
float2 l9_6866=float2(0.0);
l9_6866=((l9_6863-(*sc_set0.UserUniforms).Port_Center_N122)*l9_6864)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_6867=float2(0.0);
float2 l9_6868=(*sc_set0.UserUniforms).patternOffsetId01;
l9_6867=l9_6868;
float2 l9_6869=float2(0.0);
l9_6869=l9_6866+l9_6867;
float l9_6870=0.0;
float l9_6871=(*sc_set0.UserUniforms).patternRotateId01;
l9_6870=l9_6871;
float2 l9_6872=float2(0.0);
float2 l9_6873=l9_6869;
float l9_6874=l9_6870;
float2 l9_6875=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_6876=sin(radians(l9_6874));
float l9_6877=cos(radians(l9_6874));
float2 l9_6878=l9_6873-l9_6875;
l9_6878=float2(dot(float2(l9_6877,l9_6876),l9_6878),dot(float2(-l9_6876,l9_6877),l9_6878))+l9_6875;
l9_6872=l9_6878;
float4 l9_6879=float4(0.0);
int l9_6880;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_6881=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6881=0;
}
else
{
l9_6881=in.varStereoViewID;
}
int l9_6882=l9_6881;
l9_6880=1-l9_6882;
}
else
{
int l9_6883=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6883=0;
}
else
{
l9_6883=in.varStereoViewID;
}
int l9_6884=l9_6883;
l9_6880=l9_6884;
}
int l9_6885=l9_6880;
int l9_6886=patternTextureId01Layout_tmp;
int l9_6887=l9_6885;
float2 l9_6888=l9_6872;
bool l9_6889=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_6890=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_6891=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_6892=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_6893=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_6894=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_6895=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_6896=0.0;
bool l9_6897=l9_6894&&(!l9_6892);
float l9_6898=1.0;
float l9_6899=l9_6888.x;
int l9_6900=l9_6891.x;
if (l9_6900==1)
{
l9_6899=fract(l9_6899);
}
else
{
if (l9_6900==2)
{
float l9_6901=fract(l9_6899);
float l9_6902=l9_6899-l9_6901;
float l9_6903=step(0.25,fract(l9_6902*0.5));
l9_6899=mix(l9_6901,1.0-l9_6901,fast::clamp(l9_6903,0.0,1.0));
}
}
l9_6888.x=l9_6899;
float l9_6904=l9_6888.y;
int l9_6905=l9_6891.y;
if (l9_6905==1)
{
l9_6904=fract(l9_6904);
}
else
{
if (l9_6905==2)
{
float l9_6906=fract(l9_6904);
float l9_6907=l9_6904-l9_6906;
float l9_6908=step(0.25,fract(l9_6907*0.5));
l9_6904=mix(l9_6906,1.0-l9_6906,fast::clamp(l9_6908,0.0,1.0));
}
}
l9_6888.y=l9_6904;
if (l9_6892)
{
bool l9_6909=l9_6894;
bool l9_6910;
if (l9_6909)
{
l9_6910=l9_6891.x==3;
}
else
{
l9_6910=l9_6909;
}
float l9_6911=l9_6888.x;
float l9_6912=l9_6893.x;
float l9_6913=l9_6893.z;
bool l9_6914=l9_6910;
float l9_6915=l9_6898;
float l9_6916=fast::clamp(l9_6911,l9_6912,l9_6913);
float l9_6917=step(abs(l9_6911-l9_6916),9.9999997e-06);
l9_6915*=(l9_6917+((1.0-float(l9_6914))*(1.0-l9_6917)));
l9_6911=l9_6916;
l9_6888.x=l9_6911;
l9_6898=l9_6915;
bool l9_6918=l9_6894;
bool l9_6919;
if (l9_6918)
{
l9_6919=l9_6891.y==3;
}
else
{
l9_6919=l9_6918;
}
float l9_6920=l9_6888.y;
float l9_6921=l9_6893.y;
float l9_6922=l9_6893.w;
bool l9_6923=l9_6919;
float l9_6924=l9_6898;
float l9_6925=fast::clamp(l9_6920,l9_6921,l9_6922);
float l9_6926=step(abs(l9_6920-l9_6925),9.9999997e-06);
l9_6924*=(l9_6926+((1.0-float(l9_6923))*(1.0-l9_6926)));
l9_6920=l9_6925;
l9_6888.y=l9_6920;
l9_6898=l9_6924;
}
float2 l9_6927=l9_6888;
bool l9_6928=l9_6889;
float3x3 l9_6929=l9_6890;
if (l9_6928)
{
l9_6927=float2((l9_6929*float3(l9_6927,1.0)).xy);
}
float2 l9_6930=l9_6927;
l9_6888=l9_6930;
float l9_6931=l9_6888.x;
int l9_6932=l9_6891.x;
bool l9_6933=l9_6897;
float l9_6934=l9_6898;
if ((l9_6932==0)||(l9_6932==3))
{
float l9_6935=l9_6931;
float l9_6936=0.0;
float l9_6937=1.0;
bool l9_6938=l9_6933;
float l9_6939=l9_6934;
float l9_6940=fast::clamp(l9_6935,l9_6936,l9_6937);
float l9_6941=step(abs(l9_6935-l9_6940),9.9999997e-06);
l9_6939*=(l9_6941+((1.0-float(l9_6938))*(1.0-l9_6941)));
l9_6935=l9_6940;
l9_6931=l9_6935;
l9_6934=l9_6939;
}
l9_6888.x=l9_6931;
l9_6898=l9_6934;
float l9_6942=l9_6888.y;
int l9_6943=l9_6891.y;
bool l9_6944=l9_6897;
float l9_6945=l9_6898;
if ((l9_6943==0)||(l9_6943==3))
{
float l9_6946=l9_6942;
float l9_6947=0.0;
float l9_6948=1.0;
bool l9_6949=l9_6944;
float l9_6950=l9_6945;
float l9_6951=fast::clamp(l9_6946,l9_6947,l9_6948);
float l9_6952=step(abs(l9_6946-l9_6951),9.9999997e-06);
l9_6950*=(l9_6952+((1.0-float(l9_6949))*(1.0-l9_6952)));
l9_6946=l9_6951;
l9_6942=l9_6946;
l9_6945=l9_6950;
}
l9_6888.y=l9_6942;
l9_6898=l9_6945;
float2 l9_6953=l9_6888;
int l9_6954=l9_6886;
int l9_6955=l9_6887;
float l9_6956=l9_6896;
float2 l9_6957=l9_6953;
int l9_6958=l9_6954;
int l9_6959=l9_6955;
float3 l9_6960=float3(0.0);
if (l9_6958==0)
{
l9_6960=float3(l9_6957,0.0);
}
else
{
if (l9_6958==1)
{
l9_6960=float3(l9_6957.x,(l9_6957.y*0.5)+(0.5-(float(l9_6959)*0.5)),0.0);
}
else
{
l9_6960=float3(l9_6957,float(l9_6959));
}
}
float3 l9_6961=l9_6960;
float3 l9_6962=l9_6961;
float4 l9_6963=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_6962.xy,bias(l9_6956));
float4 l9_6964=l9_6963;
if (l9_6894)
{
l9_6964=mix(l9_6895,l9_6964,float4(l9_6898));
}
float4 l9_6965=l9_6964;
l9_6879=l9_6965;
l9_6857=l9_6879;
l9_6862=l9_6857;
}
else
{
float2 l9_6966=float2(0.0);
l9_6966=l9_6859.Surface_UVCoord0;
float2 l9_6967=float2(0.0);
float2 l9_6968=(*sc_set0.UserUniforms).patternScaleId01;
l9_6967=l9_6968;
float2 l9_6969=float2(0.0);
l9_6969=((l9_6966-(*sc_set0.UserUniforms).Port_Center_N122)*l9_6967)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_6970=float2(0.0);
float2 l9_6971=(*sc_set0.UserUniforms).patternOffsetId01;
l9_6970=l9_6971;
float2 l9_6972=float2(0.0);
l9_6972=l9_6969+l9_6970;
float l9_6973=0.0;
float l9_6974=(*sc_set0.UserUniforms).patternRotateId01;
l9_6973=l9_6974;
float2 l9_6975=float2(0.0);
float2 l9_6976=l9_6972;
float l9_6977=l9_6973;
float2 l9_6978=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_6979=sin(radians(l9_6977));
float l9_6980=cos(radians(l9_6977));
float2 l9_6981=l9_6976-l9_6978;
l9_6981=float2(dot(float2(l9_6980,l9_6979),l9_6981),dot(float2(-l9_6979,l9_6980),l9_6981))+l9_6978;
l9_6975=l9_6981;
float4 l9_6982=float4(0.0);
int l9_6983;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_6984=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6984=0;
}
else
{
l9_6984=in.varStereoViewID;
}
int l9_6985=l9_6984;
l9_6983=1-l9_6985;
}
else
{
int l9_6986=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6986=0;
}
else
{
l9_6986=in.varStereoViewID;
}
int l9_6987=l9_6986;
l9_6983=l9_6987;
}
int l9_6988=l9_6983;
int l9_6989=patternTextureId01Layout_tmp;
int l9_6990=l9_6988;
float2 l9_6991=l9_6975;
bool l9_6992=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_6993=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_6994=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_6995=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_6996=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_6997=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_6998=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_6999=0.0;
bool l9_7000=l9_6997&&(!l9_6995);
float l9_7001=1.0;
float l9_7002=l9_6991.x;
int l9_7003=l9_6994.x;
if (l9_7003==1)
{
l9_7002=fract(l9_7002);
}
else
{
if (l9_7003==2)
{
float l9_7004=fract(l9_7002);
float l9_7005=l9_7002-l9_7004;
float l9_7006=step(0.25,fract(l9_7005*0.5));
l9_7002=mix(l9_7004,1.0-l9_7004,fast::clamp(l9_7006,0.0,1.0));
}
}
l9_6991.x=l9_7002;
float l9_7007=l9_6991.y;
int l9_7008=l9_6994.y;
if (l9_7008==1)
{
l9_7007=fract(l9_7007);
}
else
{
if (l9_7008==2)
{
float l9_7009=fract(l9_7007);
float l9_7010=l9_7007-l9_7009;
float l9_7011=step(0.25,fract(l9_7010*0.5));
l9_7007=mix(l9_7009,1.0-l9_7009,fast::clamp(l9_7011,0.0,1.0));
}
}
l9_6991.y=l9_7007;
if (l9_6995)
{
bool l9_7012=l9_6997;
bool l9_7013;
if (l9_7012)
{
l9_7013=l9_6994.x==3;
}
else
{
l9_7013=l9_7012;
}
float l9_7014=l9_6991.x;
float l9_7015=l9_6996.x;
float l9_7016=l9_6996.z;
bool l9_7017=l9_7013;
float l9_7018=l9_7001;
float l9_7019=fast::clamp(l9_7014,l9_7015,l9_7016);
float l9_7020=step(abs(l9_7014-l9_7019),9.9999997e-06);
l9_7018*=(l9_7020+((1.0-float(l9_7017))*(1.0-l9_7020)));
l9_7014=l9_7019;
l9_6991.x=l9_7014;
l9_7001=l9_7018;
bool l9_7021=l9_6997;
bool l9_7022;
if (l9_7021)
{
l9_7022=l9_6994.y==3;
}
else
{
l9_7022=l9_7021;
}
float l9_7023=l9_6991.y;
float l9_7024=l9_6996.y;
float l9_7025=l9_6996.w;
bool l9_7026=l9_7022;
float l9_7027=l9_7001;
float l9_7028=fast::clamp(l9_7023,l9_7024,l9_7025);
float l9_7029=step(abs(l9_7023-l9_7028),9.9999997e-06);
l9_7027*=(l9_7029+((1.0-float(l9_7026))*(1.0-l9_7029)));
l9_7023=l9_7028;
l9_6991.y=l9_7023;
l9_7001=l9_7027;
}
float2 l9_7030=l9_6991;
bool l9_7031=l9_6992;
float3x3 l9_7032=l9_6993;
if (l9_7031)
{
l9_7030=float2((l9_7032*float3(l9_7030,1.0)).xy);
}
float2 l9_7033=l9_7030;
l9_6991=l9_7033;
float l9_7034=l9_6991.x;
int l9_7035=l9_6994.x;
bool l9_7036=l9_7000;
float l9_7037=l9_7001;
if ((l9_7035==0)||(l9_7035==3))
{
float l9_7038=l9_7034;
float l9_7039=0.0;
float l9_7040=1.0;
bool l9_7041=l9_7036;
float l9_7042=l9_7037;
float l9_7043=fast::clamp(l9_7038,l9_7039,l9_7040);
float l9_7044=step(abs(l9_7038-l9_7043),9.9999997e-06);
l9_7042*=(l9_7044+((1.0-float(l9_7041))*(1.0-l9_7044)));
l9_7038=l9_7043;
l9_7034=l9_7038;
l9_7037=l9_7042;
}
l9_6991.x=l9_7034;
l9_7001=l9_7037;
float l9_7045=l9_6991.y;
int l9_7046=l9_6994.y;
bool l9_7047=l9_7000;
float l9_7048=l9_7001;
if ((l9_7046==0)||(l9_7046==3))
{
float l9_7049=l9_7045;
float l9_7050=0.0;
float l9_7051=1.0;
bool l9_7052=l9_7047;
float l9_7053=l9_7048;
float l9_7054=fast::clamp(l9_7049,l9_7050,l9_7051);
float l9_7055=step(abs(l9_7049-l9_7054),9.9999997e-06);
l9_7053*=(l9_7055+((1.0-float(l9_7052))*(1.0-l9_7055)));
l9_7049=l9_7054;
l9_7045=l9_7049;
l9_7048=l9_7053;
}
l9_6991.y=l9_7045;
l9_7001=l9_7048;
float2 l9_7056=l9_6991;
int l9_7057=l9_6989;
int l9_7058=l9_6990;
float l9_7059=l9_6999;
float2 l9_7060=l9_7056;
int l9_7061=l9_7057;
int l9_7062=l9_7058;
float3 l9_7063=float3(0.0);
if (l9_7061==0)
{
l9_7063=float3(l9_7060,0.0);
}
else
{
if (l9_7061==1)
{
l9_7063=float3(l9_7060.x,(l9_7060.y*0.5)+(0.5-(float(l9_7062)*0.5)),0.0);
}
else
{
l9_7063=float3(l9_7060,float(l9_7062));
}
}
float3 l9_7064=l9_7063;
float3 l9_7065=l9_7064;
float4 l9_7066=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_7065.xy,bias(l9_7059));
float4 l9_7067=l9_7066;
if (l9_6997)
{
l9_7067=mix(l9_6998,l9_7067,float4(l9_7001));
}
float4 l9_7068=l9_7067;
l9_6982=l9_7068;
float l9_7069=0.0;
float3 l9_7070=l9_6982.xyz;
float l9_7071=l9_7070.x;
l9_7069=l9_7071;
l9_6858=float4(l9_7069);
l9_6862=l9_6858;
}
l9_6855=l9_6862;
float4 l9_7072=float4(0.0);
l9_7072=l9_6853*l9_6855;
l9_6847=l9_7072;
l9_6852=l9_6847;
}
else
{
float4 l9_7073=float4(0.0);
float4 l9_7074=(*sc_set0.UserUniforms).colorId01;
l9_7073=l9_7074;
float2 l9_7075=float2(0.0);
l9_7075=l9_6849.Surface_UVCoord0;
float4 l9_7076=float4(0.0);
int l9_7077;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_7078=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7078=0;
}
else
{
l9_7078=in.varStereoViewID;
}
int l9_7079=l9_7078;
l9_7077=1-l9_7079;
}
else
{
int l9_7080=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7080=0;
}
else
{
l9_7080=in.varStereoViewID;
}
int l9_7081=l9_7080;
l9_7077=l9_7081;
}
int l9_7082=l9_7077;
int l9_7083=greyMaskIdLayout_tmp;
int l9_7084=l9_7082;
float2 l9_7085=l9_7075;
bool l9_7086=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_7087=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_7088=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_7089=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_7090=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_7091=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_7092=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_7093=0.0;
bool l9_7094=l9_7091&&(!l9_7089);
float l9_7095=1.0;
float l9_7096=l9_7085.x;
int l9_7097=l9_7088.x;
if (l9_7097==1)
{
l9_7096=fract(l9_7096);
}
else
{
if (l9_7097==2)
{
float l9_7098=fract(l9_7096);
float l9_7099=l9_7096-l9_7098;
float l9_7100=step(0.25,fract(l9_7099*0.5));
l9_7096=mix(l9_7098,1.0-l9_7098,fast::clamp(l9_7100,0.0,1.0));
}
}
l9_7085.x=l9_7096;
float l9_7101=l9_7085.y;
int l9_7102=l9_7088.y;
if (l9_7102==1)
{
l9_7101=fract(l9_7101);
}
else
{
if (l9_7102==2)
{
float l9_7103=fract(l9_7101);
float l9_7104=l9_7101-l9_7103;
float l9_7105=step(0.25,fract(l9_7104*0.5));
l9_7101=mix(l9_7103,1.0-l9_7103,fast::clamp(l9_7105,0.0,1.0));
}
}
l9_7085.y=l9_7101;
if (l9_7089)
{
bool l9_7106=l9_7091;
bool l9_7107;
if (l9_7106)
{
l9_7107=l9_7088.x==3;
}
else
{
l9_7107=l9_7106;
}
float l9_7108=l9_7085.x;
float l9_7109=l9_7090.x;
float l9_7110=l9_7090.z;
bool l9_7111=l9_7107;
float l9_7112=l9_7095;
float l9_7113=fast::clamp(l9_7108,l9_7109,l9_7110);
float l9_7114=step(abs(l9_7108-l9_7113),9.9999997e-06);
l9_7112*=(l9_7114+((1.0-float(l9_7111))*(1.0-l9_7114)));
l9_7108=l9_7113;
l9_7085.x=l9_7108;
l9_7095=l9_7112;
bool l9_7115=l9_7091;
bool l9_7116;
if (l9_7115)
{
l9_7116=l9_7088.y==3;
}
else
{
l9_7116=l9_7115;
}
float l9_7117=l9_7085.y;
float l9_7118=l9_7090.y;
float l9_7119=l9_7090.w;
bool l9_7120=l9_7116;
float l9_7121=l9_7095;
float l9_7122=fast::clamp(l9_7117,l9_7118,l9_7119);
float l9_7123=step(abs(l9_7117-l9_7122),9.9999997e-06);
l9_7121*=(l9_7123+((1.0-float(l9_7120))*(1.0-l9_7123)));
l9_7117=l9_7122;
l9_7085.y=l9_7117;
l9_7095=l9_7121;
}
float2 l9_7124=l9_7085;
bool l9_7125=l9_7086;
float3x3 l9_7126=l9_7087;
if (l9_7125)
{
l9_7124=float2((l9_7126*float3(l9_7124,1.0)).xy);
}
float2 l9_7127=l9_7124;
l9_7085=l9_7127;
float l9_7128=l9_7085.x;
int l9_7129=l9_7088.x;
bool l9_7130=l9_7094;
float l9_7131=l9_7095;
if ((l9_7129==0)||(l9_7129==3))
{
float l9_7132=l9_7128;
float l9_7133=0.0;
float l9_7134=1.0;
bool l9_7135=l9_7130;
float l9_7136=l9_7131;
float l9_7137=fast::clamp(l9_7132,l9_7133,l9_7134);
float l9_7138=step(abs(l9_7132-l9_7137),9.9999997e-06);
l9_7136*=(l9_7138+((1.0-float(l9_7135))*(1.0-l9_7138)));
l9_7132=l9_7137;
l9_7128=l9_7132;
l9_7131=l9_7136;
}
l9_7085.x=l9_7128;
l9_7095=l9_7131;
float l9_7139=l9_7085.y;
int l9_7140=l9_7088.y;
bool l9_7141=l9_7094;
float l9_7142=l9_7095;
if ((l9_7140==0)||(l9_7140==3))
{
float l9_7143=l9_7139;
float l9_7144=0.0;
float l9_7145=1.0;
bool l9_7146=l9_7141;
float l9_7147=l9_7142;
float l9_7148=fast::clamp(l9_7143,l9_7144,l9_7145);
float l9_7149=step(abs(l9_7143-l9_7148),9.9999997e-06);
l9_7147*=(l9_7149+((1.0-float(l9_7146))*(1.0-l9_7149)));
l9_7143=l9_7148;
l9_7139=l9_7143;
l9_7142=l9_7147;
}
l9_7085.y=l9_7139;
l9_7095=l9_7142;
float2 l9_7150=l9_7085;
int l9_7151=l9_7083;
int l9_7152=l9_7084;
float l9_7153=l9_7093;
float2 l9_7154=l9_7150;
int l9_7155=l9_7151;
int l9_7156=l9_7152;
float3 l9_7157=float3(0.0);
if (l9_7155==0)
{
l9_7157=float3(l9_7154,0.0);
}
else
{
if (l9_7155==1)
{
l9_7157=float3(l9_7154.x,(l9_7154.y*0.5)+(0.5-(float(l9_7156)*0.5)),0.0);
}
else
{
l9_7157=float3(l9_7154,float(l9_7156));
}
}
float3 l9_7158=l9_7157;
float3 l9_7159=l9_7158;
float4 l9_7160=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_7159.xy,bias(l9_7153));
float4 l9_7161=l9_7160;
if (l9_7091)
{
l9_7161=mix(l9_7092,l9_7161,float4(l9_7095));
}
float4 l9_7162=l9_7161;
l9_7076=l9_7162;
float l9_7163=0.0;
l9_7163=l9_7076.x;
float l9_7164=0.0;
l9_7164=step(l9_7163,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_7165=float4(0.0);
l9_7165=l9_7073*float4(l9_7164);
l9_6848=l9_7165;
l9_6852=l9_6848;
}
l9_6845=l9_6852;
float2 l9_7166=float2(0.0);
l9_7166=l9_6831.Surface_UVCoord0;
float4 l9_7167=float4(0.0);
int l9_7168;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_7169=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7169=0;
}
else
{
l9_7169=in.varStereoViewID;
}
int l9_7170=l9_7169;
l9_7168=1-l9_7170;
}
else
{
int l9_7171=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7171=0;
}
else
{
l9_7171=in.varStereoViewID;
}
int l9_7172=l9_7171;
l9_7168=l9_7172;
}
int l9_7173=l9_7168;
int l9_7174=greyMaskIdLayout_tmp;
int l9_7175=l9_7173;
float2 l9_7176=l9_7166;
bool l9_7177=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_7178=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_7179=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_7180=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_7181=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_7182=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_7183=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_7184=0.0;
bool l9_7185=l9_7182&&(!l9_7180);
float l9_7186=1.0;
float l9_7187=l9_7176.x;
int l9_7188=l9_7179.x;
if (l9_7188==1)
{
l9_7187=fract(l9_7187);
}
else
{
if (l9_7188==2)
{
float l9_7189=fract(l9_7187);
float l9_7190=l9_7187-l9_7189;
float l9_7191=step(0.25,fract(l9_7190*0.5));
l9_7187=mix(l9_7189,1.0-l9_7189,fast::clamp(l9_7191,0.0,1.0));
}
}
l9_7176.x=l9_7187;
float l9_7192=l9_7176.y;
int l9_7193=l9_7179.y;
if (l9_7193==1)
{
l9_7192=fract(l9_7192);
}
else
{
if (l9_7193==2)
{
float l9_7194=fract(l9_7192);
float l9_7195=l9_7192-l9_7194;
float l9_7196=step(0.25,fract(l9_7195*0.5));
l9_7192=mix(l9_7194,1.0-l9_7194,fast::clamp(l9_7196,0.0,1.0));
}
}
l9_7176.y=l9_7192;
if (l9_7180)
{
bool l9_7197=l9_7182;
bool l9_7198;
if (l9_7197)
{
l9_7198=l9_7179.x==3;
}
else
{
l9_7198=l9_7197;
}
float l9_7199=l9_7176.x;
float l9_7200=l9_7181.x;
float l9_7201=l9_7181.z;
bool l9_7202=l9_7198;
float l9_7203=l9_7186;
float l9_7204=fast::clamp(l9_7199,l9_7200,l9_7201);
float l9_7205=step(abs(l9_7199-l9_7204),9.9999997e-06);
l9_7203*=(l9_7205+((1.0-float(l9_7202))*(1.0-l9_7205)));
l9_7199=l9_7204;
l9_7176.x=l9_7199;
l9_7186=l9_7203;
bool l9_7206=l9_7182;
bool l9_7207;
if (l9_7206)
{
l9_7207=l9_7179.y==3;
}
else
{
l9_7207=l9_7206;
}
float l9_7208=l9_7176.y;
float l9_7209=l9_7181.y;
float l9_7210=l9_7181.w;
bool l9_7211=l9_7207;
float l9_7212=l9_7186;
float l9_7213=fast::clamp(l9_7208,l9_7209,l9_7210);
float l9_7214=step(abs(l9_7208-l9_7213),9.9999997e-06);
l9_7212*=(l9_7214+((1.0-float(l9_7211))*(1.0-l9_7214)));
l9_7208=l9_7213;
l9_7176.y=l9_7208;
l9_7186=l9_7212;
}
float2 l9_7215=l9_7176;
bool l9_7216=l9_7177;
float3x3 l9_7217=l9_7178;
if (l9_7216)
{
l9_7215=float2((l9_7217*float3(l9_7215,1.0)).xy);
}
float2 l9_7218=l9_7215;
l9_7176=l9_7218;
float l9_7219=l9_7176.x;
int l9_7220=l9_7179.x;
bool l9_7221=l9_7185;
float l9_7222=l9_7186;
if ((l9_7220==0)||(l9_7220==3))
{
float l9_7223=l9_7219;
float l9_7224=0.0;
float l9_7225=1.0;
bool l9_7226=l9_7221;
float l9_7227=l9_7222;
float l9_7228=fast::clamp(l9_7223,l9_7224,l9_7225);
float l9_7229=step(abs(l9_7223-l9_7228),9.9999997e-06);
l9_7227*=(l9_7229+((1.0-float(l9_7226))*(1.0-l9_7229)));
l9_7223=l9_7228;
l9_7219=l9_7223;
l9_7222=l9_7227;
}
l9_7176.x=l9_7219;
l9_7186=l9_7222;
float l9_7230=l9_7176.y;
int l9_7231=l9_7179.y;
bool l9_7232=l9_7185;
float l9_7233=l9_7186;
if ((l9_7231==0)||(l9_7231==3))
{
float l9_7234=l9_7230;
float l9_7235=0.0;
float l9_7236=1.0;
bool l9_7237=l9_7232;
float l9_7238=l9_7233;
float l9_7239=fast::clamp(l9_7234,l9_7235,l9_7236);
float l9_7240=step(abs(l9_7234-l9_7239),9.9999997e-06);
l9_7238*=(l9_7240+((1.0-float(l9_7237))*(1.0-l9_7240)));
l9_7234=l9_7239;
l9_7230=l9_7234;
l9_7233=l9_7238;
}
l9_7176.y=l9_7230;
l9_7186=l9_7233;
float2 l9_7241=l9_7176;
int l9_7242=l9_7174;
int l9_7243=l9_7175;
float l9_7244=l9_7184;
float2 l9_7245=l9_7241;
int l9_7246=l9_7242;
int l9_7247=l9_7243;
float3 l9_7248=float3(0.0);
if (l9_7246==0)
{
l9_7248=float3(l9_7245,0.0);
}
else
{
if (l9_7246==1)
{
l9_7248=float3(l9_7245.x,(l9_7245.y*0.5)+(0.5-(float(l9_7247)*0.5)),0.0);
}
else
{
l9_7248=float3(l9_7245,float(l9_7247));
}
}
float3 l9_7249=l9_7248;
float3 l9_7250=l9_7249;
float4 l9_7251=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_7250.xy,bias(l9_7244));
float4 l9_7252=l9_7251;
if (l9_7182)
{
l9_7252=mix(l9_7183,l9_7252,float4(l9_7186));
}
float4 l9_7253=l9_7252;
l9_7167=l9_7253;
float l9_7254=0.0;
l9_7254=l9_7167.x;
float l9_7255=0.0;
l9_7255=step(l9_7254,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_7256=float4(0.0);
l9_7256=l9_6845*float4(l9_7255);
float4 l9_7257=float4(0.0);
float4 l9_7258=(*sc_set0.UserUniforms).colorId01;
l9_7257=l9_7258;
float4 l9_7259=float4(0.0);
l9_7259=l9_7257*float4(l9_7255);
float4 l9_7260=float4(0.0);
float4 l9_7261=l9_7256;
float4 l9_7262=l9_7259;
float4 l9_7263=l9_7261;
float4 l9_7264=l9_7262;
float3 l9_7265=l9_7263.xyz*l9_7263.w;
l9_7263=float4(l9_7265.x,l9_7265.y,l9_7265.z,l9_7263.w);
float4 l9_7266=l9_7263+(l9_7264*(1.0-l9_7263.w));
l9_7260=l9_7266;
float4 l9_7267=float4(0.0);
l9_7267=float4(l9_6839)*l9_7260;
float4 l9_7268=float4(0.0);
l9_7268=l9_7267+l9_7260;
l9_6829=l9_7268;
l9_6834=l9_6829;
}
else
{
float4 l9_7269=float4(0.0);
float l9_7270=0.0;
float4 l9_7271=float4(0.0);
float4 l9_7272=float4(0.0);
ssGlobals l9_7273=l9_6831;
float l9_7274=0.0;
float l9_7275=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_7274=l9_7275;
l9_7270=l9_7274;
float4 l9_7276;
if ((l9_7270*1.0)!=0.0)
{
float4 l9_7277=float4(0.0);
float4 l9_7278=(*sc_set0.UserUniforms).patternColorId01;
l9_7277=l9_7278;
float4 l9_7279=float4(0.0);
float l9_7280=0.0;
float4 l9_7281=float4(0.0);
float4 l9_7282=float4(0.0);
ssGlobals l9_7283=l9_7273;
float l9_7284=0.0;
float l9_7285=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_7284=l9_7285;
l9_7280=l9_7284;
float4 l9_7286;
if ((l9_7280*1.0)!=0.0)
{
float2 l9_7287=float2(0.0);
l9_7287=l9_7283.Surface_UVCoord0;
float2 l9_7288=float2(0.0);
float2 l9_7289=(*sc_set0.UserUniforms).patternScaleId01;
l9_7288=l9_7289;
float2 l9_7290=float2(0.0);
l9_7290=((l9_7287-(*sc_set0.UserUniforms).Port_Center_N122)*l9_7288)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_7291=float2(0.0);
float2 l9_7292=(*sc_set0.UserUniforms).patternOffsetId01;
l9_7291=l9_7292;
float2 l9_7293=float2(0.0);
l9_7293=l9_7290+l9_7291;
float l9_7294=0.0;
float l9_7295=(*sc_set0.UserUniforms).patternRotateId01;
l9_7294=l9_7295;
float2 l9_7296=float2(0.0);
float2 l9_7297=l9_7293;
float l9_7298=l9_7294;
float2 l9_7299=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_7300=sin(radians(l9_7298));
float l9_7301=cos(radians(l9_7298));
float2 l9_7302=l9_7297-l9_7299;
l9_7302=float2(dot(float2(l9_7301,l9_7300),l9_7302),dot(float2(-l9_7300,l9_7301),l9_7302))+l9_7299;
l9_7296=l9_7302;
float4 l9_7303=float4(0.0);
int l9_7304;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_7305=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7305=0;
}
else
{
l9_7305=in.varStereoViewID;
}
int l9_7306=l9_7305;
l9_7304=1-l9_7306;
}
else
{
int l9_7307=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7307=0;
}
else
{
l9_7307=in.varStereoViewID;
}
int l9_7308=l9_7307;
l9_7304=l9_7308;
}
int l9_7309=l9_7304;
int l9_7310=patternTextureId01Layout_tmp;
int l9_7311=l9_7309;
float2 l9_7312=l9_7296;
bool l9_7313=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_7314=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_7315=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_7316=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_7317=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_7318=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_7319=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_7320=0.0;
bool l9_7321=l9_7318&&(!l9_7316);
float l9_7322=1.0;
float l9_7323=l9_7312.x;
int l9_7324=l9_7315.x;
if (l9_7324==1)
{
l9_7323=fract(l9_7323);
}
else
{
if (l9_7324==2)
{
float l9_7325=fract(l9_7323);
float l9_7326=l9_7323-l9_7325;
float l9_7327=step(0.25,fract(l9_7326*0.5));
l9_7323=mix(l9_7325,1.0-l9_7325,fast::clamp(l9_7327,0.0,1.0));
}
}
l9_7312.x=l9_7323;
float l9_7328=l9_7312.y;
int l9_7329=l9_7315.y;
if (l9_7329==1)
{
l9_7328=fract(l9_7328);
}
else
{
if (l9_7329==2)
{
float l9_7330=fract(l9_7328);
float l9_7331=l9_7328-l9_7330;
float l9_7332=step(0.25,fract(l9_7331*0.5));
l9_7328=mix(l9_7330,1.0-l9_7330,fast::clamp(l9_7332,0.0,1.0));
}
}
l9_7312.y=l9_7328;
if (l9_7316)
{
bool l9_7333=l9_7318;
bool l9_7334;
if (l9_7333)
{
l9_7334=l9_7315.x==3;
}
else
{
l9_7334=l9_7333;
}
float l9_7335=l9_7312.x;
float l9_7336=l9_7317.x;
float l9_7337=l9_7317.z;
bool l9_7338=l9_7334;
float l9_7339=l9_7322;
float l9_7340=fast::clamp(l9_7335,l9_7336,l9_7337);
float l9_7341=step(abs(l9_7335-l9_7340),9.9999997e-06);
l9_7339*=(l9_7341+((1.0-float(l9_7338))*(1.0-l9_7341)));
l9_7335=l9_7340;
l9_7312.x=l9_7335;
l9_7322=l9_7339;
bool l9_7342=l9_7318;
bool l9_7343;
if (l9_7342)
{
l9_7343=l9_7315.y==3;
}
else
{
l9_7343=l9_7342;
}
float l9_7344=l9_7312.y;
float l9_7345=l9_7317.y;
float l9_7346=l9_7317.w;
bool l9_7347=l9_7343;
float l9_7348=l9_7322;
float l9_7349=fast::clamp(l9_7344,l9_7345,l9_7346);
float l9_7350=step(abs(l9_7344-l9_7349),9.9999997e-06);
l9_7348*=(l9_7350+((1.0-float(l9_7347))*(1.0-l9_7350)));
l9_7344=l9_7349;
l9_7312.y=l9_7344;
l9_7322=l9_7348;
}
float2 l9_7351=l9_7312;
bool l9_7352=l9_7313;
float3x3 l9_7353=l9_7314;
if (l9_7352)
{
l9_7351=float2((l9_7353*float3(l9_7351,1.0)).xy);
}
float2 l9_7354=l9_7351;
l9_7312=l9_7354;
float l9_7355=l9_7312.x;
int l9_7356=l9_7315.x;
bool l9_7357=l9_7321;
float l9_7358=l9_7322;
if ((l9_7356==0)||(l9_7356==3))
{
float l9_7359=l9_7355;
float l9_7360=0.0;
float l9_7361=1.0;
bool l9_7362=l9_7357;
float l9_7363=l9_7358;
float l9_7364=fast::clamp(l9_7359,l9_7360,l9_7361);
float l9_7365=step(abs(l9_7359-l9_7364),9.9999997e-06);
l9_7363*=(l9_7365+((1.0-float(l9_7362))*(1.0-l9_7365)));
l9_7359=l9_7364;
l9_7355=l9_7359;
l9_7358=l9_7363;
}
l9_7312.x=l9_7355;
l9_7322=l9_7358;
float l9_7366=l9_7312.y;
int l9_7367=l9_7315.y;
bool l9_7368=l9_7321;
float l9_7369=l9_7322;
if ((l9_7367==0)||(l9_7367==3))
{
float l9_7370=l9_7366;
float l9_7371=0.0;
float l9_7372=1.0;
bool l9_7373=l9_7368;
float l9_7374=l9_7369;
float l9_7375=fast::clamp(l9_7370,l9_7371,l9_7372);
float l9_7376=step(abs(l9_7370-l9_7375),9.9999997e-06);
l9_7374*=(l9_7376+((1.0-float(l9_7373))*(1.0-l9_7376)));
l9_7370=l9_7375;
l9_7366=l9_7370;
l9_7369=l9_7374;
}
l9_7312.y=l9_7366;
l9_7322=l9_7369;
float2 l9_7377=l9_7312;
int l9_7378=l9_7310;
int l9_7379=l9_7311;
float l9_7380=l9_7320;
float2 l9_7381=l9_7377;
int l9_7382=l9_7378;
int l9_7383=l9_7379;
float3 l9_7384=float3(0.0);
if (l9_7382==0)
{
l9_7384=float3(l9_7381,0.0);
}
else
{
if (l9_7382==1)
{
l9_7384=float3(l9_7381.x,(l9_7381.y*0.5)+(0.5-(float(l9_7383)*0.5)),0.0);
}
else
{
l9_7384=float3(l9_7381,float(l9_7383));
}
}
float3 l9_7385=l9_7384;
float3 l9_7386=l9_7385;
float4 l9_7387=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_7386.xy,bias(l9_7380));
float4 l9_7388=l9_7387;
if (l9_7318)
{
l9_7388=mix(l9_7319,l9_7388,float4(l9_7322));
}
float4 l9_7389=l9_7388;
l9_7303=l9_7389;
l9_7281=l9_7303;
l9_7286=l9_7281;
}
else
{
float2 l9_7390=float2(0.0);
l9_7390=l9_7283.Surface_UVCoord0;
float2 l9_7391=float2(0.0);
float2 l9_7392=(*sc_set0.UserUniforms).patternScaleId01;
l9_7391=l9_7392;
float2 l9_7393=float2(0.0);
l9_7393=((l9_7390-(*sc_set0.UserUniforms).Port_Center_N122)*l9_7391)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_7394=float2(0.0);
float2 l9_7395=(*sc_set0.UserUniforms).patternOffsetId01;
l9_7394=l9_7395;
float2 l9_7396=float2(0.0);
l9_7396=l9_7393+l9_7394;
float l9_7397=0.0;
float l9_7398=(*sc_set0.UserUniforms).patternRotateId01;
l9_7397=l9_7398;
float2 l9_7399=float2(0.0);
float2 l9_7400=l9_7396;
float l9_7401=l9_7397;
float2 l9_7402=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_7403=sin(radians(l9_7401));
float l9_7404=cos(radians(l9_7401));
float2 l9_7405=l9_7400-l9_7402;
l9_7405=float2(dot(float2(l9_7404,l9_7403),l9_7405),dot(float2(-l9_7403,l9_7404),l9_7405))+l9_7402;
l9_7399=l9_7405;
float4 l9_7406=float4(0.0);
int l9_7407;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_7408=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7408=0;
}
else
{
l9_7408=in.varStereoViewID;
}
int l9_7409=l9_7408;
l9_7407=1-l9_7409;
}
else
{
int l9_7410=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7410=0;
}
else
{
l9_7410=in.varStereoViewID;
}
int l9_7411=l9_7410;
l9_7407=l9_7411;
}
int l9_7412=l9_7407;
int l9_7413=patternTextureId01Layout_tmp;
int l9_7414=l9_7412;
float2 l9_7415=l9_7399;
bool l9_7416=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_7417=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_7418=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_7419=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_7420=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_7421=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_7422=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_7423=0.0;
bool l9_7424=l9_7421&&(!l9_7419);
float l9_7425=1.0;
float l9_7426=l9_7415.x;
int l9_7427=l9_7418.x;
if (l9_7427==1)
{
l9_7426=fract(l9_7426);
}
else
{
if (l9_7427==2)
{
float l9_7428=fract(l9_7426);
float l9_7429=l9_7426-l9_7428;
float l9_7430=step(0.25,fract(l9_7429*0.5));
l9_7426=mix(l9_7428,1.0-l9_7428,fast::clamp(l9_7430,0.0,1.0));
}
}
l9_7415.x=l9_7426;
float l9_7431=l9_7415.y;
int l9_7432=l9_7418.y;
if (l9_7432==1)
{
l9_7431=fract(l9_7431);
}
else
{
if (l9_7432==2)
{
float l9_7433=fract(l9_7431);
float l9_7434=l9_7431-l9_7433;
float l9_7435=step(0.25,fract(l9_7434*0.5));
l9_7431=mix(l9_7433,1.0-l9_7433,fast::clamp(l9_7435,0.0,1.0));
}
}
l9_7415.y=l9_7431;
if (l9_7419)
{
bool l9_7436=l9_7421;
bool l9_7437;
if (l9_7436)
{
l9_7437=l9_7418.x==3;
}
else
{
l9_7437=l9_7436;
}
float l9_7438=l9_7415.x;
float l9_7439=l9_7420.x;
float l9_7440=l9_7420.z;
bool l9_7441=l9_7437;
float l9_7442=l9_7425;
float l9_7443=fast::clamp(l9_7438,l9_7439,l9_7440);
float l9_7444=step(abs(l9_7438-l9_7443),9.9999997e-06);
l9_7442*=(l9_7444+((1.0-float(l9_7441))*(1.0-l9_7444)));
l9_7438=l9_7443;
l9_7415.x=l9_7438;
l9_7425=l9_7442;
bool l9_7445=l9_7421;
bool l9_7446;
if (l9_7445)
{
l9_7446=l9_7418.y==3;
}
else
{
l9_7446=l9_7445;
}
float l9_7447=l9_7415.y;
float l9_7448=l9_7420.y;
float l9_7449=l9_7420.w;
bool l9_7450=l9_7446;
float l9_7451=l9_7425;
float l9_7452=fast::clamp(l9_7447,l9_7448,l9_7449);
float l9_7453=step(abs(l9_7447-l9_7452),9.9999997e-06);
l9_7451*=(l9_7453+((1.0-float(l9_7450))*(1.0-l9_7453)));
l9_7447=l9_7452;
l9_7415.y=l9_7447;
l9_7425=l9_7451;
}
float2 l9_7454=l9_7415;
bool l9_7455=l9_7416;
float3x3 l9_7456=l9_7417;
if (l9_7455)
{
l9_7454=float2((l9_7456*float3(l9_7454,1.0)).xy);
}
float2 l9_7457=l9_7454;
l9_7415=l9_7457;
float l9_7458=l9_7415.x;
int l9_7459=l9_7418.x;
bool l9_7460=l9_7424;
float l9_7461=l9_7425;
if ((l9_7459==0)||(l9_7459==3))
{
float l9_7462=l9_7458;
float l9_7463=0.0;
float l9_7464=1.0;
bool l9_7465=l9_7460;
float l9_7466=l9_7461;
float l9_7467=fast::clamp(l9_7462,l9_7463,l9_7464);
float l9_7468=step(abs(l9_7462-l9_7467),9.9999997e-06);
l9_7466*=(l9_7468+((1.0-float(l9_7465))*(1.0-l9_7468)));
l9_7462=l9_7467;
l9_7458=l9_7462;
l9_7461=l9_7466;
}
l9_7415.x=l9_7458;
l9_7425=l9_7461;
float l9_7469=l9_7415.y;
int l9_7470=l9_7418.y;
bool l9_7471=l9_7424;
float l9_7472=l9_7425;
if ((l9_7470==0)||(l9_7470==3))
{
float l9_7473=l9_7469;
float l9_7474=0.0;
float l9_7475=1.0;
bool l9_7476=l9_7471;
float l9_7477=l9_7472;
float l9_7478=fast::clamp(l9_7473,l9_7474,l9_7475);
float l9_7479=step(abs(l9_7473-l9_7478),9.9999997e-06);
l9_7477*=(l9_7479+((1.0-float(l9_7476))*(1.0-l9_7479)));
l9_7473=l9_7478;
l9_7469=l9_7473;
l9_7472=l9_7477;
}
l9_7415.y=l9_7469;
l9_7425=l9_7472;
float2 l9_7480=l9_7415;
int l9_7481=l9_7413;
int l9_7482=l9_7414;
float l9_7483=l9_7423;
float2 l9_7484=l9_7480;
int l9_7485=l9_7481;
int l9_7486=l9_7482;
float3 l9_7487=float3(0.0);
if (l9_7485==0)
{
l9_7487=float3(l9_7484,0.0);
}
else
{
if (l9_7485==1)
{
l9_7487=float3(l9_7484.x,(l9_7484.y*0.5)+(0.5-(float(l9_7486)*0.5)),0.0);
}
else
{
l9_7487=float3(l9_7484,float(l9_7486));
}
}
float3 l9_7488=l9_7487;
float3 l9_7489=l9_7488;
float4 l9_7490=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_7489.xy,bias(l9_7483));
float4 l9_7491=l9_7490;
if (l9_7421)
{
l9_7491=mix(l9_7422,l9_7491,float4(l9_7425));
}
float4 l9_7492=l9_7491;
l9_7406=l9_7492;
float l9_7493=0.0;
float3 l9_7494=l9_7406.xyz;
float l9_7495=l9_7494.x;
l9_7493=l9_7495;
l9_7282=float4(l9_7493);
l9_7286=l9_7282;
}
l9_7279=l9_7286;
float4 l9_7496=float4(0.0);
l9_7496=l9_7277*l9_7279;
l9_7271=l9_7496;
l9_7276=l9_7271;
}
else
{
float4 l9_7497=float4(0.0);
float4 l9_7498=(*sc_set0.UserUniforms).colorId01;
l9_7497=l9_7498;
float2 l9_7499=float2(0.0);
l9_7499=l9_7273.Surface_UVCoord0;
float4 l9_7500=float4(0.0);
int l9_7501;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_7502=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7502=0;
}
else
{
l9_7502=in.varStereoViewID;
}
int l9_7503=l9_7502;
l9_7501=1-l9_7503;
}
else
{
int l9_7504=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7504=0;
}
else
{
l9_7504=in.varStereoViewID;
}
int l9_7505=l9_7504;
l9_7501=l9_7505;
}
int l9_7506=l9_7501;
int l9_7507=greyMaskIdLayout_tmp;
int l9_7508=l9_7506;
float2 l9_7509=l9_7499;
bool l9_7510=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_7511=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_7512=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_7513=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_7514=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_7515=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_7516=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_7517=0.0;
bool l9_7518=l9_7515&&(!l9_7513);
float l9_7519=1.0;
float l9_7520=l9_7509.x;
int l9_7521=l9_7512.x;
if (l9_7521==1)
{
l9_7520=fract(l9_7520);
}
else
{
if (l9_7521==2)
{
float l9_7522=fract(l9_7520);
float l9_7523=l9_7520-l9_7522;
float l9_7524=step(0.25,fract(l9_7523*0.5));
l9_7520=mix(l9_7522,1.0-l9_7522,fast::clamp(l9_7524,0.0,1.0));
}
}
l9_7509.x=l9_7520;
float l9_7525=l9_7509.y;
int l9_7526=l9_7512.y;
if (l9_7526==1)
{
l9_7525=fract(l9_7525);
}
else
{
if (l9_7526==2)
{
float l9_7527=fract(l9_7525);
float l9_7528=l9_7525-l9_7527;
float l9_7529=step(0.25,fract(l9_7528*0.5));
l9_7525=mix(l9_7527,1.0-l9_7527,fast::clamp(l9_7529,0.0,1.0));
}
}
l9_7509.y=l9_7525;
if (l9_7513)
{
bool l9_7530=l9_7515;
bool l9_7531;
if (l9_7530)
{
l9_7531=l9_7512.x==3;
}
else
{
l9_7531=l9_7530;
}
float l9_7532=l9_7509.x;
float l9_7533=l9_7514.x;
float l9_7534=l9_7514.z;
bool l9_7535=l9_7531;
float l9_7536=l9_7519;
float l9_7537=fast::clamp(l9_7532,l9_7533,l9_7534);
float l9_7538=step(abs(l9_7532-l9_7537),9.9999997e-06);
l9_7536*=(l9_7538+((1.0-float(l9_7535))*(1.0-l9_7538)));
l9_7532=l9_7537;
l9_7509.x=l9_7532;
l9_7519=l9_7536;
bool l9_7539=l9_7515;
bool l9_7540;
if (l9_7539)
{
l9_7540=l9_7512.y==3;
}
else
{
l9_7540=l9_7539;
}
float l9_7541=l9_7509.y;
float l9_7542=l9_7514.y;
float l9_7543=l9_7514.w;
bool l9_7544=l9_7540;
float l9_7545=l9_7519;
float l9_7546=fast::clamp(l9_7541,l9_7542,l9_7543);
float l9_7547=step(abs(l9_7541-l9_7546),9.9999997e-06);
l9_7545*=(l9_7547+((1.0-float(l9_7544))*(1.0-l9_7547)));
l9_7541=l9_7546;
l9_7509.y=l9_7541;
l9_7519=l9_7545;
}
float2 l9_7548=l9_7509;
bool l9_7549=l9_7510;
float3x3 l9_7550=l9_7511;
if (l9_7549)
{
l9_7548=float2((l9_7550*float3(l9_7548,1.0)).xy);
}
float2 l9_7551=l9_7548;
l9_7509=l9_7551;
float l9_7552=l9_7509.x;
int l9_7553=l9_7512.x;
bool l9_7554=l9_7518;
float l9_7555=l9_7519;
if ((l9_7553==0)||(l9_7553==3))
{
float l9_7556=l9_7552;
float l9_7557=0.0;
float l9_7558=1.0;
bool l9_7559=l9_7554;
float l9_7560=l9_7555;
float l9_7561=fast::clamp(l9_7556,l9_7557,l9_7558);
float l9_7562=step(abs(l9_7556-l9_7561),9.9999997e-06);
l9_7560*=(l9_7562+((1.0-float(l9_7559))*(1.0-l9_7562)));
l9_7556=l9_7561;
l9_7552=l9_7556;
l9_7555=l9_7560;
}
l9_7509.x=l9_7552;
l9_7519=l9_7555;
float l9_7563=l9_7509.y;
int l9_7564=l9_7512.y;
bool l9_7565=l9_7518;
float l9_7566=l9_7519;
if ((l9_7564==0)||(l9_7564==3))
{
float l9_7567=l9_7563;
float l9_7568=0.0;
float l9_7569=1.0;
bool l9_7570=l9_7565;
float l9_7571=l9_7566;
float l9_7572=fast::clamp(l9_7567,l9_7568,l9_7569);
float l9_7573=step(abs(l9_7567-l9_7572),9.9999997e-06);
l9_7571*=(l9_7573+((1.0-float(l9_7570))*(1.0-l9_7573)));
l9_7567=l9_7572;
l9_7563=l9_7567;
l9_7566=l9_7571;
}
l9_7509.y=l9_7563;
l9_7519=l9_7566;
float2 l9_7574=l9_7509;
int l9_7575=l9_7507;
int l9_7576=l9_7508;
float l9_7577=l9_7517;
float2 l9_7578=l9_7574;
int l9_7579=l9_7575;
int l9_7580=l9_7576;
float3 l9_7581=float3(0.0);
if (l9_7579==0)
{
l9_7581=float3(l9_7578,0.0);
}
else
{
if (l9_7579==1)
{
l9_7581=float3(l9_7578.x,(l9_7578.y*0.5)+(0.5-(float(l9_7580)*0.5)),0.0);
}
else
{
l9_7581=float3(l9_7578,float(l9_7580));
}
}
float3 l9_7582=l9_7581;
float3 l9_7583=l9_7582;
float4 l9_7584=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_7583.xy,bias(l9_7577));
float4 l9_7585=l9_7584;
if (l9_7515)
{
l9_7585=mix(l9_7516,l9_7585,float4(l9_7519));
}
float4 l9_7586=l9_7585;
l9_7500=l9_7586;
float l9_7587=0.0;
l9_7587=l9_7500.x;
float l9_7588=0.0;
l9_7588=step(l9_7587,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_7589=float4(0.0);
l9_7589=l9_7497*float4(l9_7588);
l9_7272=l9_7589;
l9_7276=l9_7272;
}
l9_7269=l9_7276;
float2 l9_7590=float2(0.0);
l9_7590=l9_6831.Surface_UVCoord0;
float4 l9_7591=float4(0.0);
int l9_7592;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_7593=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7593=0;
}
else
{
l9_7593=in.varStereoViewID;
}
int l9_7594=l9_7593;
l9_7592=1-l9_7594;
}
else
{
int l9_7595=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7595=0;
}
else
{
l9_7595=in.varStereoViewID;
}
int l9_7596=l9_7595;
l9_7592=l9_7596;
}
int l9_7597=l9_7592;
int l9_7598=greyMaskIdLayout_tmp;
int l9_7599=l9_7597;
float2 l9_7600=l9_7590;
bool l9_7601=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_7602=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_7603=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_7604=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_7605=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_7606=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_7607=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_7608=0.0;
bool l9_7609=l9_7606&&(!l9_7604);
float l9_7610=1.0;
float l9_7611=l9_7600.x;
int l9_7612=l9_7603.x;
if (l9_7612==1)
{
l9_7611=fract(l9_7611);
}
else
{
if (l9_7612==2)
{
float l9_7613=fract(l9_7611);
float l9_7614=l9_7611-l9_7613;
float l9_7615=step(0.25,fract(l9_7614*0.5));
l9_7611=mix(l9_7613,1.0-l9_7613,fast::clamp(l9_7615,0.0,1.0));
}
}
l9_7600.x=l9_7611;
float l9_7616=l9_7600.y;
int l9_7617=l9_7603.y;
if (l9_7617==1)
{
l9_7616=fract(l9_7616);
}
else
{
if (l9_7617==2)
{
float l9_7618=fract(l9_7616);
float l9_7619=l9_7616-l9_7618;
float l9_7620=step(0.25,fract(l9_7619*0.5));
l9_7616=mix(l9_7618,1.0-l9_7618,fast::clamp(l9_7620,0.0,1.0));
}
}
l9_7600.y=l9_7616;
if (l9_7604)
{
bool l9_7621=l9_7606;
bool l9_7622;
if (l9_7621)
{
l9_7622=l9_7603.x==3;
}
else
{
l9_7622=l9_7621;
}
float l9_7623=l9_7600.x;
float l9_7624=l9_7605.x;
float l9_7625=l9_7605.z;
bool l9_7626=l9_7622;
float l9_7627=l9_7610;
float l9_7628=fast::clamp(l9_7623,l9_7624,l9_7625);
float l9_7629=step(abs(l9_7623-l9_7628),9.9999997e-06);
l9_7627*=(l9_7629+((1.0-float(l9_7626))*(1.0-l9_7629)));
l9_7623=l9_7628;
l9_7600.x=l9_7623;
l9_7610=l9_7627;
bool l9_7630=l9_7606;
bool l9_7631;
if (l9_7630)
{
l9_7631=l9_7603.y==3;
}
else
{
l9_7631=l9_7630;
}
float l9_7632=l9_7600.y;
float l9_7633=l9_7605.y;
float l9_7634=l9_7605.w;
bool l9_7635=l9_7631;
float l9_7636=l9_7610;
float l9_7637=fast::clamp(l9_7632,l9_7633,l9_7634);
float l9_7638=step(abs(l9_7632-l9_7637),9.9999997e-06);
l9_7636*=(l9_7638+((1.0-float(l9_7635))*(1.0-l9_7638)));
l9_7632=l9_7637;
l9_7600.y=l9_7632;
l9_7610=l9_7636;
}
float2 l9_7639=l9_7600;
bool l9_7640=l9_7601;
float3x3 l9_7641=l9_7602;
if (l9_7640)
{
l9_7639=float2((l9_7641*float3(l9_7639,1.0)).xy);
}
float2 l9_7642=l9_7639;
l9_7600=l9_7642;
float l9_7643=l9_7600.x;
int l9_7644=l9_7603.x;
bool l9_7645=l9_7609;
float l9_7646=l9_7610;
if ((l9_7644==0)||(l9_7644==3))
{
float l9_7647=l9_7643;
float l9_7648=0.0;
float l9_7649=1.0;
bool l9_7650=l9_7645;
float l9_7651=l9_7646;
float l9_7652=fast::clamp(l9_7647,l9_7648,l9_7649);
float l9_7653=step(abs(l9_7647-l9_7652),9.9999997e-06);
l9_7651*=(l9_7653+((1.0-float(l9_7650))*(1.0-l9_7653)));
l9_7647=l9_7652;
l9_7643=l9_7647;
l9_7646=l9_7651;
}
l9_7600.x=l9_7643;
l9_7610=l9_7646;
float l9_7654=l9_7600.y;
int l9_7655=l9_7603.y;
bool l9_7656=l9_7609;
float l9_7657=l9_7610;
if ((l9_7655==0)||(l9_7655==3))
{
float l9_7658=l9_7654;
float l9_7659=0.0;
float l9_7660=1.0;
bool l9_7661=l9_7656;
float l9_7662=l9_7657;
float l9_7663=fast::clamp(l9_7658,l9_7659,l9_7660);
float l9_7664=step(abs(l9_7658-l9_7663),9.9999997e-06);
l9_7662*=(l9_7664+((1.0-float(l9_7661))*(1.0-l9_7664)));
l9_7658=l9_7663;
l9_7654=l9_7658;
l9_7657=l9_7662;
}
l9_7600.y=l9_7654;
l9_7610=l9_7657;
float2 l9_7665=l9_7600;
int l9_7666=l9_7598;
int l9_7667=l9_7599;
float l9_7668=l9_7608;
float2 l9_7669=l9_7665;
int l9_7670=l9_7666;
int l9_7671=l9_7667;
float3 l9_7672=float3(0.0);
if (l9_7670==0)
{
l9_7672=float3(l9_7669,0.0);
}
else
{
if (l9_7670==1)
{
l9_7672=float3(l9_7669.x,(l9_7669.y*0.5)+(0.5-(float(l9_7671)*0.5)),0.0);
}
else
{
l9_7672=float3(l9_7669,float(l9_7671));
}
}
float3 l9_7673=l9_7672;
float3 l9_7674=l9_7673;
float4 l9_7675=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_7674.xy,bias(l9_7668));
float4 l9_7676=l9_7675;
if (l9_7606)
{
l9_7676=mix(l9_7607,l9_7676,float4(l9_7610));
}
float4 l9_7677=l9_7676;
l9_7591=l9_7677;
float l9_7678=0.0;
l9_7678=l9_7591.x;
float l9_7679=0.0;
l9_7679=step(l9_7678,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_7680=float4(0.0);
l9_7680=l9_7269*float4(l9_7679);
float4 l9_7681=float4(0.0);
float4 l9_7682=(*sc_set0.UserUniforms).colorId01;
l9_7681=l9_7682;
float4 l9_7683=float4(0.0);
l9_7683=l9_7681*float4(l9_7679);
float4 l9_7684=float4(0.0);
float4 l9_7685=l9_7680;
float4 l9_7686=l9_7683;
float4 l9_7687=l9_7685;
float4 l9_7688=l9_7686;
float3 l9_7689=l9_7687.xyz*l9_7687.w;
l9_7687=float4(l9_7689.x,l9_7689.y,l9_7689.z,l9_7687.w);
float4 l9_7690=l9_7687+(l9_7688*(1.0-l9_7687.w));
l9_7684=l9_7690;
l9_6830=l9_7684;
l9_6834=l9_6830;
}
l9_6827=l9_6834;
l9_5930=l9_6827;
l9_5934=l9_5930;
}
l9_5927=l9_5934;
float2 l9_7691=float2(0.0);
l9_7691=l9_2116.Surface_UVCoord0;
float4 l9_7692=float4(0.0);
int l9_7693;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_7694=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7694=0;
}
else
{
l9_7694=in.varStereoViewID;
}
int l9_7695=l9_7694;
l9_7693=1-l9_7695;
}
else
{
int l9_7696=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7696=0;
}
else
{
l9_7696=in.varStereoViewID;
}
int l9_7697=l9_7696;
l9_7693=l9_7697;
}
int l9_7698=l9_7693;
int l9_7699=greyMaskIdLayout_tmp;
int l9_7700=l9_7698;
float2 l9_7701=l9_7691;
bool l9_7702=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_7703=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_7704=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_7705=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_7706=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_7707=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_7708=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_7709=0.0;
bool l9_7710=l9_7707&&(!l9_7705);
float l9_7711=1.0;
float l9_7712=l9_7701.x;
int l9_7713=l9_7704.x;
if (l9_7713==1)
{
l9_7712=fract(l9_7712);
}
else
{
if (l9_7713==2)
{
float l9_7714=fract(l9_7712);
float l9_7715=l9_7712-l9_7714;
float l9_7716=step(0.25,fract(l9_7715*0.5));
l9_7712=mix(l9_7714,1.0-l9_7714,fast::clamp(l9_7716,0.0,1.0));
}
}
l9_7701.x=l9_7712;
float l9_7717=l9_7701.y;
int l9_7718=l9_7704.y;
if (l9_7718==1)
{
l9_7717=fract(l9_7717);
}
else
{
if (l9_7718==2)
{
float l9_7719=fract(l9_7717);
float l9_7720=l9_7717-l9_7719;
float l9_7721=step(0.25,fract(l9_7720*0.5));
l9_7717=mix(l9_7719,1.0-l9_7719,fast::clamp(l9_7721,0.0,1.0));
}
}
l9_7701.y=l9_7717;
if (l9_7705)
{
bool l9_7722=l9_7707;
bool l9_7723;
if (l9_7722)
{
l9_7723=l9_7704.x==3;
}
else
{
l9_7723=l9_7722;
}
float l9_7724=l9_7701.x;
float l9_7725=l9_7706.x;
float l9_7726=l9_7706.z;
bool l9_7727=l9_7723;
float l9_7728=l9_7711;
float l9_7729=fast::clamp(l9_7724,l9_7725,l9_7726);
float l9_7730=step(abs(l9_7724-l9_7729),9.9999997e-06);
l9_7728*=(l9_7730+((1.0-float(l9_7727))*(1.0-l9_7730)));
l9_7724=l9_7729;
l9_7701.x=l9_7724;
l9_7711=l9_7728;
bool l9_7731=l9_7707;
bool l9_7732;
if (l9_7731)
{
l9_7732=l9_7704.y==3;
}
else
{
l9_7732=l9_7731;
}
float l9_7733=l9_7701.y;
float l9_7734=l9_7706.y;
float l9_7735=l9_7706.w;
bool l9_7736=l9_7732;
float l9_7737=l9_7711;
float l9_7738=fast::clamp(l9_7733,l9_7734,l9_7735);
float l9_7739=step(abs(l9_7733-l9_7738),9.9999997e-06);
l9_7737*=(l9_7739+((1.0-float(l9_7736))*(1.0-l9_7739)));
l9_7733=l9_7738;
l9_7701.y=l9_7733;
l9_7711=l9_7737;
}
float2 l9_7740=l9_7701;
bool l9_7741=l9_7702;
float3x3 l9_7742=l9_7703;
if (l9_7741)
{
l9_7740=float2((l9_7742*float3(l9_7740,1.0)).xy);
}
float2 l9_7743=l9_7740;
l9_7701=l9_7743;
float l9_7744=l9_7701.x;
int l9_7745=l9_7704.x;
bool l9_7746=l9_7710;
float l9_7747=l9_7711;
if ((l9_7745==0)||(l9_7745==3))
{
float l9_7748=l9_7744;
float l9_7749=0.0;
float l9_7750=1.0;
bool l9_7751=l9_7746;
float l9_7752=l9_7747;
float l9_7753=fast::clamp(l9_7748,l9_7749,l9_7750);
float l9_7754=step(abs(l9_7748-l9_7753),9.9999997e-06);
l9_7752*=(l9_7754+((1.0-float(l9_7751))*(1.0-l9_7754)));
l9_7748=l9_7753;
l9_7744=l9_7748;
l9_7747=l9_7752;
}
l9_7701.x=l9_7744;
l9_7711=l9_7747;
float l9_7755=l9_7701.y;
int l9_7756=l9_7704.y;
bool l9_7757=l9_7710;
float l9_7758=l9_7711;
if ((l9_7756==0)||(l9_7756==3))
{
float l9_7759=l9_7755;
float l9_7760=0.0;
float l9_7761=1.0;
bool l9_7762=l9_7757;
float l9_7763=l9_7758;
float l9_7764=fast::clamp(l9_7759,l9_7760,l9_7761);
float l9_7765=step(abs(l9_7759-l9_7764),9.9999997e-06);
l9_7763*=(l9_7765+((1.0-float(l9_7762))*(1.0-l9_7765)));
l9_7759=l9_7764;
l9_7755=l9_7759;
l9_7758=l9_7763;
}
l9_7701.y=l9_7755;
l9_7711=l9_7758;
float2 l9_7766=l9_7701;
int l9_7767=l9_7699;
int l9_7768=l9_7700;
float l9_7769=l9_7709;
float2 l9_7770=l9_7766;
int l9_7771=l9_7767;
int l9_7772=l9_7768;
float3 l9_7773=float3(0.0);
if (l9_7771==0)
{
l9_7773=float3(l9_7770,0.0);
}
else
{
if (l9_7771==1)
{
l9_7773=float3(l9_7770.x,(l9_7770.y*0.5)+(0.5-(float(l9_7772)*0.5)),0.0);
}
else
{
l9_7773=float3(l9_7770,float(l9_7772));
}
}
float3 l9_7774=l9_7773;
float3 l9_7775=l9_7774;
float4 l9_7776=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_7775.xy,bias(l9_7769));
float4 l9_7777=l9_7776;
if (l9_7707)
{
l9_7777=mix(l9_7708,l9_7777,float4(l9_7711));
}
float4 l9_7778=l9_7777;
l9_7692=l9_7778;
float l9_7779=0.0;
l9_7779=l9_7692.x;
float l9_7780=0.0;
l9_7780=step(l9_7779,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_7781=float4(0.0);
l9_7781=l9_5927*float4(l9_7780);
l9_2115=l9_7781;
l9_2119=l9_2115;
}
l9_2112=l9_2119;
float4 l9_7782=float4(0.0);
float4 l9_7783=l9_2111;
float4 l9_7784=l9_2112;
float4 l9_7785=l9_7783;
float4 l9_7786=l9_7784;
float3 l9_7787=l9_7785.xyz*l9_7785.w;
l9_7785=float4(l9_7787.x,l9_7787.y,l9_7787.z,l9_7785.w);
float4 l9_7788=l9_7785+(l9_7786*(1.0-l9_7785.w));
l9_7782=l9_7788;
param_29=l9_7782;
param_31=param_29;
}
else
{
float4 l9_7789=float4(0.0);
float l9_7790=0.0;
float4 l9_7791=float4(0.0);
float4 l9_7792=float4(0.0);
ssGlobals l9_7793=param_32;
float l9_7794=0.0;
float l9_7795=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_7794=l9_7795;
l9_7790=l9_7794;
float4 l9_7796;
if ((l9_7790*1.0)!=0.0)
{
float4 l9_7797=float4(0.0);
float l9_7798=0.0;
float4 l9_7799=float4(0.0);
float4 l9_7800=float4(0.0);
ssGlobals l9_7801=l9_7793;
float l9_7802=0.0;
float l9_7803=float((*sc_set0.UserUniforms).pbrOnOffId02!=0);
l9_7802=l9_7803;
l9_7798=l9_7802;
float4 l9_7804;
if ((l9_7798*1.0)!=0.0)
{
float4 l9_7805=float4(0.0);
float l9_7806=0.0;
float4 l9_7807=float4(0.0);
float4 l9_7808=float4(0.0);
ssGlobals l9_7809=l9_7801;
float l9_7810=0.0;
float l9_7811=float((*sc_set0.UserUniforms).rimOnOffId02!=0);
l9_7810=l9_7811;
l9_7806=l9_7810;
float4 l9_7812;
if ((l9_7806*1.0)!=0.0)
{
float l9_7813=0.0;
float l9_7814=(*sc_set0.UserUniforms).rimExpId02;
l9_7813=l9_7814;
float l9_7815=0.0;
float l9_7816=(*sc_set0.UserUniforms).rimIntId02;
l9_7815=l9_7816;
float l9_7817=0.0;
float l9_7818=l9_7813;
float l9_7819=l9_7815;
ssGlobals l9_7820=l9_7809;
float l9_7821=abs(dot(-l9_7820.ViewDirWS,l9_7820.VertexNormal_WorldSpace));
float l9_7822=1.0-pow(1.0-l9_7821,l9_7818);
l9_7822=fast::max(l9_7822,0.0);
l9_7822*=l9_7819;
l9_7817=l9_7822;
float4 l9_7823=float4(0.0);
float l9_7824=0.0;
float4 l9_7825=float4(0.0);
float4 l9_7826=float4(0.0);
ssGlobals l9_7827=l9_7809;
float l9_7828=0.0;
float l9_7829=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_7828=l9_7829;
l9_7824=l9_7828;
float4 l9_7830;
if ((l9_7824*1.0)!=0.0)
{
float4 l9_7831=float4(0.0);
float4 l9_7832=(*sc_set0.UserUniforms).patternColorId02;
l9_7831=l9_7832;
float4 l9_7833=float4(0.0);
float l9_7834=0.0;
float4 l9_7835=float4(0.0);
float4 l9_7836=float4(0.0);
ssGlobals l9_7837=l9_7827;
float l9_7838=0.0;
float l9_7839=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_7838=l9_7839;
l9_7834=l9_7838;
float4 l9_7840;
if ((l9_7834*1.0)!=0.0)
{
float2 l9_7841=float2(0.0);
l9_7841=l9_7837.Surface_UVCoord0;
float2 l9_7842=float2(0.0);
float2 l9_7843=(*sc_set0.UserUniforms).patternScaleId02;
l9_7842=l9_7843;
float2 l9_7844=float2(0.0);
l9_7844=((l9_7841-(*sc_set0.UserUniforms).Port_Center_N282)*l9_7842)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_7845=float2(0.0);
float2 l9_7846=(*sc_set0.UserUniforms).patternOffsetId02;
l9_7845=l9_7846;
float2 l9_7847=float2(0.0);
l9_7847=l9_7844+l9_7845;
float l9_7848=0.0;
float l9_7849=(*sc_set0.UserUniforms).patternRotateId02;
l9_7848=l9_7849;
float2 l9_7850=float2(0.0);
float2 l9_7851=l9_7847;
float l9_7852=l9_7848;
float2 l9_7853=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_7854=sin(radians(l9_7852));
float l9_7855=cos(radians(l9_7852));
float2 l9_7856=l9_7851-l9_7853;
l9_7856=float2(dot(float2(l9_7855,l9_7854),l9_7856),dot(float2(-l9_7854,l9_7855),l9_7856))+l9_7853;
l9_7850=l9_7856;
float4 l9_7857=float4(0.0);
int l9_7858;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_7859=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7859=0;
}
else
{
l9_7859=in.varStereoViewID;
}
int l9_7860=l9_7859;
l9_7858=1-l9_7860;
}
else
{
int l9_7861=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7861=0;
}
else
{
l9_7861=in.varStereoViewID;
}
int l9_7862=l9_7861;
l9_7858=l9_7862;
}
int l9_7863=l9_7858;
int l9_7864=patternTextureId02Layout_tmp;
int l9_7865=l9_7863;
float2 l9_7866=l9_7850;
bool l9_7867=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_7868=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_7869=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_7870=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_7871=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_7872=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_7873=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_7874=0.0;
bool l9_7875=l9_7872&&(!l9_7870);
float l9_7876=1.0;
float l9_7877=l9_7866.x;
int l9_7878=l9_7869.x;
if (l9_7878==1)
{
l9_7877=fract(l9_7877);
}
else
{
if (l9_7878==2)
{
float l9_7879=fract(l9_7877);
float l9_7880=l9_7877-l9_7879;
float l9_7881=step(0.25,fract(l9_7880*0.5));
l9_7877=mix(l9_7879,1.0-l9_7879,fast::clamp(l9_7881,0.0,1.0));
}
}
l9_7866.x=l9_7877;
float l9_7882=l9_7866.y;
int l9_7883=l9_7869.y;
if (l9_7883==1)
{
l9_7882=fract(l9_7882);
}
else
{
if (l9_7883==2)
{
float l9_7884=fract(l9_7882);
float l9_7885=l9_7882-l9_7884;
float l9_7886=step(0.25,fract(l9_7885*0.5));
l9_7882=mix(l9_7884,1.0-l9_7884,fast::clamp(l9_7886,0.0,1.0));
}
}
l9_7866.y=l9_7882;
if (l9_7870)
{
bool l9_7887=l9_7872;
bool l9_7888;
if (l9_7887)
{
l9_7888=l9_7869.x==3;
}
else
{
l9_7888=l9_7887;
}
float l9_7889=l9_7866.x;
float l9_7890=l9_7871.x;
float l9_7891=l9_7871.z;
bool l9_7892=l9_7888;
float l9_7893=l9_7876;
float l9_7894=fast::clamp(l9_7889,l9_7890,l9_7891);
float l9_7895=step(abs(l9_7889-l9_7894),9.9999997e-06);
l9_7893*=(l9_7895+((1.0-float(l9_7892))*(1.0-l9_7895)));
l9_7889=l9_7894;
l9_7866.x=l9_7889;
l9_7876=l9_7893;
bool l9_7896=l9_7872;
bool l9_7897;
if (l9_7896)
{
l9_7897=l9_7869.y==3;
}
else
{
l9_7897=l9_7896;
}
float l9_7898=l9_7866.y;
float l9_7899=l9_7871.y;
float l9_7900=l9_7871.w;
bool l9_7901=l9_7897;
float l9_7902=l9_7876;
float l9_7903=fast::clamp(l9_7898,l9_7899,l9_7900);
float l9_7904=step(abs(l9_7898-l9_7903),9.9999997e-06);
l9_7902*=(l9_7904+((1.0-float(l9_7901))*(1.0-l9_7904)));
l9_7898=l9_7903;
l9_7866.y=l9_7898;
l9_7876=l9_7902;
}
float2 l9_7905=l9_7866;
bool l9_7906=l9_7867;
float3x3 l9_7907=l9_7868;
if (l9_7906)
{
l9_7905=float2((l9_7907*float3(l9_7905,1.0)).xy);
}
float2 l9_7908=l9_7905;
l9_7866=l9_7908;
float l9_7909=l9_7866.x;
int l9_7910=l9_7869.x;
bool l9_7911=l9_7875;
float l9_7912=l9_7876;
if ((l9_7910==0)||(l9_7910==3))
{
float l9_7913=l9_7909;
float l9_7914=0.0;
float l9_7915=1.0;
bool l9_7916=l9_7911;
float l9_7917=l9_7912;
float l9_7918=fast::clamp(l9_7913,l9_7914,l9_7915);
float l9_7919=step(abs(l9_7913-l9_7918),9.9999997e-06);
l9_7917*=(l9_7919+((1.0-float(l9_7916))*(1.0-l9_7919)));
l9_7913=l9_7918;
l9_7909=l9_7913;
l9_7912=l9_7917;
}
l9_7866.x=l9_7909;
l9_7876=l9_7912;
float l9_7920=l9_7866.y;
int l9_7921=l9_7869.y;
bool l9_7922=l9_7875;
float l9_7923=l9_7876;
if ((l9_7921==0)||(l9_7921==3))
{
float l9_7924=l9_7920;
float l9_7925=0.0;
float l9_7926=1.0;
bool l9_7927=l9_7922;
float l9_7928=l9_7923;
float l9_7929=fast::clamp(l9_7924,l9_7925,l9_7926);
float l9_7930=step(abs(l9_7924-l9_7929),9.9999997e-06);
l9_7928*=(l9_7930+((1.0-float(l9_7927))*(1.0-l9_7930)));
l9_7924=l9_7929;
l9_7920=l9_7924;
l9_7923=l9_7928;
}
l9_7866.y=l9_7920;
l9_7876=l9_7923;
float2 l9_7931=l9_7866;
int l9_7932=l9_7864;
int l9_7933=l9_7865;
float l9_7934=l9_7874;
float2 l9_7935=l9_7931;
int l9_7936=l9_7932;
int l9_7937=l9_7933;
float3 l9_7938=float3(0.0);
if (l9_7936==0)
{
l9_7938=float3(l9_7935,0.0);
}
else
{
if (l9_7936==1)
{
l9_7938=float3(l9_7935.x,(l9_7935.y*0.5)+(0.5-(float(l9_7937)*0.5)),0.0);
}
else
{
l9_7938=float3(l9_7935,float(l9_7937));
}
}
float3 l9_7939=l9_7938;
float3 l9_7940=l9_7939;
float4 l9_7941=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_7940.xy,bias(l9_7934));
float4 l9_7942=l9_7941;
if (l9_7872)
{
l9_7942=mix(l9_7873,l9_7942,float4(l9_7876));
}
float4 l9_7943=l9_7942;
l9_7857=l9_7943;
l9_7835=l9_7857;
l9_7840=l9_7835;
}
else
{
float2 l9_7944=float2(0.0);
l9_7944=l9_7837.Surface_UVCoord0;
float2 l9_7945=float2(0.0);
float2 l9_7946=(*sc_set0.UserUniforms).patternScaleId02;
l9_7945=l9_7946;
float2 l9_7947=float2(0.0);
l9_7947=((l9_7944-(*sc_set0.UserUniforms).Port_Center_N282)*l9_7945)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_7948=float2(0.0);
float2 l9_7949=(*sc_set0.UserUniforms).patternOffsetId02;
l9_7948=l9_7949;
float2 l9_7950=float2(0.0);
l9_7950=l9_7947+l9_7948;
float l9_7951=0.0;
float l9_7952=(*sc_set0.UserUniforms).patternRotateId02;
l9_7951=l9_7952;
float2 l9_7953=float2(0.0);
float2 l9_7954=l9_7950;
float l9_7955=l9_7951;
float2 l9_7956=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_7957=sin(radians(l9_7955));
float l9_7958=cos(radians(l9_7955));
float2 l9_7959=l9_7954-l9_7956;
l9_7959=float2(dot(float2(l9_7958,l9_7957),l9_7959),dot(float2(-l9_7957,l9_7958),l9_7959))+l9_7956;
l9_7953=l9_7959;
float4 l9_7960=float4(0.0);
int l9_7961;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_7962=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7962=0;
}
else
{
l9_7962=in.varStereoViewID;
}
int l9_7963=l9_7962;
l9_7961=1-l9_7963;
}
else
{
int l9_7964=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7964=0;
}
else
{
l9_7964=in.varStereoViewID;
}
int l9_7965=l9_7964;
l9_7961=l9_7965;
}
int l9_7966=l9_7961;
int l9_7967=patternTextureId02Layout_tmp;
int l9_7968=l9_7966;
float2 l9_7969=l9_7953;
bool l9_7970=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_7971=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_7972=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_7973=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_7974=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_7975=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_7976=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_7977=0.0;
bool l9_7978=l9_7975&&(!l9_7973);
float l9_7979=1.0;
float l9_7980=l9_7969.x;
int l9_7981=l9_7972.x;
if (l9_7981==1)
{
l9_7980=fract(l9_7980);
}
else
{
if (l9_7981==2)
{
float l9_7982=fract(l9_7980);
float l9_7983=l9_7980-l9_7982;
float l9_7984=step(0.25,fract(l9_7983*0.5));
l9_7980=mix(l9_7982,1.0-l9_7982,fast::clamp(l9_7984,0.0,1.0));
}
}
l9_7969.x=l9_7980;
float l9_7985=l9_7969.y;
int l9_7986=l9_7972.y;
if (l9_7986==1)
{
l9_7985=fract(l9_7985);
}
else
{
if (l9_7986==2)
{
float l9_7987=fract(l9_7985);
float l9_7988=l9_7985-l9_7987;
float l9_7989=step(0.25,fract(l9_7988*0.5));
l9_7985=mix(l9_7987,1.0-l9_7987,fast::clamp(l9_7989,0.0,1.0));
}
}
l9_7969.y=l9_7985;
if (l9_7973)
{
bool l9_7990=l9_7975;
bool l9_7991;
if (l9_7990)
{
l9_7991=l9_7972.x==3;
}
else
{
l9_7991=l9_7990;
}
float l9_7992=l9_7969.x;
float l9_7993=l9_7974.x;
float l9_7994=l9_7974.z;
bool l9_7995=l9_7991;
float l9_7996=l9_7979;
float l9_7997=fast::clamp(l9_7992,l9_7993,l9_7994);
float l9_7998=step(abs(l9_7992-l9_7997),9.9999997e-06);
l9_7996*=(l9_7998+((1.0-float(l9_7995))*(1.0-l9_7998)));
l9_7992=l9_7997;
l9_7969.x=l9_7992;
l9_7979=l9_7996;
bool l9_7999=l9_7975;
bool l9_8000;
if (l9_7999)
{
l9_8000=l9_7972.y==3;
}
else
{
l9_8000=l9_7999;
}
float l9_8001=l9_7969.y;
float l9_8002=l9_7974.y;
float l9_8003=l9_7974.w;
bool l9_8004=l9_8000;
float l9_8005=l9_7979;
float l9_8006=fast::clamp(l9_8001,l9_8002,l9_8003);
float l9_8007=step(abs(l9_8001-l9_8006),9.9999997e-06);
l9_8005*=(l9_8007+((1.0-float(l9_8004))*(1.0-l9_8007)));
l9_8001=l9_8006;
l9_7969.y=l9_8001;
l9_7979=l9_8005;
}
float2 l9_8008=l9_7969;
bool l9_8009=l9_7970;
float3x3 l9_8010=l9_7971;
if (l9_8009)
{
l9_8008=float2((l9_8010*float3(l9_8008,1.0)).xy);
}
float2 l9_8011=l9_8008;
l9_7969=l9_8011;
float l9_8012=l9_7969.x;
int l9_8013=l9_7972.x;
bool l9_8014=l9_7978;
float l9_8015=l9_7979;
if ((l9_8013==0)||(l9_8013==3))
{
float l9_8016=l9_8012;
float l9_8017=0.0;
float l9_8018=1.0;
bool l9_8019=l9_8014;
float l9_8020=l9_8015;
float l9_8021=fast::clamp(l9_8016,l9_8017,l9_8018);
float l9_8022=step(abs(l9_8016-l9_8021),9.9999997e-06);
l9_8020*=(l9_8022+((1.0-float(l9_8019))*(1.0-l9_8022)));
l9_8016=l9_8021;
l9_8012=l9_8016;
l9_8015=l9_8020;
}
l9_7969.x=l9_8012;
l9_7979=l9_8015;
float l9_8023=l9_7969.y;
int l9_8024=l9_7972.y;
bool l9_8025=l9_7978;
float l9_8026=l9_7979;
if ((l9_8024==0)||(l9_8024==3))
{
float l9_8027=l9_8023;
float l9_8028=0.0;
float l9_8029=1.0;
bool l9_8030=l9_8025;
float l9_8031=l9_8026;
float l9_8032=fast::clamp(l9_8027,l9_8028,l9_8029);
float l9_8033=step(abs(l9_8027-l9_8032),9.9999997e-06);
l9_8031*=(l9_8033+((1.0-float(l9_8030))*(1.0-l9_8033)));
l9_8027=l9_8032;
l9_8023=l9_8027;
l9_8026=l9_8031;
}
l9_7969.y=l9_8023;
l9_7979=l9_8026;
float2 l9_8034=l9_7969;
int l9_8035=l9_7967;
int l9_8036=l9_7968;
float l9_8037=l9_7977;
float2 l9_8038=l9_8034;
int l9_8039=l9_8035;
int l9_8040=l9_8036;
float3 l9_8041=float3(0.0);
if (l9_8039==0)
{
l9_8041=float3(l9_8038,0.0);
}
else
{
if (l9_8039==1)
{
l9_8041=float3(l9_8038.x,(l9_8038.y*0.5)+(0.5-(float(l9_8040)*0.5)),0.0);
}
else
{
l9_8041=float3(l9_8038,float(l9_8040));
}
}
float3 l9_8042=l9_8041;
float3 l9_8043=l9_8042;
float4 l9_8044=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_8043.xy,bias(l9_8037));
float4 l9_8045=l9_8044;
if (l9_7975)
{
l9_8045=mix(l9_7976,l9_8045,float4(l9_7979));
}
float4 l9_8046=l9_8045;
l9_7960=l9_8046;
float l9_8047=0.0;
float3 l9_8048=l9_7960.xyz;
float l9_8049=l9_8048.x;
l9_8047=l9_8049;
l9_7836=float4(l9_8047);
l9_7840=l9_7836;
}
l9_7833=l9_7840;
float4 l9_8050=float4(0.0);
l9_8050=l9_7831*l9_7833;
l9_7825=l9_8050;
l9_7830=l9_7825;
}
else
{
float4 l9_8051=float4(0.0);
float4 l9_8052=(*sc_set0.UserUniforms).colorId02;
l9_8051=l9_8052;
float4 l9_8053=float4(0.0);
float l9_8054=0.0;
float4 l9_8055=float4(0.0);
float4 l9_8056=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_8057=l9_7827;
float l9_8058=0.0;
float l9_8059=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_8058=l9_8059;
l9_8054=l9_8058;
float4 l9_8060;
if ((l9_8054*1.0)!=0.0)
{
float2 l9_8061=float2(0.0);
l9_8061=l9_8057.Surface_UVCoord0;
float4 l9_8062=float4(0.0);
int l9_8063;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_8064=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8064=0;
}
else
{
l9_8064=in.varStereoViewID;
}
int l9_8065=l9_8064;
l9_8063=1-l9_8065;
}
else
{
int l9_8066=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8066=0;
}
else
{
l9_8066=in.varStereoViewID;
}
int l9_8067=l9_8066;
l9_8063=l9_8067;
}
int l9_8068=l9_8063;
int l9_8069=greyMaskIdLayout_tmp;
int l9_8070=l9_8068;
float2 l9_8071=l9_8061;
bool l9_8072=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_8073=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_8074=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_8075=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_8076=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_8077=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_8078=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_8079=0.0;
bool l9_8080=l9_8077&&(!l9_8075);
float l9_8081=1.0;
float l9_8082=l9_8071.x;
int l9_8083=l9_8074.x;
if (l9_8083==1)
{
l9_8082=fract(l9_8082);
}
else
{
if (l9_8083==2)
{
float l9_8084=fract(l9_8082);
float l9_8085=l9_8082-l9_8084;
float l9_8086=step(0.25,fract(l9_8085*0.5));
l9_8082=mix(l9_8084,1.0-l9_8084,fast::clamp(l9_8086,0.0,1.0));
}
}
l9_8071.x=l9_8082;
float l9_8087=l9_8071.y;
int l9_8088=l9_8074.y;
if (l9_8088==1)
{
l9_8087=fract(l9_8087);
}
else
{
if (l9_8088==2)
{
float l9_8089=fract(l9_8087);
float l9_8090=l9_8087-l9_8089;
float l9_8091=step(0.25,fract(l9_8090*0.5));
l9_8087=mix(l9_8089,1.0-l9_8089,fast::clamp(l9_8091,0.0,1.0));
}
}
l9_8071.y=l9_8087;
if (l9_8075)
{
bool l9_8092=l9_8077;
bool l9_8093;
if (l9_8092)
{
l9_8093=l9_8074.x==3;
}
else
{
l9_8093=l9_8092;
}
float l9_8094=l9_8071.x;
float l9_8095=l9_8076.x;
float l9_8096=l9_8076.z;
bool l9_8097=l9_8093;
float l9_8098=l9_8081;
float l9_8099=fast::clamp(l9_8094,l9_8095,l9_8096);
float l9_8100=step(abs(l9_8094-l9_8099),9.9999997e-06);
l9_8098*=(l9_8100+((1.0-float(l9_8097))*(1.0-l9_8100)));
l9_8094=l9_8099;
l9_8071.x=l9_8094;
l9_8081=l9_8098;
bool l9_8101=l9_8077;
bool l9_8102;
if (l9_8101)
{
l9_8102=l9_8074.y==3;
}
else
{
l9_8102=l9_8101;
}
float l9_8103=l9_8071.y;
float l9_8104=l9_8076.y;
float l9_8105=l9_8076.w;
bool l9_8106=l9_8102;
float l9_8107=l9_8081;
float l9_8108=fast::clamp(l9_8103,l9_8104,l9_8105);
float l9_8109=step(abs(l9_8103-l9_8108),9.9999997e-06);
l9_8107*=(l9_8109+((1.0-float(l9_8106))*(1.0-l9_8109)));
l9_8103=l9_8108;
l9_8071.y=l9_8103;
l9_8081=l9_8107;
}
float2 l9_8110=l9_8071;
bool l9_8111=l9_8072;
float3x3 l9_8112=l9_8073;
if (l9_8111)
{
l9_8110=float2((l9_8112*float3(l9_8110,1.0)).xy);
}
float2 l9_8113=l9_8110;
l9_8071=l9_8113;
float l9_8114=l9_8071.x;
int l9_8115=l9_8074.x;
bool l9_8116=l9_8080;
float l9_8117=l9_8081;
if ((l9_8115==0)||(l9_8115==3))
{
float l9_8118=l9_8114;
float l9_8119=0.0;
float l9_8120=1.0;
bool l9_8121=l9_8116;
float l9_8122=l9_8117;
float l9_8123=fast::clamp(l9_8118,l9_8119,l9_8120);
float l9_8124=step(abs(l9_8118-l9_8123),9.9999997e-06);
l9_8122*=(l9_8124+((1.0-float(l9_8121))*(1.0-l9_8124)));
l9_8118=l9_8123;
l9_8114=l9_8118;
l9_8117=l9_8122;
}
l9_8071.x=l9_8114;
l9_8081=l9_8117;
float l9_8125=l9_8071.y;
int l9_8126=l9_8074.y;
bool l9_8127=l9_8080;
float l9_8128=l9_8081;
if ((l9_8126==0)||(l9_8126==3))
{
float l9_8129=l9_8125;
float l9_8130=0.0;
float l9_8131=1.0;
bool l9_8132=l9_8127;
float l9_8133=l9_8128;
float l9_8134=fast::clamp(l9_8129,l9_8130,l9_8131);
float l9_8135=step(abs(l9_8129-l9_8134),9.9999997e-06);
l9_8133*=(l9_8135+((1.0-float(l9_8132))*(1.0-l9_8135)));
l9_8129=l9_8134;
l9_8125=l9_8129;
l9_8128=l9_8133;
}
l9_8071.y=l9_8125;
l9_8081=l9_8128;
float2 l9_8136=l9_8071;
int l9_8137=l9_8069;
int l9_8138=l9_8070;
float l9_8139=l9_8079;
float2 l9_8140=l9_8136;
int l9_8141=l9_8137;
int l9_8142=l9_8138;
float3 l9_8143=float3(0.0);
if (l9_8141==0)
{
l9_8143=float3(l9_8140,0.0);
}
else
{
if (l9_8141==1)
{
l9_8143=float3(l9_8140.x,(l9_8140.y*0.5)+(0.5-(float(l9_8142)*0.5)),0.0);
}
else
{
l9_8143=float3(l9_8140,float(l9_8142));
}
}
float3 l9_8144=l9_8143;
float3 l9_8145=l9_8144;
float4 l9_8146=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_8145.xy,bias(l9_8139));
float4 l9_8147=l9_8146;
if (l9_8077)
{
l9_8147=mix(l9_8078,l9_8147,float4(l9_8081));
}
float4 l9_8148=l9_8147;
l9_8062=l9_8148;
float l9_8149=0.0;
l9_8149=l9_8062.x;
float l9_8150=0.0;
l9_8150=step(l9_8149,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_8151=0.0;
l9_8151=step(l9_8149,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_8152=0.0;
l9_8152=l9_8150-l9_8151;
l9_8055=float4(l9_8152);
l9_8060=l9_8055;
}
else
{
l9_8060=l9_8056;
}
l9_8053=l9_8060;
float4 l9_8153=float4(0.0);
l9_8153=l9_8051*l9_8053;
l9_7826=l9_8153;
l9_7830=l9_7826;
}
l9_7823=l9_7830;
float4 l9_8154=float4(0.0);
float l9_8155=0.0;
float4 l9_8156=float4(0.0);
float4 l9_8157=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_8158=l9_7809;
float l9_8159=0.0;
float l9_8160=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_8159=l9_8160;
l9_8155=l9_8159;
float4 l9_8161;
if ((l9_8155*1.0)!=0.0)
{
float2 l9_8162=float2(0.0);
l9_8162=l9_8158.Surface_UVCoord0;
float4 l9_8163=float4(0.0);
int l9_8164;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_8165=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8165=0;
}
else
{
l9_8165=in.varStereoViewID;
}
int l9_8166=l9_8165;
l9_8164=1-l9_8166;
}
else
{
int l9_8167=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8167=0;
}
else
{
l9_8167=in.varStereoViewID;
}
int l9_8168=l9_8167;
l9_8164=l9_8168;
}
int l9_8169=l9_8164;
int l9_8170=greyMaskIdLayout_tmp;
int l9_8171=l9_8169;
float2 l9_8172=l9_8162;
bool l9_8173=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_8174=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_8175=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_8176=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_8177=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_8178=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_8179=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_8180=0.0;
bool l9_8181=l9_8178&&(!l9_8176);
float l9_8182=1.0;
float l9_8183=l9_8172.x;
int l9_8184=l9_8175.x;
if (l9_8184==1)
{
l9_8183=fract(l9_8183);
}
else
{
if (l9_8184==2)
{
float l9_8185=fract(l9_8183);
float l9_8186=l9_8183-l9_8185;
float l9_8187=step(0.25,fract(l9_8186*0.5));
l9_8183=mix(l9_8185,1.0-l9_8185,fast::clamp(l9_8187,0.0,1.0));
}
}
l9_8172.x=l9_8183;
float l9_8188=l9_8172.y;
int l9_8189=l9_8175.y;
if (l9_8189==1)
{
l9_8188=fract(l9_8188);
}
else
{
if (l9_8189==2)
{
float l9_8190=fract(l9_8188);
float l9_8191=l9_8188-l9_8190;
float l9_8192=step(0.25,fract(l9_8191*0.5));
l9_8188=mix(l9_8190,1.0-l9_8190,fast::clamp(l9_8192,0.0,1.0));
}
}
l9_8172.y=l9_8188;
if (l9_8176)
{
bool l9_8193=l9_8178;
bool l9_8194;
if (l9_8193)
{
l9_8194=l9_8175.x==3;
}
else
{
l9_8194=l9_8193;
}
float l9_8195=l9_8172.x;
float l9_8196=l9_8177.x;
float l9_8197=l9_8177.z;
bool l9_8198=l9_8194;
float l9_8199=l9_8182;
float l9_8200=fast::clamp(l9_8195,l9_8196,l9_8197);
float l9_8201=step(abs(l9_8195-l9_8200),9.9999997e-06);
l9_8199*=(l9_8201+((1.0-float(l9_8198))*(1.0-l9_8201)));
l9_8195=l9_8200;
l9_8172.x=l9_8195;
l9_8182=l9_8199;
bool l9_8202=l9_8178;
bool l9_8203;
if (l9_8202)
{
l9_8203=l9_8175.y==3;
}
else
{
l9_8203=l9_8202;
}
float l9_8204=l9_8172.y;
float l9_8205=l9_8177.y;
float l9_8206=l9_8177.w;
bool l9_8207=l9_8203;
float l9_8208=l9_8182;
float l9_8209=fast::clamp(l9_8204,l9_8205,l9_8206);
float l9_8210=step(abs(l9_8204-l9_8209),9.9999997e-06);
l9_8208*=(l9_8210+((1.0-float(l9_8207))*(1.0-l9_8210)));
l9_8204=l9_8209;
l9_8172.y=l9_8204;
l9_8182=l9_8208;
}
float2 l9_8211=l9_8172;
bool l9_8212=l9_8173;
float3x3 l9_8213=l9_8174;
if (l9_8212)
{
l9_8211=float2((l9_8213*float3(l9_8211,1.0)).xy);
}
float2 l9_8214=l9_8211;
l9_8172=l9_8214;
float l9_8215=l9_8172.x;
int l9_8216=l9_8175.x;
bool l9_8217=l9_8181;
float l9_8218=l9_8182;
if ((l9_8216==0)||(l9_8216==3))
{
float l9_8219=l9_8215;
float l9_8220=0.0;
float l9_8221=1.0;
bool l9_8222=l9_8217;
float l9_8223=l9_8218;
float l9_8224=fast::clamp(l9_8219,l9_8220,l9_8221);
float l9_8225=step(abs(l9_8219-l9_8224),9.9999997e-06);
l9_8223*=(l9_8225+((1.0-float(l9_8222))*(1.0-l9_8225)));
l9_8219=l9_8224;
l9_8215=l9_8219;
l9_8218=l9_8223;
}
l9_8172.x=l9_8215;
l9_8182=l9_8218;
float l9_8226=l9_8172.y;
int l9_8227=l9_8175.y;
bool l9_8228=l9_8181;
float l9_8229=l9_8182;
if ((l9_8227==0)||(l9_8227==3))
{
float l9_8230=l9_8226;
float l9_8231=0.0;
float l9_8232=1.0;
bool l9_8233=l9_8228;
float l9_8234=l9_8229;
float l9_8235=fast::clamp(l9_8230,l9_8231,l9_8232);
float l9_8236=step(abs(l9_8230-l9_8235),9.9999997e-06);
l9_8234*=(l9_8236+((1.0-float(l9_8233))*(1.0-l9_8236)));
l9_8230=l9_8235;
l9_8226=l9_8230;
l9_8229=l9_8234;
}
l9_8172.y=l9_8226;
l9_8182=l9_8229;
float2 l9_8237=l9_8172;
int l9_8238=l9_8170;
int l9_8239=l9_8171;
float l9_8240=l9_8180;
float2 l9_8241=l9_8237;
int l9_8242=l9_8238;
int l9_8243=l9_8239;
float3 l9_8244=float3(0.0);
if (l9_8242==0)
{
l9_8244=float3(l9_8241,0.0);
}
else
{
if (l9_8242==1)
{
l9_8244=float3(l9_8241.x,(l9_8241.y*0.5)+(0.5-(float(l9_8243)*0.5)),0.0);
}
else
{
l9_8244=float3(l9_8241,float(l9_8243));
}
}
float3 l9_8245=l9_8244;
float3 l9_8246=l9_8245;
float4 l9_8247=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_8246.xy,bias(l9_8240));
float4 l9_8248=l9_8247;
if (l9_8178)
{
l9_8248=mix(l9_8179,l9_8248,float4(l9_8182));
}
float4 l9_8249=l9_8248;
l9_8163=l9_8249;
float l9_8250=0.0;
l9_8250=l9_8163.x;
float l9_8251=0.0;
l9_8251=step(l9_8250,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_8252=0.0;
l9_8252=step(l9_8250,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_8253=0.0;
l9_8253=l9_8251-l9_8252;
l9_8156=float4(l9_8253);
l9_8161=l9_8156;
}
else
{
l9_8161=l9_8157;
}
l9_8154=l9_8161;
float4 l9_8254=float4(0.0);
l9_8254=l9_7823*l9_8154;
float4 l9_8255=float4(0.0);
float4 l9_8256=(*sc_set0.UserUniforms).colorId02;
l9_8255=l9_8256;
float4 l9_8257=float4(0.0);
l9_8257=l9_8255*l9_8154;
float4 l9_8258=float4(0.0);
float4 l9_8259=l9_8254;
float4 l9_8260=l9_8257;
float4 l9_8261=l9_8259;
float4 l9_8262=l9_8260;
float3 l9_8263=l9_8261.xyz*l9_8261.w;
l9_8261=float4(l9_8263.x,l9_8263.y,l9_8263.z,l9_8261.w);
float4 l9_8264=l9_8261+(l9_8262*(1.0-l9_8261.w));
l9_8258=l9_8264;
float4 l9_8265=float4(0.0);
l9_8265=float4(l9_7817)*l9_8258;
float4 l9_8266=float4(0.0);
l9_8266=l9_8265+l9_8258;
l9_7807=l9_8266;
l9_7812=l9_7807;
}
else
{
float4 l9_8267=float4(0.0);
float l9_8268=0.0;
float4 l9_8269=float4(0.0);
float4 l9_8270=float4(0.0);
ssGlobals l9_8271=l9_7809;
float l9_8272=0.0;
float l9_8273=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_8272=l9_8273;
l9_8268=l9_8272;
float4 l9_8274;
if ((l9_8268*1.0)!=0.0)
{
float4 l9_8275=float4(0.0);
float4 l9_8276=(*sc_set0.UserUniforms).patternColorId02;
l9_8275=l9_8276;
float4 l9_8277=float4(0.0);
float l9_8278=0.0;
float4 l9_8279=float4(0.0);
float4 l9_8280=float4(0.0);
ssGlobals l9_8281=l9_8271;
float l9_8282=0.0;
float l9_8283=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_8282=l9_8283;
l9_8278=l9_8282;
float4 l9_8284;
if ((l9_8278*1.0)!=0.0)
{
float2 l9_8285=float2(0.0);
l9_8285=l9_8281.Surface_UVCoord0;
float2 l9_8286=float2(0.0);
float2 l9_8287=(*sc_set0.UserUniforms).patternScaleId02;
l9_8286=l9_8287;
float2 l9_8288=float2(0.0);
l9_8288=((l9_8285-(*sc_set0.UserUniforms).Port_Center_N282)*l9_8286)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_8289=float2(0.0);
float2 l9_8290=(*sc_set0.UserUniforms).patternOffsetId02;
l9_8289=l9_8290;
float2 l9_8291=float2(0.0);
l9_8291=l9_8288+l9_8289;
float l9_8292=0.0;
float l9_8293=(*sc_set0.UserUniforms).patternRotateId02;
l9_8292=l9_8293;
float2 l9_8294=float2(0.0);
float2 l9_8295=l9_8291;
float l9_8296=l9_8292;
float2 l9_8297=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_8298=sin(radians(l9_8296));
float l9_8299=cos(radians(l9_8296));
float2 l9_8300=l9_8295-l9_8297;
l9_8300=float2(dot(float2(l9_8299,l9_8298),l9_8300),dot(float2(-l9_8298,l9_8299),l9_8300))+l9_8297;
l9_8294=l9_8300;
float4 l9_8301=float4(0.0);
int l9_8302;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_8303=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8303=0;
}
else
{
l9_8303=in.varStereoViewID;
}
int l9_8304=l9_8303;
l9_8302=1-l9_8304;
}
else
{
int l9_8305=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8305=0;
}
else
{
l9_8305=in.varStereoViewID;
}
int l9_8306=l9_8305;
l9_8302=l9_8306;
}
int l9_8307=l9_8302;
int l9_8308=patternTextureId02Layout_tmp;
int l9_8309=l9_8307;
float2 l9_8310=l9_8294;
bool l9_8311=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_8312=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_8313=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_8314=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_8315=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_8316=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_8317=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_8318=0.0;
bool l9_8319=l9_8316&&(!l9_8314);
float l9_8320=1.0;
float l9_8321=l9_8310.x;
int l9_8322=l9_8313.x;
if (l9_8322==1)
{
l9_8321=fract(l9_8321);
}
else
{
if (l9_8322==2)
{
float l9_8323=fract(l9_8321);
float l9_8324=l9_8321-l9_8323;
float l9_8325=step(0.25,fract(l9_8324*0.5));
l9_8321=mix(l9_8323,1.0-l9_8323,fast::clamp(l9_8325,0.0,1.0));
}
}
l9_8310.x=l9_8321;
float l9_8326=l9_8310.y;
int l9_8327=l9_8313.y;
if (l9_8327==1)
{
l9_8326=fract(l9_8326);
}
else
{
if (l9_8327==2)
{
float l9_8328=fract(l9_8326);
float l9_8329=l9_8326-l9_8328;
float l9_8330=step(0.25,fract(l9_8329*0.5));
l9_8326=mix(l9_8328,1.0-l9_8328,fast::clamp(l9_8330,0.0,1.0));
}
}
l9_8310.y=l9_8326;
if (l9_8314)
{
bool l9_8331=l9_8316;
bool l9_8332;
if (l9_8331)
{
l9_8332=l9_8313.x==3;
}
else
{
l9_8332=l9_8331;
}
float l9_8333=l9_8310.x;
float l9_8334=l9_8315.x;
float l9_8335=l9_8315.z;
bool l9_8336=l9_8332;
float l9_8337=l9_8320;
float l9_8338=fast::clamp(l9_8333,l9_8334,l9_8335);
float l9_8339=step(abs(l9_8333-l9_8338),9.9999997e-06);
l9_8337*=(l9_8339+((1.0-float(l9_8336))*(1.0-l9_8339)));
l9_8333=l9_8338;
l9_8310.x=l9_8333;
l9_8320=l9_8337;
bool l9_8340=l9_8316;
bool l9_8341;
if (l9_8340)
{
l9_8341=l9_8313.y==3;
}
else
{
l9_8341=l9_8340;
}
float l9_8342=l9_8310.y;
float l9_8343=l9_8315.y;
float l9_8344=l9_8315.w;
bool l9_8345=l9_8341;
float l9_8346=l9_8320;
float l9_8347=fast::clamp(l9_8342,l9_8343,l9_8344);
float l9_8348=step(abs(l9_8342-l9_8347),9.9999997e-06);
l9_8346*=(l9_8348+((1.0-float(l9_8345))*(1.0-l9_8348)));
l9_8342=l9_8347;
l9_8310.y=l9_8342;
l9_8320=l9_8346;
}
float2 l9_8349=l9_8310;
bool l9_8350=l9_8311;
float3x3 l9_8351=l9_8312;
if (l9_8350)
{
l9_8349=float2((l9_8351*float3(l9_8349,1.0)).xy);
}
float2 l9_8352=l9_8349;
l9_8310=l9_8352;
float l9_8353=l9_8310.x;
int l9_8354=l9_8313.x;
bool l9_8355=l9_8319;
float l9_8356=l9_8320;
if ((l9_8354==0)||(l9_8354==3))
{
float l9_8357=l9_8353;
float l9_8358=0.0;
float l9_8359=1.0;
bool l9_8360=l9_8355;
float l9_8361=l9_8356;
float l9_8362=fast::clamp(l9_8357,l9_8358,l9_8359);
float l9_8363=step(abs(l9_8357-l9_8362),9.9999997e-06);
l9_8361*=(l9_8363+((1.0-float(l9_8360))*(1.0-l9_8363)));
l9_8357=l9_8362;
l9_8353=l9_8357;
l9_8356=l9_8361;
}
l9_8310.x=l9_8353;
l9_8320=l9_8356;
float l9_8364=l9_8310.y;
int l9_8365=l9_8313.y;
bool l9_8366=l9_8319;
float l9_8367=l9_8320;
if ((l9_8365==0)||(l9_8365==3))
{
float l9_8368=l9_8364;
float l9_8369=0.0;
float l9_8370=1.0;
bool l9_8371=l9_8366;
float l9_8372=l9_8367;
float l9_8373=fast::clamp(l9_8368,l9_8369,l9_8370);
float l9_8374=step(abs(l9_8368-l9_8373),9.9999997e-06);
l9_8372*=(l9_8374+((1.0-float(l9_8371))*(1.0-l9_8374)));
l9_8368=l9_8373;
l9_8364=l9_8368;
l9_8367=l9_8372;
}
l9_8310.y=l9_8364;
l9_8320=l9_8367;
float2 l9_8375=l9_8310;
int l9_8376=l9_8308;
int l9_8377=l9_8309;
float l9_8378=l9_8318;
float2 l9_8379=l9_8375;
int l9_8380=l9_8376;
int l9_8381=l9_8377;
float3 l9_8382=float3(0.0);
if (l9_8380==0)
{
l9_8382=float3(l9_8379,0.0);
}
else
{
if (l9_8380==1)
{
l9_8382=float3(l9_8379.x,(l9_8379.y*0.5)+(0.5-(float(l9_8381)*0.5)),0.0);
}
else
{
l9_8382=float3(l9_8379,float(l9_8381));
}
}
float3 l9_8383=l9_8382;
float3 l9_8384=l9_8383;
float4 l9_8385=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_8384.xy,bias(l9_8378));
float4 l9_8386=l9_8385;
if (l9_8316)
{
l9_8386=mix(l9_8317,l9_8386,float4(l9_8320));
}
float4 l9_8387=l9_8386;
l9_8301=l9_8387;
l9_8279=l9_8301;
l9_8284=l9_8279;
}
else
{
float2 l9_8388=float2(0.0);
l9_8388=l9_8281.Surface_UVCoord0;
float2 l9_8389=float2(0.0);
float2 l9_8390=(*sc_set0.UserUniforms).patternScaleId02;
l9_8389=l9_8390;
float2 l9_8391=float2(0.0);
l9_8391=((l9_8388-(*sc_set0.UserUniforms).Port_Center_N282)*l9_8389)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_8392=float2(0.0);
float2 l9_8393=(*sc_set0.UserUniforms).patternOffsetId02;
l9_8392=l9_8393;
float2 l9_8394=float2(0.0);
l9_8394=l9_8391+l9_8392;
float l9_8395=0.0;
float l9_8396=(*sc_set0.UserUniforms).patternRotateId02;
l9_8395=l9_8396;
float2 l9_8397=float2(0.0);
float2 l9_8398=l9_8394;
float l9_8399=l9_8395;
float2 l9_8400=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_8401=sin(radians(l9_8399));
float l9_8402=cos(radians(l9_8399));
float2 l9_8403=l9_8398-l9_8400;
l9_8403=float2(dot(float2(l9_8402,l9_8401),l9_8403),dot(float2(-l9_8401,l9_8402),l9_8403))+l9_8400;
l9_8397=l9_8403;
float4 l9_8404=float4(0.0);
int l9_8405;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_8406=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8406=0;
}
else
{
l9_8406=in.varStereoViewID;
}
int l9_8407=l9_8406;
l9_8405=1-l9_8407;
}
else
{
int l9_8408=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8408=0;
}
else
{
l9_8408=in.varStereoViewID;
}
int l9_8409=l9_8408;
l9_8405=l9_8409;
}
int l9_8410=l9_8405;
int l9_8411=patternTextureId02Layout_tmp;
int l9_8412=l9_8410;
float2 l9_8413=l9_8397;
bool l9_8414=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_8415=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_8416=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_8417=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_8418=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_8419=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_8420=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_8421=0.0;
bool l9_8422=l9_8419&&(!l9_8417);
float l9_8423=1.0;
float l9_8424=l9_8413.x;
int l9_8425=l9_8416.x;
if (l9_8425==1)
{
l9_8424=fract(l9_8424);
}
else
{
if (l9_8425==2)
{
float l9_8426=fract(l9_8424);
float l9_8427=l9_8424-l9_8426;
float l9_8428=step(0.25,fract(l9_8427*0.5));
l9_8424=mix(l9_8426,1.0-l9_8426,fast::clamp(l9_8428,0.0,1.0));
}
}
l9_8413.x=l9_8424;
float l9_8429=l9_8413.y;
int l9_8430=l9_8416.y;
if (l9_8430==1)
{
l9_8429=fract(l9_8429);
}
else
{
if (l9_8430==2)
{
float l9_8431=fract(l9_8429);
float l9_8432=l9_8429-l9_8431;
float l9_8433=step(0.25,fract(l9_8432*0.5));
l9_8429=mix(l9_8431,1.0-l9_8431,fast::clamp(l9_8433,0.0,1.0));
}
}
l9_8413.y=l9_8429;
if (l9_8417)
{
bool l9_8434=l9_8419;
bool l9_8435;
if (l9_8434)
{
l9_8435=l9_8416.x==3;
}
else
{
l9_8435=l9_8434;
}
float l9_8436=l9_8413.x;
float l9_8437=l9_8418.x;
float l9_8438=l9_8418.z;
bool l9_8439=l9_8435;
float l9_8440=l9_8423;
float l9_8441=fast::clamp(l9_8436,l9_8437,l9_8438);
float l9_8442=step(abs(l9_8436-l9_8441),9.9999997e-06);
l9_8440*=(l9_8442+((1.0-float(l9_8439))*(1.0-l9_8442)));
l9_8436=l9_8441;
l9_8413.x=l9_8436;
l9_8423=l9_8440;
bool l9_8443=l9_8419;
bool l9_8444;
if (l9_8443)
{
l9_8444=l9_8416.y==3;
}
else
{
l9_8444=l9_8443;
}
float l9_8445=l9_8413.y;
float l9_8446=l9_8418.y;
float l9_8447=l9_8418.w;
bool l9_8448=l9_8444;
float l9_8449=l9_8423;
float l9_8450=fast::clamp(l9_8445,l9_8446,l9_8447);
float l9_8451=step(abs(l9_8445-l9_8450),9.9999997e-06);
l9_8449*=(l9_8451+((1.0-float(l9_8448))*(1.0-l9_8451)));
l9_8445=l9_8450;
l9_8413.y=l9_8445;
l9_8423=l9_8449;
}
float2 l9_8452=l9_8413;
bool l9_8453=l9_8414;
float3x3 l9_8454=l9_8415;
if (l9_8453)
{
l9_8452=float2((l9_8454*float3(l9_8452,1.0)).xy);
}
float2 l9_8455=l9_8452;
l9_8413=l9_8455;
float l9_8456=l9_8413.x;
int l9_8457=l9_8416.x;
bool l9_8458=l9_8422;
float l9_8459=l9_8423;
if ((l9_8457==0)||(l9_8457==3))
{
float l9_8460=l9_8456;
float l9_8461=0.0;
float l9_8462=1.0;
bool l9_8463=l9_8458;
float l9_8464=l9_8459;
float l9_8465=fast::clamp(l9_8460,l9_8461,l9_8462);
float l9_8466=step(abs(l9_8460-l9_8465),9.9999997e-06);
l9_8464*=(l9_8466+((1.0-float(l9_8463))*(1.0-l9_8466)));
l9_8460=l9_8465;
l9_8456=l9_8460;
l9_8459=l9_8464;
}
l9_8413.x=l9_8456;
l9_8423=l9_8459;
float l9_8467=l9_8413.y;
int l9_8468=l9_8416.y;
bool l9_8469=l9_8422;
float l9_8470=l9_8423;
if ((l9_8468==0)||(l9_8468==3))
{
float l9_8471=l9_8467;
float l9_8472=0.0;
float l9_8473=1.0;
bool l9_8474=l9_8469;
float l9_8475=l9_8470;
float l9_8476=fast::clamp(l9_8471,l9_8472,l9_8473);
float l9_8477=step(abs(l9_8471-l9_8476),9.9999997e-06);
l9_8475*=(l9_8477+((1.0-float(l9_8474))*(1.0-l9_8477)));
l9_8471=l9_8476;
l9_8467=l9_8471;
l9_8470=l9_8475;
}
l9_8413.y=l9_8467;
l9_8423=l9_8470;
float2 l9_8478=l9_8413;
int l9_8479=l9_8411;
int l9_8480=l9_8412;
float l9_8481=l9_8421;
float2 l9_8482=l9_8478;
int l9_8483=l9_8479;
int l9_8484=l9_8480;
float3 l9_8485=float3(0.0);
if (l9_8483==0)
{
l9_8485=float3(l9_8482,0.0);
}
else
{
if (l9_8483==1)
{
l9_8485=float3(l9_8482.x,(l9_8482.y*0.5)+(0.5-(float(l9_8484)*0.5)),0.0);
}
else
{
l9_8485=float3(l9_8482,float(l9_8484));
}
}
float3 l9_8486=l9_8485;
float3 l9_8487=l9_8486;
float4 l9_8488=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_8487.xy,bias(l9_8481));
float4 l9_8489=l9_8488;
if (l9_8419)
{
l9_8489=mix(l9_8420,l9_8489,float4(l9_8423));
}
float4 l9_8490=l9_8489;
l9_8404=l9_8490;
float l9_8491=0.0;
float3 l9_8492=l9_8404.xyz;
float l9_8493=l9_8492.x;
l9_8491=l9_8493;
l9_8280=float4(l9_8491);
l9_8284=l9_8280;
}
l9_8277=l9_8284;
float4 l9_8494=float4(0.0);
l9_8494=l9_8275*l9_8277;
l9_8269=l9_8494;
l9_8274=l9_8269;
}
else
{
float4 l9_8495=float4(0.0);
float4 l9_8496=(*sc_set0.UserUniforms).colorId02;
l9_8495=l9_8496;
float4 l9_8497=float4(0.0);
float l9_8498=0.0;
float4 l9_8499=float4(0.0);
float4 l9_8500=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_8501=l9_8271;
float l9_8502=0.0;
float l9_8503=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_8502=l9_8503;
l9_8498=l9_8502;
float4 l9_8504;
if ((l9_8498*1.0)!=0.0)
{
float2 l9_8505=float2(0.0);
l9_8505=l9_8501.Surface_UVCoord0;
float4 l9_8506=float4(0.0);
int l9_8507;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_8508=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8508=0;
}
else
{
l9_8508=in.varStereoViewID;
}
int l9_8509=l9_8508;
l9_8507=1-l9_8509;
}
else
{
int l9_8510=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8510=0;
}
else
{
l9_8510=in.varStereoViewID;
}
int l9_8511=l9_8510;
l9_8507=l9_8511;
}
int l9_8512=l9_8507;
int l9_8513=greyMaskIdLayout_tmp;
int l9_8514=l9_8512;
float2 l9_8515=l9_8505;
bool l9_8516=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_8517=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_8518=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_8519=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_8520=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_8521=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_8522=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_8523=0.0;
bool l9_8524=l9_8521&&(!l9_8519);
float l9_8525=1.0;
float l9_8526=l9_8515.x;
int l9_8527=l9_8518.x;
if (l9_8527==1)
{
l9_8526=fract(l9_8526);
}
else
{
if (l9_8527==2)
{
float l9_8528=fract(l9_8526);
float l9_8529=l9_8526-l9_8528;
float l9_8530=step(0.25,fract(l9_8529*0.5));
l9_8526=mix(l9_8528,1.0-l9_8528,fast::clamp(l9_8530,0.0,1.0));
}
}
l9_8515.x=l9_8526;
float l9_8531=l9_8515.y;
int l9_8532=l9_8518.y;
if (l9_8532==1)
{
l9_8531=fract(l9_8531);
}
else
{
if (l9_8532==2)
{
float l9_8533=fract(l9_8531);
float l9_8534=l9_8531-l9_8533;
float l9_8535=step(0.25,fract(l9_8534*0.5));
l9_8531=mix(l9_8533,1.0-l9_8533,fast::clamp(l9_8535,0.0,1.0));
}
}
l9_8515.y=l9_8531;
if (l9_8519)
{
bool l9_8536=l9_8521;
bool l9_8537;
if (l9_8536)
{
l9_8537=l9_8518.x==3;
}
else
{
l9_8537=l9_8536;
}
float l9_8538=l9_8515.x;
float l9_8539=l9_8520.x;
float l9_8540=l9_8520.z;
bool l9_8541=l9_8537;
float l9_8542=l9_8525;
float l9_8543=fast::clamp(l9_8538,l9_8539,l9_8540);
float l9_8544=step(abs(l9_8538-l9_8543),9.9999997e-06);
l9_8542*=(l9_8544+((1.0-float(l9_8541))*(1.0-l9_8544)));
l9_8538=l9_8543;
l9_8515.x=l9_8538;
l9_8525=l9_8542;
bool l9_8545=l9_8521;
bool l9_8546;
if (l9_8545)
{
l9_8546=l9_8518.y==3;
}
else
{
l9_8546=l9_8545;
}
float l9_8547=l9_8515.y;
float l9_8548=l9_8520.y;
float l9_8549=l9_8520.w;
bool l9_8550=l9_8546;
float l9_8551=l9_8525;
float l9_8552=fast::clamp(l9_8547,l9_8548,l9_8549);
float l9_8553=step(abs(l9_8547-l9_8552),9.9999997e-06);
l9_8551*=(l9_8553+((1.0-float(l9_8550))*(1.0-l9_8553)));
l9_8547=l9_8552;
l9_8515.y=l9_8547;
l9_8525=l9_8551;
}
float2 l9_8554=l9_8515;
bool l9_8555=l9_8516;
float3x3 l9_8556=l9_8517;
if (l9_8555)
{
l9_8554=float2((l9_8556*float3(l9_8554,1.0)).xy);
}
float2 l9_8557=l9_8554;
l9_8515=l9_8557;
float l9_8558=l9_8515.x;
int l9_8559=l9_8518.x;
bool l9_8560=l9_8524;
float l9_8561=l9_8525;
if ((l9_8559==0)||(l9_8559==3))
{
float l9_8562=l9_8558;
float l9_8563=0.0;
float l9_8564=1.0;
bool l9_8565=l9_8560;
float l9_8566=l9_8561;
float l9_8567=fast::clamp(l9_8562,l9_8563,l9_8564);
float l9_8568=step(abs(l9_8562-l9_8567),9.9999997e-06);
l9_8566*=(l9_8568+((1.0-float(l9_8565))*(1.0-l9_8568)));
l9_8562=l9_8567;
l9_8558=l9_8562;
l9_8561=l9_8566;
}
l9_8515.x=l9_8558;
l9_8525=l9_8561;
float l9_8569=l9_8515.y;
int l9_8570=l9_8518.y;
bool l9_8571=l9_8524;
float l9_8572=l9_8525;
if ((l9_8570==0)||(l9_8570==3))
{
float l9_8573=l9_8569;
float l9_8574=0.0;
float l9_8575=1.0;
bool l9_8576=l9_8571;
float l9_8577=l9_8572;
float l9_8578=fast::clamp(l9_8573,l9_8574,l9_8575);
float l9_8579=step(abs(l9_8573-l9_8578),9.9999997e-06);
l9_8577*=(l9_8579+((1.0-float(l9_8576))*(1.0-l9_8579)));
l9_8573=l9_8578;
l9_8569=l9_8573;
l9_8572=l9_8577;
}
l9_8515.y=l9_8569;
l9_8525=l9_8572;
float2 l9_8580=l9_8515;
int l9_8581=l9_8513;
int l9_8582=l9_8514;
float l9_8583=l9_8523;
float2 l9_8584=l9_8580;
int l9_8585=l9_8581;
int l9_8586=l9_8582;
float3 l9_8587=float3(0.0);
if (l9_8585==0)
{
l9_8587=float3(l9_8584,0.0);
}
else
{
if (l9_8585==1)
{
l9_8587=float3(l9_8584.x,(l9_8584.y*0.5)+(0.5-(float(l9_8586)*0.5)),0.0);
}
else
{
l9_8587=float3(l9_8584,float(l9_8586));
}
}
float3 l9_8588=l9_8587;
float3 l9_8589=l9_8588;
float4 l9_8590=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_8589.xy,bias(l9_8583));
float4 l9_8591=l9_8590;
if (l9_8521)
{
l9_8591=mix(l9_8522,l9_8591,float4(l9_8525));
}
float4 l9_8592=l9_8591;
l9_8506=l9_8592;
float l9_8593=0.0;
l9_8593=l9_8506.x;
float l9_8594=0.0;
l9_8594=step(l9_8593,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_8595=0.0;
l9_8595=step(l9_8593,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_8596=0.0;
l9_8596=l9_8594-l9_8595;
l9_8499=float4(l9_8596);
l9_8504=l9_8499;
}
else
{
l9_8504=l9_8500;
}
l9_8497=l9_8504;
float4 l9_8597=float4(0.0);
l9_8597=l9_8495*l9_8497;
l9_8270=l9_8597;
l9_8274=l9_8270;
}
l9_8267=l9_8274;
float4 l9_8598=float4(0.0);
float l9_8599=0.0;
float4 l9_8600=float4(0.0);
float4 l9_8601=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_8602=l9_7809;
float l9_8603=0.0;
float l9_8604=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_8603=l9_8604;
l9_8599=l9_8603;
float4 l9_8605;
if ((l9_8599*1.0)!=0.0)
{
float2 l9_8606=float2(0.0);
l9_8606=l9_8602.Surface_UVCoord0;
float4 l9_8607=float4(0.0);
int l9_8608;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_8609=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8609=0;
}
else
{
l9_8609=in.varStereoViewID;
}
int l9_8610=l9_8609;
l9_8608=1-l9_8610;
}
else
{
int l9_8611=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8611=0;
}
else
{
l9_8611=in.varStereoViewID;
}
int l9_8612=l9_8611;
l9_8608=l9_8612;
}
int l9_8613=l9_8608;
int l9_8614=greyMaskIdLayout_tmp;
int l9_8615=l9_8613;
float2 l9_8616=l9_8606;
bool l9_8617=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_8618=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_8619=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_8620=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_8621=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_8622=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_8623=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_8624=0.0;
bool l9_8625=l9_8622&&(!l9_8620);
float l9_8626=1.0;
float l9_8627=l9_8616.x;
int l9_8628=l9_8619.x;
if (l9_8628==1)
{
l9_8627=fract(l9_8627);
}
else
{
if (l9_8628==2)
{
float l9_8629=fract(l9_8627);
float l9_8630=l9_8627-l9_8629;
float l9_8631=step(0.25,fract(l9_8630*0.5));
l9_8627=mix(l9_8629,1.0-l9_8629,fast::clamp(l9_8631,0.0,1.0));
}
}
l9_8616.x=l9_8627;
float l9_8632=l9_8616.y;
int l9_8633=l9_8619.y;
if (l9_8633==1)
{
l9_8632=fract(l9_8632);
}
else
{
if (l9_8633==2)
{
float l9_8634=fract(l9_8632);
float l9_8635=l9_8632-l9_8634;
float l9_8636=step(0.25,fract(l9_8635*0.5));
l9_8632=mix(l9_8634,1.0-l9_8634,fast::clamp(l9_8636,0.0,1.0));
}
}
l9_8616.y=l9_8632;
if (l9_8620)
{
bool l9_8637=l9_8622;
bool l9_8638;
if (l9_8637)
{
l9_8638=l9_8619.x==3;
}
else
{
l9_8638=l9_8637;
}
float l9_8639=l9_8616.x;
float l9_8640=l9_8621.x;
float l9_8641=l9_8621.z;
bool l9_8642=l9_8638;
float l9_8643=l9_8626;
float l9_8644=fast::clamp(l9_8639,l9_8640,l9_8641);
float l9_8645=step(abs(l9_8639-l9_8644),9.9999997e-06);
l9_8643*=(l9_8645+((1.0-float(l9_8642))*(1.0-l9_8645)));
l9_8639=l9_8644;
l9_8616.x=l9_8639;
l9_8626=l9_8643;
bool l9_8646=l9_8622;
bool l9_8647;
if (l9_8646)
{
l9_8647=l9_8619.y==3;
}
else
{
l9_8647=l9_8646;
}
float l9_8648=l9_8616.y;
float l9_8649=l9_8621.y;
float l9_8650=l9_8621.w;
bool l9_8651=l9_8647;
float l9_8652=l9_8626;
float l9_8653=fast::clamp(l9_8648,l9_8649,l9_8650);
float l9_8654=step(abs(l9_8648-l9_8653),9.9999997e-06);
l9_8652*=(l9_8654+((1.0-float(l9_8651))*(1.0-l9_8654)));
l9_8648=l9_8653;
l9_8616.y=l9_8648;
l9_8626=l9_8652;
}
float2 l9_8655=l9_8616;
bool l9_8656=l9_8617;
float3x3 l9_8657=l9_8618;
if (l9_8656)
{
l9_8655=float2((l9_8657*float3(l9_8655,1.0)).xy);
}
float2 l9_8658=l9_8655;
l9_8616=l9_8658;
float l9_8659=l9_8616.x;
int l9_8660=l9_8619.x;
bool l9_8661=l9_8625;
float l9_8662=l9_8626;
if ((l9_8660==0)||(l9_8660==3))
{
float l9_8663=l9_8659;
float l9_8664=0.0;
float l9_8665=1.0;
bool l9_8666=l9_8661;
float l9_8667=l9_8662;
float l9_8668=fast::clamp(l9_8663,l9_8664,l9_8665);
float l9_8669=step(abs(l9_8663-l9_8668),9.9999997e-06);
l9_8667*=(l9_8669+((1.0-float(l9_8666))*(1.0-l9_8669)));
l9_8663=l9_8668;
l9_8659=l9_8663;
l9_8662=l9_8667;
}
l9_8616.x=l9_8659;
l9_8626=l9_8662;
float l9_8670=l9_8616.y;
int l9_8671=l9_8619.y;
bool l9_8672=l9_8625;
float l9_8673=l9_8626;
if ((l9_8671==0)||(l9_8671==3))
{
float l9_8674=l9_8670;
float l9_8675=0.0;
float l9_8676=1.0;
bool l9_8677=l9_8672;
float l9_8678=l9_8673;
float l9_8679=fast::clamp(l9_8674,l9_8675,l9_8676);
float l9_8680=step(abs(l9_8674-l9_8679),9.9999997e-06);
l9_8678*=(l9_8680+((1.0-float(l9_8677))*(1.0-l9_8680)));
l9_8674=l9_8679;
l9_8670=l9_8674;
l9_8673=l9_8678;
}
l9_8616.y=l9_8670;
l9_8626=l9_8673;
float2 l9_8681=l9_8616;
int l9_8682=l9_8614;
int l9_8683=l9_8615;
float l9_8684=l9_8624;
float2 l9_8685=l9_8681;
int l9_8686=l9_8682;
int l9_8687=l9_8683;
float3 l9_8688=float3(0.0);
if (l9_8686==0)
{
l9_8688=float3(l9_8685,0.0);
}
else
{
if (l9_8686==1)
{
l9_8688=float3(l9_8685.x,(l9_8685.y*0.5)+(0.5-(float(l9_8687)*0.5)),0.0);
}
else
{
l9_8688=float3(l9_8685,float(l9_8687));
}
}
float3 l9_8689=l9_8688;
float3 l9_8690=l9_8689;
float4 l9_8691=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_8690.xy,bias(l9_8684));
float4 l9_8692=l9_8691;
if (l9_8622)
{
l9_8692=mix(l9_8623,l9_8692,float4(l9_8626));
}
float4 l9_8693=l9_8692;
l9_8607=l9_8693;
float l9_8694=0.0;
l9_8694=l9_8607.x;
float l9_8695=0.0;
l9_8695=step(l9_8694,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_8696=0.0;
l9_8696=step(l9_8694,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_8697=0.0;
l9_8697=l9_8695-l9_8696;
l9_8600=float4(l9_8697);
l9_8605=l9_8600;
}
else
{
l9_8605=l9_8601;
}
l9_8598=l9_8605;
float4 l9_8698=float4(0.0);
l9_8698=l9_8267*l9_8598;
float4 l9_8699=float4(0.0);
float4 l9_8700=(*sc_set0.UserUniforms).colorId02;
l9_8699=l9_8700;
float4 l9_8701=float4(0.0);
l9_8701=l9_8699*l9_8598;
float4 l9_8702=float4(0.0);
float4 l9_8703=l9_8698;
float4 l9_8704=l9_8701;
float4 l9_8705=l9_8703;
float4 l9_8706=l9_8704;
float3 l9_8707=l9_8705.xyz*l9_8705.w;
l9_8705=float4(l9_8707.x,l9_8707.y,l9_8707.z,l9_8705.w);
float4 l9_8708=l9_8705+(l9_8706*(1.0-l9_8705.w));
l9_8702=l9_8708;
l9_7808=l9_8702;
l9_7812=l9_7808;
}
l9_7805=l9_7812;
float l9_8709=0.0;
float l9_8710=(*sc_set0.UserUniforms).metallicId02;
l9_8709=l9_8710;
float l9_8711=0.0;
float l9_8712=(*sc_set0.UserUniforms).rougnessId02;
l9_8711=l9_8712;
float4 l9_8713=float4(0.0);
float3 l9_8714=l9_7805.xyz;
float l9_8715=(*sc_set0.UserUniforms).Port_Opacity_N313;
float3 l9_8716=(*sc_set0.UserUniforms).Port_Emissive_N313;
float l9_8717=l9_8709;
float l9_8718=l9_8711;
float3 l9_8719=(*sc_set0.UserUniforms).Port_AO_N313;
float3 l9_8720=(*sc_set0.UserUniforms).Port_SpecularAO_N313;
ssGlobals l9_8721=l9_7801;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_8721.BumpedNormal=l9_8721.VertexNormal_WorldSpace;
}
float l9_8722=l9_8715;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_8722<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_8723=gl_FragCoord;
float2 l9_8724=floor(mod(l9_8723.xy,float2(4.0)));
float l9_8725=(mod(dot(l9_8724,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_8722<l9_8725)
{
discard_fragment();
}
}
l9_8714=fast::max(l9_8714,float3(0.0));
float4 l9_8726;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_8726=float4(l9_8714,l9_8715);
}
else
{
l9_8717=fast::clamp(l9_8717,0.0,1.0);
l9_8718=fast::clamp(l9_8718,0.0,1.0);
float3 l9_8727=l9_8714;
float l9_8728=l9_8715;
float3 l9_8729=l9_8721.BumpedNormal;
float3 l9_8730=l9_8721.PositionWS;
float3 l9_8731=l9_8721.ViewDirWS;
float3 l9_8732=l9_8716;
float l9_8733=l9_8717;
float l9_8734=l9_8718;
float3 l9_8735=l9_8719;
float3 l9_8736=l9_8720;
l9_8726=ngsCalculateLighting(l9_8727,l9_8728,l9_8729,l9_8730,l9_8731,l9_8732,l9_8733,l9_8734,l9_8735,l9_8736,in.varStereoViewID,sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_RayTracingReflections,sc_set0.sc_RayTracingReflectionsSmpSC,sc_set0.sc_RayTracingGlobalIllumination,sc_set0.sc_RayTracingGlobalIlluminationSmpSC,sc_set0.sc_RayTracingShadows,sc_set0.sc_RayTracingShadowsSmpSC,gl_FragCoord,(*sc_set0.UserUniforms),in.varShadowTex,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,out.sc_FragData0,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
l9_8726=fast::max(l9_8726,float4(0.0));
l9_8713=l9_8726;
l9_7799=l9_8713;
l9_7804=l9_7799;
}
else
{
float4 l9_8737=float4(0.0);
float l9_8738=0.0;
float4 l9_8739=float4(0.0);
float4 l9_8740=float4(0.0);
ssGlobals l9_8741=l9_7801;
float l9_8742=0.0;
float l9_8743=float((*sc_set0.UserUniforms).rimOnOffId02!=0);
l9_8742=l9_8743;
l9_8738=l9_8742;
float4 l9_8744;
if ((l9_8738*1.0)!=0.0)
{
float l9_8745=0.0;
float l9_8746=(*sc_set0.UserUniforms).rimExpId02;
l9_8745=l9_8746;
float l9_8747=0.0;
float l9_8748=(*sc_set0.UserUniforms).rimIntId02;
l9_8747=l9_8748;
float l9_8749=0.0;
float l9_8750=l9_8745;
float l9_8751=l9_8747;
ssGlobals l9_8752=l9_8741;
float l9_8753=abs(dot(-l9_8752.ViewDirWS,l9_8752.VertexNormal_WorldSpace));
float l9_8754=1.0-pow(1.0-l9_8753,l9_8750);
l9_8754=fast::max(l9_8754,0.0);
l9_8754*=l9_8751;
l9_8749=l9_8754;
float4 l9_8755=float4(0.0);
float l9_8756=0.0;
float4 l9_8757=float4(0.0);
float4 l9_8758=float4(0.0);
ssGlobals l9_8759=l9_8741;
float l9_8760=0.0;
float l9_8761=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_8760=l9_8761;
l9_8756=l9_8760;
float4 l9_8762;
if ((l9_8756*1.0)!=0.0)
{
float4 l9_8763=float4(0.0);
float4 l9_8764=(*sc_set0.UserUniforms).patternColorId02;
l9_8763=l9_8764;
float4 l9_8765=float4(0.0);
float l9_8766=0.0;
float4 l9_8767=float4(0.0);
float4 l9_8768=float4(0.0);
ssGlobals l9_8769=l9_8759;
float l9_8770=0.0;
float l9_8771=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_8770=l9_8771;
l9_8766=l9_8770;
float4 l9_8772;
if ((l9_8766*1.0)!=0.0)
{
float2 l9_8773=float2(0.0);
l9_8773=l9_8769.Surface_UVCoord0;
float2 l9_8774=float2(0.0);
float2 l9_8775=(*sc_set0.UserUniforms).patternScaleId02;
l9_8774=l9_8775;
float2 l9_8776=float2(0.0);
l9_8776=((l9_8773-(*sc_set0.UserUniforms).Port_Center_N282)*l9_8774)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_8777=float2(0.0);
float2 l9_8778=(*sc_set0.UserUniforms).patternOffsetId02;
l9_8777=l9_8778;
float2 l9_8779=float2(0.0);
l9_8779=l9_8776+l9_8777;
float l9_8780=0.0;
float l9_8781=(*sc_set0.UserUniforms).patternRotateId02;
l9_8780=l9_8781;
float2 l9_8782=float2(0.0);
float2 l9_8783=l9_8779;
float l9_8784=l9_8780;
float2 l9_8785=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_8786=sin(radians(l9_8784));
float l9_8787=cos(radians(l9_8784));
float2 l9_8788=l9_8783-l9_8785;
l9_8788=float2(dot(float2(l9_8787,l9_8786),l9_8788),dot(float2(-l9_8786,l9_8787),l9_8788))+l9_8785;
l9_8782=l9_8788;
float4 l9_8789=float4(0.0);
int l9_8790;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_8791=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8791=0;
}
else
{
l9_8791=in.varStereoViewID;
}
int l9_8792=l9_8791;
l9_8790=1-l9_8792;
}
else
{
int l9_8793=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8793=0;
}
else
{
l9_8793=in.varStereoViewID;
}
int l9_8794=l9_8793;
l9_8790=l9_8794;
}
int l9_8795=l9_8790;
int l9_8796=patternTextureId02Layout_tmp;
int l9_8797=l9_8795;
float2 l9_8798=l9_8782;
bool l9_8799=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_8800=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_8801=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_8802=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_8803=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_8804=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_8805=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_8806=0.0;
bool l9_8807=l9_8804&&(!l9_8802);
float l9_8808=1.0;
float l9_8809=l9_8798.x;
int l9_8810=l9_8801.x;
if (l9_8810==1)
{
l9_8809=fract(l9_8809);
}
else
{
if (l9_8810==2)
{
float l9_8811=fract(l9_8809);
float l9_8812=l9_8809-l9_8811;
float l9_8813=step(0.25,fract(l9_8812*0.5));
l9_8809=mix(l9_8811,1.0-l9_8811,fast::clamp(l9_8813,0.0,1.0));
}
}
l9_8798.x=l9_8809;
float l9_8814=l9_8798.y;
int l9_8815=l9_8801.y;
if (l9_8815==1)
{
l9_8814=fract(l9_8814);
}
else
{
if (l9_8815==2)
{
float l9_8816=fract(l9_8814);
float l9_8817=l9_8814-l9_8816;
float l9_8818=step(0.25,fract(l9_8817*0.5));
l9_8814=mix(l9_8816,1.0-l9_8816,fast::clamp(l9_8818,0.0,1.0));
}
}
l9_8798.y=l9_8814;
if (l9_8802)
{
bool l9_8819=l9_8804;
bool l9_8820;
if (l9_8819)
{
l9_8820=l9_8801.x==3;
}
else
{
l9_8820=l9_8819;
}
float l9_8821=l9_8798.x;
float l9_8822=l9_8803.x;
float l9_8823=l9_8803.z;
bool l9_8824=l9_8820;
float l9_8825=l9_8808;
float l9_8826=fast::clamp(l9_8821,l9_8822,l9_8823);
float l9_8827=step(abs(l9_8821-l9_8826),9.9999997e-06);
l9_8825*=(l9_8827+((1.0-float(l9_8824))*(1.0-l9_8827)));
l9_8821=l9_8826;
l9_8798.x=l9_8821;
l9_8808=l9_8825;
bool l9_8828=l9_8804;
bool l9_8829;
if (l9_8828)
{
l9_8829=l9_8801.y==3;
}
else
{
l9_8829=l9_8828;
}
float l9_8830=l9_8798.y;
float l9_8831=l9_8803.y;
float l9_8832=l9_8803.w;
bool l9_8833=l9_8829;
float l9_8834=l9_8808;
float l9_8835=fast::clamp(l9_8830,l9_8831,l9_8832);
float l9_8836=step(abs(l9_8830-l9_8835),9.9999997e-06);
l9_8834*=(l9_8836+((1.0-float(l9_8833))*(1.0-l9_8836)));
l9_8830=l9_8835;
l9_8798.y=l9_8830;
l9_8808=l9_8834;
}
float2 l9_8837=l9_8798;
bool l9_8838=l9_8799;
float3x3 l9_8839=l9_8800;
if (l9_8838)
{
l9_8837=float2((l9_8839*float3(l9_8837,1.0)).xy);
}
float2 l9_8840=l9_8837;
l9_8798=l9_8840;
float l9_8841=l9_8798.x;
int l9_8842=l9_8801.x;
bool l9_8843=l9_8807;
float l9_8844=l9_8808;
if ((l9_8842==0)||(l9_8842==3))
{
float l9_8845=l9_8841;
float l9_8846=0.0;
float l9_8847=1.0;
bool l9_8848=l9_8843;
float l9_8849=l9_8844;
float l9_8850=fast::clamp(l9_8845,l9_8846,l9_8847);
float l9_8851=step(abs(l9_8845-l9_8850),9.9999997e-06);
l9_8849*=(l9_8851+((1.0-float(l9_8848))*(1.0-l9_8851)));
l9_8845=l9_8850;
l9_8841=l9_8845;
l9_8844=l9_8849;
}
l9_8798.x=l9_8841;
l9_8808=l9_8844;
float l9_8852=l9_8798.y;
int l9_8853=l9_8801.y;
bool l9_8854=l9_8807;
float l9_8855=l9_8808;
if ((l9_8853==0)||(l9_8853==3))
{
float l9_8856=l9_8852;
float l9_8857=0.0;
float l9_8858=1.0;
bool l9_8859=l9_8854;
float l9_8860=l9_8855;
float l9_8861=fast::clamp(l9_8856,l9_8857,l9_8858);
float l9_8862=step(abs(l9_8856-l9_8861),9.9999997e-06);
l9_8860*=(l9_8862+((1.0-float(l9_8859))*(1.0-l9_8862)));
l9_8856=l9_8861;
l9_8852=l9_8856;
l9_8855=l9_8860;
}
l9_8798.y=l9_8852;
l9_8808=l9_8855;
float2 l9_8863=l9_8798;
int l9_8864=l9_8796;
int l9_8865=l9_8797;
float l9_8866=l9_8806;
float2 l9_8867=l9_8863;
int l9_8868=l9_8864;
int l9_8869=l9_8865;
float3 l9_8870=float3(0.0);
if (l9_8868==0)
{
l9_8870=float3(l9_8867,0.0);
}
else
{
if (l9_8868==1)
{
l9_8870=float3(l9_8867.x,(l9_8867.y*0.5)+(0.5-(float(l9_8869)*0.5)),0.0);
}
else
{
l9_8870=float3(l9_8867,float(l9_8869));
}
}
float3 l9_8871=l9_8870;
float3 l9_8872=l9_8871;
float4 l9_8873=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_8872.xy,bias(l9_8866));
float4 l9_8874=l9_8873;
if (l9_8804)
{
l9_8874=mix(l9_8805,l9_8874,float4(l9_8808));
}
float4 l9_8875=l9_8874;
l9_8789=l9_8875;
l9_8767=l9_8789;
l9_8772=l9_8767;
}
else
{
float2 l9_8876=float2(0.0);
l9_8876=l9_8769.Surface_UVCoord0;
float2 l9_8877=float2(0.0);
float2 l9_8878=(*sc_set0.UserUniforms).patternScaleId02;
l9_8877=l9_8878;
float2 l9_8879=float2(0.0);
l9_8879=((l9_8876-(*sc_set0.UserUniforms).Port_Center_N282)*l9_8877)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_8880=float2(0.0);
float2 l9_8881=(*sc_set0.UserUniforms).patternOffsetId02;
l9_8880=l9_8881;
float2 l9_8882=float2(0.0);
l9_8882=l9_8879+l9_8880;
float l9_8883=0.0;
float l9_8884=(*sc_set0.UserUniforms).patternRotateId02;
l9_8883=l9_8884;
float2 l9_8885=float2(0.0);
float2 l9_8886=l9_8882;
float l9_8887=l9_8883;
float2 l9_8888=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_8889=sin(radians(l9_8887));
float l9_8890=cos(radians(l9_8887));
float2 l9_8891=l9_8886-l9_8888;
l9_8891=float2(dot(float2(l9_8890,l9_8889),l9_8891),dot(float2(-l9_8889,l9_8890),l9_8891))+l9_8888;
l9_8885=l9_8891;
float4 l9_8892=float4(0.0);
int l9_8893;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_8894=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8894=0;
}
else
{
l9_8894=in.varStereoViewID;
}
int l9_8895=l9_8894;
l9_8893=1-l9_8895;
}
else
{
int l9_8896=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8896=0;
}
else
{
l9_8896=in.varStereoViewID;
}
int l9_8897=l9_8896;
l9_8893=l9_8897;
}
int l9_8898=l9_8893;
int l9_8899=patternTextureId02Layout_tmp;
int l9_8900=l9_8898;
float2 l9_8901=l9_8885;
bool l9_8902=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_8903=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_8904=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_8905=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_8906=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_8907=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_8908=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_8909=0.0;
bool l9_8910=l9_8907&&(!l9_8905);
float l9_8911=1.0;
float l9_8912=l9_8901.x;
int l9_8913=l9_8904.x;
if (l9_8913==1)
{
l9_8912=fract(l9_8912);
}
else
{
if (l9_8913==2)
{
float l9_8914=fract(l9_8912);
float l9_8915=l9_8912-l9_8914;
float l9_8916=step(0.25,fract(l9_8915*0.5));
l9_8912=mix(l9_8914,1.0-l9_8914,fast::clamp(l9_8916,0.0,1.0));
}
}
l9_8901.x=l9_8912;
float l9_8917=l9_8901.y;
int l9_8918=l9_8904.y;
if (l9_8918==1)
{
l9_8917=fract(l9_8917);
}
else
{
if (l9_8918==2)
{
float l9_8919=fract(l9_8917);
float l9_8920=l9_8917-l9_8919;
float l9_8921=step(0.25,fract(l9_8920*0.5));
l9_8917=mix(l9_8919,1.0-l9_8919,fast::clamp(l9_8921,0.0,1.0));
}
}
l9_8901.y=l9_8917;
if (l9_8905)
{
bool l9_8922=l9_8907;
bool l9_8923;
if (l9_8922)
{
l9_8923=l9_8904.x==3;
}
else
{
l9_8923=l9_8922;
}
float l9_8924=l9_8901.x;
float l9_8925=l9_8906.x;
float l9_8926=l9_8906.z;
bool l9_8927=l9_8923;
float l9_8928=l9_8911;
float l9_8929=fast::clamp(l9_8924,l9_8925,l9_8926);
float l9_8930=step(abs(l9_8924-l9_8929),9.9999997e-06);
l9_8928*=(l9_8930+((1.0-float(l9_8927))*(1.0-l9_8930)));
l9_8924=l9_8929;
l9_8901.x=l9_8924;
l9_8911=l9_8928;
bool l9_8931=l9_8907;
bool l9_8932;
if (l9_8931)
{
l9_8932=l9_8904.y==3;
}
else
{
l9_8932=l9_8931;
}
float l9_8933=l9_8901.y;
float l9_8934=l9_8906.y;
float l9_8935=l9_8906.w;
bool l9_8936=l9_8932;
float l9_8937=l9_8911;
float l9_8938=fast::clamp(l9_8933,l9_8934,l9_8935);
float l9_8939=step(abs(l9_8933-l9_8938),9.9999997e-06);
l9_8937*=(l9_8939+((1.0-float(l9_8936))*(1.0-l9_8939)));
l9_8933=l9_8938;
l9_8901.y=l9_8933;
l9_8911=l9_8937;
}
float2 l9_8940=l9_8901;
bool l9_8941=l9_8902;
float3x3 l9_8942=l9_8903;
if (l9_8941)
{
l9_8940=float2((l9_8942*float3(l9_8940,1.0)).xy);
}
float2 l9_8943=l9_8940;
l9_8901=l9_8943;
float l9_8944=l9_8901.x;
int l9_8945=l9_8904.x;
bool l9_8946=l9_8910;
float l9_8947=l9_8911;
if ((l9_8945==0)||(l9_8945==3))
{
float l9_8948=l9_8944;
float l9_8949=0.0;
float l9_8950=1.0;
bool l9_8951=l9_8946;
float l9_8952=l9_8947;
float l9_8953=fast::clamp(l9_8948,l9_8949,l9_8950);
float l9_8954=step(abs(l9_8948-l9_8953),9.9999997e-06);
l9_8952*=(l9_8954+((1.0-float(l9_8951))*(1.0-l9_8954)));
l9_8948=l9_8953;
l9_8944=l9_8948;
l9_8947=l9_8952;
}
l9_8901.x=l9_8944;
l9_8911=l9_8947;
float l9_8955=l9_8901.y;
int l9_8956=l9_8904.y;
bool l9_8957=l9_8910;
float l9_8958=l9_8911;
if ((l9_8956==0)||(l9_8956==3))
{
float l9_8959=l9_8955;
float l9_8960=0.0;
float l9_8961=1.0;
bool l9_8962=l9_8957;
float l9_8963=l9_8958;
float l9_8964=fast::clamp(l9_8959,l9_8960,l9_8961);
float l9_8965=step(abs(l9_8959-l9_8964),9.9999997e-06);
l9_8963*=(l9_8965+((1.0-float(l9_8962))*(1.0-l9_8965)));
l9_8959=l9_8964;
l9_8955=l9_8959;
l9_8958=l9_8963;
}
l9_8901.y=l9_8955;
l9_8911=l9_8958;
float2 l9_8966=l9_8901;
int l9_8967=l9_8899;
int l9_8968=l9_8900;
float l9_8969=l9_8909;
float2 l9_8970=l9_8966;
int l9_8971=l9_8967;
int l9_8972=l9_8968;
float3 l9_8973=float3(0.0);
if (l9_8971==0)
{
l9_8973=float3(l9_8970,0.0);
}
else
{
if (l9_8971==1)
{
l9_8973=float3(l9_8970.x,(l9_8970.y*0.5)+(0.5-(float(l9_8972)*0.5)),0.0);
}
else
{
l9_8973=float3(l9_8970,float(l9_8972));
}
}
float3 l9_8974=l9_8973;
float3 l9_8975=l9_8974;
float4 l9_8976=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_8975.xy,bias(l9_8969));
float4 l9_8977=l9_8976;
if (l9_8907)
{
l9_8977=mix(l9_8908,l9_8977,float4(l9_8911));
}
float4 l9_8978=l9_8977;
l9_8892=l9_8978;
float l9_8979=0.0;
float3 l9_8980=l9_8892.xyz;
float l9_8981=l9_8980.x;
l9_8979=l9_8981;
l9_8768=float4(l9_8979);
l9_8772=l9_8768;
}
l9_8765=l9_8772;
float4 l9_8982=float4(0.0);
l9_8982=l9_8763*l9_8765;
l9_8757=l9_8982;
l9_8762=l9_8757;
}
else
{
float4 l9_8983=float4(0.0);
float4 l9_8984=(*sc_set0.UserUniforms).colorId02;
l9_8983=l9_8984;
float4 l9_8985=float4(0.0);
float l9_8986=0.0;
float4 l9_8987=float4(0.0);
float4 l9_8988=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_8989=l9_8759;
float l9_8990=0.0;
float l9_8991=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_8990=l9_8991;
l9_8986=l9_8990;
float4 l9_8992;
if ((l9_8986*1.0)!=0.0)
{
float2 l9_8993=float2(0.0);
l9_8993=l9_8989.Surface_UVCoord0;
float4 l9_8994=float4(0.0);
int l9_8995;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_8996=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8996=0;
}
else
{
l9_8996=in.varStereoViewID;
}
int l9_8997=l9_8996;
l9_8995=1-l9_8997;
}
else
{
int l9_8998=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8998=0;
}
else
{
l9_8998=in.varStereoViewID;
}
int l9_8999=l9_8998;
l9_8995=l9_8999;
}
int l9_9000=l9_8995;
int l9_9001=greyMaskIdLayout_tmp;
int l9_9002=l9_9000;
float2 l9_9003=l9_8993;
bool l9_9004=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_9005=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_9006=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_9007=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_9008=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_9009=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_9010=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_9011=0.0;
bool l9_9012=l9_9009&&(!l9_9007);
float l9_9013=1.0;
float l9_9014=l9_9003.x;
int l9_9015=l9_9006.x;
if (l9_9015==1)
{
l9_9014=fract(l9_9014);
}
else
{
if (l9_9015==2)
{
float l9_9016=fract(l9_9014);
float l9_9017=l9_9014-l9_9016;
float l9_9018=step(0.25,fract(l9_9017*0.5));
l9_9014=mix(l9_9016,1.0-l9_9016,fast::clamp(l9_9018,0.0,1.0));
}
}
l9_9003.x=l9_9014;
float l9_9019=l9_9003.y;
int l9_9020=l9_9006.y;
if (l9_9020==1)
{
l9_9019=fract(l9_9019);
}
else
{
if (l9_9020==2)
{
float l9_9021=fract(l9_9019);
float l9_9022=l9_9019-l9_9021;
float l9_9023=step(0.25,fract(l9_9022*0.5));
l9_9019=mix(l9_9021,1.0-l9_9021,fast::clamp(l9_9023,0.0,1.0));
}
}
l9_9003.y=l9_9019;
if (l9_9007)
{
bool l9_9024=l9_9009;
bool l9_9025;
if (l9_9024)
{
l9_9025=l9_9006.x==3;
}
else
{
l9_9025=l9_9024;
}
float l9_9026=l9_9003.x;
float l9_9027=l9_9008.x;
float l9_9028=l9_9008.z;
bool l9_9029=l9_9025;
float l9_9030=l9_9013;
float l9_9031=fast::clamp(l9_9026,l9_9027,l9_9028);
float l9_9032=step(abs(l9_9026-l9_9031),9.9999997e-06);
l9_9030*=(l9_9032+((1.0-float(l9_9029))*(1.0-l9_9032)));
l9_9026=l9_9031;
l9_9003.x=l9_9026;
l9_9013=l9_9030;
bool l9_9033=l9_9009;
bool l9_9034;
if (l9_9033)
{
l9_9034=l9_9006.y==3;
}
else
{
l9_9034=l9_9033;
}
float l9_9035=l9_9003.y;
float l9_9036=l9_9008.y;
float l9_9037=l9_9008.w;
bool l9_9038=l9_9034;
float l9_9039=l9_9013;
float l9_9040=fast::clamp(l9_9035,l9_9036,l9_9037);
float l9_9041=step(abs(l9_9035-l9_9040),9.9999997e-06);
l9_9039*=(l9_9041+((1.0-float(l9_9038))*(1.0-l9_9041)));
l9_9035=l9_9040;
l9_9003.y=l9_9035;
l9_9013=l9_9039;
}
float2 l9_9042=l9_9003;
bool l9_9043=l9_9004;
float3x3 l9_9044=l9_9005;
if (l9_9043)
{
l9_9042=float2((l9_9044*float3(l9_9042,1.0)).xy);
}
float2 l9_9045=l9_9042;
l9_9003=l9_9045;
float l9_9046=l9_9003.x;
int l9_9047=l9_9006.x;
bool l9_9048=l9_9012;
float l9_9049=l9_9013;
if ((l9_9047==0)||(l9_9047==3))
{
float l9_9050=l9_9046;
float l9_9051=0.0;
float l9_9052=1.0;
bool l9_9053=l9_9048;
float l9_9054=l9_9049;
float l9_9055=fast::clamp(l9_9050,l9_9051,l9_9052);
float l9_9056=step(abs(l9_9050-l9_9055),9.9999997e-06);
l9_9054*=(l9_9056+((1.0-float(l9_9053))*(1.0-l9_9056)));
l9_9050=l9_9055;
l9_9046=l9_9050;
l9_9049=l9_9054;
}
l9_9003.x=l9_9046;
l9_9013=l9_9049;
float l9_9057=l9_9003.y;
int l9_9058=l9_9006.y;
bool l9_9059=l9_9012;
float l9_9060=l9_9013;
if ((l9_9058==0)||(l9_9058==3))
{
float l9_9061=l9_9057;
float l9_9062=0.0;
float l9_9063=1.0;
bool l9_9064=l9_9059;
float l9_9065=l9_9060;
float l9_9066=fast::clamp(l9_9061,l9_9062,l9_9063);
float l9_9067=step(abs(l9_9061-l9_9066),9.9999997e-06);
l9_9065*=(l9_9067+((1.0-float(l9_9064))*(1.0-l9_9067)));
l9_9061=l9_9066;
l9_9057=l9_9061;
l9_9060=l9_9065;
}
l9_9003.y=l9_9057;
l9_9013=l9_9060;
float2 l9_9068=l9_9003;
int l9_9069=l9_9001;
int l9_9070=l9_9002;
float l9_9071=l9_9011;
float2 l9_9072=l9_9068;
int l9_9073=l9_9069;
int l9_9074=l9_9070;
float3 l9_9075=float3(0.0);
if (l9_9073==0)
{
l9_9075=float3(l9_9072,0.0);
}
else
{
if (l9_9073==1)
{
l9_9075=float3(l9_9072.x,(l9_9072.y*0.5)+(0.5-(float(l9_9074)*0.5)),0.0);
}
else
{
l9_9075=float3(l9_9072,float(l9_9074));
}
}
float3 l9_9076=l9_9075;
float3 l9_9077=l9_9076;
float4 l9_9078=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_9077.xy,bias(l9_9071));
float4 l9_9079=l9_9078;
if (l9_9009)
{
l9_9079=mix(l9_9010,l9_9079,float4(l9_9013));
}
float4 l9_9080=l9_9079;
l9_8994=l9_9080;
float l9_9081=0.0;
l9_9081=l9_8994.x;
float l9_9082=0.0;
l9_9082=step(l9_9081,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_9083=0.0;
l9_9083=step(l9_9081,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_9084=0.0;
l9_9084=l9_9082-l9_9083;
l9_8987=float4(l9_9084);
l9_8992=l9_8987;
}
else
{
l9_8992=l9_8988;
}
l9_8985=l9_8992;
float4 l9_9085=float4(0.0);
l9_9085=l9_8983*l9_8985;
l9_8758=l9_9085;
l9_8762=l9_8758;
}
l9_8755=l9_8762;
float4 l9_9086=float4(0.0);
float l9_9087=0.0;
float4 l9_9088=float4(0.0);
float4 l9_9089=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_9090=l9_8741;
float l9_9091=0.0;
float l9_9092=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_9091=l9_9092;
l9_9087=l9_9091;
float4 l9_9093;
if ((l9_9087*1.0)!=0.0)
{
float2 l9_9094=float2(0.0);
l9_9094=l9_9090.Surface_UVCoord0;
float4 l9_9095=float4(0.0);
int l9_9096;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_9097=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9097=0;
}
else
{
l9_9097=in.varStereoViewID;
}
int l9_9098=l9_9097;
l9_9096=1-l9_9098;
}
else
{
int l9_9099=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9099=0;
}
else
{
l9_9099=in.varStereoViewID;
}
int l9_9100=l9_9099;
l9_9096=l9_9100;
}
int l9_9101=l9_9096;
int l9_9102=greyMaskIdLayout_tmp;
int l9_9103=l9_9101;
float2 l9_9104=l9_9094;
bool l9_9105=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_9106=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_9107=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_9108=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_9109=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_9110=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_9111=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_9112=0.0;
bool l9_9113=l9_9110&&(!l9_9108);
float l9_9114=1.0;
float l9_9115=l9_9104.x;
int l9_9116=l9_9107.x;
if (l9_9116==1)
{
l9_9115=fract(l9_9115);
}
else
{
if (l9_9116==2)
{
float l9_9117=fract(l9_9115);
float l9_9118=l9_9115-l9_9117;
float l9_9119=step(0.25,fract(l9_9118*0.5));
l9_9115=mix(l9_9117,1.0-l9_9117,fast::clamp(l9_9119,0.0,1.0));
}
}
l9_9104.x=l9_9115;
float l9_9120=l9_9104.y;
int l9_9121=l9_9107.y;
if (l9_9121==1)
{
l9_9120=fract(l9_9120);
}
else
{
if (l9_9121==2)
{
float l9_9122=fract(l9_9120);
float l9_9123=l9_9120-l9_9122;
float l9_9124=step(0.25,fract(l9_9123*0.5));
l9_9120=mix(l9_9122,1.0-l9_9122,fast::clamp(l9_9124,0.0,1.0));
}
}
l9_9104.y=l9_9120;
if (l9_9108)
{
bool l9_9125=l9_9110;
bool l9_9126;
if (l9_9125)
{
l9_9126=l9_9107.x==3;
}
else
{
l9_9126=l9_9125;
}
float l9_9127=l9_9104.x;
float l9_9128=l9_9109.x;
float l9_9129=l9_9109.z;
bool l9_9130=l9_9126;
float l9_9131=l9_9114;
float l9_9132=fast::clamp(l9_9127,l9_9128,l9_9129);
float l9_9133=step(abs(l9_9127-l9_9132),9.9999997e-06);
l9_9131*=(l9_9133+((1.0-float(l9_9130))*(1.0-l9_9133)));
l9_9127=l9_9132;
l9_9104.x=l9_9127;
l9_9114=l9_9131;
bool l9_9134=l9_9110;
bool l9_9135;
if (l9_9134)
{
l9_9135=l9_9107.y==3;
}
else
{
l9_9135=l9_9134;
}
float l9_9136=l9_9104.y;
float l9_9137=l9_9109.y;
float l9_9138=l9_9109.w;
bool l9_9139=l9_9135;
float l9_9140=l9_9114;
float l9_9141=fast::clamp(l9_9136,l9_9137,l9_9138);
float l9_9142=step(abs(l9_9136-l9_9141),9.9999997e-06);
l9_9140*=(l9_9142+((1.0-float(l9_9139))*(1.0-l9_9142)));
l9_9136=l9_9141;
l9_9104.y=l9_9136;
l9_9114=l9_9140;
}
float2 l9_9143=l9_9104;
bool l9_9144=l9_9105;
float3x3 l9_9145=l9_9106;
if (l9_9144)
{
l9_9143=float2((l9_9145*float3(l9_9143,1.0)).xy);
}
float2 l9_9146=l9_9143;
l9_9104=l9_9146;
float l9_9147=l9_9104.x;
int l9_9148=l9_9107.x;
bool l9_9149=l9_9113;
float l9_9150=l9_9114;
if ((l9_9148==0)||(l9_9148==3))
{
float l9_9151=l9_9147;
float l9_9152=0.0;
float l9_9153=1.0;
bool l9_9154=l9_9149;
float l9_9155=l9_9150;
float l9_9156=fast::clamp(l9_9151,l9_9152,l9_9153);
float l9_9157=step(abs(l9_9151-l9_9156),9.9999997e-06);
l9_9155*=(l9_9157+((1.0-float(l9_9154))*(1.0-l9_9157)));
l9_9151=l9_9156;
l9_9147=l9_9151;
l9_9150=l9_9155;
}
l9_9104.x=l9_9147;
l9_9114=l9_9150;
float l9_9158=l9_9104.y;
int l9_9159=l9_9107.y;
bool l9_9160=l9_9113;
float l9_9161=l9_9114;
if ((l9_9159==0)||(l9_9159==3))
{
float l9_9162=l9_9158;
float l9_9163=0.0;
float l9_9164=1.0;
bool l9_9165=l9_9160;
float l9_9166=l9_9161;
float l9_9167=fast::clamp(l9_9162,l9_9163,l9_9164);
float l9_9168=step(abs(l9_9162-l9_9167),9.9999997e-06);
l9_9166*=(l9_9168+((1.0-float(l9_9165))*(1.0-l9_9168)));
l9_9162=l9_9167;
l9_9158=l9_9162;
l9_9161=l9_9166;
}
l9_9104.y=l9_9158;
l9_9114=l9_9161;
float2 l9_9169=l9_9104;
int l9_9170=l9_9102;
int l9_9171=l9_9103;
float l9_9172=l9_9112;
float2 l9_9173=l9_9169;
int l9_9174=l9_9170;
int l9_9175=l9_9171;
float3 l9_9176=float3(0.0);
if (l9_9174==0)
{
l9_9176=float3(l9_9173,0.0);
}
else
{
if (l9_9174==1)
{
l9_9176=float3(l9_9173.x,(l9_9173.y*0.5)+(0.5-(float(l9_9175)*0.5)),0.0);
}
else
{
l9_9176=float3(l9_9173,float(l9_9175));
}
}
float3 l9_9177=l9_9176;
float3 l9_9178=l9_9177;
float4 l9_9179=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_9178.xy,bias(l9_9172));
float4 l9_9180=l9_9179;
if (l9_9110)
{
l9_9180=mix(l9_9111,l9_9180,float4(l9_9114));
}
float4 l9_9181=l9_9180;
l9_9095=l9_9181;
float l9_9182=0.0;
l9_9182=l9_9095.x;
float l9_9183=0.0;
l9_9183=step(l9_9182,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_9184=0.0;
l9_9184=step(l9_9182,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_9185=0.0;
l9_9185=l9_9183-l9_9184;
l9_9088=float4(l9_9185);
l9_9093=l9_9088;
}
else
{
l9_9093=l9_9089;
}
l9_9086=l9_9093;
float4 l9_9186=float4(0.0);
l9_9186=l9_8755*l9_9086;
float4 l9_9187=float4(0.0);
float4 l9_9188=(*sc_set0.UserUniforms).colorId02;
l9_9187=l9_9188;
float4 l9_9189=float4(0.0);
l9_9189=l9_9187*l9_9086;
float4 l9_9190=float4(0.0);
float4 l9_9191=l9_9186;
float4 l9_9192=l9_9189;
float4 l9_9193=l9_9191;
float4 l9_9194=l9_9192;
float3 l9_9195=l9_9193.xyz*l9_9193.w;
l9_9193=float4(l9_9195.x,l9_9195.y,l9_9195.z,l9_9193.w);
float4 l9_9196=l9_9193+(l9_9194*(1.0-l9_9193.w));
l9_9190=l9_9196;
float4 l9_9197=float4(0.0);
l9_9197=float4(l9_8749)*l9_9190;
float4 l9_9198=float4(0.0);
l9_9198=l9_9197+l9_9190;
l9_8739=l9_9198;
l9_8744=l9_8739;
}
else
{
float4 l9_9199=float4(0.0);
float l9_9200=0.0;
float4 l9_9201=float4(0.0);
float4 l9_9202=float4(0.0);
ssGlobals l9_9203=l9_8741;
float l9_9204=0.0;
float l9_9205=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_9204=l9_9205;
l9_9200=l9_9204;
float4 l9_9206;
if ((l9_9200*1.0)!=0.0)
{
float4 l9_9207=float4(0.0);
float4 l9_9208=(*sc_set0.UserUniforms).patternColorId02;
l9_9207=l9_9208;
float4 l9_9209=float4(0.0);
float l9_9210=0.0;
float4 l9_9211=float4(0.0);
float4 l9_9212=float4(0.0);
ssGlobals l9_9213=l9_9203;
float l9_9214=0.0;
float l9_9215=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_9214=l9_9215;
l9_9210=l9_9214;
float4 l9_9216;
if ((l9_9210*1.0)!=0.0)
{
float2 l9_9217=float2(0.0);
l9_9217=l9_9213.Surface_UVCoord0;
float2 l9_9218=float2(0.0);
float2 l9_9219=(*sc_set0.UserUniforms).patternScaleId02;
l9_9218=l9_9219;
float2 l9_9220=float2(0.0);
l9_9220=((l9_9217-(*sc_set0.UserUniforms).Port_Center_N282)*l9_9218)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_9221=float2(0.0);
float2 l9_9222=(*sc_set0.UserUniforms).patternOffsetId02;
l9_9221=l9_9222;
float2 l9_9223=float2(0.0);
l9_9223=l9_9220+l9_9221;
float l9_9224=0.0;
float l9_9225=(*sc_set0.UserUniforms).patternRotateId02;
l9_9224=l9_9225;
float2 l9_9226=float2(0.0);
float2 l9_9227=l9_9223;
float l9_9228=l9_9224;
float2 l9_9229=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_9230=sin(radians(l9_9228));
float l9_9231=cos(radians(l9_9228));
float2 l9_9232=l9_9227-l9_9229;
l9_9232=float2(dot(float2(l9_9231,l9_9230),l9_9232),dot(float2(-l9_9230,l9_9231),l9_9232))+l9_9229;
l9_9226=l9_9232;
float4 l9_9233=float4(0.0);
int l9_9234;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_9235=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9235=0;
}
else
{
l9_9235=in.varStereoViewID;
}
int l9_9236=l9_9235;
l9_9234=1-l9_9236;
}
else
{
int l9_9237=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9237=0;
}
else
{
l9_9237=in.varStereoViewID;
}
int l9_9238=l9_9237;
l9_9234=l9_9238;
}
int l9_9239=l9_9234;
int l9_9240=patternTextureId02Layout_tmp;
int l9_9241=l9_9239;
float2 l9_9242=l9_9226;
bool l9_9243=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_9244=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_9245=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_9246=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_9247=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_9248=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_9249=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_9250=0.0;
bool l9_9251=l9_9248&&(!l9_9246);
float l9_9252=1.0;
float l9_9253=l9_9242.x;
int l9_9254=l9_9245.x;
if (l9_9254==1)
{
l9_9253=fract(l9_9253);
}
else
{
if (l9_9254==2)
{
float l9_9255=fract(l9_9253);
float l9_9256=l9_9253-l9_9255;
float l9_9257=step(0.25,fract(l9_9256*0.5));
l9_9253=mix(l9_9255,1.0-l9_9255,fast::clamp(l9_9257,0.0,1.0));
}
}
l9_9242.x=l9_9253;
float l9_9258=l9_9242.y;
int l9_9259=l9_9245.y;
if (l9_9259==1)
{
l9_9258=fract(l9_9258);
}
else
{
if (l9_9259==2)
{
float l9_9260=fract(l9_9258);
float l9_9261=l9_9258-l9_9260;
float l9_9262=step(0.25,fract(l9_9261*0.5));
l9_9258=mix(l9_9260,1.0-l9_9260,fast::clamp(l9_9262,0.0,1.0));
}
}
l9_9242.y=l9_9258;
if (l9_9246)
{
bool l9_9263=l9_9248;
bool l9_9264;
if (l9_9263)
{
l9_9264=l9_9245.x==3;
}
else
{
l9_9264=l9_9263;
}
float l9_9265=l9_9242.x;
float l9_9266=l9_9247.x;
float l9_9267=l9_9247.z;
bool l9_9268=l9_9264;
float l9_9269=l9_9252;
float l9_9270=fast::clamp(l9_9265,l9_9266,l9_9267);
float l9_9271=step(abs(l9_9265-l9_9270),9.9999997e-06);
l9_9269*=(l9_9271+((1.0-float(l9_9268))*(1.0-l9_9271)));
l9_9265=l9_9270;
l9_9242.x=l9_9265;
l9_9252=l9_9269;
bool l9_9272=l9_9248;
bool l9_9273;
if (l9_9272)
{
l9_9273=l9_9245.y==3;
}
else
{
l9_9273=l9_9272;
}
float l9_9274=l9_9242.y;
float l9_9275=l9_9247.y;
float l9_9276=l9_9247.w;
bool l9_9277=l9_9273;
float l9_9278=l9_9252;
float l9_9279=fast::clamp(l9_9274,l9_9275,l9_9276);
float l9_9280=step(abs(l9_9274-l9_9279),9.9999997e-06);
l9_9278*=(l9_9280+((1.0-float(l9_9277))*(1.0-l9_9280)));
l9_9274=l9_9279;
l9_9242.y=l9_9274;
l9_9252=l9_9278;
}
float2 l9_9281=l9_9242;
bool l9_9282=l9_9243;
float3x3 l9_9283=l9_9244;
if (l9_9282)
{
l9_9281=float2((l9_9283*float3(l9_9281,1.0)).xy);
}
float2 l9_9284=l9_9281;
l9_9242=l9_9284;
float l9_9285=l9_9242.x;
int l9_9286=l9_9245.x;
bool l9_9287=l9_9251;
float l9_9288=l9_9252;
if ((l9_9286==0)||(l9_9286==3))
{
float l9_9289=l9_9285;
float l9_9290=0.0;
float l9_9291=1.0;
bool l9_9292=l9_9287;
float l9_9293=l9_9288;
float l9_9294=fast::clamp(l9_9289,l9_9290,l9_9291);
float l9_9295=step(abs(l9_9289-l9_9294),9.9999997e-06);
l9_9293*=(l9_9295+((1.0-float(l9_9292))*(1.0-l9_9295)));
l9_9289=l9_9294;
l9_9285=l9_9289;
l9_9288=l9_9293;
}
l9_9242.x=l9_9285;
l9_9252=l9_9288;
float l9_9296=l9_9242.y;
int l9_9297=l9_9245.y;
bool l9_9298=l9_9251;
float l9_9299=l9_9252;
if ((l9_9297==0)||(l9_9297==3))
{
float l9_9300=l9_9296;
float l9_9301=0.0;
float l9_9302=1.0;
bool l9_9303=l9_9298;
float l9_9304=l9_9299;
float l9_9305=fast::clamp(l9_9300,l9_9301,l9_9302);
float l9_9306=step(abs(l9_9300-l9_9305),9.9999997e-06);
l9_9304*=(l9_9306+((1.0-float(l9_9303))*(1.0-l9_9306)));
l9_9300=l9_9305;
l9_9296=l9_9300;
l9_9299=l9_9304;
}
l9_9242.y=l9_9296;
l9_9252=l9_9299;
float2 l9_9307=l9_9242;
int l9_9308=l9_9240;
int l9_9309=l9_9241;
float l9_9310=l9_9250;
float2 l9_9311=l9_9307;
int l9_9312=l9_9308;
int l9_9313=l9_9309;
float3 l9_9314=float3(0.0);
if (l9_9312==0)
{
l9_9314=float3(l9_9311,0.0);
}
else
{
if (l9_9312==1)
{
l9_9314=float3(l9_9311.x,(l9_9311.y*0.5)+(0.5-(float(l9_9313)*0.5)),0.0);
}
else
{
l9_9314=float3(l9_9311,float(l9_9313));
}
}
float3 l9_9315=l9_9314;
float3 l9_9316=l9_9315;
float4 l9_9317=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_9316.xy,bias(l9_9310));
float4 l9_9318=l9_9317;
if (l9_9248)
{
l9_9318=mix(l9_9249,l9_9318,float4(l9_9252));
}
float4 l9_9319=l9_9318;
l9_9233=l9_9319;
l9_9211=l9_9233;
l9_9216=l9_9211;
}
else
{
float2 l9_9320=float2(0.0);
l9_9320=l9_9213.Surface_UVCoord0;
float2 l9_9321=float2(0.0);
float2 l9_9322=(*sc_set0.UserUniforms).patternScaleId02;
l9_9321=l9_9322;
float2 l9_9323=float2(0.0);
l9_9323=((l9_9320-(*sc_set0.UserUniforms).Port_Center_N282)*l9_9321)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_9324=float2(0.0);
float2 l9_9325=(*sc_set0.UserUniforms).patternOffsetId02;
l9_9324=l9_9325;
float2 l9_9326=float2(0.0);
l9_9326=l9_9323+l9_9324;
float l9_9327=0.0;
float l9_9328=(*sc_set0.UserUniforms).patternRotateId02;
l9_9327=l9_9328;
float2 l9_9329=float2(0.0);
float2 l9_9330=l9_9326;
float l9_9331=l9_9327;
float2 l9_9332=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_9333=sin(radians(l9_9331));
float l9_9334=cos(radians(l9_9331));
float2 l9_9335=l9_9330-l9_9332;
l9_9335=float2(dot(float2(l9_9334,l9_9333),l9_9335),dot(float2(-l9_9333,l9_9334),l9_9335))+l9_9332;
l9_9329=l9_9335;
float4 l9_9336=float4(0.0);
int l9_9337;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
{
int l9_9338=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9338=0;
}
else
{
l9_9338=in.varStereoViewID;
}
int l9_9339=l9_9338;
l9_9337=1-l9_9339;
}
else
{
int l9_9340=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9340=0;
}
else
{
l9_9340=in.varStereoViewID;
}
int l9_9341=l9_9340;
l9_9337=l9_9341;
}
int l9_9342=l9_9337;
int l9_9343=patternTextureId02Layout_tmp;
int l9_9344=l9_9342;
float2 l9_9345=l9_9329;
bool l9_9346=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_9347=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_9348=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_9349=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_9350=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_9351=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_9352=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
float l9_9353=0.0;
bool l9_9354=l9_9351&&(!l9_9349);
float l9_9355=1.0;
float l9_9356=l9_9345.x;
int l9_9357=l9_9348.x;
if (l9_9357==1)
{
l9_9356=fract(l9_9356);
}
else
{
if (l9_9357==2)
{
float l9_9358=fract(l9_9356);
float l9_9359=l9_9356-l9_9358;
float l9_9360=step(0.25,fract(l9_9359*0.5));
l9_9356=mix(l9_9358,1.0-l9_9358,fast::clamp(l9_9360,0.0,1.0));
}
}
l9_9345.x=l9_9356;
float l9_9361=l9_9345.y;
int l9_9362=l9_9348.y;
if (l9_9362==1)
{
l9_9361=fract(l9_9361);
}
else
{
if (l9_9362==2)
{
float l9_9363=fract(l9_9361);
float l9_9364=l9_9361-l9_9363;
float l9_9365=step(0.25,fract(l9_9364*0.5));
l9_9361=mix(l9_9363,1.0-l9_9363,fast::clamp(l9_9365,0.0,1.0));
}
}
l9_9345.y=l9_9361;
if (l9_9349)
{
bool l9_9366=l9_9351;
bool l9_9367;
if (l9_9366)
{
l9_9367=l9_9348.x==3;
}
else
{
l9_9367=l9_9366;
}
float l9_9368=l9_9345.x;
float l9_9369=l9_9350.x;
float l9_9370=l9_9350.z;
bool l9_9371=l9_9367;
float l9_9372=l9_9355;
float l9_9373=fast::clamp(l9_9368,l9_9369,l9_9370);
float l9_9374=step(abs(l9_9368-l9_9373),9.9999997e-06);
l9_9372*=(l9_9374+((1.0-float(l9_9371))*(1.0-l9_9374)));
l9_9368=l9_9373;
l9_9345.x=l9_9368;
l9_9355=l9_9372;
bool l9_9375=l9_9351;
bool l9_9376;
if (l9_9375)
{
l9_9376=l9_9348.y==3;
}
else
{
l9_9376=l9_9375;
}
float l9_9377=l9_9345.y;
float l9_9378=l9_9350.y;
float l9_9379=l9_9350.w;
bool l9_9380=l9_9376;
float l9_9381=l9_9355;
float l9_9382=fast::clamp(l9_9377,l9_9378,l9_9379);
float l9_9383=step(abs(l9_9377-l9_9382),9.9999997e-06);
l9_9381*=(l9_9383+((1.0-float(l9_9380))*(1.0-l9_9383)));
l9_9377=l9_9382;
l9_9345.y=l9_9377;
l9_9355=l9_9381;
}
float2 l9_9384=l9_9345;
bool l9_9385=l9_9346;
float3x3 l9_9386=l9_9347;
if (l9_9385)
{
l9_9384=float2((l9_9386*float3(l9_9384,1.0)).xy);
}
float2 l9_9387=l9_9384;
l9_9345=l9_9387;
float l9_9388=l9_9345.x;
int l9_9389=l9_9348.x;
bool l9_9390=l9_9354;
float l9_9391=l9_9355;
if ((l9_9389==0)||(l9_9389==3))
{
float l9_9392=l9_9388;
float l9_9393=0.0;
float l9_9394=1.0;
bool l9_9395=l9_9390;
float l9_9396=l9_9391;
float l9_9397=fast::clamp(l9_9392,l9_9393,l9_9394);
float l9_9398=step(abs(l9_9392-l9_9397),9.9999997e-06);
l9_9396*=(l9_9398+((1.0-float(l9_9395))*(1.0-l9_9398)));
l9_9392=l9_9397;
l9_9388=l9_9392;
l9_9391=l9_9396;
}
l9_9345.x=l9_9388;
l9_9355=l9_9391;
float l9_9399=l9_9345.y;
int l9_9400=l9_9348.y;
bool l9_9401=l9_9354;
float l9_9402=l9_9355;
if ((l9_9400==0)||(l9_9400==3))
{
float l9_9403=l9_9399;
float l9_9404=0.0;
float l9_9405=1.0;
bool l9_9406=l9_9401;
float l9_9407=l9_9402;
float l9_9408=fast::clamp(l9_9403,l9_9404,l9_9405);
float l9_9409=step(abs(l9_9403-l9_9408),9.9999997e-06);
l9_9407*=(l9_9409+((1.0-float(l9_9406))*(1.0-l9_9409)));
l9_9403=l9_9408;
l9_9399=l9_9403;
l9_9402=l9_9407;
}
l9_9345.y=l9_9399;
l9_9355=l9_9402;
float2 l9_9410=l9_9345;
int l9_9411=l9_9343;
int l9_9412=l9_9344;
float l9_9413=l9_9353;
float2 l9_9414=l9_9410;
int l9_9415=l9_9411;
int l9_9416=l9_9412;
float3 l9_9417=float3(0.0);
if (l9_9415==0)
{
l9_9417=float3(l9_9414,0.0);
}
else
{
if (l9_9415==1)
{
l9_9417=float3(l9_9414.x,(l9_9414.y*0.5)+(0.5-(float(l9_9416)*0.5)),0.0);
}
else
{
l9_9417=float3(l9_9414,float(l9_9416));
}
}
float3 l9_9418=l9_9417;
float3 l9_9419=l9_9418;
float4 l9_9420=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_9419.xy,bias(l9_9413));
float4 l9_9421=l9_9420;
if (l9_9351)
{
l9_9421=mix(l9_9352,l9_9421,float4(l9_9355));
}
float4 l9_9422=l9_9421;
l9_9336=l9_9422;
float l9_9423=0.0;
float3 l9_9424=l9_9336.xyz;
float l9_9425=l9_9424.x;
l9_9423=l9_9425;
l9_9212=float4(l9_9423);
l9_9216=l9_9212;
}
l9_9209=l9_9216;
float4 l9_9426=float4(0.0);
l9_9426=l9_9207*l9_9209;
l9_9201=l9_9426;
l9_9206=l9_9201;
}
else
{
float4 l9_9427=float4(0.0);
float4 l9_9428=(*sc_set0.UserUniforms).colorId02;
l9_9427=l9_9428;
float4 l9_9429=float4(0.0);
float l9_9430=0.0;
float4 l9_9431=float4(0.0);
float4 l9_9432=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_9433=l9_9203;
float l9_9434=0.0;
float l9_9435=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_9434=l9_9435;
l9_9430=l9_9434;
float4 l9_9436;
if ((l9_9430*1.0)!=0.0)
{
float2 l9_9437=float2(0.0);
l9_9437=l9_9433.Surface_UVCoord0;
float4 l9_9438=float4(0.0);
int l9_9439;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_9440=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9440=0;
}
else
{
l9_9440=in.varStereoViewID;
}
int l9_9441=l9_9440;
l9_9439=1-l9_9441;
}
else
{
int l9_9442=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9442=0;
}
else
{
l9_9442=in.varStereoViewID;
}
int l9_9443=l9_9442;
l9_9439=l9_9443;
}
int l9_9444=l9_9439;
int l9_9445=greyMaskIdLayout_tmp;
int l9_9446=l9_9444;
float2 l9_9447=l9_9437;
bool l9_9448=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_9449=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_9450=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_9451=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_9452=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_9453=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_9454=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_9455=0.0;
bool l9_9456=l9_9453&&(!l9_9451);
float l9_9457=1.0;
float l9_9458=l9_9447.x;
int l9_9459=l9_9450.x;
if (l9_9459==1)
{
l9_9458=fract(l9_9458);
}
else
{
if (l9_9459==2)
{
float l9_9460=fract(l9_9458);
float l9_9461=l9_9458-l9_9460;
float l9_9462=step(0.25,fract(l9_9461*0.5));
l9_9458=mix(l9_9460,1.0-l9_9460,fast::clamp(l9_9462,0.0,1.0));
}
}
l9_9447.x=l9_9458;
float l9_9463=l9_9447.y;
int l9_9464=l9_9450.y;
if (l9_9464==1)
{
l9_9463=fract(l9_9463);
}
else
{
if (l9_9464==2)
{
float l9_9465=fract(l9_9463);
float l9_9466=l9_9463-l9_9465;
float l9_9467=step(0.25,fract(l9_9466*0.5));
l9_9463=mix(l9_9465,1.0-l9_9465,fast::clamp(l9_9467,0.0,1.0));
}
}
l9_9447.y=l9_9463;
if (l9_9451)
{
bool l9_9468=l9_9453;
bool l9_9469;
if (l9_9468)
{
l9_9469=l9_9450.x==3;
}
else
{
l9_9469=l9_9468;
}
float l9_9470=l9_9447.x;
float l9_9471=l9_9452.x;
float l9_9472=l9_9452.z;
bool l9_9473=l9_9469;
float l9_9474=l9_9457;
float l9_9475=fast::clamp(l9_9470,l9_9471,l9_9472);
float l9_9476=step(abs(l9_9470-l9_9475),9.9999997e-06);
l9_9474*=(l9_9476+((1.0-float(l9_9473))*(1.0-l9_9476)));
l9_9470=l9_9475;
l9_9447.x=l9_9470;
l9_9457=l9_9474;
bool l9_9477=l9_9453;
bool l9_9478;
if (l9_9477)
{
l9_9478=l9_9450.y==3;
}
else
{
l9_9478=l9_9477;
}
float l9_9479=l9_9447.y;
float l9_9480=l9_9452.y;
float l9_9481=l9_9452.w;
bool l9_9482=l9_9478;
float l9_9483=l9_9457;
float l9_9484=fast::clamp(l9_9479,l9_9480,l9_9481);
float l9_9485=step(abs(l9_9479-l9_9484),9.9999997e-06);
l9_9483*=(l9_9485+((1.0-float(l9_9482))*(1.0-l9_9485)));
l9_9479=l9_9484;
l9_9447.y=l9_9479;
l9_9457=l9_9483;
}
float2 l9_9486=l9_9447;
bool l9_9487=l9_9448;
float3x3 l9_9488=l9_9449;
if (l9_9487)
{
l9_9486=float2((l9_9488*float3(l9_9486,1.0)).xy);
}
float2 l9_9489=l9_9486;
l9_9447=l9_9489;
float l9_9490=l9_9447.x;
int l9_9491=l9_9450.x;
bool l9_9492=l9_9456;
float l9_9493=l9_9457;
if ((l9_9491==0)||(l9_9491==3))
{
float l9_9494=l9_9490;
float l9_9495=0.0;
float l9_9496=1.0;
bool l9_9497=l9_9492;
float l9_9498=l9_9493;
float l9_9499=fast::clamp(l9_9494,l9_9495,l9_9496);
float l9_9500=step(abs(l9_9494-l9_9499),9.9999997e-06);
l9_9498*=(l9_9500+((1.0-float(l9_9497))*(1.0-l9_9500)));
l9_9494=l9_9499;
l9_9490=l9_9494;
l9_9493=l9_9498;
}
l9_9447.x=l9_9490;
l9_9457=l9_9493;
float l9_9501=l9_9447.y;
int l9_9502=l9_9450.y;
bool l9_9503=l9_9456;
float l9_9504=l9_9457;
if ((l9_9502==0)||(l9_9502==3))
{
float l9_9505=l9_9501;
float l9_9506=0.0;
float l9_9507=1.0;
bool l9_9508=l9_9503;
float l9_9509=l9_9504;
float l9_9510=fast::clamp(l9_9505,l9_9506,l9_9507);
float l9_9511=step(abs(l9_9505-l9_9510),9.9999997e-06);
l9_9509*=(l9_9511+((1.0-float(l9_9508))*(1.0-l9_9511)));
l9_9505=l9_9510;
l9_9501=l9_9505;
l9_9504=l9_9509;
}
l9_9447.y=l9_9501;
l9_9457=l9_9504;
float2 l9_9512=l9_9447;
int l9_9513=l9_9445;
int l9_9514=l9_9446;
float l9_9515=l9_9455;
float2 l9_9516=l9_9512;
int l9_9517=l9_9513;
int l9_9518=l9_9514;
float3 l9_9519=float3(0.0);
if (l9_9517==0)
{
l9_9519=float3(l9_9516,0.0);
}
else
{
if (l9_9517==1)
{
l9_9519=float3(l9_9516.x,(l9_9516.y*0.5)+(0.5-(float(l9_9518)*0.5)),0.0);
}
else
{
l9_9519=float3(l9_9516,float(l9_9518));
}
}
float3 l9_9520=l9_9519;
float3 l9_9521=l9_9520;
float4 l9_9522=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_9521.xy,bias(l9_9515));
float4 l9_9523=l9_9522;
if (l9_9453)
{
l9_9523=mix(l9_9454,l9_9523,float4(l9_9457));
}
float4 l9_9524=l9_9523;
l9_9438=l9_9524;
float l9_9525=0.0;
l9_9525=l9_9438.x;
float l9_9526=0.0;
l9_9526=step(l9_9525,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_9527=0.0;
l9_9527=step(l9_9525,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_9528=0.0;
l9_9528=l9_9526-l9_9527;
l9_9431=float4(l9_9528);
l9_9436=l9_9431;
}
else
{
l9_9436=l9_9432;
}
l9_9429=l9_9436;
float4 l9_9529=float4(0.0);
l9_9529=l9_9427*l9_9429;
l9_9202=l9_9529;
l9_9206=l9_9202;
}
l9_9199=l9_9206;
float4 l9_9530=float4(0.0);
float l9_9531=0.0;
float4 l9_9532=float4(0.0);
float4 l9_9533=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_9534=l9_8741;
float l9_9535=0.0;
float l9_9536=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_9535=l9_9536;
l9_9531=l9_9535;
float4 l9_9537;
if ((l9_9531*1.0)!=0.0)
{
float2 l9_9538=float2(0.0);
l9_9538=l9_9534.Surface_UVCoord0;
float4 l9_9539=float4(0.0);
int l9_9540;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_9541=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9541=0;
}
else
{
l9_9541=in.varStereoViewID;
}
int l9_9542=l9_9541;
l9_9540=1-l9_9542;
}
else
{
int l9_9543=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9543=0;
}
else
{
l9_9543=in.varStereoViewID;
}
int l9_9544=l9_9543;
l9_9540=l9_9544;
}
int l9_9545=l9_9540;
int l9_9546=greyMaskIdLayout_tmp;
int l9_9547=l9_9545;
float2 l9_9548=l9_9538;
bool l9_9549=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_9550=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_9551=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_9552=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_9553=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_9554=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_9555=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_9556=0.0;
bool l9_9557=l9_9554&&(!l9_9552);
float l9_9558=1.0;
float l9_9559=l9_9548.x;
int l9_9560=l9_9551.x;
if (l9_9560==1)
{
l9_9559=fract(l9_9559);
}
else
{
if (l9_9560==2)
{
float l9_9561=fract(l9_9559);
float l9_9562=l9_9559-l9_9561;
float l9_9563=step(0.25,fract(l9_9562*0.5));
l9_9559=mix(l9_9561,1.0-l9_9561,fast::clamp(l9_9563,0.0,1.0));
}
}
l9_9548.x=l9_9559;
float l9_9564=l9_9548.y;
int l9_9565=l9_9551.y;
if (l9_9565==1)
{
l9_9564=fract(l9_9564);
}
else
{
if (l9_9565==2)
{
float l9_9566=fract(l9_9564);
float l9_9567=l9_9564-l9_9566;
float l9_9568=step(0.25,fract(l9_9567*0.5));
l9_9564=mix(l9_9566,1.0-l9_9566,fast::clamp(l9_9568,0.0,1.0));
}
}
l9_9548.y=l9_9564;
if (l9_9552)
{
bool l9_9569=l9_9554;
bool l9_9570;
if (l9_9569)
{
l9_9570=l9_9551.x==3;
}
else
{
l9_9570=l9_9569;
}
float l9_9571=l9_9548.x;
float l9_9572=l9_9553.x;
float l9_9573=l9_9553.z;
bool l9_9574=l9_9570;
float l9_9575=l9_9558;
float l9_9576=fast::clamp(l9_9571,l9_9572,l9_9573);
float l9_9577=step(abs(l9_9571-l9_9576),9.9999997e-06);
l9_9575*=(l9_9577+((1.0-float(l9_9574))*(1.0-l9_9577)));
l9_9571=l9_9576;
l9_9548.x=l9_9571;
l9_9558=l9_9575;
bool l9_9578=l9_9554;
bool l9_9579;
if (l9_9578)
{
l9_9579=l9_9551.y==3;
}
else
{
l9_9579=l9_9578;
}
float l9_9580=l9_9548.y;
float l9_9581=l9_9553.y;
float l9_9582=l9_9553.w;
bool l9_9583=l9_9579;
float l9_9584=l9_9558;
float l9_9585=fast::clamp(l9_9580,l9_9581,l9_9582);
float l9_9586=step(abs(l9_9580-l9_9585),9.9999997e-06);
l9_9584*=(l9_9586+((1.0-float(l9_9583))*(1.0-l9_9586)));
l9_9580=l9_9585;
l9_9548.y=l9_9580;
l9_9558=l9_9584;
}
float2 l9_9587=l9_9548;
bool l9_9588=l9_9549;
float3x3 l9_9589=l9_9550;
if (l9_9588)
{
l9_9587=float2((l9_9589*float3(l9_9587,1.0)).xy);
}
float2 l9_9590=l9_9587;
l9_9548=l9_9590;
float l9_9591=l9_9548.x;
int l9_9592=l9_9551.x;
bool l9_9593=l9_9557;
float l9_9594=l9_9558;
if ((l9_9592==0)||(l9_9592==3))
{
float l9_9595=l9_9591;
float l9_9596=0.0;
float l9_9597=1.0;
bool l9_9598=l9_9593;
float l9_9599=l9_9594;
float l9_9600=fast::clamp(l9_9595,l9_9596,l9_9597);
float l9_9601=step(abs(l9_9595-l9_9600),9.9999997e-06);
l9_9599*=(l9_9601+((1.0-float(l9_9598))*(1.0-l9_9601)));
l9_9595=l9_9600;
l9_9591=l9_9595;
l9_9594=l9_9599;
}
l9_9548.x=l9_9591;
l9_9558=l9_9594;
float l9_9602=l9_9548.y;
int l9_9603=l9_9551.y;
bool l9_9604=l9_9557;
float l9_9605=l9_9558;
if ((l9_9603==0)||(l9_9603==3))
{
float l9_9606=l9_9602;
float l9_9607=0.0;
float l9_9608=1.0;
bool l9_9609=l9_9604;
float l9_9610=l9_9605;
float l9_9611=fast::clamp(l9_9606,l9_9607,l9_9608);
float l9_9612=step(abs(l9_9606-l9_9611),9.9999997e-06);
l9_9610*=(l9_9612+((1.0-float(l9_9609))*(1.0-l9_9612)));
l9_9606=l9_9611;
l9_9602=l9_9606;
l9_9605=l9_9610;
}
l9_9548.y=l9_9602;
l9_9558=l9_9605;
float2 l9_9613=l9_9548;
int l9_9614=l9_9546;
int l9_9615=l9_9547;
float l9_9616=l9_9556;
float2 l9_9617=l9_9613;
int l9_9618=l9_9614;
int l9_9619=l9_9615;
float3 l9_9620=float3(0.0);
if (l9_9618==0)
{
l9_9620=float3(l9_9617,0.0);
}
else
{
if (l9_9618==1)
{
l9_9620=float3(l9_9617.x,(l9_9617.y*0.5)+(0.5-(float(l9_9619)*0.5)),0.0);
}
else
{
l9_9620=float3(l9_9617,float(l9_9619));
}
}
float3 l9_9621=l9_9620;
float3 l9_9622=l9_9621;
float4 l9_9623=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_9622.xy,bias(l9_9616));
float4 l9_9624=l9_9623;
if (l9_9554)
{
l9_9624=mix(l9_9555,l9_9624,float4(l9_9558));
}
float4 l9_9625=l9_9624;
l9_9539=l9_9625;
float l9_9626=0.0;
l9_9626=l9_9539.x;
float l9_9627=0.0;
l9_9627=step(l9_9626,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_9628=0.0;
l9_9628=step(l9_9626,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_9629=0.0;
l9_9629=l9_9627-l9_9628;
l9_9532=float4(l9_9629);
l9_9537=l9_9532;
}
else
{
l9_9537=l9_9533;
}
l9_9530=l9_9537;
float4 l9_9630=float4(0.0);
l9_9630=l9_9199*l9_9530;
float4 l9_9631=float4(0.0);
float4 l9_9632=(*sc_set0.UserUniforms).colorId02;
l9_9631=l9_9632;
float4 l9_9633=float4(0.0);
l9_9633=l9_9631*l9_9530;
float4 l9_9634=float4(0.0);
float4 l9_9635=l9_9630;
float4 l9_9636=l9_9633;
float4 l9_9637=l9_9635;
float4 l9_9638=l9_9636;
float3 l9_9639=l9_9637.xyz*l9_9637.w;
l9_9637=float4(l9_9639.x,l9_9639.y,l9_9639.z,l9_9637.w);
float4 l9_9640=l9_9637+(l9_9638*(1.0-l9_9637.w));
l9_9634=l9_9640;
l9_8740=l9_9634;
l9_8744=l9_8740;
}
l9_8737=l9_8744;
l9_7800=l9_8737;
l9_7804=l9_7800;
}
l9_7797=l9_7804;
float4 l9_9641=float4(0.0);
float l9_9642=0.0;
float4 l9_9643=float4(0.0);
float4 l9_9644=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_9645=l9_7793;
float l9_9646=0.0;
float l9_9647=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_9646=l9_9647;
l9_9642=l9_9646;
float4 l9_9648;
if ((l9_9642*1.0)!=0.0)
{
float2 l9_9649=float2(0.0);
l9_9649=l9_9645.Surface_UVCoord0;
float4 l9_9650=float4(0.0);
int l9_9651;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_9652=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9652=0;
}
else
{
l9_9652=in.varStereoViewID;
}
int l9_9653=l9_9652;
l9_9651=1-l9_9653;
}
else
{
int l9_9654=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9654=0;
}
else
{
l9_9654=in.varStereoViewID;
}
int l9_9655=l9_9654;
l9_9651=l9_9655;
}
int l9_9656=l9_9651;
int l9_9657=greyMaskIdLayout_tmp;
int l9_9658=l9_9656;
float2 l9_9659=l9_9649;
bool l9_9660=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_9661=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_9662=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_9663=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_9664=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_9665=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_9666=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_9667=0.0;
bool l9_9668=l9_9665&&(!l9_9663);
float l9_9669=1.0;
float l9_9670=l9_9659.x;
int l9_9671=l9_9662.x;
if (l9_9671==1)
{
l9_9670=fract(l9_9670);
}
else
{
if (l9_9671==2)
{
float l9_9672=fract(l9_9670);
float l9_9673=l9_9670-l9_9672;
float l9_9674=step(0.25,fract(l9_9673*0.5));
l9_9670=mix(l9_9672,1.0-l9_9672,fast::clamp(l9_9674,0.0,1.0));
}
}
l9_9659.x=l9_9670;
float l9_9675=l9_9659.y;
int l9_9676=l9_9662.y;
if (l9_9676==1)
{
l9_9675=fract(l9_9675);
}
else
{
if (l9_9676==2)
{
float l9_9677=fract(l9_9675);
float l9_9678=l9_9675-l9_9677;
float l9_9679=step(0.25,fract(l9_9678*0.5));
l9_9675=mix(l9_9677,1.0-l9_9677,fast::clamp(l9_9679,0.0,1.0));
}
}
l9_9659.y=l9_9675;
if (l9_9663)
{
bool l9_9680=l9_9665;
bool l9_9681;
if (l9_9680)
{
l9_9681=l9_9662.x==3;
}
else
{
l9_9681=l9_9680;
}
float l9_9682=l9_9659.x;
float l9_9683=l9_9664.x;
float l9_9684=l9_9664.z;
bool l9_9685=l9_9681;
float l9_9686=l9_9669;
float l9_9687=fast::clamp(l9_9682,l9_9683,l9_9684);
float l9_9688=step(abs(l9_9682-l9_9687),9.9999997e-06);
l9_9686*=(l9_9688+((1.0-float(l9_9685))*(1.0-l9_9688)));
l9_9682=l9_9687;
l9_9659.x=l9_9682;
l9_9669=l9_9686;
bool l9_9689=l9_9665;
bool l9_9690;
if (l9_9689)
{
l9_9690=l9_9662.y==3;
}
else
{
l9_9690=l9_9689;
}
float l9_9691=l9_9659.y;
float l9_9692=l9_9664.y;
float l9_9693=l9_9664.w;
bool l9_9694=l9_9690;
float l9_9695=l9_9669;
float l9_9696=fast::clamp(l9_9691,l9_9692,l9_9693);
float l9_9697=step(abs(l9_9691-l9_9696),9.9999997e-06);
l9_9695*=(l9_9697+((1.0-float(l9_9694))*(1.0-l9_9697)));
l9_9691=l9_9696;
l9_9659.y=l9_9691;
l9_9669=l9_9695;
}
float2 l9_9698=l9_9659;
bool l9_9699=l9_9660;
float3x3 l9_9700=l9_9661;
if (l9_9699)
{
l9_9698=float2((l9_9700*float3(l9_9698,1.0)).xy);
}
float2 l9_9701=l9_9698;
l9_9659=l9_9701;
float l9_9702=l9_9659.x;
int l9_9703=l9_9662.x;
bool l9_9704=l9_9668;
float l9_9705=l9_9669;
if ((l9_9703==0)||(l9_9703==3))
{
float l9_9706=l9_9702;
float l9_9707=0.0;
float l9_9708=1.0;
bool l9_9709=l9_9704;
float l9_9710=l9_9705;
float l9_9711=fast::clamp(l9_9706,l9_9707,l9_9708);
float l9_9712=step(abs(l9_9706-l9_9711),9.9999997e-06);
l9_9710*=(l9_9712+((1.0-float(l9_9709))*(1.0-l9_9712)));
l9_9706=l9_9711;
l9_9702=l9_9706;
l9_9705=l9_9710;
}
l9_9659.x=l9_9702;
l9_9669=l9_9705;
float l9_9713=l9_9659.y;
int l9_9714=l9_9662.y;
bool l9_9715=l9_9668;
float l9_9716=l9_9669;
if ((l9_9714==0)||(l9_9714==3))
{
float l9_9717=l9_9713;
float l9_9718=0.0;
float l9_9719=1.0;
bool l9_9720=l9_9715;
float l9_9721=l9_9716;
float l9_9722=fast::clamp(l9_9717,l9_9718,l9_9719);
float l9_9723=step(abs(l9_9717-l9_9722),9.9999997e-06);
l9_9721*=(l9_9723+((1.0-float(l9_9720))*(1.0-l9_9723)));
l9_9717=l9_9722;
l9_9713=l9_9717;
l9_9716=l9_9721;
}
l9_9659.y=l9_9713;
l9_9669=l9_9716;
float2 l9_9724=l9_9659;
int l9_9725=l9_9657;
int l9_9726=l9_9658;
float l9_9727=l9_9667;
float2 l9_9728=l9_9724;
int l9_9729=l9_9725;
int l9_9730=l9_9726;
float3 l9_9731=float3(0.0);
if (l9_9729==0)
{
l9_9731=float3(l9_9728,0.0);
}
else
{
if (l9_9729==1)
{
l9_9731=float3(l9_9728.x,(l9_9728.y*0.5)+(0.5-(float(l9_9730)*0.5)),0.0);
}
else
{
l9_9731=float3(l9_9728,float(l9_9730));
}
}
float3 l9_9732=l9_9731;
float3 l9_9733=l9_9732;
float4 l9_9734=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_9733.xy,bias(l9_9727));
float4 l9_9735=l9_9734;
if (l9_9665)
{
l9_9735=mix(l9_9666,l9_9735,float4(l9_9669));
}
float4 l9_9736=l9_9735;
l9_9650=l9_9736;
float l9_9737=0.0;
l9_9737=l9_9650.x;
float l9_9738=0.0;
l9_9738=step(l9_9737,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_9739=0.0;
l9_9739=step(l9_9737,(*sc_set0.UserUniforms).Port_Input1_N035);
float l9_9740=0.0;
l9_9740=l9_9738-l9_9739;
l9_9643=float4(l9_9740);
l9_9648=l9_9643;
}
else
{
l9_9648=l9_9644;
}
l9_9641=l9_9648;
float4 l9_9741=float4(0.0);
l9_9741=l9_7797*l9_9641;
float4 l9_9742=float4(0.0);
float l9_9743=0.0;
float4 l9_9744=float4(0.0);
float4 l9_9745=float4(0.0);
ssGlobals l9_9746=l9_7793;
float l9_9747=0.0;
float l9_9748=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
l9_9747=l9_9748;
l9_9743=l9_9747;
float4 l9_9749;
if ((l9_9743*1.0)!=0.0)
{
float4 l9_9750=float4(0.0);
float l9_9751=0.0;
float4 l9_9752=float4(0.0);
float4 l9_9753=float4(0.0);
ssGlobals l9_9754=l9_9746;
float l9_9755=0.0;
float l9_9756=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_9755=l9_9756;
l9_9751=l9_9755;
float4 l9_9757;
if ((l9_9751*1.0)!=0.0)
{
float l9_9758=0.0;
float l9_9759=(*sc_set0.UserUniforms).rimExpId01;
l9_9758=l9_9759;
float l9_9760=0.0;
float l9_9761=(*sc_set0.UserUniforms).rimIntId01;
l9_9760=l9_9761;
float l9_9762=0.0;
float l9_9763=l9_9758;
float l9_9764=l9_9760;
ssGlobals l9_9765=l9_9754;
float l9_9766=abs(dot(-l9_9765.ViewDirWS,l9_9765.VertexNormal_WorldSpace));
float l9_9767=1.0-pow(1.0-l9_9766,l9_9763);
l9_9767=fast::max(l9_9767,0.0);
l9_9767*=l9_9764;
l9_9762=l9_9767;
float4 l9_9768=float4(0.0);
float l9_9769=0.0;
float4 l9_9770=float4(0.0);
float4 l9_9771=float4(0.0);
ssGlobals l9_9772=l9_9754;
float l9_9773=0.0;
float l9_9774=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_9773=l9_9774;
l9_9769=l9_9773;
float4 l9_9775;
if ((l9_9769*1.0)!=0.0)
{
float4 l9_9776=float4(0.0);
float4 l9_9777=(*sc_set0.UserUniforms).patternColorId01;
l9_9776=l9_9777;
float4 l9_9778=float4(0.0);
float l9_9779=0.0;
float4 l9_9780=float4(0.0);
float4 l9_9781=float4(0.0);
ssGlobals l9_9782=l9_9772;
float l9_9783=0.0;
float l9_9784=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_9783=l9_9784;
l9_9779=l9_9783;
float4 l9_9785;
if ((l9_9779*1.0)!=0.0)
{
float2 l9_9786=float2(0.0);
l9_9786=l9_9782.Surface_UVCoord0;
float2 l9_9787=float2(0.0);
float2 l9_9788=(*sc_set0.UserUniforms).patternScaleId01;
l9_9787=l9_9788;
float2 l9_9789=float2(0.0);
l9_9789=((l9_9786-(*sc_set0.UserUniforms).Port_Center_N122)*l9_9787)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_9790=float2(0.0);
float2 l9_9791=(*sc_set0.UserUniforms).patternOffsetId01;
l9_9790=l9_9791;
float2 l9_9792=float2(0.0);
l9_9792=l9_9789+l9_9790;
float l9_9793=0.0;
float l9_9794=(*sc_set0.UserUniforms).patternRotateId01;
l9_9793=l9_9794;
float2 l9_9795=float2(0.0);
float2 l9_9796=l9_9792;
float l9_9797=l9_9793;
float2 l9_9798=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_9799=sin(radians(l9_9797));
float l9_9800=cos(radians(l9_9797));
float2 l9_9801=l9_9796-l9_9798;
l9_9801=float2(dot(float2(l9_9800,l9_9799),l9_9801),dot(float2(-l9_9799,l9_9800),l9_9801))+l9_9798;
l9_9795=l9_9801;
float4 l9_9802=float4(0.0);
int l9_9803;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_9804=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9804=0;
}
else
{
l9_9804=in.varStereoViewID;
}
int l9_9805=l9_9804;
l9_9803=1-l9_9805;
}
else
{
int l9_9806=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9806=0;
}
else
{
l9_9806=in.varStereoViewID;
}
int l9_9807=l9_9806;
l9_9803=l9_9807;
}
int l9_9808=l9_9803;
int l9_9809=patternTextureId01Layout_tmp;
int l9_9810=l9_9808;
float2 l9_9811=l9_9795;
bool l9_9812=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_9813=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_9814=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_9815=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_9816=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_9817=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_9818=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_9819=0.0;
bool l9_9820=l9_9817&&(!l9_9815);
float l9_9821=1.0;
float l9_9822=l9_9811.x;
int l9_9823=l9_9814.x;
if (l9_9823==1)
{
l9_9822=fract(l9_9822);
}
else
{
if (l9_9823==2)
{
float l9_9824=fract(l9_9822);
float l9_9825=l9_9822-l9_9824;
float l9_9826=step(0.25,fract(l9_9825*0.5));
l9_9822=mix(l9_9824,1.0-l9_9824,fast::clamp(l9_9826,0.0,1.0));
}
}
l9_9811.x=l9_9822;
float l9_9827=l9_9811.y;
int l9_9828=l9_9814.y;
if (l9_9828==1)
{
l9_9827=fract(l9_9827);
}
else
{
if (l9_9828==2)
{
float l9_9829=fract(l9_9827);
float l9_9830=l9_9827-l9_9829;
float l9_9831=step(0.25,fract(l9_9830*0.5));
l9_9827=mix(l9_9829,1.0-l9_9829,fast::clamp(l9_9831,0.0,1.0));
}
}
l9_9811.y=l9_9827;
if (l9_9815)
{
bool l9_9832=l9_9817;
bool l9_9833;
if (l9_9832)
{
l9_9833=l9_9814.x==3;
}
else
{
l9_9833=l9_9832;
}
float l9_9834=l9_9811.x;
float l9_9835=l9_9816.x;
float l9_9836=l9_9816.z;
bool l9_9837=l9_9833;
float l9_9838=l9_9821;
float l9_9839=fast::clamp(l9_9834,l9_9835,l9_9836);
float l9_9840=step(abs(l9_9834-l9_9839),9.9999997e-06);
l9_9838*=(l9_9840+((1.0-float(l9_9837))*(1.0-l9_9840)));
l9_9834=l9_9839;
l9_9811.x=l9_9834;
l9_9821=l9_9838;
bool l9_9841=l9_9817;
bool l9_9842;
if (l9_9841)
{
l9_9842=l9_9814.y==3;
}
else
{
l9_9842=l9_9841;
}
float l9_9843=l9_9811.y;
float l9_9844=l9_9816.y;
float l9_9845=l9_9816.w;
bool l9_9846=l9_9842;
float l9_9847=l9_9821;
float l9_9848=fast::clamp(l9_9843,l9_9844,l9_9845);
float l9_9849=step(abs(l9_9843-l9_9848),9.9999997e-06);
l9_9847*=(l9_9849+((1.0-float(l9_9846))*(1.0-l9_9849)));
l9_9843=l9_9848;
l9_9811.y=l9_9843;
l9_9821=l9_9847;
}
float2 l9_9850=l9_9811;
bool l9_9851=l9_9812;
float3x3 l9_9852=l9_9813;
if (l9_9851)
{
l9_9850=float2((l9_9852*float3(l9_9850,1.0)).xy);
}
float2 l9_9853=l9_9850;
l9_9811=l9_9853;
float l9_9854=l9_9811.x;
int l9_9855=l9_9814.x;
bool l9_9856=l9_9820;
float l9_9857=l9_9821;
if ((l9_9855==0)||(l9_9855==3))
{
float l9_9858=l9_9854;
float l9_9859=0.0;
float l9_9860=1.0;
bool l9_9861=l9_9856;
float l9_9862=l9_9857;
float l9_9863=fast::clamp(l9_9858,l9_9859,l9_9860);
float l9_9864=step(abs(l9_9858-l9_9863),9.9999997e-06);
l9_9862*=(l9_9864+((1.0-float(l9_9861))*(1.0-l9_9864)));
l9_9858=l9_9863;
l9_9854=l9_9858;
l9_9857=l9_9862;
}
l9_9811.x=l9_9854;
l9_9821=l9_9857;
float l9_9865=l9_9811.y;
int l9_9866=l9_9814.y;
bool l9_9867=l9_9820;
float l9_9868=l9_9821;
if ((l9_9866==0)||(l9_9866==3))
{
float l9_9869=l9_9865;
float l9_9870=0.0;
float l9_9871=1.0;
bool l9_9872=l9_9867;
float l9_9873=l9_9868;
float l9_9874=fast::clamp(l9_9869,l9_9870,l9_9871);
float l9_9875=step(abs(l9_9869-l9_9874),9.9999997e-06);
l9_9873*=(l9_9875+((1.0-float(l9_9872))*(1.0-l9_9875)));
l9_9869=l9_9874;
l9_9865=l9_9869;
l9_9868=l9_9873;
}
l9_9811.y=l9_9865;
l9_9821=l9_9868;
float2 l9_9876=l9_9811;
int l9_9877=l9_9809;
int l9_9878=l9_9810;
float l9_9879=l9_9819;
float2 l9_9880=l9_9876;
int l9_9881=l9_9877;
int l9_9882=l9_9878;
float3 l9_9883=float3(0.0);
if (l9_9881==0)
{
l9_9883=float3(l9_9880,0.0);
}
else
{
if (l9_9881==1)
{
l9_9883=float3(l9_9880.x,(l9_9880.y*0.5)+(0.5-(float(l9_9882)*0.5)),0.0);
}
else
{
l9_9883=float3(l9_9880,float(l9_9882));
}
}
float3 l9_9884=l9_9883;
float3 l9_9885=l9_9884;
float4 l9_9886=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_9885.xy,bias(l9_9879));
float4 l9_9887=l9_9886;
if (l9_9817)
{
l9_9887=mix(l9_9818,l9_9887,float4(l9_9821));
}
float4 l9_9888=l9_9887;
l9_9802=l9_9888;
l9_9780=l9_9802;
l9_9785=l9_9780;
}
else
{
float2 l9_9889=float2(0.0);
l9_9889=l9_9782.Surface_UVCoord0;
float2 l9_9890=float2(0.0);
float2 l9_9891=(*sc_set0.UserUniforms).patternScaleId01;
l9_9890=l9_9891;
float2 l9_9892=float2(0.0);
l9_9892=((l9_9889-(*sc_set0.UserUniforms).Port_Center_N122)*l9_9890)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_9893=float2(0.0);
float2 l9_9894=(*sc_set0.UserUniforms).patternOffsetId01;
l9_9893=l9_9894;
float2 l9_9895=float2(0.0);
l9_9895=l9_9892+l9_9893;
float l9_9896=0.0;
float l9_9897=(*sc_set0.UserUniforms).patternRotateId01;
l9_9896=l9_9897;
float2 l9_9898=float2(0.0);
float2 l9_9899=l9_9895;
float l9_9900=l9_9896;
float2 l9_9901=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_9902=sin(radians(l9_9900));
float l9_9903=cos(radians(l9_9900));
float2 l9_9904=l9_9899-l9_9901;
l9_9904=float2(dot(float2(l9_9903,l9_9902),l9_9904),dot(float2(-l9_9902,l9_9903),l9_9904))+l9_9901;
l9_9898=l9_9904;
float4 l9_9905=float4(0.0);
int l9_9906;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_9907=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9907=0;
}
else
{
l9_9907=in.varStereoViewID;
}
int l9_9908=l9_9907;
l9_9906=1-l9_9908;
}
else
{
int l9_9909=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_9909=0;
}
else
{
l9_9909=in.varStereoViewID;
}
int l9_9910=l9_9909;
l9_9906=l9_9910;
}
int l9_9911=l9_9906;
int l9_9912=patternTextureId01Layout_tmp;
int l9_9913=l9_9911;
float2 l9_9914=l9_9898;
bool l9_9915=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_9916=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_9917=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_9918=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_9919=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_9920=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_9921=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_9922=0.0;
bool l9_9923=l9_9920&&(!l9_9918);
float l9_9924=1.0;
float l9_9925=l9_9914.x;
int l9_9926=l9_9917.x;
if (l9_9926==1)
{
l9_9925=fract(l9_9925);
}
else
{
if (l9_9926==2)
{
float l9_9927=fract(l9_9925);
float l9_9928=l9_9925-l9_9927;
float l9_9929=step(0.25,fract(l9_9928*0.5));
l9_9925=mix(l9_9927,1.0-l9_9927,fast::clamp(l9_9929,0.0,1.0));
}
}
l9_9914.x=l9_9925;
float l9_9930=l9_9914.y;
int l9_9931=l9_9917.y;
if (l9_9931==1)
{
l9_9930=fract(l9_9930);
}
else
{
if (l9_9931==2)
{
float l9_9932=fract(l9_9930);
float l9_9933=l9_9930-l9_9932;
float l9_9934=step(0.25,fract(l9_9933*0.5));
l9_9930=mix(l9_9932,1.0-l9_9932,fast::clamp(l9_9934,0.0,1.0));
}
}
l9_9914.y=l9_9930;
if (l9_9918)
{
bool l9_9935=l9_9920;
bool l9_9936;
if (l9_9935)
{
l9_9936=l9_9917.x==3;
}
else
{
l9_9936=l9_9935;
}
float l9_9937=l9_9914.x;
float l9_9938=l9_9919.x;
float l9_9939=l9_9919.z;
bool l9_9940=l9_9936;
float l9_9941=l9_9924;
float l9_9942=fast::clamp(l9_9937,l9_9938,l9_9939);
float l9_9943=step(abs(l9_9937-l9_9942),9.9999997e-06);
l9_9941*=(l9_9943+((1.0-float(l9_9940))*(1.0-l9_9943)));
l9_9937=l9_9942;
l9_9914.x=l9_9937;
l9_9924=l9_9941;
bool l9_9944=l9_9920;
bool l9_9945;
if (l9_9944)
{
l9_9945=l9_9917.y==3;
}
else
{
l9_9945=l9_9944;
}
float l9_9946=l9_9914.y;
float l9_9947=l9_9919.y;
float l9_9948=l9_9919.w;
bool l9_9949=l9_9945;
float l9_9950=l9_9924;
float l9_9951=fast::clamp(l9_9946,l9_9947,l9_9948);
float l9_9952=step(abs(l9_9946-l9_9951),9.9999997e-06);
l9_9950*=(l9_9952+((1.0-float(l9_9949))*(1.0-l9_9952)));
l9_9946=l9_9951;
l9_9914.y=l9_9946;
l9_9924=l9_9950;
}
float2 l9_9953=l9_9914;
bool l9_9954=l9_9915;
float3x3 l9_9955=l9_9916;
if (l9_9954)
{
l9_9953=float2((l9_9955*float3(l9_9953,1.0)).xy);
}
float2 l9_9956=l9_9953;
l9_9914=l9_9956;
float l9_9957=l9_9914.x;
int l9_9958=l9_9917.x;
bool l9_9959=l9_9923;
float l9_9960=l9_9924;
if ((l9_9958==0)||(l9_9958==3))
{
float l9_9961=l9_9957;
float l9_9962=0.0;
float l9_9963=1.0;
bool l9_9964=l9_9959;
float l9_9965=l9_9960;
float l9_9966=fast::clamp(l9_9961,l9_9962,l9_9963);
float l9_9967=step(abs(l9_9961-l9_9966),9.9999997e-06);
l9_9965*=(l9_9967+((1.0-float(l9_9964))*(1.0-l9_9967)));
l9_9961=l9_9966;
l9_9957=l9_9961;
l9_9960=l9_9965;
}
l9_9914.x=l9_9957;
l9_9924=l9_9960;
float l9_9968=l9_9914.y;
int l9_9969=l9_9917.y;
bool l9_9970=l9_9923;
float l9_9971=l9_9924;
if ((l9_9969==0)||(l9_9969==3))
{
float l9_9972=l9_9968;
float l9_9973=0.0;
float l9_9974=1.0;
bool l9_9975=l9_9970;
float l9_9976=l9_9971;
float l9_9977=fast::clamp(l9_9972,l9_9973,l9_9974);
float l9_9978=step(abs(l9_9972-l9_9977),9.9999997e-06);
l9_9976*=(l9_9978+((1.0-float(l9_9975))*(1.0-l9_9978)));
l9_9972=l9_9977;
l9_9968=l9_9972;
l9_9971=l9_9976;
}
l9_9914.y=l9_9968;
l9_9924=l9_9971;
float2 l9_9979=l9_9914;
int l9_9980=l9_9912;
int l9_9981=l9_9913;
float l9_9982=l9_9922;
float2 l9_9983=l9_9979;
int l9_9984=l9_9980;
int l9_9985=l9_9981;
float3 l9_9986=float3(0.0);
if (l9_9984==0)
{
l9_9986=float3(l9_9983,0.0);
}
else
{
if (l9_9984==1)
{
l9_9986=float3(l9_9983.x,(l9_9983.y*0.5)+(0.5-(float(l9_9985)*0.5)),0.0);
}
else
{
l9_9986=float3(l9_9983,float(l9_9985));
}
}
float3 l9_9987=l9_9986;
float3 l9_9988=l9_9987;
float4 l9_9989=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_9988.xy,bias(l9_9982));
float4 l9_9990=l9_9989;
if (l9_9920)
{
l9_9990=mix(l9_9921,l9_9990,float4(l9_9924));
}
float4 l9_9991=l9_9990;
l9_9905=l9_9991;
float l9_9992=0.0;
float3 l9_9993=l9_9905.xyz;
float l9_9994=l9_9993.x;
l9_9992=l9_9994;
l9_9781=float4(l9_9992);
l9_9785=l9_9781;
}
l9_9778=l9_9785;
float4 l9_9995=float4(0.0);
l9_9995=l9_9776*l9_9778;
l9_9770=l9_9995;
l9_9775=l9_9770;
}
else
{
float4 l9_9996=float4(0.0);
float4 l9_9997=(*sc_set0.UserUniforms).colorId01;
l9_9996=l9_9997;
float2 l9_9998=float2(0.0);
l9_9998=l9_9772.Surface_UVCoord0;
float4 l9_9999=float4(0.0);
int l9_10000;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_10001=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10001=0;
}
else
{
l9_10001=in.varStereoViewID;
}
int l9_10002=l9_10001;
l9_10000=1-l9_10002;
}
else
{
int l9_10003=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10003=0;
}
else
{
l9_10003=in.varStereoViewID;
}
int l9_10004=l9_10003;
l9_10000=l9_10004;
}
int l9_10005=l9_10000;
int l9_10006=greyMaskIdLayout_tmp;
int l9_10007=l9_10005;
float2 l9_10008=l9_9998;
bool l9_10009=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_10010=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_10011=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_10012=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_10013=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_10014=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_10015=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_10016=0.0;
bool l9_10017=l9_10014&&(!l9_10012);
float l9_10018=1.0;
float l9_10019=l9_10008.x;
int l9_10020=l9_10011.x;
if (l9_10020==1)
{
l9_10019=fract(l9_10019);
}
else
{
if (l9_10020==2)
{
float l9_10021=fract(l9_10019);
float l9_10022=l9_10019-l9_10021;
float l9_10023=step(0.25,fract(l9_10022*0.5));
l9_10019=mix(l9_10021,1.0-l9_10021,fast::clamp(l9_10023,0.0,1.0));
}
}
l9_10008.x=l9_10019;
float l9_10024=l9_10008.y;
int l9_10025=l9_10011.y;
if (l9_10025==1)
{
l9_10024=fract(l9_10024);
}
else
{
if (l9_10025==2)
{
float l9_10026=fract(l9_10024);
float l9_10027=l9_10024-l9_10026;
float l9_10028=step(0.25,fract(l9_10027*0.5));
l9_10024=mix(l9_10026,1.0-l9_10026,fast::clamp(l9_10028,0.0,1.0));
}
}
l9_10008.y=l9_10024;
if (l9_10012)
{
bool l9_10029=l9_10014;
bool l9_10030;
if (l9_10029)
{
l9_10030=l9_10011.x==3;
}
else
{
l9_10030=l9_10029;
}
float l9_10031=l9_10008.x;
float l9_10032=l9_10013.x;
float l9_10033=l9_10013.z;
bool l9_10034=l9_10030;
float l9_10035=l9_10018;
float l9_10036=fast::clamp(l9_10031,l9_10032,l9_10033);
float l9_10037=step(abs(l9_10031-l9_10036),9.9999997e-06);
l9_10035*=(l9_10037+((1.0-float(l9_10034))*(1.0-l9_10037)));
l9_10031=l9_10036;
l9_10008.x=l9_10031;
l9_10018=l9_10035;
bool l9_10038=l9_10014;
bool l9_10039;
if (l9_10038)
{
l9_10039=l9_10011.y==3;
}
else
{
l9_10039=l9_10038;
}
float l9_10040=l9_10008.y;
float l9_10041=l9_10013.y;
float l9_10042=l9_10013.w;
bool l9_10043=l9_10039;
float l9_10044=l9_10018;
float l9_10045=fast::clamp(l9_10040,l9_10041,l9_10042);
float l9_10046=step(abs(l9_10040-l9_10045),9.9999997e-06);
l9_10044*=(l9_10046+((1.0-float(l9_10043))*(1.0-l9_10046)));
l9_10040=l9_10045;
l9_10008.y=l9_10040;
l9_10018=l9_10044;
}
float2 l9_10047=l9_10008;
bool l9_10048=l9_10009;
float3x3 l9_10049=l9_10010;
if (l9_10048)
{
l9_10047=float2((l9_10049*float3(l9_10047,1.0)).xy);
}
float2 l9_10050=l9_10047;
l9_10008=l9_10050;
float l9_10051=l9_10008.x;
int l9_10052=l9_10011.x;
bool l9_10053=l9_10017;
float l9_10054=l9_10018;
if ((l9_10052==0)||(l9_10052==3))
{
float l9_10055=l9_10051;
float l9_10056=0.0;
float l9_10057=1.0;
bool l9_10058=l9_10053;
float l9_10059=l9_10054;
float l9_10060=fast::clamp(l9_10055,l9_10056,l9_10057);
float l9_10061=step(abs(l9_10055-l9_10060),9.9999997e-06);
l9_10059*=(l9_10061+((1.0-float(l9_10058))*(1.0-l9_10061)));
l9_10055=l9_10060;
l9_10051=l9_10055;
l9_10054=l9_10059;
}
l9_10008.x=l9_10051;
l9_10018=l9_10054;
float l9_10062=l9_10008.y;
int l9_10063=l9_10011.y;
bool l9_10064=l9_10017;
float l9_10065=l9_10018;
if ((l9_10063==0)||(l9_10063==3))
{
float l9_10066=l9_10062;
float l9_10067=0.0;
float l9_10068=1.0;
bool l9_10069=l9_10064;
float l9_10070=l9_10065;
float l9_10071=fast::clamp(l9_10066,l9_10067,l9_10068);
float l9_10072=step(abs(l9_10066-l9_10071),9.9999997e-06);
l9_10070*=(l9_10072+((1.0-float(l9_10069))*(1.0-l9_10072)));
l9_10066=l9_10071;
l9_10062=l9_10066;
l9_10065=l9_10070;
}
l9_10008.y=l9_10062;
l9_10018=l9_10065;
float2 l9_10073=l9_10008;
int l9_10074=l9_10006;
int l9_10075=l9_10007;
float l9_10076=l9_10016;
float2 l9_10077=l9_10073;
int l9_10078=l9_10074;
int l9_10079=l9_10075;
float3 l9_10080=float3(0.0);
if (l9_10078==0)
{
l9_10080=float3(l9_10077,0.0);
}
else
{
if (l9_10078==1)
{
l9_10080=float3(l9_10077.x,(l9_10077.y*0.5)+(0.5-(float(l9_10079)*0.5)),0.0);
}
else
{
l9_10080=float3(l9_10077,float(l9_10079));
}
}
float3 l9_10081=l9_10080;
float3 l9_10082=l9_10081;
float4 l9_10083=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_10082.xy,bias(l9_10076));
float4 l9_10084=l9_10083;
if (l9_10014)
{
l9_10084=mix(l9_10015,l9_10084,float4(l9_10018));
}
float4 l9_10085=l9_10084;
l9_9999=l9_10085;
float l9_10086=0.0;
l9_10086=l9_9999.x;
float l9_10087=0.0;
l9_10087=step(l9_10086,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_10088=float4(0.0);
l9_10088=l9_9996*float4(l9_10087);
l9_9771=l9_10088;
l9_9775=l9_9771;
}
l9_9768=l9_9775;
float2 l9_10089=float2(0.0);
l9_10089=l9_9754.Surface_UVCoord0;
float4 l9_10090=float4(0.0);
int l9_10091;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_10092=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10092=0;
}
else
{
l9_10092=in.varStereoViewID;
}
int l9_10093=l9_10092;
l9_10091=1-l9_10093;
}
else
{
int l9_10094=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10094=0;
}
else
{
l9_10094=in.varStereoViewID;
}
int l9_10095=l9_10094;
l9_10091=l9_10095;
}
int l9_10096=l9_10091;
int l9_10097=greyMaskIdLayout_tmp;
int l9_10098=l9_10096;
float2 l9_10099=l9_10089;
bool l9_10100=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_10101=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_10102=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_10103=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_10104=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_10105=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_10106=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_10107=0.0;
bool l9_10108=l9_10105&&(!l9_10103);
float l9_10109=1.0;
float l9_10110=l9_10099.x;
int l9_10111=l9_10102.x;
if (l9_10111==1)
{
l9_10110=fract(l9_10110);
}
else
{
if (l9_10111==2)
{
float l9_10112=fract(l9_10110);
float l9_10113=l9_10110-l9_10112;
float l9_10114=step(0.25,fract(l9_10113*0.5));
l9_10110=mix(l9_10112,1.0-l9_10112,fast::clamp(l9_10114,0.0,1.0));
}
}
l9_10099.x=l9_10110;
float l9_10115=l9_10099.y;
int l9_10116=l9_10102.y;
if (l9_10116==1)
{
l9_10115=fract(l9_10115);
}
else
{
if (l9_10116==2)
{
float l9_10117=fract(l9_10115);
float l9_10118=l9_10115-l9_10117;
float l9_10119=step(0.25,fract(l9_10118*0.5));
l9_10115=mix(l9_10117,1.0-l9_10117,fast::clamp(l9_10119,0.0,1.0));
}
}
l9_10099.y=l9_10115;
if (l9_10103)
{
bool l9_10120=l9_10105;
bool l9_10121;
if (l9_10120)
{
l9_10121=l9_10102.x==3;
}
else
{
l9_10121=l9_10120;
}
float l9_10122=l9_10099.x;
float l9_10123=l9_10104.x;
float l9_10124=l9_10104.z;
bool l9_10125=l9_10121;
float l9_10126=l9_10109;
float l9_10127=fast::clamp(l9_10122,l9_10123,l9_10124);
float l9_10128=step(abs(l9_10122-l9_10127),9.9999997e-06);
l9_10126*=(l9_10128+((1.0-float(l9_10125))*(1.0-l9_10128)));
l9_10122=l9_10127;
l9_10099.x=l9_10122;
l9_10109=l9_10126;
bool l9_10129=l9_10105;
bool l9_10130;
if (l9_10129)
{
l9_10130=l9_10102.y==3;
}
else
{
l9_10130=l9_10129;
}
float l9_10131=l9_10099.y;
float l9_10132=l9_10104.y;
float l9_10133=l9_10104.w;
bool l9_10134=l9_10130;
float l9_10135=l9_10109;
float l9_10136=fast::clamp(l9_10131,l9_10132,l9_10133);
float l9_10137=step(abs(l9_10131-l9_10136),9.9999997e-06);
l9_10135*=(l9_10137+((1.0-float(l9_10134))*(1.0-l9_10137)));
l9_10131=l9_10136;
l9_10099.y=l9_10131;
l9_10109=l9_10135;
}
float2 l9_10138=l9_10099;
bool l9_10139=l9_10100;
float3x3 l9_10140=l9_10101;
if (l9_10139)
{
l9_10138=float2((l9_10140*float3(l9_10138,1.0)).xy);
}
float2 l9_10141=l9_10138;
l9_10099=l9_10141;
float l9_10142=l9_10099.x;
int l9_10143=l9_10102.x;
bool l9_10144=l9_10108;
float l9_10145=l9_10109;
if ((l9_10143==0)||(l9_10143==3))
{
float l9_10146=l9_10142;
float l9_10147=0.0;
float l9_10148=1.0;
bool l9_10149=l9_10144;
float l9_10150=l9_10145;
float l9_10151=fast::clamp(l9_10146,l9_10147,l9_10148);
float l9_10152=step(abs(l9_10146-l9_10151),9.9999997e-06);
l9_10150*=(l9_10152+((1.0-float(l9_10149))*(1.0-l9_10152)));
l9_10146=l9_10151;
l9_10142=l9_10146;
l9_10145=l9_10150;
}
l9_10099.x=l9_10142;
l9_10109=l9_10145;
float l9_10153=l9_10099.y;
int l9_10154=l9_10102.y;
bool l9_10155=l9_10108;
float l9_10156=l9_10109;
if ((l9_10154==0)||(l9_10154==3))
{
float l9_10157=l9_10153;
float l9_10158=0.0;
float l9_10159=1.0;
bool l9_10160=l9_10155;
float l9_10161=l9_10156;
float l9_10162=fast::clamp(l9_10157,l9_10158,l9_10159);
float l9_10163=step(abs(l9_10157-l9_10162),9.9999997e-06);
l9_10161*=(l9_10163+((1.0-float(l9_10160))*(1.0-l9_10163)));
l9_10157=l9_10162;
l9_10153=l9_10157;
l9_10156=l9_10161;
}
l9_10099.y=l9_10153;
l9_10109=l9_10156;
float2 l9_10164=l9_10099;
int l9_10165=l9_10097;
int l9_10166=l9_10098;
float l9_10167=l9_10107;
float2 l9_10168=l9_10164;
int l9_10169=l9_10165;
int l9_10170=l9_10166;
float3 l9_10171=float3(0.0);
if (l9_10169==0)
{
l9_10171=float3(l9_10168,0.0);
}
else
{
if (l9_10169==1)
{
l9_10171=float3(l9_10168.x,(l9_10168.y*0.5)+(0.5-(float(l9_10170)*0.5)),0.0);
}
else
{
l9_10171=float3(l9_10168,float(l9_10170));
}
}
float3 l9_10172=l9_10171;
float3 l9_10173=l9_10172;
float4 l9_10174=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_10173.xy,bias(l9_10167));
float4 l9_10175=l9_10174;
if (l9_10105)
{
l9_10175=mix(l9_10106,l9_10175,float4(l9_10109));
}
float4 l9_10176=l9_10175;
l9_10090=l9_10176;
float l9_10177=0.0;
l9_10177=l9_10090.x;
float l9_10178=0.0;
l9_10178=step(l9_10177,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_10179=float4(0.0);
l9_10179=l9_9768*float4(l9_10178);
float4 l9_10180=float4(0.0);
float4 l9_10181=(*sc_set0.UserUniforms).colorId01;
l9_10180=l9_10181;
float4 l9_10182=float4(0.0);
l9_10182=l9_10180*float4(l9_10178);
float4 l9_10183=float4(0.0);
float4 l9_10184=l9_10179;
float4 l9_10185=l9_10182;
float4 l9_10186=l9_10184;
float4 l9_10187=l9_10185;
float3 l9_10188=l9_10186.xyz*l9_10186.w;
l9_10186=float4(l9_10188.x,l9_10188.y,l9_10188.z,l9_10186.w);
float4 l9_10189=l9_10186+(l9_10187*(1.0-l9_10186.w));
l9_10183=l9_10189;
float4 l9_10190=float4(0.0);
l9_10190=float4(l9_9762)*l9_10183;
float4 l9_10191=float4(0.0);
l9_10191=l9_10190+l9_10183;
l9_9752=l9_10191;
l9_9757=l9_9752;
}
else
{
float4 l9_10192=float4(0.0);
float l9_10193=0.0;
float4 l9_10194=float4(0.0);
float4 l9_10195=float4(0.0);
ssGlobals l9_10196=l9_9754;
float l9_10197=0.0;
float l9_10198=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_10197=l9_10198;
l9_10193=l9_10197;
float4 l9_10199;
if ((l9_10193*1.0)!=0.0)
{
float4 l9_10200=float4(0.0);
float4 l9_10201=(*sc_set0.UserUniforms).patternColorId01;
l9_10200=l9_10201;
float4 l9_10202=float4(0.0);
float l9_10203=0.0;
float4 l9_10204=float4(0.0);
float4 l9_10205=float4(0.0);
ssGlobals l9_10206=l9_10196;
float l9_10207=0.0;
float l9_10208=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_10207=l9_10208;
l9_10203=l9_10207;
float4 l9_10209;
if ((l9_10203*1.0)!=0.0)
{
float2 l9_10210=float2(0.0);
l9_10210=l9_10206.Surface_UVCoord0;
float2 l9_10211=float2(0.0);
float2 l9_10212=(*sc_set0.UserUniforms).patternScaleId01;
l9_10211=l9_10212;
float2 l9_10213=float2(0.0);
l9_10213=((l9_10210-(*sc_set0.UserUniforms).Port_Center_N122)*l9_10211)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_10214=float2(0.0);
float2 l9_10215=(*sc_set0.UserUniforms).patternOffsetId01;
l9_10214=l9_10215;
float2 l9_10216=float2(0.0);
l9_10216=l9_10213+l9_10214;
float l9_10217=0.0;
float l9_10218=(*sc_set0.UserUniforms).patternRotateId01;
l9_10217=l9_10218;
float2 l9_10219=float2(0.0);
float2 l9_10220=l9_10216;
float l9_10221=l9_10217;
float2 l9_10222=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_10223=sin(radians(l9_10221));
float l9_10224=cos(radians(l9_10221));
float2 l9_10225=l9_10220-l9_10222;
l9_10225=float2(dot(float2(l9_10224,l9_10223),l9_10225),dot(float2(-l9_10223,l9_10224),l9_10225))+l9_10222;
l9_10219=l9_10225;
float4 l9_10226=float4(0.0);
int l9_10227;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_10228=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10228=0;
}
else
{
l9_10228=in.varStereoViewID;
}
int l9_10229=l9_10228;
l9_10227=1-l9_10229;
}
else
{
int l9_10230=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10230=0;
}
else
{
l9_10230=in.varStereoViewID;
}
int l9_10231=l9_10230;
l9_10227=l9_10231;
}
int l9_10232=l9_10227;
int l9_10233=patternTextureId01Layout_tmp;
int l9_10234=l9_10232;
float2 l9_10235=l9_10219;
bool l9_10236=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_10237=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_10238=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_10239=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_10240=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_10241=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_10242=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_10243=0.0;
bool l9_10244=l9_10241&&(!l9_10239);
float l9_10245=1.0;
float l9_10246=l9_10235.x;
int l9_10247=l9_10238.x;
if (l9_10247==1)
{
l9_10246=fract(l9_10246);
}
else
{
if (l9_10247==2)
{
float l9_10248=fract(l9_10246);
float l9_10249=l9_10246-l9_10248;
float l9_10250=step(0.25,fract(l9_10249*0.5));
l9_10246=mix(l9_10248,1.0-l9_10248,fast::clamp(l9_10250,0.0,1.0));
}
}
l9_10235.x=l9_10246;
float l9_10251=l9_10235.y;
int l9_10252=l9_10238.y;
if (l9_10252==1)
{
l9_10251=fract(l9_10251);
}
else
{
if (l9_10252==2)
{
float l9_10253=fract(l9_10251);
float l9_10254=l9_10251-l9_10253;
float l9_10255=step(0.25,fract(l9_10254*0.5));
l9_10251=mix(l9_10253,1.0-l9_10253,fast::clamp(l9_10255,0.0,1.0));
}
}
l9_10235.y=l9_10251;
if (l9_10239)
{
bool l9_10256=l9_10241;
bool l9_10257;
if (l9_10256)
{
l9_10257=l9_10238.x==3;
}
else
{
l9_10257=l9_10256;
}
float l9_10258=l9_10235.x;
float l9_10259=l9_10240.x;
float l9_10260=l9_10240.z;
bool l9_10261=l9_10257;
float l9_10262=l9_10245;
float l9_10263=fast::clamp(l9_10258,l9_10259,l9_10260);
float l9_10264=step(abs(l9_10258-l9_10263),9.9999997e-06);
l9_10262*=(l9_10264+((1.0-float(l9_10261))*(1.0-l9_10264)));
l9_10258=l9_10263;
l9_10235.x=l9_10258;
l9_10245=l9_10262;
bool l9_10265=l9_10241;
bool l9_10266;
if (l9_10265)
{
l9_10266=l9_10238.y==3;
}
else
{
l9_10266=l9_10265;
}
float l9_10267=l9_10235.y;
float l9_10268=l9_10240.y;
float l9_10269=l9_10240.w;
bool l9_10270=l9_10266;
float l9_10271=l9_10245;
float l9_10272=fast::clamp(l9_10267,l9_10268,l9_10269);
float l9_10273=step(abs(l9_10267-l9_10272),9.9999997e-06);
l9_10271*=(l9_10273+((1.0-float(l9_10270))*(1.0-l9_10273)));
l9_10267=l9_10272;
l9_10235.y=l9_10267;
l9_10245=l9_10271;
}
float2 l9_10274=l9_10235;
bool l9_10275=l9_10236;
float3x3 l9_10276=l9_10237;
if (l9_10275)
{
l9_10274=float2((l9_10276*float3(l9_10274,1.0)).xy);
}
float2 l9_10277=l9_10274;
l9_10235=l9_10277;
float l9_10278=l9_10235.x;
int l9_10279=l9_10238.x;
bool l9_10280=l9_10244;
float l9_10281=l9_10245;
if ((l9_10279==0)||(l9_10279==3))
{
float l9_10282=l9_10278;
float l9_10283=0.0;
float l9_10284=1.0;
bool l9_10285=l9_10280;
float l9_10286=l9_10281;
float l9_10287=fast::clamp(l9_10282,l9_10283,l9_10284);
float l9_10288=step(abs(l9_10282-l9_10287),9.9999997e-06);
l9_10286*=(l9_10288+((1.0-float(l9_10285))*(1.0-l9_10288)));
l9_10282=l9_10287;
l9_10278=l9_10282;
l9_10281=l9_10286;
}
l9_10235.x=l9_10278;
l9_10245=l9_10281;
float l9_10289=l9_10235.y;
int l9_10290=l9_10238.y;
bool l9_10291=l9_10244;
float l9_10292=l9_10245;
if ((l9_10290==0)||(l9_10290==3))
{
float l9_10293=l9_10289;
float l9_10294=0.0;
float l9_10295=1.0;
bool l9_10296=l9_10291;
float l9_10297=l9_10292;
float l9_10298=fast::clamp(l9_10293,l9_10294,l9_10295);
float l9_10299=step(abs(l9_10293-l9_10298),9.9999997e-06);
l9_10297*=(l9_10299+((1.0-float(l9_10296))*(1.0-l9_10299)));
l9_10293=l9_10298;
l9_10289=l9_10293;
l9_10292=l9_10297;
}
l9_10235.y=l9_10289;
l9_10245=l9_10292;
float2 l9_10300=l9_10235;
int l9_10301=l9_10233;
int l9_10302=l9_10234;
float l9_10303=l9_10243;
float2 l9_10304=l9_10300;
int l9_10305=l9_10301;
int l9_10306=l9_10302;
float3 l9_10307=float3(0.0);
if (l9_10305==0)
{
l9_10307=float3(l9_10304,0.0);
}
else
{
if (l9_10305==1)
{
l9_10307=float3(l9_10304.x,(l9_10304.y*0.5)+(0.5-(float(l9_10306)*0.5)),0.0);
}
else
{
l9_10307=float3(l9_10304,float(l9_10306));
}
}
float3 l9_10308=l9_10307;
float3 l9_10309=l9_10308;
float4 l9_10310=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_10309.xy,bias(l9_10303));
float4 l9_10311=l9_10310;
if (l9_10241)
{
l9_10311=mix(l9_10242,l9_10311,float4(l9_10245));
}
float4 l9_10312=l9_10311;
l9_10226=l9_10312;
l9_10204=l9_10226;
l9_10209=l9_10204;
}
else
{
float2 l9_10313=float2(0.0);
l9_10313=l9_10206.Surface_UVCoord0;
float2 l9_10314=float2(0.0);
float2 l9_10315=(*sc_set0.UserUniforms).patternScaleId01;
l9_10314=l9_10315;
float2 l9_10316=float2(0.0);
l9_10316=((l9_10313-(*sc_set0.UserUniforms).Port_Center_N122)*l9_10314)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_10317=float2(0.0);
float2 l9_10318=(*sc_set0.UserUniforms).patternOffsetId01;
l9_10317=l9_10318;
float2 l9_10319=float2(0.0);
l9_10319=l9_10316+l9_10317;
float l9_10320=0.0;
float l9_10321=(*sc_set0.UserUniforms).patternRotateId01;
l9_10320=l9_10321;
float2 l9_10322=float2(0.0);
float2 l9_10323=l9_10319;
float l9_10324=l9_10320;
float2 l9_10325=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_10326=sin(radians(l9_10324));
float l9_10327=cos(radians(l9_10324));
float2 l9_10328=l9_10323-l9_10325;
l9_10328=float2(dot(float2(l9_10327,l9_10326),l9_10328),dot(float2(-l9_10326,l9_10327),l9_10328))+l9_10325;
l9_10322=l9_10328;
float4 l9_10329=float4(0.0);
int l9_10330;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_10331=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10331=0;
}
else
{
l9_10331=in.varStereoViewID;
}
int l9_10332=l9_10331;
l9_10330=1-l9_10332;
}
else
{
int l9_10333=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10333=0;
}
else
{
l9_10333=in.varStereoViewID;
}
int l9_10334=l9_10333;
l9_10330=l9_10334;
}
int l9_10335=l9_10330;
int l9_10336=patternTextureId01Layout_tmp;
int l9_10337=l9_10335;
float2 l9_10338=l9_10322;
bool l9_10339=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_10340=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_10341=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_10342=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_10343=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_10344=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_10345=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_10346=0.0;
bool l9_10347=l9_10344&&(!l9_10342);
float l9_10348=1.0;
float l9_10349=l9_10338.x;
int l9_10350=l9_10341.x;
if (l9_10350==1)
{
l9_10349=fract(l9_10349);
}
else
{
if (l9_10350==2)
{
float l9_10351=fract(l9_10349);
float l9_10352=l9_10349-l9_10351;
float l9_10353=step(0.25,fract(l9_10352*0.5));
l9_10349=mix(l9_10351,1.0-l9_10351,fast::clamp(l9_10353,0.0,1.0));
}
}
l9_10338.x=l9_10349;
float l9_10354=l9_10338.y;
int l9_10355=l9_10341.y;
if (l9_10355==1)
{
l9_10354=fract(l9_10354);
}
else
{
if (l9_10355==2)
{
float l9_10356=fract(l9_10354);
float l9_10357=l9_10354-l9_10356;
float l9_10358=step(0.25,fract(l9_10357*0.5));
l9_10354=mix(l9_10356,1.0-l9_10356,fast::clamp(l9_10358,0.0,1.0));
}
}
l9_10338.y=l9_10354;
if (l9_10342)
{
bool l9_10359=l9_10344;
bool l9_10360;
if (l9_10359)
{
l9_10360=l9_10341.x==3;
}
else
{
l9_10360=l9_10359;
}
float l9_10361=l9_10338.x;
float l9_10362=l9_10343.x;
float l9_10363=l9_10343.z;
bool l9_10364=l9_10360;
float l9_10365=l9_10348;
float l9_10366=fast::clamp(l9_10361,l9_10362,l9_10363);
float l9_10367=step(abs(l9_10361-l9_10366),9.9999997e-06);
l9_10365*=(l9_10367+((1.0-float(l9_10364))*(1.0-l9_10367)));
l9_10361=l9_10366;
l9_10338.x=l9_10361;
l9_10348=l9_10365;
bool l9_10368=l9_10344;
bool l9_10369;
if (l9_10368)
{
l9_10369=l9_10341.y==3;
}
else
{
l9_10369=l9_10368;
}
float l9_10370=l9_10338.y;
float l9_10371=l9_10343.y;
float l9_10372=l9_10343.w;
bool l9_10373=l9_10369;
float l9_10374=l9_10348;
float l9_10375=fast::clamp(l9_10370,l9_10371,l9_10372);
float l9_10376=step(abs(l9_10370-l9_10375),9.9999997e-06);
l9_10374*=(l9_10376+((1.0-float(l9_10373))*(1.0-l9_10376)));
l9_10370=l9_10375;
l9_10338.y=l9_10370;
l9_10348=l9_10374;
}
float2 l9_10377=l9_10338;
bool l9_10378=l9_10339;
float3x3 l9_10379=l9_10340;
if (l9_10378)
{
l9_10377=float2((l9_10379*float3(l9_10377,1.0)).xy);
}
float2 l9_10380=l9_10377;
l9_10338=l9_10380;
float l9_10381=l9_10338.x;
int l9_10382=l9_10341.x;
bool l9_10383=l9_10347;
float l9_10384=l9_10348;
if ((l9_10382==0)||(l9_10382==3))
{
float l9_10385=l9_10381;
float l9_10386=0.0;
float l9_10387=1.0;
bool l9_10388=l9_10383;
float l9_10389=l9_10384;
float l9_10390=fast::clamp(l9_10385,l9_10386,l9_10387);
float l9_10391=step(abs(l9_10385-l9_10390),9.9999997e-06);
l9_10389*=(l9_10391+((1.0-float(l9_10388))*(1.0-l9_10391)));
l9_10385=l9_10390;
l9_10381=l9_10385;
l9_10384=l9_10389;
}
l9_10338.x=l9_10381;
l9_10348=l9_10384;
float l9_10392=l9_10338.y;
int l9_10393=l9_10341.y;
bool l9_10394=l9_10347;
float l9_10395=l9_10348;
if ((l9_10393==0)||(l9_10393==3))
{
float l9_10396=l9_10392;
float l9_10397=0.0;
float l9_10398=1.0;
bool l9_10399=l9_10394;
float l9_10400=l9_10395;
float l9_10401=fast::clamp(l9_10396,l9_10397,l9_10398);
float l9_10402=step(abs(l9_10396-l9_10401),9.9999997e-06);
l9_10400*=(l9_10402+((1.0-float(l9_10399))*(1.0-l9_10402)));
l9_10396=l9_10401;
l9_10392=l9_10396;
l9_10395=l9_10400;
}
l9_10338.y=l9_10392;
l9_10348=l9_10395;
float2 l9_10403=l9_10338;
int l9_10404=l9_10336;
int l9_10405=l9_10337;
float l9_10406=l9_10346;
float2 l9_10407=l9_10403;
int l9_10408=l9_10404;
int l9_10409=l9_10405;
float3 l9_10410=float3(0.0);
if (l9_10408==0)
{
l9_10410=float3(l9_10407,0.0);
}
else
{
if (l9_10408==1)
{
l9_10410=float3(l9_10407.x,(l9_10407.y*0.5)+(0.5-(float(l9_10409)*0.5)),0.0);
}
else
{
l9_10410=float3(l9_10407,float(l9_10409));
}
}
float3 l9_10411=l9_10410;
float3 l9_10412=l9_10411;
float4 l9_10413=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_10412.xy,bias(l9_10406));
float4 l9_10414=l9_10413;
if (l9_10344)
{
l9_10414=mix(l9_10345,l9_10414,float4(l9_10348));
}
float4 l9_10415=l9_10414;
l9_10329=l9_10415;
float l9_10416=0.0;
float3 l9_10417=l9_10329.xyz;
float l9_10418=l9_10417.x;
l9_10416=l9_10418;
l9_10205=float4(l9_10416);
l9_10209=l9_10205;
}
l9_10202=l9_10209;
float4 l9_10419=float4(0.0);
l9_10419=l9_10200*l9_10202;
l9_10194=l9_10419;
l9_10199=l9_10194;
}
else
{
float4 l9_10420=float4(0.0);
float4 l9_10421=(*sc_set0.UserUniforms).colorId01;
l9_10420=l9_10421;
float2 l9_10422=float2(0.0);
l9_10422=l9_10196.Surface_UVCoord0;
float4 l9_10423=float4(0.0);
int l9_10424;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_10425=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10425=0;
}
else
{
l9_10425=in.varStereoViewID;
}
int l9_10426=l9_10425;
l9_10424=1-l9_10426;
}
else
{
int l9_10427=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10427=0;
}
else
{
l9_10427=in.varStereoViewID;
}
int l9_10428=l9_10427;
l9_10424=l9_10428;
}
int l9_10429=l9_10424;
int l9_10430=greyMaskIdLayout_tmp;
int l9_10431=l9_10429;
float2 l9_10432=l9_10422;
bool l9_10433=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_10434=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_10435=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_10436=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_10437=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_10438=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_10439=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_10440=0.0;
bool l9_10441=l9_10438&&(!l9_10436);
float l9_10442=1.0;
float l9_10443=l9_10432.x;
int l9_10444=l9_10435.x;
if (l9_10444==1)
{
l9_10443=fract(l9_10443);
}
else
{
if (l9_10444==2)
{
float l9_10445=fract(l9_10443);
float l9_10446=l9_10443-l9_10445;
float l9_10447=step(0.25,fract(l9_10446*0.5));
l9_10443=mix(l9_10445,1.0-l9_10445,fast::clamp(l9_10447,0.0,1.0));
}
}
l9_10432.x=l9_10443;
float l9_10448=l9_10432.y;
int l9_10449=l9_10435.y;
if (l9_10449==1)
{
l9_10448=fract(l9_10448);
}
else
{
if (l9_10449==2)
{
float l9_10450=fract(l9_10448);
float l9_10451=l9_10448-l9_10450;
float l9_10452=step(0.25,fract(l9_10451*0.5));
l9_10448=mix(l9_10450,1.0-l9_10450,fast::clamp(l9_10452,0.0,1.0));
}
}
l9_10432.y=l9_10448;
if (l9_10436)
{
bool l9_10453=l9_10438;
bool l9_10454;
if (l9_10453)
{
l9_10454=l9_10435.x==3;
}
else
{
l9_10454=l9_10453;
}
float l9_10455=l9_10432.x;
float l9_10456=l9_10437.x;
float l9_10457=l9_10437.z;
bool l9_10458=l9_10454;
float l9_10459=l9_10442;
float l9_10460=fast::clamp(l9_10455,l9_10456,l9_10457);
float l9_10461=step(abs(l9_10455-l9_10460),9.9999997e-06);
l9_10459*=(l9_10461+((1.0-float(l9_10458))*(1.0-l9_10461)));
l9_10455=l9_10460;
l9_10432.x=l9_10455;
l9_10442=l9_10459;
bool l9_10462=l9_10438;
bool l9_10463;
if (l9_10462)
{
l9_10463=l9_10435.y==3;
}
else
{
l9_10463=l9_10462;
}
float l9_10464=l9_10432.y;
float l9_10465=l9_10437.y;
float l9_10466=l9_10437.w;
bool l9_10467=l9_10463;
float l9_10468=l9_10442;
float l9_10469=fast::clamp(l9_10464,l9_10465,l9_10466);
float l9_10470=step(abs(l9_10464-l9_10469),9.9999997e-06);
l9_10468*=(l9_10470+((1.0-float(l9_10467))*(1.0-l9_10470)));
l9_10464=l9_10469;
l9_10432.y=l9_10464;
l9_10442=l9_10468;
}
float2 l9_10471=l9_10432;
bool l9_10472=l9_10433;
float3x3 l9_10473=l9_10434;
if (l9_10472)
{
l9_10471=float2((l9_10473*float3(l9_10471,1.0)).xy);
}
float2 l9_10474=l9_10471;
l9_10432=l9_10474;
float l9_10475=l9_10432.x;
int l9_10476=l9_10435.x;
bool l9_10477=l9_10441;
float l9_10478=l9_10442;
if ((l9_10476==0)||(l9_10476==3))
{
float l9_10479=l9_10475;
float l9_10480=0.0;
float l9_10481=1.0;
bool l9_10482=l9_10477;
float l9_10483=l9_10478;
float l9_10484=fast::clamp(l9_10479,l9_10480,l9_10481);
float l9_10485=step(abs(l9_10479-l9_10484),9.9999997e-06);
l9_10483*=(l9_10485+((1.0-float(l9_10482))*(1.0-l9_10485)));
l9_10479=l9_10484;
l9_10475=l9_10479;
l9_10478=l9_10483;
}
l9_10432.x=l9_10475;
l9_10442=l9_10478;
float l9_10486=l9_10432.y;
int l9_10487=l9_10435.y;
bool l9_10488=l9_10441;
float l9_10489=l9_10442;
if ((l9_10487==0)||(l9_10487==3))
{
float l9_10490=l9_10486;
float l9_10491=0.0;
float l9_10492=1.0;
bool l9_10493=l9_10488;
float l9_10494=l9_10489;
float l9_10495=fast::clamp(l9_10490,l9_10491,l9_10492);
float l9_10496=step(abs(l9_10490-l9_10495),9.9999997e-06);
l9_10494*=(l9_10496+((1.0-float(l9_10493))*(1.0-l9_10496)));
l9_10490=l9_10495;
l9_10486=l9_10490;
l9_10489=l9_10494;
}
l9_10432.y=l9_10486;
l9_10442=l9_10489;
float2 l9_10497=l9_10432;
int l9_10498=l9_10430;
int l9_10499=l9_10431;
float l9_10500=l9_10440;
float2 l9_10501=l9_10497;
int l9_10502=l9_10498;
int l9_10503=l9_10499;
float3 l9_10504=float3(0.0);
if (l9_10502==0)
{
l9_10504=float3(l9_10501,0.0);
}
else
{
if (l9_10502==1)
{
l9_10504=float3(l9_10501.x,(l9_10501.y*0.5)+(0.5-(float(l9_10503)*0.5)),0.0);
}
else
{
l9_10504=float3(l9_10501,float(l9_10503));
}
}
float3 l9_10505=l9_10504;
float3 l9_10506=l9_10505;
float4 l9_10507=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_10506.xy,bias(l9_10500));
float4 l9_10508=l9_10507;
if (l9_10438)
{
l9_10508=mix(l9_10439,l9_10508,float4(l9_10442));
}
float4 l9_10509=l9_10508;
l9_10423=l9_10509;
float l9_10510=0.0;
l9_10510=l9_10423.x;
float l9_10511=0.0;
l9_10511=step(l9_10510,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_10512=float4(0.0);
l9_10512=l9_10420*float4(l9_10511);
l9_10195=l9_10512;
l9_10199=l9_10195;
}
l9_10192=l9_10199;
float2 l9_10513=float2(0.0);
l9_10513=l9_9754.Surface_UVCoord0;
float4 l9_10514=float4(0.0);
int l9_10515;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_10516=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10516=0;
}
else
{
l9_10516=in.varStereoViewID;
}
int l9_10517=l9_10516;
l9_10515=1-l9_10517;
}
else
{
int l9_10518=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10518=0;
}
else
{
l9_10518=in.varStereoViewID;
}
int l9_10519=l9_10518;
l9_10515=l9_10519;
}
int l9_10520=l9_10515;
int l9_10521=greyMaskIdLayout_tmp;
int l9_10522=l9_10520;
float2 l9_10523=l9_10513;
bool l9_10524=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_10525=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_10526=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_10527=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_10528=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_10529=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_10530=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_10531=0.0;
bool l9_10532=l9_10529&&(!l9_10527);
float l9_10533=1.0;
float l9_10534=l9_10523.x;
int l9_10535=l9_10526.x;
if (l9_10535==1)
{
l9_10534=fract(l9_10534);
}
else
{
if (l9_10535==2)
{
float l9_10536=fract(l9_10534);
float l9_10537=l9_10534-l9_10536;
float l9_10538=step(0.25,fract(l9_10537*0.5));
l9_10534=mix(l9_10536,1.0-l9_10536,fast::clamp(l9_10538,0.0,1.0));
}
}
l9_10523.x=l9_10534;
float l9_10539=l9_10523.y;
int l9_10540=l9_10526.y;
if (l9_10540==1)
{
l9_10539=fract(l9_10539);
}
else
{
if (l9_10540==2)
{
float l9_10541=fract(l9_10539);
float l9_10542=l9_10539-l9_10541;
float l9_10543=step(0.25,fract(l9_10542*0.5));
l9_10539=mix(l9_10541,1.0-l9_10541,fast::clamp(l9_10543,0.0,1.0));
}
}
l9_10523.y=l9_10539;
if (l9_10527)
{
bool l9_10544=l9_10529;
bool l9_10545;
if (l9_10544)
{
l9_10545=l9_10526.x==3;
}
else
{
l9_10545=l9_10544;
}
float l9_10546=l9_10523.x;
float l9_10547=l9_10528.x;
float l9_10548=l9_10528.z;
bool l9_10549=l9_10545;
float l9_10550=l9_10533;
float l9_10551=fast::clamp(l9_10546,l9_10547,l9_10548);
float l9_10552=step(abs(l9_10546-l9_10551),9.9999997e-06);
l9_10550*=(l9_10552+((1.0-float(l9_10549))*(1.0-l9_10552)));
l9_10546=l9_10551;
l9_10523.x=l9_10546;
l9_10533=l9_10550;
bool l9_10553=l9_10529;
bool l9_10554;
if (l9_10553)
{
l9_10554=l9_10526.y==3;
}
else
{
l9_10554=l9_10553;
}
float l9_10555=l9_10523.y;
float l9_10556=l9_10528.y;
float l9_10557=l9_10528.w;
bool l9_10558=l9_10554;
float l9_10559=l9_10533;
float l9_10560=fast::clamp(l9_10555,l9_10556,l9_10557);
float l9_10561=step(abs(l9_10555-l9_10560),9.9999997e-06);
l9_10559*=(l9_10561+((1.0-float(l9_10558))*(1.0-l9_10561)));
l9_10555=l9_10560;
l9_10523.y=l9_10555;
l9_10533=l9_10559;
}
float2 l9_10562=l9_10523;
bool l9_10563=l9_10524;
float3x3 l9_10564=l9_10525;
if (l9_10563)
{
l9_10562=float2((l9_10564*float3(l9_10562,1.0)).xy);
}
float2 l9_10565=l9_10562;
l9_10523=l9_10565;
float l9_10566=l9_10523.x;
int l9_10567=l9_10526.x;
bool l9_10568=l9_10532;
float l9_10569=l9_10533;
if ((l9_10567==0)||(l9_10567==3))
{
float l9_10570=l9_10566;
float l9_10571=0.0;
float l9_10572=1.0;
bool l9_10573=l9_10568;
float l9_10574=l9_10569;
float l9_10575=fast::clamp(l9_10570,l9_10571,l9_10572);
float l9_10576=step(abs(l9_10570-l9_10575),9.9999997e-06);
l9_10574*=(l9_10576+((1.0-float(l9_10573))*(1.0-l9_10576)));
l9_10570=l9_10575;
l9_10566=l9_10570;
l9_10569=l9_10574;
}
l9_10523.x=l9_10566;
l9_10533=l9_10569;
float l9_10577=l9_10523.y;
int l9_10578=l9_10526.y;
bool l9_10579=l9_10532;
float l9_10580=l9_10533;
if ((l9_10578==0)||(l9_10578==3))
{
float l9_10581=l9_10577;
float l9_10582=0.0;
float l9_10583=1.0;
bool l9_10584=l9_10579;
float l9_10585=l9_10580;
float l9_10586=fast::clamp(l9_10581,l9_10582,l9_10583);
float l9_10587=step(abs(l9_10581-l9_10586),9.9999997e-06);
l9_10585*=(l9_10587+((1.0-float(l9_10584))*(1.0-l9_10587)));
l9_10581=l9_10586;
l9_10577=l9_10581;
l9_10580=l9_10585;
}
l9_10523.y=l9_10577;
l9_10533=l9_10580;
float2 l9_10588=l9_10523;
int l9_10589=l9_10521;
int l9_10590=l9_10522;
float l9_10591=l9_10531;
float2 l9_10592=l9_10588;
int l9_10593=l9_10589;
int l9_10594=l9_10590;
float3 l9_10595=float3(0.0);
if (l9_10593==0)
{
l9_10595=float3(l9_10592,0.0);
}
else
{
if (l9_10593==1)
{
l9_10595=float3(l9_10592.x,(l9_10592.y*0.5)+(0.5-(float(l9_10594)*0.5)),0.0);
}
else
{
l9_10595=float3(l9_10592,float(l9_10594));
}
}
float3 l9_10596=l9_10595;
float3 l9_10597=l9_10596;
float4 l9_10598=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_10597.xy,bias(l9_10591));
float4 l9_10599=l9_10598;
if (l9_10529)
{
l9_10599=mix(l9_10530,l9_10599,float4(l9_10533));
}
float4 l9_10600=l9_10599;
l9_10514=l9_10600;
float l9_10601=0.0;
l9_10601=l9_10514.x;
float l9_10602=0.0;
l9_10602=step(l9_10601,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_10603=float4(0.0);
l9_10603=l9_10192*float4(l9_10602);
float4 l9_10604=float4(0.0);
float4 l9_10605=(*sc_set0.UserUniforms).colorId01;
l9_10604=l9_10605;
float4 l9_10606=float4(0.0);
l9_10606=l9_10604*float4(l9_10602);
float4 l9_10607=float4(0.0);
float4 l9_10608=l9_10603;
float4 l9_10609=l9_10606;
float4 l9_10610=l9_10608;
float4 l9_10611=l9_10609;
float3 l9_10612=l9_10610.xyz*l9_10610.w;
l9_10610=float4(l9_10612.x,l9_10612.y,l9_10612.z,l9_10610.w);
float4 l9_10613=l9_10610+(l9_10611*(1.0-l9_10610.w));
l9_10607=l9_10613;
l9_9753=l9_10607;
l9_9757=l9_9753;
}
l9_9750=l9_9757;
float l9_10614=0.0;
float l9_10615=(*sc_set0.UserUniforms).metallicId01;
l9_10614=l9_10615;
float l9_10616=0.0;
float l9_10617=(*sc_set0.UserUniforms).rougnessId01;
l9_10616=l9_10617;
float4 l9_10618=float4(0.0);
float3 l9_10619=l9_9750.xyz;
float l9_10620=(*sc_set0.UserUniforms).Port_Opacity_N152;
float3 l9_10621=(*sc_set0.UserUniforms).Port_Emissive_N152;
float l9_10622=l9_10614;
float l9_10623=l9_10616;
float3 l9_10624=(*sc_set0.UserUniforms).Port_AO_N152;
float3 l9_10625=(*sc_set0.UserUniforms).Port_SpecularAO_N152;
ssGlobals l9_10626=l9_9746;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_10626.BumpedNormal=l9_10626.VertexNormal_WorldSpace;
}
float l9_10627=l9_10620;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_10627<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_10628=gl_FragCoord;
float2 l9_10629=floor(mod(l9_10628.xy,float2(4.0)));
float l9_10630=(mod(dot(l9_10629,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_10627<l9_10630)
{
discard_fragment();
}
}
l9_10619=fast::max(l9_10619,float3(0.0));
float4 l9_10631;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_10631=float4(l9_10619,l9_10620);
}
else
{
l9_10622=fast::clamp(l9_10622,0.0,1.0);
l9_10623=fast::clamp(l9_10623,0.0,1.0);
float3 l9_10632=l9_10619;
float l9_10633=l9_10620;
float3 l9_10634=l9_10626.BumpedNormal;
float3 l9_10635=l9_10626.PositionWS;
float3 l9_10636=l9_10626.ViewDirWS;
float3 l9_10637=l9_10621;
float l9_10638=l9_10622;
float l9_10639=l9_10623;
float3 l9_10640=l9_10624;
float3 l9_10641=l9_10625;
l9_10631=ngsCalculateLighting(l9_10632,l9_10633,l9_10634,l9_10635,l9_10636,l9_10637,l9_10638,l9_10639,l9_10640,l9_10641,in.varStereoViewID,sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_RayTracingReflections,sc_set0.sc_RayTracingReflectionsSmpSC,sc_set0.sc_RayTracingGlobalIllumination,sc_set0.sc_RayTracingGlobalIlluminationSmpSC,sc_set0.sc_RayTracingShadows,sc_set0.sc_RayTracingShadowsSmpSC,gl_FragCoord,(*sc_set0.UserUniforms),in.varShadowTex,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,out.sc_FragData0,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
l9_10631=fast::max(l9_10631,float4(0.0));
l9_10618=l9_10631;
l9_9744=l9_10618;
l9_9749=l9_9744;
}
else
{
float4 l9_10642=float4(0.0);
float l9_10643=0.0;
float4 l9_10644=float4(0.0);
float4 l9_10645=float4(0.0);
ssGlobals l9_10646=l9_9746;
float l9_10647=0.0;
float l9_10648=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_10647=l9_10648;
l9_10643=l9_10647;
float4 l9_10649;
if ((l9_10643*1.0)!=0.0)
{
float l9_10650=0.0;
float l9_10651=(*sc_set0.UserUniforms).rimExpId01;
l9_10650=l9_10651;
float l9_10652=0.0;
float l9_10653=(*sc_set0.UserUniforms).rimIntId01;
l9_10652=l9_10653;
float l9_10654=0.0;
float l9_10655=l9_10650;
float l9_10656=l9_10652;
ssGlobals l9_10657=l9_10646;
float l9_10658=abs(dot(-l9_10657.ViewDirWS,l9_10657.VertexNormal_WorldSpace));
float l9_10659=1.0-pow(1.0-l9_10658,l9_10655);
l9_10659=fast::max(l9_10659,0.0);
l9_10659*=l9_10656;
l9_10654=l9_10659;
float4 l9_10660=float4(0.0);
float l9_10661=0.0;
float4 l9_10662=float4(0.0);
float4 l9_10663=float4(0.0);
ssGlobals l9_10664=l9_10646;
float l9_10665=0.0;
float l9_10666=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_10665=l9_10666;
l9_10661=l9_10665;
float4 l9_10667;
if ((l9_10661*1.0)!=0.0)
{
float4 l9_10668=float4(0.0);
float4 l9_10669=(*sc_set0.UserUniforms).patternColorId01;
l9_10668=l9_10669;
float4 l9_10670=float4(0.0);
float l9_10671=0.0;
float4 l9_10672=float4(0.0);
float4 l9_10673=float4(0.0);
ssGlobals l9_10674=l9_10664;
float l9_10675=0.0;
float l9_10676=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_10675=l9_10676;
l9_10671=l9_10675;
float4 l9_10677;
if ((l9_10671*1.0)!=0.0)
{
float2 l9_10678=float2(0.0);
l9_10678=l9_10674.Surface_UVCoord0;
float2 l9_10679=float2(0.0);
float2 l9_10680=(*sc_set0.UserUniforms).patternScaleId01;
l9_10679=l9_10680;
float2 l9_10681=float2(0.0);
l9_10681=((l9_10678-(*sc_set0.UserUniforms).Port_Center_N122)*l9_10679)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_10682=float2(0.0);
float2 l9_10683=(*sc_set0.UserUniforms).patternOffsetId01;
l9_10682=l9_10683;
float2 l9_10684=float2(0.0);
l9_10684=l9_10681+l9_10682;
float l9_10685=0.0;
float l9_10686=(*sc_set0.UserUniforms).patternRotateId01;
l9_10685=l9_10686;
float2 l9_10687=float2(0.0);
float2 l9_10688=l9_10684;
float l9_10689=l9_10685;
float2 l9_10690=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_10691=sin(radians(l9_10689));
float l9_10692=cos(radians(l9_10689));
float2 l9_10693=l9_10688-l9_10690;
l9_10693=float2(dot(float2(l9_10692,l9_10691),l9_10693),dot(float2(-l9_10691,l9_10692),l9_10693))+l9_10690;
l9_10687=l9_10693;
float4 l9_10694=float4(0.0);
int l9_10695;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_10696=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10696=0;
}
else
{
l9_10696=in.varStereoViewID;
}
int l9_10697=l9_10696;
l9_10695=1-l9_10697;
}
else
{
int l9_10698=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10698=0;
}
else
{
l9_10698=in.varStereoViewID;
}
int l9_10699=l9_10698;
l9_10695=l9_10699;
}
int l9_10700=l9_10695;
int l9_10701=patternTextureId01Layout_tmp;
int l9_10702=l9_10700;
float2 l9_10703=l9_10687;
bool l9_10704=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_10705=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_10706=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_10707=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_10708=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_10709=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_10710=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_10711=0.0;
bool l9_10712=l9_10709&&(!l9_10707);
float l9_10713=1.0;
float l9_10714=l9_10703.x;
int l9_10715=l9_10706.x;
if (l9_10715==1)
{
l9_10714=fract(l9_10714);
}
else
{
if (l9_10715==2)
{
float l9_10716=fract(l9_10714);
float l9_10717=l9_10714-l9_10716;
float l9_10718=step(0.25,fract(l9_10717*0.5));
l9_10714=mix(l9_10716,1.0-l9_10716,fast::clamp(l9_10718,0.0,1.0));
}
}
l9_10703.x=l9_10714;
float l9_10719=l9_10703.y;
int l9_10720=l9_10706.y;
if (l9_10720==1)
{
l9_10719=fract(l9_10719);
}
else
{
if (l9_10720==2)
{
float l9_10721=fract(l9_10719);
float l9_10722=l9_10719-l9_10721;
float l9_10723=step(0.25,fract(l9_10722*0.5));
l9_10719=mix(l9_10721,1.0-l9_10721,fast::clamp(l9_10723,0.0,1.0));
}
}
l9_10703.y=l9_10719;
if (l9_10707)
{
bool l9_10724=l9_10709;
bool l9_10725;
if (l9_10724)
{
l9_10725=l9_10706.x==3;
}
else
{
l9_10725=l9_10724;
}
float l9_10726=l9_10703.x;
float l9_10727=l9_10708.x;
float l9_10728=l9_10708.z;
bool l9_10729=l9_10725;
float l9_10730=l9_10713;
float l9_10731=fast::clamp(l9_10726,l9_10727,l9_10728);
float l9_10732=step(abs(l9_10726-l9_10731),9.9999997e-06);
l9_10730*=(l9_10732+((1.0-float(l9_10729))*(1.0-l9_10732)));
l9_10726=l9_10731;
l9_10703.x=l9_10726;
l9_10713=l9_10730;
bool l9_10733=l9_10709;
bool l9_10734;
if (l9_10733)
{
l9_10734=l9_10706.y==3;
}
else
{
l9_10734=l9_10733;
}
float l9_10735=l9_10703.y;
float l9_10736=l9_10708.y;
float l9_10737=l9_10708.w;
bool l9_10738=l9_10734;
float l9_10739=l9_10713;
float l9_10740=fast::clamp(l9_10735,l9_10736,l9_10737);
float l9_10741=step(abs(l9_10735-l9_10740),9.9999997e-06);
l9_10739*=(l9_10741+((1.0-float(l9_10738))*(1.0-l9_10741)));
l9_10735=l9_10740;
l9_10703.y=l9_10735;
l9_10713=l9_10739;
}
float2 l9_10742=l9_10703;
bool l9_10743=l9_10704;
float3x3 l9_10744=l9_10705;
if (l9_10743)
{
l9_10742=float2((l9_10744*float3(l9_10742,1.0)).xy);
}
float2 l9_10745=l9_10742;
l9_10703=l9_10745;
float l9_10746=l9_10703.x;
int l9_10747=l9_10706.x;
bool l9_10748=l9_10712;
float l9_10749=l9_10713;
if ((l9_10747==0)||(l9_10747==3))
{
float l9_10750=l9_10746;
float l9_10751=0.0;
float l9_10752=1.0;
bool l9_10753=l9_10748;
float l9_10754=l9_10749;
float l9_10755=fast::clamp(l9_10750,l9_10751,l9_10752);
float l9_10756=step(abs(l9_10750-l9_10755),9.9999997e-06);
l9_10754*=(l9_10756+((1.0-float(l9_10753))*(1.0-l9_10756)));
l9_10750=l9_10755;
l9_10746=l9_10750;
l9_10749=l9_10754;
}
l9_10703.x=l9_10746;
l9_10713=l9_10749;
float l9_10757=l9_10703.y;
int l9_10758=l9_10706.y;
bool l9_10759=l9_10712;
float l9_10760=l9_10713;
if ((l9_10758==0)||(l9_10758==3))
{
float l9_10761=l9_10757;
float l9_10762=0.0;
float l9_10763=1.0;
bool l9_10764=l9_10759;
float l9_10765=l9_10760;
float l9_10766=fast::clamp(l9_10761,l9_10762,l9_10763);
float l9_10767=step(abs(l9_10761-l9_10766),9.9999997e-06);
l9_10765*=(l9_10767+((1.0-float(l9_10764))*(1.0-l9_10767)));
l9_10761=l9_10766;
l9_10757=l9_10761;
l9_10760=l9_10765;
}
l9_10703.y=l9_10757;
l9_10713=l9_10760;
float2 l9_10768=l9_10703;
int l9_10769=l9_10701;
int l9_10770=l9_10702;
float l9_10771=l9_10711;
float2 l9_10772=l9_10768;
int l9_10773=l9_10769;
int l9_10774=l9_10770;
float3 l9_10775=float3(0.0);
if (l9_10773==0)
{
l9_10775=float3(l9_10772,0.0);
}
else
{
if (l9_10773==1)
{
l9_10775=float3(l9_10772.x,(l9_10772.y*0.5)+(0.5-(float(l9_10774)*0.5)),0.0);
}
else
{
l9_10775=float3(l9_10772,float(l9_10774));
}
}
float3 l9_10776=l9_10775;
float3 l9_10777=l9_10776;
float4 l9_10778=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_10777.xy,bias(l9_10771));
float4 l9_10779=l9_10778;
if (l9_10709)
{
l9_10779=mix(l9_10710,l9_10779,float4(l9_10713));
}
float4 l9_10780=l9_10779;
l9_10694=l9_10780;
l9_10672=l9_10694;
l9_10677=l9_10672;
}
else
{
float2 l9_10781=float2(0.0);
l9_10781=l9_10674.Surface_UVCoord0;
float2 l9_10782=float2(0.0);
float2 l9_10783=(*sc_set0.UserUniforms).patternScaleId01;
l9_10782=l9_10783;
float2 l9_10784=float2(0.0);
l9_10784=((l9_10781-(*sc_set0.UserUniforms).Port_Center_N122)*l9_10782)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_10785=float2(0.0);
float2 l9_10786=(*sc_set0.UserUniforms).patternOffsetId01;
l9_10785=l9_10786;
float2 l9_10787=float2(0.0);
l9_10787=l9_10784+l9_10785;
float l9_10788=0.0;
float l9_10789=(*sc_set0.UserUniforms).patternRotateId01;
l9_10788=l9_10789;
float2 l9_10790=float2(0.0);
float2 l9_10791=l9_10787;
float l9_10792=l9_10788;
float2 l9_10793=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_10794=sin(radians(l9_10792));
float l9_10795=cos(radians(l9_10792));
float2 l9_10796=l9_10791-l9_10793;
l9_10796=float2(dot(float2(l9_10795,l9_10794),l9_10796),dot(float2(-l9_10794,l9_10795),l9_10796))+l9_10793;
l9_10790=l9_10796;
float4 l9_10797=float4(0.0);
int l9_10798;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_10799=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10799=0;
}
else
{
l9_10799=in.varStereoViewID;
}
int l9_10800=l9_10799;
l9_10798=1-l9_10800;
}
else
{
int l9_10801=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10801=0;
}
else
{
l9_10801=in.varStereoViewID;
}
int l9_10802=l9_10801;
l9_10798=l9_10802;
}
int l9_10803=l9_10798;
int l9_10804=patternTextureId01Layout_tmp;
int l9_10805=l9_10803;
float2 l9_10806=l9_10790;
bool l9_10807=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_10808=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_10809=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_10810=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_10811=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_10812=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_10813=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_10814=0.0;
bool l9_10815=l9_10812&&(!l9_10810);
float l9_10816=1.0;
float l9_10817=l9_10806.x;
int l9_10818=l9_10809.x;
if (l9_10818==1)
{
l9_10817=fract(l9_10817);
}
else
{
if (l9_10818==2)
{
float l9_10819=fract(l9_10817);
float l9_10820=l9_10817-l9_10819;
float l9_10821=step(0.25,fract(l9_10820*0.5));
l9_10817=mix(l9_10819,1.0-l9_10819,fast::clamp(l9_10821,0.0,1.0));
}
}
l9_10806.x=l9_10817;
float l9_10822=l9_10806.y;
int l9_10823=l9_10809.y;
if (l9_10823==1)
{
l9_10822=fract(l9_10822);
}
else
{
if (l9_10823==2)
{
float l9_10824=fract(l9_10822);
float l9_10825=l9_10822-l9_10824;
float l9_10826=step(0.25,fract(l9_10825*0.5));
l9_10822=mix(l9_10824,1.0-l9_10824,fast::clamp(l9_10826,0.0,1.0));
}
}
l9_10806.y=l9_10822;
if (l9_10810)
{
bool l9_10827=l9_10812;
bool l9_10828;
if (l9_10827)
{
l9_10828=l9_10809.x==3;
}
else
{
l9_10828=l9_10827;
}
float l9_10829=l9_10806.x;
float l9_10830=l9_10811.x;
float l9_10831=l9_10811.z;
bool l9_10832=l9_10828;
float l9_10833=l9_10816;
float l9_10834=fast::clamp(l9_10829,l9_10830,l9_10831);
float l9_10835=step(abs(l9_10829-l9_10834),9.9999997e-06);
l9_10833*=(l9_10835+((1.0-float(l9_10832))*(1.0-l9_10835)));
l9_10829=l9_10834;
l9_10806.x=l9_10829;
l9_10816=l9_10833;
bool l9_10836=l9_10812;
bool l9_10837;
if (l9_10836)
{
l9_10837=l9_10809.y==3;
}
else
{
l9_10837=l9_10836;
}
float l9_10838=l9_10806.y;
float l9_10839=l9_10811.y;
float l9_10840=l9_10811.w;
bool l9_10841=l9_10837;
float l9_10842=l9_10816;
float l9_10843=fast::clamp(l9_10838,l9_10839,l9_10840);
float l9_10844=step(abs(l9_10838-l9_10843),9.9999997e-06);
l9_10842*=(l9_10844+((1.0-float(l9_10841))*(1.0-l9_10844)));
l9_10838=l9_10843;
l9_10806.y=l9_10838;
l9_10816=l9_10842;
}
float2 l9_10845=l9_10806;
bool l9_10846=l9_10807;
float3x3 l9_10847=l9_10808;
if (l9_10846)
{
l9_10845=float2((l9_10847*float3(l9_10845,1.0)).xy);
}
float2 l9_10848=l9_10845;
l9_10806=l9_10848;
float l9_10849=l9_10806.x;
int l9_10850=l9_10809.x;
bool l9_10851=l9_10815;
float l9_10852=l9_10816;
if ((l9_10850==0)||(l9_10850==3))
{
float l9_10853=l9_10849;
float l9_10854=0.0;
float l9_10855=1.0;
bool l9_10856=l9_10851;
float l9_10857=l9_10852;
float l9_10858=fast::clamp(l9_10853,l9_10854,l9_10855);
float l9_10859=step(abs(l9_10853-l9_10858),9.9999997e-06);
l9_10857*=(l9_10859+((1.0-float(l9_10856))*(1.0-l9_10859)));
l9_10853=l9_10858;
l9_10849=l9_10853;
l9_10852=l9_10857;
}
l9_10806.x=l9_10849;
l9_10816=l9_10852;
float l9_10860=l9_10806.y;
int l9_10861=l9_10809.y;
bool l9_10862=l9_10815;
float l9_10863=l9_10816;
if ((l9_10861==0)||(l9_10861==3))
{
float l9_10864=l9_10860;
float l9_10865=0.0;
float l9_10866=1.0;
bool l9_10867=l9_10862;
float l9_10868=l9_10863;
float l9_10869=fast::clamp(l9_10864,l9_10865,l9_10866);
float l9_10870=step(abs(l9_10864-l9_10869),9.9999997e-06);
l9_10868*=(l9_10870+((1.0-float(l9_10867))*(1.0-l9_10870)));
l9_10864=l9_10869;
l9_10860=l9_10864;
l9_10863=l9_10868;
}
l9_10806.y=l9_10860;
l9_10816=l9_10863;
float2 l9_10871=l9_10806;
int l9_10872=l9_10804;
int l9_10873=l9_10805;
float l9_10874=l9_10814;
float2 l9_10875=l9_10871;
int l9_10876=l9_10872;
int l9_10877=l9_10873;
float3 l9_10878=float3(0.0);
if (l9_10876==0)
{
l9_10878=float3(l9_10875,0.0);
}
else
{
if (l9_10876==1)
{
l9_10878=float3(l9_10875.x,(l9_10875.y*0.5)+(0.5-(float(l9_10877)*0.5)),0.0);
}
else
{
l9_10878=float3(l9_10875,float(l9_10877));
}
}
float3 l9_10879=l9_10878;
float3 l9_10880=l9_10879;
float4 l9_10881=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_10880.xy,bias(l9_10874));
float4 l9_10882=l9_10881;
if (l9_10812)
{
l9_10882=mix(l9_10813,l9_10882,float4(l9_10816));
}
float4 l9_10883=l9_10882;
l9_10797=l9_10883;
float l9_10884=0.0;
float3 l9_10885=l9_10797.xyz;
float l9_10886=l9_10885.x;
l9_10884=l9_10886;
l9_10673=float4(l9_10884);
l9_10677=l9_10673;
}
l9_10670=l9_10677;
float4 l9_10887=float4(0.0);
l9_10887=l9_10668*l9_10670;
l9_10662=l9_10887;
l9_10667=l9_10662;
}
else
{
float4 l9_10888=float4(0.0);
float4 l9_10889=(*sc_set0.UserUniforms).colorId01;
l9_10888=l9_10889;
float2 l9_10890=float2(0.0);
l9_10890=l9_10664.Surface_UVCoord0;
float4 l9_10891=float4(0.0);
int l9_10892;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_10893=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10893=0;
}
else
{
l9_10893=in.varStereoViewID;
}
int l9_10894=l9_10893;
l9_10892=1-l9_10894;
}
else
{
int l9_10895=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10895=0;
}
else
{
l9_10895=in.varStereoViewID;
}
int l9_10896=l9_10895;
l9_10892=l9_10896;
}
int l9_10897=l9_10892;
int l9_10898=greyMaskIdLayout_tmp;
int l9_10899=l9_10897;
float2 l9_10900=l9_10890;
bool l9_10901=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_10902=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_10903=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_10904=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_10905=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_10906=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_10907=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_10908=0.0;
bool l9_10909=l9_10906&&(!l9_10904);
float l9_10910=1.0;
float l9_10911=l9_10900.x;
int l9_10912=l9_10903.x;
if (l9_10912==1)
{
l9_10911=fract(l9_10911);
}
else
{
if (l9_10912==2)
{
float l9_10913=fract(l9_10911);
float l9_10914=l9_10911-l9_10913;
float l9_10915=step(0.25,fract(l9_10914*0.5));
l9_10911=mix(l9_10913,1.0-l9_10913,fast::clamp(l9_10915,0.0,1.0));
}
}
l9_10900.x=l9_10911;
float l9_10916=l9_10900.y;
int l9_10917=l9_10903.y;
if (l9_10917==1)
{
l9_10916=fract(l9_10916);
}
else
{
if (l9_10917==2)
{
float l9_10918=fract(l9_10916);
float l9_10919=l9_10916-l9_10918;
float l9_10920=step(0.25,fract(l9_10919*0.5));
l9_10916=mix(l9_10918,1.0-l9_10918,fast::clamp(l9_10920,0.0,1.0));
}
}
l9_10900.y=l9_10916;
if (l9_10904)
{
bool l9_10921=l9_10906;
bool l9_10922;
if (l9_10921)
{
l9_10922=l9_10903.x==3;
}
else
{
l9_10922=l9_10921;
}
float l9_10923=l9_10900.x;
float l9_10924=l9_10905.x;
float l9_10925=l9_10905.z;
bool l9_10926=l9_10922;
float l9_10927=l9_10910;
float l9_10928=fast::clamp(l9_10923,l9_10924,l9_10925);
float l9_10929=step(abs(l9_10923-l9_10928),9.9999997e-06);
l9_10927*=(l9_10929+((1.0-float(l9_10926))*(1.0-l9_10929)));
l9_10923=l9_10928;
l9_10900.x=l9_10923;
l9_10910=l9_10927;
bool l9_10930=l9_10906;
bool l9_10931;
if (l9_10930)
{
l9_10931=l9_10903.y==3;
}
else
{
l9_10931=l9_10930;
}
float l9_10932=l9_10900.y;
float l9_10933=l9_10905.y;
float l9_10934=l9_10905.w;
bool l9_10935=l9_10931;
float l9_10936=l9_10910;
float l9_10937=fast::clamp(l9_10932,l9_10933,l9_10934);
float l9_10938=step(abs(l9_10932-l9_10937),9.9999997e-06);
l9_10936*=(l9_10938+((1.0-float(l9_10935))*(1.0-l9_10938)));
l9_10932=l9_10937;
l9_10900.y=l9_10932;
l9_10910=l9_10936;
}
float2 l9_10939=l9_10900;
bool l9_10940=l9_10901;
float3x3 l9_10941=l9_10902;
if (l9_10940)
{
l9_10939=float2((l9_10941*float3(l9_10939,1.0)).xy);
}
float2 l9_10942=l9_10939;
l9_10900=l9_10942;
float l9_10943=l9_10900.x;
int l9_10944=l9_10903.x;
bool l9_10945=l9_10909;
float l9_10946=l9_10910;
if ((l9_10944==0)||(l9_10944==3))
{
float l9_10947=l9_10943;
float l9_10948=0.0;
float l9_10949=1.0;
bool l9_10950=l9_10945;
float l9_10951=l9_10946;
float l9_10952=fast::clamp(l9_10947,l9_10948,l9_10949);
float l9_10953=step(abs(l9_10947-l9_10952),9.9999997e-06);
l9_10951*=(l9_10953+((1.0-float(l9_10950))*(1.0-l9_10953)));
l9_10947=l9_10952;
l9_10943=l9_10947;
l9_10946=l9_10951;
}
l9_10900.x=l9_10943;
l9_10910=l9_10946;
float l9_10954=l9_10900.y;
int l9_10955=l9_10903.y;
bool l9_10956=l9_10909;
float l9_10957=l9_10910;
if ((l9_10955==0)||(l9_10955==3))
{
float l9_10958=l9_10954;
float l9_10959=0.0;
float l9_10960=1.0;
bool l9_10961=l9_10956;
float l9_10962=l9_10957;
float l9_10963=fast::clamp(l9_10958,l9_10959,l9_10960);
float l9_10964=step(abs(l9_10958-l9_10963),9.9999997e-06);
l9_10962*=(l9_10964+((1.0-float(l9_10961))*(1.0-l9_10964)));
l9_10958=l9_10963;
l9_10954=l9_10958;
l9_10957=l9_10962;
}
l9_10900.y=l9_10954;
l9_10910=l9_10957;
float2 l9_10965=l9_10900;
int l9_10966=l9_10898;
int l9_10967=l9_10899;
float l9_10968=l9_10908;
float2 l9_10969=l9_10965;
int l9_10970=l9_10966;
int l9_10971=l9_10967;
float3 l9_10972=float3(0.0);
if (l9_10970==0)
{
l9_10972=float3(l9_10969,0.0);
}
else
{
if (l9_10970==1)
{
l9_10972=float3(l9_10969.x,(l9_10969.y*0.5)+(0.5-(float(l9_10971)*0.5)),0.0);
}
else
{
l9_10972=float3(l9_10969,float(l9_10971));
}
}
float3 l9_10973=l9_10972;
float3 l9_10974=l9_10973;
float4 l9_10975=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_10974.xy,bias(l9_10968));
float4 l9_10976=l9_10975;
if (l9_10906)
{
l9_10976=mix(l9_10907,l9_10976,float4(l9_10910));
}
float4 l9_10977=l9_10976;
l9_10891=l9_10977;
float l9_10978=0.0;
l9_10978=l9_10891.x;
float l9_10979=0.0;
l9_10979=step(l9_10978,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_10980=float4(0.0);
l9_10980=l9_10888*float4(l9_10979);
l9_10663=l9_10980;
l9_10667=l9_10663;
}
l9_10660=l9_10667;
float2 l9_10981=float2(0.0);
l9_10981=l9_10646.Surface_UVCoord0;
float4 l9_10982=float4(0.0);
int l9_10983;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_10984=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10984=0;
}
else
{
l9_10984=in.varStereoViewID;
}
int l9_10985=l9_10984;
l9_10983=1-l9_10985;
}
else
{
int l9_10986=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_10986=0;
}
else
{
l9_10986=in.varStereoViewID;
}
int l9_10987=l9_10986;
l9_10983=l9_10987;
}
int l9_10988=l9_10983;
int l9_10989=greyMaskIdLayout_tmp;
int l9_10990=l9_10988;
float2 l9_10991=l9_10981;
bool l9_10992=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_10993=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_10994=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_10995=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_10996=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_10997=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_10998=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_10999=0.0;
bool l9_11000=l9_10997&&(!l9_10995);
float l9_11001=1.0;
float l9_11002=l9_10991.x;
int l9_11003=l9_10994.x;
if (l9_11003==1)
{
l9_11002=fract(l9_11002);
}
else
{
if (l9_11003==2)
{
float l9_11004=fract(l9_11002);
float l9_11005=l9_11002-l9_11004;
float l9_11006=step(0.25,fract(l9_11005*0.5));
l9_11002=mix(l9_11004,1.0-l9_11004,fast::clamp(l9_11006,0.0,1.0));
}
}
l9_10991.x=l9_11002;
float l9_11007=l9_10991.y;
int l9_11008=l9_10994.y;
if (l9_11008==1)
{
l9_11007=fract(l9_11007);
}
else
{
if (l9_11008==2)
{
float l9_11009=fract(l9_11007);
float l9_11010=l9_11007-l9_11009;
float l9_11011=step(0.25,fract(l9_11010*0.5));
l9_11007=mix(l9_11009,1.0-l9_11009,fast::clamp(l9_11011,0.0,1.0));
}
}
l9_10991.y=l9_11007;
if (l9_10995)
{
bool l9_11012=l9_10997;
bool l9_11013;
if (l9_11012)
{
l9_11013=l9_10994.x==3;
}
else
{
l9_11013=l9_11012;
}
float l9_11014=l9_10991.x;
float l9_11015=l9_10996.x;
float l9_11016=l9_10996.z;
bool l9_11017=l9_11013;
float l9_11018=l9_11001;
float l9_11019=fast::clamp(l9_11014,l9_11015,l9_11016);
float l9_11020=step(abs(l9_11014-l9_11019),9.9999997e-06);
l9_11018*=(l9_11020+((1.0-float(l9_11017))*(1.0-l9_11020)));
l9_11014=l9_11019;
l9_10991.x=l9_11014;
l9_11001=l9_11018;
bool l9_11021=l9_10997;
bool l9_11022;
if (l9_11021)
{
l9_11022=l9_10994.y==3;
}
else
{
l9_11022=l9_11021;
}
float l9_11023=l9_10991.y;
float l9_11024=l9_10996.y;
float l9_11025=l9_10996.w;
bool l9_11026=l9_11022;
float l9_11027=l9_11001;
float l9_11028=fast::clamp(l9_11023,l9_11024,l9_11025);
float l9_11029=step(abs(l9_11023-l9_11028),9.9999997e-06);
l9_11027*=(l9_11029+((1.0-float(l9_11026))*(1.0-l9_11029)));
l9_11023=l9_11028;
l9_10991.y=l9_11023;
l9_11001=l9_11027;
}
float2 l9_11030=l9_10991;
bool l9_11031=l9_10992;
float3x3 l9_11032=l9_10993;
if (l9_11031)
{
l9_11030=float2((l9_11032*float3(l9_11030,1.0)).xy);
}
float2 l9_11033=l9_11030;
l9_10991=l9_11033;
float l9_11034=l9_10991.x;
int l9_11035=l9_10994.x;
bool l9_11036=l9_11000;
float l9_11037=l9_11001;
if ((l9_11035==0)||(l9_11035==3))
{
float l9_11038=l9_11034;
float l9_11039=0.0;
float l9_11040=1.0;
bool l9_11041=l9_11036;
float l9_11042=l9_11037;
float l9_11043=fast::clamp(l9_11038,l9_11039,l9_11040);
float l9_11044=step(abs(l9_11038-l9_11043),9.9999997e-06);
l9_11042*=(l9_11044+((1.0-float(l9_11041))*(1.0-l9_11044)));
l9_11038=l9_11043;
l9_11034=l9_11038;
l9_11037=l9_11042;
}
l9_10991.x=l9_11034;
l9_11001=l9_11037;
float l9_11045=l9_10991.y;
int l9_11046=l9_10994.y;
bool l9_11047=l9_11000;
float l9_11048=l9_11001;
if ((l9_11046==0)||(l9_11046==3))
{
float l9_11049=l9_11045;
float l9_11050=0.0;
float l9_11051=1.0;
bool l9_11052=l9_11047;
float l9_11053=l9_11048;
float l9_11054=fast::clamp(l9_11049,l9_11050,l9_11051);
float l9_11055=step(abs(l9_11049-l9_11054),9.9999997e-06);
l9_11053*=(l9_11055+((1.0-float(l9_11052))*(1.0-l9_11055)));
l9_11049=l9_11054;
l9_11045=l9_11049;
l9_11048=l9_11053;
}
l9_10991.y=l9_11045;
l9_11001=l9_11048;
float2 l9_11056=l9_10991;
int l9_11057=l9_10989;
int l9_11058=l9_10990;
float l9_11059=l9_10999;
float2 l9_11060=l9_11056;
int l9_11061=l9_11057;
int l9_11062=l9_11058;
float3 l9_11063=float3(0.0);
if (l9_11061==0)
{
l9_11063=float3(l9_11060,0.0);
}
else
{
if (l9_11061==1)
{
l9_11063=float3(l9_11060.x,(l9_11060.y*0.5)+(0.5-(float(l9_11062)*0.5)),0.0);
}
else
{
l9_11063=float3(l9_11060,float(l9_11062));
}
}
float3 l9_11064=l9_11063;
float3 l9_11065=l9_11064;
float4 l9_11066=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_11065.xy,bias(l9_11059));
float4 l9_11067=l9_11066;
if (l9_10997)
{
l9_11067=mix(l9_10998,l9_11067,float4(l9_11001));
}
float4 l9_11068=l9_11067;
l9_10982=l9_11068;
float l9_11069=0.0;
l9_11069=l9_10982.x;
float l9_11070=0.0;
l9_11070=step(l9_11069,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_11071=float4(0.0);
l9_11071=l9_10660*float4(l9_11070);
float4 l9_11072=float4(0.0);
float4 l9_11073=(*sc_set0.UserUniforms).colorId01;
l9_11072=l9_11073;
float4 l9_11074=float4(0.0);
l9_11074=l9_11072*float4(l9_11070);
float4 l9_11075=float4(0.0);
float4 l9_11076=l9_11071;
float4 l9_11077=l9_11074;
float4 l9_11078=l9_11076;
float4 l9_11079=l9_11077;
float3 l9_11080=l9_11078.xyz*l9_11078.w;
l9_11078=float4(l9_11080.x,l9_11080.y,l9_11080.z,l9_11078.w);
float4 l9_11081=l9_11078+(l9_11079*(1.0-l9_11078.w));
l9_11075=l9_11081;
float4 l9_11082=float4(0.0);
l9_11082=float4(l9_10654)*l9_11075;
float4 l9_11083=float4(0.0);
l9_11083=l9_11082+l9_11075;
l9_10644=l9_11083;
l9_10649=l9_10644;
}
else
{
float4 l9_11084=float4(0.0);
float l9_11085=0.0;
float4 l9_11086=float4(0.0);
float4 l9_11087=float4(0.0);
ssGlobals l9_11088=l9_10646;
float l9_11089=0.0;
float l9_11090=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_11089=l9_11090;
l9_11085=l9_11089;
float4 l9_11091;
if ((l9_11085*1.0)!=0.0)
{
float4 l9_11092=float4(0.0);
float4 l9_11093=(*sc_set0.UserUniforms).patternColorId01;
l9_11092=l9_11093;
float4 l9_11094=float4(0.0);
float l9_11095=0.0;
float4 l9_11096=float4(0.0);
float4 l9_11097=float4(0.0);
ssGlobals l9_11098=l9_11088;
float l9_11099=0.0;
float l9_11100=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_11099=l9_11100;
l9_11095=l9_11099;
float4 l9_11101;
if ((l9_11095*1.0)!=0.0)
{
float2 l9_11102=float2(0.0);
l9_11102=l9_11098.Surface_UVCoord0;
float2 l9_11103=float2(0.0);
float2 l9_11104=(*sc_set0.UserUniforms).patternScaleId01;
l9_11103=l9_11104;
float2 l9_11105=float2(0.0);
l9_11105=((l9_11102-(*sc_set0.UserUniforms).Port_Center_N122)*l9_11103)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_11106=float2(0.0);
float2 l9_11107=(*sc_set0.UserUniforms).patternOffsetId01;
l9_11106=l9_11107;
float2 l9_11108=float2(0.0);
l9_11108=l9_11105+l9_11106;
float l9_11109=0.0;
float l9_11110=(*sc_set0.UserUniforms).patternRotateId01;
l9_11109=l9_11110;
float2 l9_11111=float2(0.0);
float2 l9_11112=l9_11108;
float l9_11113=l9_11109;
float2 l9_11114=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_11115=sin(radians(l9_11113));
float l9_11116=cos(radians(l9_11113));
float2 l9_11117=l9_11112-l9_11114;
l9_11117=float2(dot(float2(l9_11116,l9_11115),l9_11117),dot(float2(-l9_11115,l9_11116),l9_11117))+l9_11114;
l9_11111=l9_11117;
float4 l9_11118=float4(0.0);
int l9_11119;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_11120=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11120=0;
}
else
{
l9_11120=in.varStereoViewID;
}
int l9_11121=l9_11120;
l9_11119=1-l9_11121;
}
else
{
int l9_11122=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11122=0;
}
else
{
l9_11122=in.varStereoViewID;
}
int l9_11123=l9_11122;
l9_11119=l9_11123;
}
int l9_11124=l9_11119;
int l9_11125=patternTextureId01Layout_tmp;
int l9_11126=l9_11124;
float2 l9_11127=l9_11111;
bool l9_11128=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_11129=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_11130=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_11131=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_11132=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_11133=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_11134=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_11135=0.0;
bool l9_11136=l9_11133&&(!l9_11131);
float l9_11137=1.0;
float l9_11138=l9_11127.x;
int l9_11139=l9_11130.x;
if (l9_11139==1)
{
l9_11138=fract(l9_11138);
}
else
{
if (l9_11139==2)
{
float l9_11140=fract(l9_11138);
float l9_11141=l9_11138-l9_11140;
float l9_11142=step(0.25,fract(l9_11141*0.5));
l9_11138=mix(l9_11140,1.0-l9_11140,fast::clamp(l9_11142,0.0,1.0));
}
}
l9_11127.x=l9_11138;
float l9_11143=l9_11127.y;
int l9_11144=l9_11130.y;
if (l9_11144==1)
{
l9_11143=fract(l9_11143);
}
else
{
if (l9_11144==2)
{
float l9_11145=fract(l9_11143);
float l9_11146=l9_11143-l9_11145;
float l9_11147=step(0.25,fract(l9_11146*0.5));
l9_11143=mix(l9_11145,1.0-l9_11145,fast::clamp(l9_11147,0.0,1.0));
}
}
l9_11127.y=l9_11143;
if (l9_11131)
{
bool l9_11148=l9_11133;
bool l9_11149;
if (l9_11148)
{
l9_11149=l9_11130.x==3;
}
else
{
l9_11149=l9_11148;
}
float l9_11150=l9_11127.x;
float l9_11151=l9_11132.x;
float l9_11152=l9_11132.z;
bool l9_11153=l9_11149;
float l9_11154=l9_11137;
float l9_11155=fast::clamp(l9_11150,l9_11151,l9_11152);
float l9_11156=step(abs(l9_11150-l9_11155),9.9999997e-06);
l9_11154*=(l9_11156+((1.0-float(l9_11153))*(1.0-l9_11156)));
l9_11150=l9_11155;
l9_11127.x=l9_11150;
l9_11137=l9_11154;
bool l9_11157=l9_11133;
bool l9_11158;
if (l9_11157)
{
l9_11158=l9_11130.y==3;
}
else
{
l9_11158=l9_11157;
}
float l9_11159=l9_11127.y;
float l9_11160=l9_11132.y;
float l9_11161=l9_11132.w;
bool l9_11162=l9_11158;
float l9_11163=l9_11137;
float l9_11164=fast::clamp(l9_11159,l9_11160,l9_11161);
float l9_11165=step(abs(l9_11159-l9_11164),9.9999997e-06);
l9_11163*=(l9_11165+((1.0-float(l9_11162))*(1.0-l9_11165)));
l9_11159=l9_11164;
l9_11127.y=l9_11159;
l9_11137=l9_11163;
}
float2 l9_11166=l9_11127;
bool l9_11167=l9_11128;
float3x3 l9_11168=l9_11129;
if (l9_11167)
{
l9_11166=float2((l9_11168*float3(l9_11166,1.0)).xy);
}
float2 l9_11169=l9_11166;
l9_11127=l9_11169;
float l9_11170=l9_11127.x;
int l9_11171=l9_11130.x;
bool l9_11172=l9_11136;
float l9_11173=l9_11137;
if ((l9_11171==0)||(l9_11171==3))
{
float l9_11174=l9_11170;
float l9_11175=0.0;
float l9_11176=1.0;
bool l9_11177=l9_11172;
float l9_11178=l9_11173;
float l9_11179=fast::clamp(l9_11174,l9_11175,l9_11176);
float l9_11180=step(abs(l9_11174-l9_11179),9.9999997e-06);
l9_11178*=(l9_11180+((1.0-float(l9_11177))*(1.0-l9_11180)));
l9_11174=l9_11179;
l9_11170=l9_11174;
l9_11173=l9_11178;
}
l9_11127.x=l9_11170;
l9_11137=l9_11173;
float l9_11181=l9_11127.y;
int l9_11182=l9_11130.y;
bool l9_11183=l9_11136;
float l9_11184=l9_11137;
if ((l9_11182==0)||(l9_11182==3))
{
float l9_11185=l9_11181;
float l9_11186=0.0;
float l9_11187=1.0;
bool l9_11188=l9_11183;
float l9_11189=l9_11184;
float l9_11190=fast::clamp(l9_11185,l9_11186,l9_11187);
float l9_11191=step(abs(l9_11185-l9_11190),9.9999997e-06);
l9_11189*=(l9_11191+((1.0-float(l9_11188))*(1.0-l9_11191)));
l9_11185=l9_11190;
l9_11181=l9_11185;
l9_11184=l9_11189;
}
l9_11127.y=l9_11181;
l9_11137=l9_11184;
float2 l9_11192=l9_11127;
int l9_11193=l9_11125;
int l9_11194=l9_11126;
float l9_11195=l9_11135;
float2 l9_11196=l9_11192;
int l9_11197=l9_11193;
int l9_11198=l9_11194;
float3 l9_11199=float3(0.0);
if (l9_11197==0)
{
l9_11199=float3(l9_11196,0.0);
}
else
{
if (l9_11197==1)
{
l9_11199=float3(l9_11196.x,(l9_11196.y*0.5)+(0.5-(float(l9_11198)*0.5)),0.0);
}
else
{
l9_11199=float3(l9_11196,float(l9_11198));
}
}
float3 l9_11200=l9_11199;
float3 l9_11201=l9_11200;
float4 l9_11202=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_11201.xy,bias(l9_11195));
float4 l9_11203=l9_11202;
if (l9_11133)
{
l9_11203=mix(l9_11134,l9_11203,float4(l9_11137));
}
float4 l9_11204=l9_11203;
l9_11118=l9_11204;
l9_11096=l9_11118;
l9_11101=l9_11096;
}
else
{
float2 l9_11205=float2(0.0);
l9_11205=l9_11098.Surface_UVCoord0;
float2 l9_11206=float2(0.0);
float2 l9_11207=(*sc_set0.UserUniforms).patternScaleId01;
l9_11206=l9_11207;
float2 l9_11208=float2(0.0);
l9_11208=((l9_11205-(*sc_set0.UserUniforms).Port_Center_N122)*l9_11206)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_11209=float2(0.0);
float2 l9_11210=(*sc_set0.UserUniforms).patternOffsetId01;
l9_11209=l9_11210;
float2 l9_11211=float2(0.0);
l9_11211=l9_11208+l9_11209;
float l9_11212=0.0;
float l9_11213=(*sc_set0.UserUniforms).patternRotateId01;
l9_11212=l9_11213;
float2 l9_11214=float2(0.0);
float2 l9_11215=l9_11211;
float l9_11216=l9_11212;
float2 l9_11217=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_11218=sin(radians(l9_11216));
float l9_11219=cos(radians(l9_11216));
float2 l9_11220=l9_11215-l9_11217;
l9_11220=float2(dot(float2(l9_11219,l9_11218),l9_11220),dot(float2(-l9_11218,l9_11219),l9_11220))+l9_11217;
l9_11214=l9_11220;
float4 l9_11221=float4(0.0);
int l9_11222;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_11223=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11223=0;
}
else
{
l9_11223=in.varStereoViewID;
}
int l9_11224=l9_11223;
l9_11222=1-l9_11224;
}
else
{
int l9_11225=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11225=0;
}
else
{
l9_11225=in.varStereoViewID;
}
int l9_11226=l9_11225;
l9_11222=l9_11226;
}
int l9_11227=l9_11222;
int l9_11228=patternTextureId01Layout_tmp;
int l9_11229=l9_11227;
float2 l9_11230=l9_11214;
bool l9_11231=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_11232=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_11233=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_11234=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_11235=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_11236=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_11237=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_11238=0.0;
bool l9_11239=l9_11236&&(!l9_11234);
float l9_11240=1.0;
float l9_11241=l9_11230.x;
int l9_11242=l9_11233.x;
if (l9_11242==1)
{
l9_11241=fract(l9_11241);
}
else
{
if (l9_11242==2)
{
float l9_11243=fract(l9_11241);
float l9_11244=l9_11241-l9_11243;
float l9_11245=step(0.25,fract(l9_11244*0.5));
l9_11241=mix(l9_11243,1.0-l9_11243,fast::clamp(l9_11245,0.0,1.0));
}
}
l9_11230.x=l9_11241;
float l9_11246=l9_11230.y;
int l9_11247=l9_11233.y;
if (l9_11247==1)
{
l9_11246=fract(l9_11246);
}
else
{
if (l9_11247==2)
{
float l9_11248=fract(l9_11246);
float l9_11249=l9_11246-l9_11248;
float l9_11250=step(0.25,fract(l9_11249*0.5));
l9_11246=mix(l9_11248,1.0-l9_11248,fast::clamp(l9_11250,0.0,1.0));
}
}
l9_11230.y=l9_11246;
if (l9_11234)
{
bool l9_11251=l9_11236;
bool l9_11252;
if (l9_11251)
{
l9_11252=l9_11233.x==3;
}
else
{
l9_11252=l9_11251;
}
float l9_11253=l9_11230.x;
float l9_11254=l9_11235.x;
float l9_11255=l9_11235.z;
bool l9_11256=l9_11252;
float l9_11257=l9_11240;
float l9_11258=fast::clamp(l9_11253,l9_11254,l9_11255);
float l9_11259=step(abs(l9_11253-l9_11258),9.9999997e-06);
l9_11257*=(l9_11259+((1.0-float(l9_11256))*(1.0-l9_11259)));
l9_11253=l9_11258;
l9_11230.x=l9_11253;
l9_11240=l9_11257;
bool l9_11260=l9_11236;
bool l9_11261;
if (l9_11260)
{
l9_11261=l9_11233.y==3;
}
else
{
l9_11261=l9_11260;
}
float l9_11262=l9_11230.y;
float l9_11263=l9_11235.y;
float l9_11264=l9_11235.w;
bool l9_11265=l9_11261;
float l9_11266=l9_11240;
float l9_11267=fast::clamp(l9_11262,l9_11263,l9_11264);
float l9_11268=step(abs(l9_11262-l9_11267),9.9999997e-06);
l9_11266*=(l9_11268+((1.0-float(l9_11265))*(1.0-l9_11268)));
l9_11262=l9_11267;
l9_11230.y=l9_11262;
l9_11240=l9_11266;
}
float2 l9_11269=l9_11230;
bool l9_11270=l9_11231;
float3x3 l9_11271=l9_11232;
if (l9_11270)
{
l9_11269=float2((l9_11271*float3(l9_11269,1.0)).xy);
}
float2 l9_11272=l9_11269;
l9_11230=l9_11272;
float l9_11273=l9_11230.x;
int l9_11274=l9_11233.x;
bool l9_11275=l9_11239;
float l9_11276=l9_11240;
if ((l9_11274==0)||(l9_11274==3))
{
float l9_11277=l9_11273;
float l9_11278=0.0;
float l9_11279=1.0;
bool l9_11280=l9_11275;
float l9_11281=l9_11276;
float l9_11282=fast::clamp(l9_11277,l9_11278,l9_11279);
float l9_11283=step(abs(l9_11277-l9_11282),9.9999997e-06);
l9_11281*=(l9_11283+((1.0-float(l9_11280))*(1.0-l9_11283)));
l9_11277=l9_11282;
l9_11273=l9_11277;
l9_11276=l9_11281;
}
l9_11230.x=l9_11273;
l9_11240=l9_11276;
float l9_11284=l9_11230.y;
int l9_11285=l9_11233.y;
bool l9_11286=l9_11239;
float l9_11287=l9_11240;
if ((l9_11285==0)||(l9_11285==3))
{
float l9_11288=l9_11284;
float l9_11289=0.0;
float l9_11290=1.0;
bool l9_11291=l9_11286;
float l9_11292=l9_11287;
float l9_11293=fast::clamp(l9_11288,l9_11289,l9_11290);
float l9_11294=step(abs(l9_11288-l9_11293),9.9999997e-06);
l9_11292*=(l9_11294+((1.0-float(l9_11291))*(1.0-l9_11294)));
l9_11288=l9_11293;
l9_11284=l9_11288;
l9_11287=l9_11292;
}
l9_11230.y=l9_11284;
l9_11240=l9_11287;
float2 l9_11295=l9_11230;
int l9_11296=l9_11228;
int l9_11297=l9_11229;
float l9_11298=l9_11238;
float2 l9_11299=l9_11295;
int l9_11300=l9_11296;
int l9_11301=l9_11297;
float3 l9_11302=float3(0.0);
if (l9_11300==0)
{
l9_11302=float3(l9_11299,0.0);
}
else
{
if (l9_11300==1)
{
l9_11302=float3(l9_11299.x,(l9_11299.y*0.5)+(0.5-(float(l9_11301)*0.5)),0.0);
}
else
{
l9_11302=float3(l9_11299,float(l9_11301));
}
}
float3 l9_11303=l9_11302;
float3 l9_11304=l9_11303;
float4 l9_11305=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_11304.xy,bias(l9_11298));
float4 l9_11306=l9_11305;
if (l9_11236)
{
l9_11306=mix(l9_11237,l9_11306,float4(l9_11240));
}
float4 l9_11307=l9_11306;
l9_11221=l9_11307;
float l9_11308=0.0;
float3 l9_11309=l9_11221.xyz;
float l9_11310=l9_11309.x;
l9_11308=l9_11310;
l9_11097=float4(l9_11308);
l9_11101=l9_11097;
}
l9_11094=l9_11101;
float4 l9_11311=float4(0.0);
l9_11311=l9_11092*l9_11094;
l9_11086=l9_11311;
l9_11091=l9_11086;
}
else
{
float4 l9_11312=float4(0.0);
float4 l9_11313=(*sc_set0.UserUniforms).colorId01;
l9_11312=l9_11313;
float2 l9_11314=float2(0.0);
l9_11314=l9_11088.Surface_UVCoord0;
float4 l9_11315=float4(0.0);
int l9_11316;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_11317=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11317=0;
}
else
{
l9_11317=in.varStereoViewID;
}
int l9_11318=l9_11317;
l9_11316=1-l9_11318;
}
else
{
int l9_11319=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11319=0;
}
else
{
l9_11319=in.varStereoViewID;
}
int l9_11320=l9_11319;
l9_11316=l9_11320;
}
int l9_11321=l9_11316;
int l9_11322=greyMaskIdLayout_tmp;
int l9_11323=l9_11321;
float2 l9_11324=l9_11314;
bool l9_11325=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_11326=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_11327=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_11328=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_11329=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_11330=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_11331=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_11332=0.0;
bool l9_11333=l9_11330&&(!l9_11328);
float l9_11334=1.0;
float l9_11335=l9_11324.x;
int l9_11336=l9_11327.x;
if (l9_11336==1)
{
l9_11335=fract(l9_11335);
}
else
{
if (l9_11336==2)
{
float l9_11337=fract(l9_11335);
float l9_11338=l9_11335-l9_11337;
float l9_11339=step(0.25,fract(l9_11338*0.5));
l9_11335=mix(l9_11337,1.0-l9_11337,fast::clamp(l9_11339,0.0,1.0));
}
}
l9_11324.x=l9_11335;
float l9_11340=l9_11324.y;
int l9_11341=l9_11327.y;
if (l9_11341==1)
{
l9_11340=fract(l9_11340);
}
else
{
if (l9_11341==2)
{
float l9_11342=fract(l9_11340);
float l9_11343=l9_11340-l9_11342;
float l9_11344=step(0.25,fract(l9_11343*0.5));
l9_11340=mix(l9_11342,1.0-l9_11342,fast::clamp(l9_11344,0.0,1.0));
}
}
l9_11324.y=l9_11340;
if (l9_11328)
{
bool l9_11345=l9_11330;
bool l9_11346;
if (l9_11345)
{
l9_11346=l9_11327.x==3;
}
else
{
l9_11346=l9_11345;
}
float l9_11347=l9_11324.x;
float l9_11348=l9_11329.x;
float l9_11349=l9_11329.z;
bool l9_11350=l9_11346;
float l9_11351=l9_11334;
float l9_11352=fast::clamp(l9_11347,l9_11348,l9_11349);
float l9_11353=step(abs(l9_11347-l9_11352),9.9999997e-06);
l9_11351*=(l9_11353+((1.0-float(l9_11350))*(1.0-l9_11353)));
l9_11347=l9_11352;
l9_11324.x=l9_11347;
l9_11334=l9_11351;
bool l9_11354=l9_11330;
bool l9_11355;
if (l9_11354)
{
l9_11355=l9_11327.y==3;
}
else
{
l9_11355=l9_11354;
}
float l9_11356=l9_11324.y;
float l9_11357=l9_11329.y;
float l9_11358=l9_11329.w;
bool l9_11359=l9_11355;
float l9_11360=l9_11334;
float l9_11361=fast::clamp(l9_11356,l9_11357,l9_11358);
float l9_11362=step(abs(l9_11356-l9_11361),9.9999997e-06);
l9_11360*=(l9_11362+((1.0-float(l9_11359))*(1.0-l9_11362)));
l9_11356=l9_11361;
l9_11324.y=l9_11356;
l9_11334=l9_11360;
}
float2 l9_11363=l9_11324;
bool l9_11364=l9_11325;
float3x3 l9_11365=l9_11326;
if (l9_11364)
{
l9_11363=float2((l9_11365*float3(l9_11363,1.0)).xy);
}
float2 l9_11366=l9_11363;
l9_11324=l9_11366;
float l9_11367=l9_11324.x;
int l9_11368=l9_11327.x;
bool l9_11369=l9_11333;
float l9_11370=l9_11334;
if ((l9_11368==0)||(l9_11368==3))
{
float l9_11371=l9_11367;
float l9_11372=0.0;
float l9_11373=1.0;
bool l9_11374=l9_11369;
float l9_11375=l9_11370;
float l9_11376=fast::clamp(l9_11371,l9_11372,l9_11373);
float l9_11377=step(abs(l9_11371-l9_11376),9.9999997e-06);
l9_11375*=(l9_11377+((1.0-float(l9_11374))*(1.0-l9_11377)));
l9_11371=l9_11376;
l9_11367=l9_11371;
l9_11370=l9_11375;
}
l9_11324.x=l9_11367;
l9_11334=l9_11370;
float l9_11378=l9_11324.y;
int l9_11379=l9_11327.y;
bool l9_11380=l9_11333;
float l9_11381=l9_11334;
if ((l9_11379==0)||(l9_11379==3))
{
float l9_11382=l9_11378;
float l9_11383=0.0;
float l9_11384=1.0;
bool l9_11385=l9_11380;
float l9_11386=l9_11381;
float l9_11387=fast::clamp(l9_11382,l9_11383,l9_11384);
float l9_11388=step(abs(l9_11382-l9_11387),9.9999997e-06);
l9_11386*=(l9_11388+((1.0-float(l9_11385))*(1.0-l9_11388)));
l9_11382=l9_11387;
l9_11378=l9_11382;
l9_11381=l9_11386;
}
l9_11324.y=l9_11378;
l9_11334=l9_11381;
float2 l9_11389=l9_11324;
int l9_11390=l9_11322;
int l9_11391=l9_11323;
float l9_11392=l9_11332;
float2 l9_11393=l9_11389;
int l9_11394=l9_11390;
int l9_11395=l9_11391;
float3 l9_11396=float3(0.0);
if (l9_11394==0)
{
l9_11396=float3(l9_11393,0.0);
}
else
{
if (l9_11394==1)
{
l9_11396=float3(l9_11393.x,(l9_11393.y*0.5)+(0.5-(float(l9_11395)*0.5)),0.0);
}
else
{
l9_11396=float3(l9_11393,float(l9_11395));
}
}
float3 l9_11397=l9_11396;
float3 l9_11398=l9_11397;
float4 l9_11399=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_11398.xy,bias(l9_11392));
float4 l9_11400=l9_11399;
if (l9_11330)
{
l9_11400=mix(l9_11331,l9_11400,float4(l9_11334));
}
float4 l9_11401=l9_11400;
l9_11315=l9_11401;
float l9_11402=0.0;
l9_11402=l9_11315.x;
float l9_11403=0.0;
l9_11403=step(l9_11402,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_11404=float4(0.0);
l9_11404=l9_11312*float4(l9_11403);
l9_11087=l9_11404;
l9_11091=l9_11087;
}
l9_11084=l9_11091;
float2 l9_11405=float2(0.0);
l9_11405=l9_10646.Surface_UVCoord0;
float4 l9_11406=float4(0.0);
int l9_11407;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_11408=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11408=0;
}
else
{
l9_11408=in.varStereoViewID;
}
int l9_11409=l9_11408;
l9_11407=1-l9_11409;
}
else
{
int l9_11410=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11410=0;
}
else
{
l9_11410=in.varStereoViewID;
}
int l9_11411=l9_11410;
l9_11407=l9_11411;
}
int l9_11412=l9_11407;
int l9_11413=greyMaskIdLayout_tmp;
int l9_11414=l9_11412;
float2 l9_11415=l9_11405;
bool l9_11416=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_11417=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_11418=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_11419=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_11420=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_11421=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_11422=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_11423=0.0;
bool l9_11424=l9_11421&&(!l9_11419);
float l9_11425=1.0;
float l9_11426=l9_11415.x;
int l9_11427=l9_11418.x;
if (l9_11427==1)
{
l9_11426=fract(l9_11426);
}
else
{
if (l9_11427==2)
{
float l9_11428=fract(l9_11426);
float l9_11429=l9_11426-l9_11428;
float l9_11430=step(0.25,fract(l9_11429*0.5));
l9_11426=mix(l9_11428,1.0-l9_11428,fast::clamp(l9_11430,0.0,1.0));
}
}
l9_11415.x=l9_11426;
float l9_11431=l9_11415.y;
int l9_11432=l9_11418.y;
if (l9_11432==1)
{
l9_11431=fract(l9_11431);
}
else
{
if (l9_11432==2)
{
float l9_11433=fract(l9_11431);
float l9_11434=l9_11431-l9_11433;
float l9_11435=step(0.25,fract(l9_11434*0.5));
l9_11431=mix(l9_11433,1.0-l9_11433,fast::clamp(l9_11435,0.0,1.0));
}
}
l9_11415.y=l9_11431;
if (l9_11419)
{
bool l9_11436=l9_11421;
bool l9_11437;
if (l9_11436)
{
l9_11437=l9_11418.x==3;
}
else
{
l9_11437=l9_11436;
}
float l9_11438=l9_11415.x;
float l9_11439=l9_11420.x;
float l9_11440=l9_11420.z;
bool l9_11441=l9_11437;
float l9_11442=l9_11425;
float l9_11443=fast::clamp(l9_11438,l9_11439,l9_11440);
float l9_11444=step(abs(l9_11438-l9_11443),9.9999997e-06);
l9_11442*=(l9_11444+((1.0-float(l9_11441))*(1.0-l9_11444)));
l9_11438=l9_11443;
l9_11415.x=l9_11438;
l9_11425=l9_11442;
bool l9_11445=l9_11421;
bool l9_11446;
if (l9_11445)
{
l9_11446=l9_11418.y==3;
}
else
{
l9_11446=l9_11445;
}
float l9_11447=l9_11415.y;
float l9_11448=l9_11420.y;
float l9_11449=l9_11420.w;
bool l9_11450=l9_11446;
float l9_11451=l9_11425;
float l9_11452=fast::clamp(l9_11447,l9_11448,l9_11449);
float l9_11453=step(abs(l9_11447-l9_11452),9.9999997e-06);
l9_11451*=(l9_11453+((1.0-float(l9_11450))*(1.0-l9_11453)));
l9_11447=l9_11452;
l9_11415.y=l9_11447;
l9_11425=l9_11451;
}
float2 l9_11454=l9_11415;
bool l9_11455=l9_11416;
float3x3 l9_11456=l9_11417;
if (l9_11455)
{
l9_11454=float2((l9_11456*float3(l9_11454,1.0)).xy);
}
float2 l9_11457=l9_11454;
l9_11415=l9_11457;
float l9_11458=l9_11415.x;
int l9_11459=l9_11418.x;
bool l9_11460=l9_11424;
float l9_11461=l9_11425;
if ((l9_11459==0)||(l9_11459==3))
{
float l9_11462=l9_11458;
float l9_11463=0.0;
float l9_11464=1.0;
bool l9_11465=l9_11460;
float l9_11466=l9_11461;
float l9_11467=fast::clamp(l9_11462,l9_11463,l9_11464);
float l9_11468=step(abs(l9_11462-l9_11467),9.9999997e-06);
l9_11466*=(l9_11468+((1.0-float(l9_11465))*(1.0-l9_11468)));
l9_11462=l9_11467;
l9_11458=l9_11462;
l9_11461=l9_11466;
}
l9_11415.x=l9_11458;
l9_11425=l9_11461;
float l9_11469=l9_11415.y;
int l9_11470=l9_11418.y;
bool l9_11471=l9_11424;
float l9_11472=l9_11425;
if ((l9_11470==0)||(l9_11470==3))
{
float l9_11473=l9_11469;
float l9_11474=0.0;
float l9_11475=1.0;
bool l9_11476=l9_11471;
float l9_11477=l9_11472;
float l9_11478=fast::clamp(l9_11473,l9_11474,l9_11475);
float l9_11479=step(abs(l9_11473-l9_11478),9.9999997e-06);
l9_11477*=(l9_11479+((1.0-float(l9_11476))*(1.0-l9_11479)));
l9_11473=l9_11478;
l9_11469=l9_11473;
l9_11472=l9_11477;
}
l9_11415.y=l9_11469;
l9_11425=l9_11472;
float2 l9_11480=l9_11415;
int l9_11481=l9_11413;
int l9_11482=l9_11414;
float l9_11483=l9_11423;
float2 l9_11484=l9_11480;
int l9_11485=l9_11481;
int l9_11486=l9_11482;
float3 l9_11487=float3(0.0);
if (l9_11485==0)
{
l9_11487=float3(l9_11484,0.0);
}
else
{
if (l9_11485==1)
{
l9_11487=float3(l9_11484.x,(l9_11484.y*0.5)+(0.5-(float(l9_11486)*0.5)),0.0);
}
else
{
l9_11487=float3(l9_11484,float(l9_11486));
}
}
float3 l9_11488=l9_11487;
float3 l9_11489=l9_11488;
float4 l9_11490=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_11489.xy,bias(l9_11483));
float4 l9_11491=l9_11490;
if (l9_11421)
{
l9_11491=mix(l9_11422,l9_11491,float4(l9_11425));
}
float4 l9_11492=l9_11491;
l9_11406=l9_11492;
float l9_11493=0.0;
l9_11493=l9_11406.x;
float l9_11494=0.0;
l9_11494=step(l9_11493,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_11495=float4(0.0);
l9_11495=l9_11084*float4(l9_11494);
float4 l9_11496=float4(0.0);
float4 l9_11497=(*sc_set0.UserUniforms).colorId01;
l9_11496=l9_11497;
float4 l9_11498=float4(0.0);
l9_11498=l9_11496*float4(l9_11494);
float4 l9_11499=float4(0.0);
float4 l9_11500=l9_11495;
float4 l9_11501=l9_11498;
float4 l9_11502=l9_11500;
float4 l9_11503=l9_11501;
float3 l9_11504=l9_11502.xyz*l9_11502.w;
l9_11502=float4(l9_11504.x,l9_11504.y,l9_11504.z,l9_11502.w);
float4 l9_11505=l9_11502+(l9_11503*(1.0-l9_11502.w));
l9_11499=l9_11505;
l9_10645=l9_11499;
l9_10649=l9_10645;
}
l9_10642=l9_10649;
l9_9745=l9_10642;
l9_9749=l9_9745;
}
l9_9742=l9_9749;
float2 l9_11506=float2(0.0);
l9_11506=l9_7793.Surface_UVCoord0;
float4 l9_11507=float4(0.0);
int l9_11508;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_11509=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11509=0;
}
else
{
l9_11509=in.varStereoViewID;
}
int l9_11510=l9_11509;
l9_11508=1-l9_11510;
}
else
{
int l9_11511=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11511=0;
}
else
{
l9_11511=in.varStereoViewID;
}
int l9_11512=l9_11511;
l9_11508=l9_11512;
}
int l9_11513=l9_11508;
int l9_11514=greyMaskIdLayout_tmp;
int l9_11515=l9_11513;
float2 l9_11516=l9_11506;
bool l9_11517=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_11518=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_11519=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_11520=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_11521=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_11522=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_11523=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_11524=0.0;
bool l9_11525=l9_11522&&(!l9_11520);
float l9_11526=1.0;
float l9_11527=l9_11516.x;
int l9_11528=l9_11519.x;
if (l9_11528==1)
{
l9_11527=fract(l9_11527);
}
else
{
if (l9_11528==2)
{
float l9_11529=fract(l9_11527);
float l9_11530=l9_11527-l9_11529;
float l9_11531=step(0.25,fract(l9_11530*0.5));
l9_11527=mix(l9_11529,1.0-l9_11529,fast::clamp(l9_11531,0.0,1.0));
}
}
l9_11516.x=l9_11527;
float l9_11532=l9_11516.y;
int l9_11533=l9_11519.y;
if (l9_11533==1)
{
l9_11532=fract(l9_11532);
}
else
{
if (l9_11533==2)
{
float l9_11534=fract(l9_11532);
float l9_11535=l9_11532-l9_11534;
float l9_11536=step(0.25,fract(l9_11535*0.5));
l9_11532=mix(l9_11534,1.0-l9_11534,fast::clamp(l9_11536,0.0,1.0));
}
}
l9_11516.y=l9_11532;
if (l9_11520)
{
bool l9_11537=l9_11522;
bool l9_11538;
if (l9_11537)
{
l9_11538=l9_11519.x==3;
}
else
{
l9_11538=l9_11537;
}
float l9_11539=l9_11516.x;
float l9_11540=l9_11521.x;
float l9_11541=l9_11521.z;
bool l9_11542=l9_11538;
float l9_11543=l9_11526;
float l9_11544=fast::clamp(l9_11539,l9_11540,l9_11541);
float l9_11545=step(abs(l9_11539-l9_11544),9.9999997e-06);
l9_11543*=(l9_11545+((1.0-float(l9_11542))*(1.0-l9_11545)));
l9_11539=l9_11544;
l9_11516.x=l9_11539;
l9_11526=l9_11543;
bool l9_11546=l9_11522;
bool l9_11547;
if (l9_11546)
{
l9_11547=l9_11519.y==3;
}
else
{
l9_11547=l9_11546;
}
float l9_11548=l9_11516.y;
float l9_11549=l9_11521.y;
float l9_11550=l9_11521.w;
bool l9_11551=l9_11547;
float l9_11552=l9_11526;
float l9_11553=fast::clamp(l9_11548,l9_11549,l9_11550);
float l9_11554=step(abs(l9_11548-l9_11553),9.9999997e-06);
l9_11552*=(l9_11554+((1.0-float(l9_11551))*(1.0-l9_11554)));
l9_11548=l9_11553;
l9_11516.y=l9_11548;
l9_11526=l9_11552;
}
float2 l9_11555=l9_11516;
bool l9_11556=l9_11517;
float3x3 l9_11557=l9_11518;
if (l9_11556)
{
l9_11555=float2((l9_11557*float3(l9_11555,1.0)).xy);
}
float2 l9_11558=l9_11555;
l9_11516=l9_11558;
float l9_11559=l9_11516.x;
int l9_11560=l9_11519.x;
bool l9_11561=l9_11525;
float l9_11562=l9_11526;
if ((l9_11560==0)||(l9_11560==3))
{
float l9_11563=l9_11559;
float l9_11564=0.0;
float l9_11565=1.0;
bool l9_11566=l9_11561;
float l9_11567=l9_11562;
float l9_11568=fast::clamp(l9_11563,l9_11564,l9_11565);
float l9_11569=step(abs(l9_11563-l9_11568),9.9999997e-06);
l9_11567*=(l9_11569+((1.0-float(l9_11566))*(1.0-l9_11569)));
l9_11563=l9_11568;
l9_11559=l9_11563;
l9_11562=l9_11567;
}
l9_11516.x=l9_11559;
l9_11526=l9_11562;
float l9_11570=l9_11516.y;
int l9_11571=l9_11519.y;
bool l9_11572=l9_11525;
float l9_11573=l9_11526;
if ((l9_11571==0)||(l9_11571==3))
{
float l9_11574=l9_11570;
float l9_11575=0.0;
float l9_11576=1.0;
bool l9_11577=l9_11572;
float l9_11578=l9_11573;
float l9_11579=fast::clamp(l9_11574,l9_11575,l9_11576);
float l9_11580=step(abs(l9_11574-l9_11579),9.9999997e-06);
l9_11578*=(l9_11580+((1.0-float(l9_11577))*(1.0-l9_11580)));
l9_11574=l9_11579;
l9_11570=l9_11574;
l9_11573=l9_11578;
}
l9_11516.y=l9_11570;
l9_11526=l9_11573;
float2 l9_11581=l9_11516;
int l9_11582=l9_11514;
int l9_11583=l9_11515;
float l9_11584=l9_11524;
float2 l9_11585=l9_11581;
int l9_11586=l9_11582;
int l9_11587=l9_11583;
float3 l9_11588=float3(0.0);
if (l9_11586==0)
{
l9_11588=float3(l9_11585,0.0);
}
else
{
if (l9_11586==1)
{
l9_11588=float3(l9_11585.x,(l9_11585.y*0.5)+(0.5-(float(l9_11587)*0.5)),0.0);
}
else
{
l9_11588=float3(l9_11585,float(l9_11587));
}
}
float3 l9_11589=l9_11588;
float3 l9_11590=l9_11589;
float4 l9_11591=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_11590.xy,bias(l9_11584));
float4 l9_11592=l9_11591;
if (l9_11522)
{
l9_11592=mix(l9_11523,l9_11592,float4(l9_11526));
}
float4 l9_11593=l9_11592;
l9_11507=l9_11593;
float l9_11594=0.0;
l9_11594=l9_11507.x;
float l9_11595=0.0;
l9_11595=step(l9_11594,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_11596=float4(0.0);
l9_11596=l9_9742*float4(l9_11595);
float4 l9_11597=float4(0.0);
float4 l9_11598=l9_9741;
float4 l9_11599=l9_11596;
float4 l9_11600=l9_11598;
float4 l9_11601=l9_11599;
float3 l9_11602=l9_11600.xyz*l9_11600.w;
l9_11600=float4(l9_11602.x,l9_11602.y,l9_11602.z,l9_11600.w);
float4 l9_11603=l9_11600+(l9_11601*(1.0-l9_11600.w));
l9_11597=l9_11603;
l9_7791=l9_11597;
l9_7796=l9_7791;
}
else
{
float4 l9_11604=float4(0.0);
float l9_11605=0.0;
float4 l9_11606=float4(0.0);
float4 l9_11607=float4(0.0);
ssGlobals l9_11608=l9_7793;
float l9_11609=0.0;
float l9_11610=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
l9_11609=l9_11610;
l9_11605=l9_11609;
float4 l9_11611;
if ((l9_11605*1.0)!=0.0)
{
float4 l9_11612=float4(0.0);
float l9_11613=0.0;
float4 l9_11614=float4(0.0);
float4 l9_11615=float4(0.0);
ssGlobals l9_11616=l9_11608;
float l9_11617=0.0;
float l9_11618=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_11617=l9_11618;
l9_11613=l9_11617;
float4 l9_11619;
if ((l9_11613*1.0)!=0.0)
{
float l9_11620=0.0;
float l9_11621=(*sc_set0.UserUniforms).rimExpId01;
l9_11620=l9_11621;
float l9_11622=0.0;
float l9_11623=(*sc_set0.UserUniforms).rimIntId01;
l9_11622=l9_11623;
float l9_11624=0.0;
float l9_11625=l9_11620;
float l9_11626=l9_11622;
ssGlobals l9_11627=l9_11616;
float l9_11628=abs(dot(-l9_11627.ViewDirWS,l9_11627.VertexNormal_WorldSpace));
float l9_11629=1.0-pow(1.0-l9_11628,l9_11625);
l9_11629=fast::max(l9_11629,0.0);
l9_11629*=l9_11626;
l9_11624=l9_11629;
float4 l9_11630=float4(0.0);
float l9_11631=0.0;
float4 l9_11632=float4(0.0);
float4 l9_11633=float4(0.0);
ssGlobals l9_11634=l9_11616;
float l9_11635=0.0;
float l9_11636=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_11635=l9_11636;
l9_11631=l9_11635;
float4 l9_11637;
if ((l9_11631*1.0)!=0.0)
{
float4 l9_11638=float4(0.0);
float4 l9_11639=(*sc_set0.UserUniforms).patternColorId01;
l9_11638=l9_11639;
float4 l9_11640=float4(0.0);
float l9_11641=0.0;
float4 l9_11642=float4(0.0);
float4 l9_11643=float4(0.0);
ssGlobals l9_11644=l9_11634;
float l9_11645=0.0;
float l9_11646=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_11645=l9_11646;
l9_11641=l9_11645;
float4 l9_11647;
if ((l9_11641*1.0)!=0.0)
{
float2 l9_11648=float2(0.0);
l9_11648=l9_11644.Surface_UVCoord0;
float2 l9_11649=float2(0.0);
float2 l9_11650=(*sc_set0.UserUniforms).patternScaleId01;
l9_11649=l9_11650;
float2 l9_11651=float2(0.0);
l9_11651=((l9_11648-(*sc_set0.UserUniforms).Port_Center_N122)*l9_11649)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_11652=float2(0.0);
float2 l9_11653=(*sc_set0.UserUniforms).patternOffsetId01;
l9_11652=l9_11653;
float2 l9_11654=float2(0.0);
l9_11654=l9_11651+l9_11652;
float l9_11655=0.0;
float l9_11656=(*sc_set0.UserUniforms).patternRotateId01;
l9_11655=l9_11656;
float2 l9_11657=float2(0.0);
float2 l9_11658=l9_11654;
float l9_11659=l9_11655;
float2 l9_11660=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_11661=sin(radians(l9_11659));
float l9_11662=cos(radians(l9_11659));
float2 l9_11663=l9_11658-l9_11660;
l9_11663=float2(dot(float2(l9_11662,l9_11661),l9_11663),dot(float2(-l9_11661,l9_11662),l9_11663))+l9_11660;
l9_11657=l9_11663;
float4 l9_11664=float4(0.0);
int l9_11665;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_11666=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11666=0;
}
else
{
l9_11666=in.varStereoViewID;
}
int l9_11667=l9_11666;
l9_11665=1-l9_11667;
}
else
{
int l9_11668=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11668=0;
}
else
{
l9_11668=in.varStereoViewID;
}
int l9_11669=l9_11668;
l9_11665=l9_11669;
}
int l9_11670=l9_11665;
int l9_11671=patternTextureId01Layout_tmp;
int l9_11672=l9_11670;
float2 l9_11673=l9_11657;
bool l9_11674=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_11675=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_11676=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_11677=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_11678=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_11679=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_11680=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_11681=0.0;
bool l9_11682=l9_11679&&(!l9_11677);
float l9_11683=1.0;
float l9_11684=l9_11673.x;
int l9_11685=l9_11676.x;
if (l9_11685==1)
{
l9_11684=fract(l9_11684);
}
else
{
if (l9_11685==2)
{
float l9_11686=fract(l9_11684);
float l9_11687=l9_11684-l9_11686;
float l9_11688=step(0.25,fract(l9_11687*0.5));
l9_11684=mix(l9_11686,1.0-l9_11686,fast::clamp(l9_11688,0.0,1.0));
}
}
l9_11673.x=l9_11684;
float l9_11689=l9_11673.y;
int l9_11690=l9_11676.y;
if (l9_11690==1)
{
l9_11689=fract(l9_11689);
}
else
{
if (l9_11690==2)
{
float l9_11691=fract(l9_11689);
float l9_11692=l9_11689-l9_11691;
float l9_11693=step(0.25,fract(l9_11692*0.5));
l9_11689=mix(l9_11691,1.0-l9_11691,fast::clamp(l9_11693,0.0,1.0));
}
}
l9_11673.y=l9_11689;
if (l9_11677)
{
bool l9_11694=l9_11679;
bool l9_11695;
if (l9_11694)
{
l9_11695=l9_11676.x==3;
}
else
{
l9_11695=l9_11694;
}
float l9_11696=l9_11673.x;
float l9_11697=l9_11678.x;
float l9_11698=l9_11678.z;
bool l9_11699=l9_11695;
float l9_11700=l9_11683;
float l9_11701=fast::clamp(l9_11696,l9_11697,l9_11698);
float l9_11702=step(abs(l9_11696-l9_11701),9.9999997e-06);
l9_11700*=(l9_11702+((1.0-float(l9_11699))*(1.0-l9_11702)));
l9_11696=l9_11701;
l9_11673.x=l9_11696;
l9_11683=l9_11700;
bool l9_11703=l9_11679;
bool l9_11704;
if (l9_11703)
{
l9_11704=l9_11676.y==3;
}
else
{
l9_11704=l9_11703;
}
float l9_11705=l9_11673.y;
float l9_11706=l9_11678.y;
float l9_11707=l9_11678.w;
bool l9_11708=l9_11704;
float l9_11709=l9_11683;
float l9_11710=fast::clamp(l9_11705,l9_11706,l9_11707);
float l9_11711=step(abs(l9_11705-l9_11710),9.9999997e-06);
l9_11709*=(l9_11711+((1.0-float(l9_11708))*(1.0-l9_11711)));
l9_11705=l9_11710;
l9_11673.y=l9_11705;
l9_11683=l9_11709;
}
float2 l9_11712=l9_11673;
bool l9_11713=l9_11674;
float3x3 l9_11714=l9_11675;
if (l9_11713)
{
l9_11712=float2((l9_11714*float3(l9_11712,1.0)).xy);
}
float2 l9_11715=l9_11712;
l9_11673=l9_11715;
float l9_11716=l9_11673.x;
int l9_11717=l9_11676.x;
bool l9_11718=l9_11682;
float l9_11719=l9_11683;
if ((l9_11717==0)||(l9_11717==3))
{
float l9_11720=l9_11716;
float l9_11721=0.0;
float l9_11722=1.0;
bool l9_11723=l9_11718;
float l9_11724=l9_11719;
float l9_11725=fast::clamp(l9_11720,l9_11721,l9_11722);
float l9_11726=step(abs(l9_11720-l9_11725),9.9999997e-06);
l9_11724*=(l9_11726+((1.0-float(l9_11723))*(1.0-l9_11726)));
l9_11720=l9_11725;
l9_11716=l9_11720;
l9_11719=l9_11724;
}
l9_11673.x=l9_11716;
l9_11683=l9_11719;
float l9_11727=l9_11673.y;
int l9_11728=l9_11676.y;
bool l9_11729=l9_11682;
float l9_11730=l9_11683;
if ((l9_11728==0)||(l9_11728==3))
{
float l9_11731=l9_11727;
float l9_11732=0.0;
float l9_11733=1.0;
bool l9_11734=l9_11729;
float l9_11735=l9_11730;
float l9_11736=fast::clamp(l9_11731,l9_11732,l9_11733);
float l9_11737=step(abs(l9_11731-l9_11736),9.9999997e-06);
l9_11735*=(l9_11737+((1.0-float(l9_11734))*(1.0-l9_11737)));
l9_11731=l9_11736;
l9_11727=l9_11731;
l9_11730=l9_11735;
}
l9_11673.y=l9_11727;
l9_11683=l9_11730;
float2 l9_11738=l9_11673;
int l9_11739=l9_11671;
int l9_11740=l9_11672;
float l9_11741=l9_11681;
float2 l9_11742=l9_11738;
int l9_11743=l9_11739;
int l9_11744=l9_11740;
float3 l9_11745=float3(0.0);
if (l9_11743==0)
{
l9_11745=float3(l9_11742,0.0);
}
else
{
if (l9_11743==1)
{
l9_11745=float3(l9_11742.x,(l9_11742.y*0.5)+(0.5-(float(l9_11744)*0.5)),0.0);
}
else
{
l9_11745=float3(l9_11742,float(l9_11744));
}
}
float3 l9_11746=l9_11745;
float3 l9_11747=l9_11746;
float4 l9_11748=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_11747.xy,bias(l9_11741));
float4 l9_11749=l9_11748;
if (l9_11679)
{
l9_11749=mix(l9_11680,l9_11749,float4(l9_11683));
}
float4 l9_11750=l9_11749;
l9_11664=l9_11750;
l9_11642=l9_11664;
l9_11647=l9_11642;
}
else
{
float2 l9_11751=float2(0.0);
l9_11751=l9_11644.Surface_UVCoord0;
float2 l9_11752=float2(0.0);
float2 l9_11753=(*sc_set0.UserUniforms).patternScaleId01;
l9_11752=l9_11753;
float2 l9_11754=float2(0.0);
l9_11754=((l9_11751-(*sc_set0.UserUniforms).Port_Center_N122)*l9_11752)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_11755=float2(0.0);
float2 l9_11756=(*sc_set0.UserUniforms).patternOffsetId01;
l9_11755=l9_11756;
float2 l9_11757=float2(0.0);
l9_11757=l9_11754+l9_11755;
float l9_11758=0.0;
float l9_11759=(*sc_set0.UserUniforms).patternRotateId01;
l9_11758=l9_11759;
float2 l9_11760=float2(0.0);
float2 l9_11761=l9_11757;
float l9_11762=l9_11758;
float2 l9_11763=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_11764=sin(radians(l9_11762));
float l9_11765=cos(radians(l9_11762));
float2 l9_11766=l9_11761-l9_11763;
l9_11766=float2(dot(float2(l9_11765,l9_11764),l9_11766),dot(float2(-l9_11764,l9_11765),l9_11766))+l9_11763;
l9_11760=l9_11766;
float4 l9_11767=float4(0.0);
int l9_11768;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_11769=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11769=0;
}
else
{
l9_11769=in.varStereoViewID;
}
int l9_11770=l9_11769;
l9_11768=1-l9_11770;
}
else
{
int l9_11771=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11771=0;
}
else
{
l9_11771=in.varStereoViewID;
}
int l9_11772=l9_11771;
l9_11768=l9_11772;
}
int l9_11773=l9_11768;
int l9_11774=patternTextureId01Layout_tmp;
int l9_11775=l9_11773;
float2 l9_11776=l9_11760;
bool l9_11777=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_11778=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_11779=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_11780=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_11781=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_11782=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_11783=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_11784=0.0;
bool l9_11785=l9_11782&&(!l9_11780);
float l9_11786=1.0;
float l9_11787=l9_11776.x;
int l9_11788=l9_11779.x;
if (l9_11788==1)
{
l9_11787=fract(l9_11787);
}
else
{
if (l9_11788==2)
{
float l9_11789=fract(l9_11787);
float l9_11790=l9_11787-l9_11789;
float l9_11791=step(0.25,fract(l9_11790*0.5));
l9_11787=mix(l9_11789,1.0-l9_11789,fast::clamp(l9_11791,0.0,1.0));
}
}
l9_11776.x=l9_11787;
float l9_11792=l9_11776.y;
int l9_11793=l9_11779.y;
if (l9_11793==1)
{
l9_11792=fract(l9_11792);
}
else
{
if (l9_11793==2)
{
float l9_11794=fract(l9_11792);
float l9_11795=l9_11792-l9_11794;
float l9_11796=step(0.25,fract(l9_11795*0.5));
l9_11792=mix(l9_11794,1.0-l9_11794,fast::clamp(l9_11796,0.0,1.0));
}
}
l9_11776.y=l9_11792;
if (l9_11780)
{
bool l9_11797=l9_11782;
bool l9_11798;
if (l9_11797)
{
l9_11798=l9_11779.x==3;
}
else
{
l9_11798=l9_11797;
}
float l9_11799=l9_11776.x;
float l9_11800=l9_11781.x;
float l9_11801=l9_11781.z;
bool l9_11802=l9_11798;
float l9_11803=l9_11786;
float l9_11804=fast::clamp(l9_11799,l9_11800,l9_11801);
float l9_11805=step(abs(l9_11799-l9_11804),9.9999997e-06);
l9_11803*=(l9_11805+((1.0-float(l9_11802))*(1.0-l9_11805)));
l9_11799=l9_11804;
l9_11776.x=l9_11799;
l9_11786=l9_11803;
bool l9_11806=l9_11782;
bool l9_11807;
if (l9_11806)
{
l9_11807=l9_11779.y==3;
}
else
{
l9_11807=l9_11806;
}
float l9_11808=l9_11776.y;
float l9_11809=l9_11781.y;
float l9_11810=l9_11781.w;
bool l9_11811=l9_11807;
float l9_11812=l9_11786;
float l9_11813=fast::clamp(l9_11808,l9_11809,l9_11810);
float l9_11814=step(abs(l9_11808-l9_11813),9.9999997e-06);
l9_11812*=(l9_11814+((1.0-float(l9_11811))*(1.0-l9_11814)));
l9_11808=l9_11813;
l9_11776.y=l9_11808;
l9_11786=l9_11812;
}
float2 l9_11815=l9_11776;
bool l9_11816=l9_11777;
float3x3 l9_11817=l9_11778;
if (l9_11816)
{
l9_11815=float2((l9_11817*float3(l9_11815,1.0)).xy);
}
float2 l9_11818=l9_11815;
l9_11776=l9_11818;
float l9_11819=l9_11776.x;
int l9_11820=l9_11779.x;
bool l9_11821=l9_11785;
float l9_11822=l9_11786;
if ((l9_11820==0)||(l9_11820==3))
{
float l9_11823=l9_11819;
float l9_11824=0.0;
float l9_11825=1.0;
bool l9_11826=l9_11821;
float l9_11827=l9_11822;
float l9_11828=fast::clamp(l9_11823,l9_11824,l9_11825);
float l9_11829=step(abs(l9_11823-l9_11828),9.9999997e-06);
l9_11827*=(l9_11829+((1.0-float(l9_11826))*(1.0-l9_11829)));
l9_11823=l9_11828;
l9_11819=l9_11823;
l9_11822=l9_11827;
}
l9_11776.x=l9_11819;
l9_11786=l9_11822;
float l9_11830=l9_11776.y;
int l9_11831=l9_11779.y;
bool l9_11832=l9_11785;
float l9_11833=l9_11786;
if ((l9_11831==0)||(l9_11831==3))
{
float l9_11834=l9_11830;
float l9_11835=0.0;
float l9_11836=1.0;
bool l9_11837=l9_11832;
float l9_11838=l9_11833;
float l9_11839=fast::clamp(l9_11834,l9_11835,l9_11836);
float l9_11840=step(abs(l9_11834-l9_11839),9.9999997e-06);
l9_11838*=(l9_11840+((1.0-float(l9_11837))*(1.0-l9_11840)));
l9_11834=l9_11839;
l9_11830=l9_11834;
l9_11833=l9_11838;
}
l9_11776.y=l9_11830;
l9_11786=l9_11833;
float2 l9_11841=l9_11776;
int l9_11842=l9_11774;
int l9_11843=l9_11775;
float l9_11844=l9_11784;
float2 l9_11845=l9_11841;
int l9_11846=l9_11842;
int l9_11847=l9_11843;
float3 l9_11848=float3(0.0);
if (l9_11846==0)
{
l9_11848=float3(l9_11845,0.0);
}
else
{
if (l9_11846==1)
{
l9_11848=float3(l9_11845.x,(l9_11845.y*0.5)+(0.5-(float(l9_11847)*0.5)),0.0);
}
else
{
l9_11848=float3(l9_11845,float(l9_11847));
}
}
float3 l9_11849=l9_11848;
float3 l9_11850=l9_11849;
float4 l9_11851=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_11850.xy,bias(l9_11844));
float4 l9_11852=l9_11851;
if (l9_11782)
{
l9_11852=mix(l9_11783,l9_11852,float4(l9_11786));
}
float4 l9_11853=l9_11852;
l9_11767=l9_11853;
float l9_11854=0.0;
float3 l9_11855=l9_11767.xyz;
float l9_11856=l9_11855.x;
l9_11854=l9_11856;
l9_11643=float4(l9_11854);
l9_11647=l9_11643;
}
l9_11640=l9_11647;
float4 l9_11857=float4(0.0);
l9_11857=l9_11638*l9_11640;
l9_11632=l9_11857;
l9_11637=l9_11632;
}
else
{
float4 l9_11858=float4(0.0);
float4 l9_11859=(*sc_set0.UserUniforms).colorId01;
l9_11858=l9_11859;
float2 l9_11860=float2(0.0);
l9_11860=l9_11634.Surface_UVCoord0;
float4 l9_11861=float4(0.0);
int l9_11862;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_11863=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11863=0;
}
else
{
l9_11863=in.varStereoViewID;
}
int l9_11864=l9_11863;
l9_11862=1-l9_11864;
}
else
{
int l9_11865=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11865=0;
}
else
{
l9_11865=in.varStereoViewID;
}
int l9_11866=l9_11865;
l9_11862=l9_11866;
}
int l9_11867=l9_11862;
int l9_11868=greyMaskIdLayout_tmp;
int l9_11869=l9_11867;
float2 l9_11870=l9_11860;
bool l9_11871=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_11872=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_11873=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_11874=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_11875=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_11876=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_11877=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_11878=0.0;
bool l9_11879=l9_11876&&(!l9_11874);
float l9_11880=1.0;
float l9_11881=l9_11870.x;
int l9_11882=l9_11873.x;
if (l9_11882==1)
{
l9_11881=fract(l9_11881);
}
else
{
if (l9_11882==2)
{
float l9_11883=fract(l9_11881);
float l9_11884=l9_11881-l9_11883;
float l9_11885=step(0.25,fract(l9_11884*0.5));
l9_11881=mix(l9_11883,1.0-l9_11883,fast::clamp(l9_11885,0.0,1.0));
}
}
l9_11870.x=l9_11881;
float l9_11886=l9_11870.y;
int l9_11887=l9_11873.y;
if (l9_11887==1)
{
l9_11886=fract(l9_11886);
}
else
{
if (l9_11887==2)
{
float l9_11888=fract(l9_11886);
float l9_11889=l9_11886-l9_11888;
float l9_11890=step(0.25,fract(l9_11889*0.5));
l9_11886=mix(l9_11888,1.0-l9_11888,fast::clamp(l9_11890,0.0,1.0));
}
}
l9_11870.y=l9_11886;
if (l9_11874)
{
bool l9_11891=l9_11876;
bool l9_11892;
if (l9_11891)
{
l9_11892=l9_11873.x==3;
}
else
{
l9_11892=l9_11891;
}
float l9_11893=l9_11870.x;
float l9_11894=l9_11875.x;
float l9_11895=l9_11875.z;
bool l9_11896=l9_11892;
float l9_11897=l9_11880;
float l9_11898=fast::clamp(l9_11893,l9_11894,l9_11895);
float l9_11899=step(abs(l9_11893-l9_11898),9.9999997e-06);
l9_11897*=(l9_11899+((1.0-float(l9_11896))*(1.0-l9_11899)));
l9_11893=l9_11898;
l9_11870.x=l9_11893;
l9_11880=l9_11897;
bool l9_11900=l9_11876;
bool l9_11901;
if (l9_11900)
{
l9_11901=l9_11873.y==3;
}
else
{
l9_11901=l9_11900;
}
float l9_11902=l9_11870.y;
float l9_11903=l9_11875.y;
float l9_11904=l9_11875.w;
bool l9_11905=l9_11901;
float l9_11906=l9_11880;
float l9_11907=fast::clamp(l9_11902,l9_11903,l9_11904);
float l9_11908=step(abs(l9_11902-l9_11907),9.9999997e-06);
l9_11906*=(l9_11908+((1.0-float(l9_11905))*(1.0-l9_11908)));
l9_11902=l9_11907;
l9_11870.y=l9_11902;
l9_11880=l9_11906;
}
float2 l9_11909=l9_11870;
bool l9_11910=l9_11871;
float3x3 l9_11911=l9_11872;
if (l9_11910)
{
l9_11909=float2((l9_11911*float3(l9_11909,1.0)).xy);
}
float2 l9_11912=l9_11909;
l9_11870=l9_11912;
float l9_11913=l9_11870.x;
int l9_11914=l9_11873.x;
bool l9_11915=l9_11879;
float l9_11916=l9_11880;
if ((l9_11914==0)||(l9_11914==3))
{
float l9_11917=l9_11913;
float l9_11918=0.0;
float l9_11919=1.0;
bool l9_11920=l9_11915;
float l9_11921=l9_11916;
float l9_11922=fast::clamp(l9_11917,l9_11918,l9_11919);
float l9_11923=step(abs(l9_11917-l9_11922),9.9999997e-06);
l9_11921*=(l9_11923+((1.0-float(l9_11920))*(1.0-l9_11923)));
l9_11917=l9_11922;
l9_11913=l9_11917;
l9_11916=l9_11921;
}
l9_11870.x=l9_11913;
l9_11880=l9_11916;
float l9_11924=l9_11870.y;
int l9_11925=l9_11873.y;
bool l9_11926=l9_11879;
float l9_11927=l9_11880;
if ((l9_11925==0)||(l9_11925==3))
{
float l9_11928=l9_11924;
float l9_11929=0.0;
float l9_11930=1.0;
bool l9_11931=l9_11926;
float l9_11932=l9_11927;
float l9_11933=fast::clamp(l9_11928,l9_11929,l9_11930);
float l9_11934=step(abs(l9_11928-l9_11933),9.9999997e-06);
l9_11932*=(l9_11934+((1.0-float(l9_11931))*(1.0-l9_11934)));
l9_11928=l9_11933;
l9_11924=l9_11928;
l9_11927=l9_11932;
}
l9_11870.y=l9_11924;
l9_11880=l9_11927;
float2 l9_11935=l9_11870;
int l9_11936=l9_11868;
int l9_11937=l9_11869;
float l9_11938=l9_11878;
float2 l9_11939=l9_11935;
int l9_11940=l9_11936;
int l9_11941=l9_11937;
float3 l9_11942=float3(0.0);
if (l9_11940==0)
{
l9_11942=float3(l9_11939,0.0);
}
else
{
if (l9_11940==1)
{
l9_11942=float3(l9_11939.x,(l9_11939.y*0.5)+(0.5-(float(l9_11941)*0.5)),0.0);
}
else
{
l9_11942=float3(l9_11939,float(l9_11941));
}
}
float3 l9_11943=l9_11942;
float3 l9_11944=l9_11943;
float4 l9_11945=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_11944.xy,bias(l9_11938));
float4 l9_11946=l9_11945;
if (l9_11876)
{
l9_11946=mix(l9_11877,l9_11946,float4(l9_11880));
}
float4 l9_11947=l9_11946;
l9_11861=l9_11947;
float l9_11948=0.0;
l9_11948=l9_11861.x;
float l9_11949=0.0;
l9_11949=step(l9_11948,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_11950=float4(0.0);
l9_11950=l9_11858*float4(l9_11949);
l9_11633=l9_11950;
l9_11637=l9_11633;
}
l9_11630=l9_11637;
float2 l9_11951=float2(0.0);
l9_11951=l9_11616.Surface_UVCoord0;
float4 l9_11952=float4(0.0);
int l9_11953;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_11954=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11954=0;
}
else
{
l9_11954=in.varStereoViewID;
}
int l9_11955=l9_11954;
l9_11953=1-l9_11955;
}
else
{
int l9_11956=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_11956=0;
}
else
{
l9_11956=in.varStereoViewID;
}
int l9_11957=l9_11956;
l9_11953=l9_11957;
}
int l9_11958=l9_11953;
int l9_11959=greyMaskIdLayout_tmp;
int l9_11960=l9_11958;
float2 l9_11961=l9_11951;
bool l9_11962=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_11963=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_11964=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_11965=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_11966=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_11967=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_11968=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_11969=0.0;
bool l9_11970=l9_11967&&(!l9_11965);
float l9_11971=1.0;
float l9_11972=l9_11961.x;
int l9_11973=l9_11964.x;
if (l9_11973==1)
{
l9_11972=fract(l9_11972);
}
else
{
if (l9_11973==2)
{
float l9_11974=fract(l9_11972);
float l9_11975=l9_11972-l9_11974;
float l9_11976=step(0.25,fract(l9_11975*0.5));
l9_11972=mix(l9_11974,1.0-l9_11974,fast::clamp(l9_11976,0.0,1.0));
}
}
l9_11961.x=l9_11972;
float l9_11977=l9_11961.y;
int l9_11978=l9_11964.y;
if (l9_11978==1)
{
l9_11977=fract(l9_11977);
}
else
{
if (l9_11978==2)
{
float l9_11979=fract(l9_11977);
float l9_11980=l9_11977-l9_11979;
float l9_11981=step(0.25,fract(l9_11980*0.5));
l9_11977=mix(l9_11979,1.0-l9_11979,fast::clamp(l9_11981,0.0,1.0));
}
}
l9_11961.y=l9_11977;
if (l9_11965)
{
bool l9_11982=l9_11967;
bool l9_11983;
if (l9_11982)
{
l9_11983=l9_11964.x==3;
}
else
{
l9_11983=l9_11982;
}
float l9_11984=l9_11961.x;
float l9_11985=l9_11966.x;
float l9_11986=l9_11966.z;
bool l9_11987=l9_11983;
float l9_11988=l9_11971;
float l9_11989=fast::clamp(l9_11984,l9_11985,l9_11986);
float l9_11990=step(abs(l9_11984-l9_11989),9.9999997e-06);
l9_11988*=(l9_11990+((1.0-float(l9_11987))*(1.0-l9_11990)));
l9_11984=l9_11989;
l9_11961.x=l9_11984;
l9_11971=l9_11988;
bool l9_11991=l9_11967;
bool l9_11992;
if (l9_11991)
{
l9_11992=l9_11964.y==3;
}
else
{
l9_11992=l9_11991;
}
float l9_11993=l9_11961.y;
float l9_11994=l9_11966.y;
float l9_11995=l9_11966.w;
bool l9_11996=l9_11992;
float l9_11997=l9_11971;
float l9_11998=fast::clamp(l9_11993,l9_11994,l9_11995);
float l9_11999=step(abs(l9_11993-l9_11998),9.9999997e-06);
l9_11997*=(l9_11999+((1.0-float(l9_11996))*(1.0-l9_11999)));
l9_11993=l9_11998;
l9_11961.y=l9_11993;
l9_11971=l9_11997;
}
float2 l9_12000=l9_11961;
bool l9_12001=l9_11962;
float3x3 l9_12002=l9_11963;
if (l9_12001)
{
l9_12000=float2((l9_12002*float3(l9_12000,1.0)).xy);
}
float2 l9_12003=l9_12000;
l9_11961=l9_12003;
float l9_12004=l9_11961.x;
int l9_12005=l9_11964.x;
bool l9_12006=l9_11970;
float l9_12007=l9_11971;
if ((l9_12005==0)||(l9_12005==3))
{
float l9_12008=l9_12004;
float l9_12009=0.0;
float l9_12010=1.0;
bool l9_12011=l9_12006;
float l9_12012=l9_12007;
float l9_12013=fast::clamp(l9_12008,l9_12009,l9_12010);
float l9_12014=step(abs(l9_12008-l9_12013),9.9999997e-06);
l9_12012*=(l9_12014+((1.0-float(l9_12011))*(1.0-l9_12014)));
l9_12008=l9_12013;
l9_12004=l9_12008;
l9_12007=l9_12012;
}
l9_11961.x=l9_12004;
l9_11971=l9_12007;
float l9_12015=l9_11961.y;
int l9_12016=l9_11964.y;
bool l9_12017=l9_11970;
float l9_12018=l9_11971;
if ((l9_12016==0)||(l9_12016==3))
{
float l9_12019=l9_12015;
float l9_12020=0.0;
float l9_12021=1.0;
bool l9_12022=l9_12017;
float l9_12023=l9_12018;
float l9_12024=fast::clamp(l9_12019,l9_12020,l9_12021);
float l9_12025=step(abs(l9_12019-l9_12024),9.9999997e-06);
l9_12023*=(l9_12025+((1.0-float(l9_12022))*(1.0-l9_12025)));
l9_12019=l9_12024;
l9_12015=l9_12019;
l9_12018=l9_12023;
}
l9_11961.y=l9_12015;
l9_11971=l9_12018;
float2 l9_12026=l9_11961;
int l9_12027=l9_11959;
int l9_12028=l9_11960;
float l9_12029=l9_11969;
float2 l9_12030=l9_12026;
int l9_12031=l9_12027;
int l9_12032=l9_12028;
float3 l9_12033=float3(0.0);
if (l9_12031==0)
{
l9_12033=float3(l9_12030,0.0);
}
else
{
if (l9_12031==1)
{
l9_12033=float3(l9_12030.x,(l9_12030.y*0.5)+(0.5-(float(l9_12032)*0.5)),0.0);
}
else
{
l9_12033=float3(l9_12030,float(l9_12032));
}
}
float3 l9_12034=l9_12033;
float3 l9_12035=l9_12034;
float4 l9_12036=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_12035.xy,bias(l9_12029));
float4 l9_12037=l9_12036;
if (l9_11967)
{
l9_12037=mix(l9_11968,l9_12037,float4(l9_11971));
}
float4 l9_12038=l9_12037;
l9_11952=l9_12038;
float l9_12039=0.0;
l9_12039=l9_11952.x;
float l9_12040=0.0;
l9_12040=step(l9_12039,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_12041=float4(0.0);
l9_12041=l9_11630*float4(l9_12040);
float4 l9_12042=float4(0.0);
float4 l9_12043=(*sc_set0.UserUniforms).colorId01;
l9_12042=l9_12043;
float4 l9_12044=float4(0.0);
l9_12044=l9_12042*float4(l9_12040);
float4 l9_12045=float4(0.0);
float4 l9_12046=l9_12041;
float4 l9_12047=l9_12044;
float4 l9_12048=l9_12046;
float4 l9_12049=l9_12047;
float3 l9_12050=l9_12048.xyz*l9_12048.w;
l9_12048=float4(l9_12050.x,l9_12050.y,l9_12050.z,l9_12048.w);
float4 l9_12051=l9_12048+(l9_12049*(1.0-l9_12048.w));
l9_12045=l9_12051;
float4 l9_12052=float4(0.0);
l9_12052=float4(l9_11624)*l9_12045;
float4 l9_12053=float4(0.0);
l9_12053=l9_12052+l9_12045;
l9_11614=l9_12053;
l9_11619=l9_11614;
}
else
{
float4 l9_12054=float4(0.0);
float l9_12055=0.0;
float4 l9_12056=float4(0.0);
float4 l9_12057=float4(0.0);
ssGlobals l9_12058=l9_11616;
float l9_12059=0.0;
float l9_12060=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_12059=l9_12060;
l9_12055=l9_12059;
float4 l9_12061;
if ((l9_12055*1.0)!=0.0)
{
float4 l9_12062=float4(0.0);
float4 l9_12063=(*sc_set0.UserUniforms).patternColorId01;
l9_12062=l9_12063;
float4 l9_12064=float4(0.0);
float l9_12065=0.0;
float4 l9_12066=float4(0.0);
float4 l9_12067=float4(0.0);
ssGlobals l9_12068=l9_12058;
float l9_12069=0.0;
float l9_12070=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_12069=l9_12070;
l9_12065=l9_12069;
float4 l9_12071;
if ((l9_12065*1.0)!=0.0)
{
float2 l9_12072=float2(0.0);
l9_12072=l9_12068.Surface_UVCoord0;
float2 l9_12073=float2(0.0);
float2 l9_12074=(*sc_set0.UserUniforms).patternScaleId01;
l9_12073=l9_12074;
float2 l9_12075=float2(0.0);
l9_12075=((l9_12072-(*sc_set0.UserUniforms).Port_Center_N122)*l9_12073)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_12076=float2(0.0);
float2 l9_12077=(*sc_set0.UserUniforms).patternOffsetId01;
l9_12076=l9_12077;
float2 l9_12078=float2(0.0);
l9_12078=l9_12075+l9_12076;
float l9_12079=0.0;
float l9_12080=(*sc_set0.UserUniforms).patternRotateId01;
l9_12079=l9_12080;
float2 l9_12081=float2(0.0);
float2 l9_12082=l9_12078;
float l9_12083=l9_12079;
float2 l9_12084=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_12085=sin(radians(l9_12083));
float l9_12086=cos(radians(l9_12083));
float2 l9_12087=l9_12082-l9_12084;
l9_12087=float2(dot(float2(l9_12086,l9_12085),l9_12087),dot(float2(-l9_12085,l9_12086),l9_12087))+l9_12084;
l9_12081=l9_12087;
float4 l9_12088=float4(0.0);
int l9_12089;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_12090=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12090=0;
}
else
{
l9_12090=in.varStereoViewID;
}
int l9_12091=l9_12090;
l9_12089=1-l9_12091;
}
else
{
int l9_12092=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12092=0;
}
else
{
l9_12092=in.varStereoViewID;
}
int l9_12093=l9_12092;
l9_12089=l9_12093;
}
int l9_12094=l9_12089;
int l9_12095=patternTextureId01Layout_tmp;
int l9_12096=l9_12094;
float2 l9_12097=l9_12081;
bool l9_12098=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_12099=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_12100=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_12101=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_12102=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_12103=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_12104=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_12105=0.0;
bool l9_12106=l9_12103&&(!l9_12101);
float l9_12107=1.0;
float l9_12108=l9_12097.x;
int l9_12109=l9_12100.x;
if (l9_12109==1)
{
l9_12108=fract(l9_12108);
}
else
{
if (l9_12109==2)
{
float l9_12110=fract(l9_12108);
float l9_12111=l9_12108-l9_12110;
float l9_12112=step(0.25,fract(l9_12111*0.5));
l9_12108=mix(l9_12110,1.0-l9_12110,fast::clamp(l9_12112,0.0,1.0));
}
}
l9_12097.x=l9_12108;
float l9_12113=l9_12097.y;
int l9_12114=l9_12100.y;
if (l9_12114==1)
{
l9_12113=fract(l9_12113);
}
else
{
if (l9_12114==2)
{
float l9_12115=fract(l9_12113);
float l9_12116=l9_12113-l9_12115;
float l9_12117=step(0.25,fract(l9_12116*0.5));
l9_12113=mix(l9_12115,1.0-l9_12115,fast::clamp(l9_12117,0.0,1.0));
}
}
l9_12097.y=l9_12113;
if (l9_12101)
{
bool l9_12118=l9_12103;
bool l9_12119;
if (l9_12118)
{
l9_12119=l9_12100.x==3;
}
else
{
l9_12119=l9_12118;
}
float l9_12120=l9_12097.x;
float l9_12121=l9_12102.x;
float l9_12122=l9_12102.z;
bool l9_12123=l9_12119;
float l9_12124=l9_12107;
float l9_12125=fast::clamp(l9_12120,l9_12121,l9_12122);
float l9_12126=step(abs(l9_12120-l9_12125),9.9999997e-06);
l9_12124*=(l9_12126+((1.0-float(l9_12123))*(1.0-l9_12126)));
l9_12120=l9_12125;
l9_12097.x=l9_12120;
l9_12107=l9_12124;
bool l9_12127=l9_12103;
bool l9_12128;
if (l9_12127)
{
l9_12128=l9_12100.y==3;
}
else
{
l9_12128=l9_12127;
}
float l9_12129=l9_12097.y;
float l9_12130=l9_12102.y;
float l9_12131=l9_12102.w;
bool l9_12132=l9_12128;
float l9_12133=l9_12107;
float l9_12134=fast::clamp(l9_12129,l9_12130,l9_12131);
float l9_12135=step(abs(l9_12129-l9_12134),9.9999997e-06);
l9_12133*=(l9_12135+((1.0-float(l9_12132))*(1.0-l9_12135)));
l9_12129=l9_12134;
l9_12097.y=l9_12129;
l9_12107=l9_12133;
}
float2 l9_12136=l9_12097;
bool l9_12137=l9_12098;
float3x3 l9_12138=l9_12099;
if (l9_12137)
{
l9_12136=float2((l9_12138*float3(l9_12136,1.0)).xy);
}
float2 l9_12139=l9_12136;
l9_12097=l9_12139;
float l9_12140=l9_12097.x;
int l9_12141=l9_12100.x;
bool l9_12142=l9_12106;
float l9_12143=l9_12107;
if ((l9_12141==0)||(l9_12141==3))
{
float l9_12144=l9_12140;
float l9_12145=0.0;
float l9_12146=1.0;
bool l9_12147=l9_12142;
float l9_12148=l9_12143;
float l9_12149=fast::clamp(l9_12144,l9_12145,l9_12146);
float l9_12150=step(abs(l9_12144-l9_12149),9.9999997e-06);
l9_12148*=(l9_12150+((1.0-float(l9_12147))*(1.0-l9_12150)));
l9_12144=l9_12149;
l9_12140=l9_12144;
l9_12143=l9_12148;
}
l9_12097.x=l9_12140;
l9_12107=l9_12143;
float l9_12151=l9_12097.y;
int l9_12152=l9_12100.y;
bool l9_12153=l9_12106;
float l9_12154=l9_12107;
if ((l9_12152==0)||(l9_12152==3))
{
float l9_12155=l9_12151;
float l9_12156=0.0;
float l9_12157=1.0;
bool l9_12158=l9_12153;
float l9_12159=l9_12154;
float l9_12160=fast::clamp(l9_12155,l9_12156,l9_12157);
float l9_12161=step(abs(l9_12155-l9_12160),9.9999997e-06);
l9_12159*=(l9_12161+((1.0-float(l9_12158))*(1.0-l9_12161)));
l9_12155=l9_12160;
l9_12151=l9_12155;
l9_12154=l9_12159;
}
l9_12097.y=l9_12151;
l9_12107=l9_12154;
float2 l9_12162=l9_12097;
int l9_12163=l9_12095;
int l9_12164=l9_12096;
float l9_12165=l9_12105;
float2 l9_12166=l9_12162;
int l9_12167=l9_12163;
int l9_12168=l9_12164;
float3 l9_12169=float3(0.0);
if (l9_12167==0)
{
l9_12169=float3(l9_12166,0.0);
}
else
{
if (l9_12167==1)
{
l9_12169=float3(l9_12166.x,(l9_12166.y*0.5)+(0.5-(float(l9_12168)*0.5)),0.0);
}
else
{
l9_12169=float3(l9_12166,float(l9_12168));
}
}
float3 l9_12170=l9_12169;
float3 l9_12171=l9_12170;
float4 l9_12172=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_12171.xy,bias(l9_12165));
float4 l9_12173=l9_12172;
if (l9_12103)
{
l9_12173=mix(l9_12104,l9_12173,float4(l9_12107));
}
float4 l9_12174=l9_12173;
l9_12088=l9_12174;
l9_12066=l9_12088;
l9_12071=l9_12066;
}
else
{
float2 l9_12175=float2(0.0);
l9_12175=l9_12068.Surface_UVCoord0;
float2 l9_12176=float2(0.0);
float2 l9_12177=(*sc_set0.UserUniforms).patternScaleId01;
l9_12176=l9_12177;
float2 l9_12178=float2(0.0);
l9_12178=((l9_12175-(*sc_set0.UserUniforms).Port_Center_N122)*l9_12176)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_12179=float2(0.0);
float2 l9_12180=(*sc_set0.UserUniforms).patternOffsetId01;
l9_12179=l9_12180;
float2 l9_12181=float2(0.0);
l9_12181=l9_12178+l9_12179;
float l9_12182=0.0;
float l9_12183=(*sc_set0.UserUniforms).patternRotateId01;
l9_12182=l9_12183;
float2 l9_12184=float2(0.0);
float2 l9_12185=l9_12181;
float l9_12186=l9_12182;
float2 l9_12187=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_12188=sin(radians(l9_12186));
float l9_12189=cos(radians(l9_12186));
float2 l9_12190=l9_12185-l9_12187;
l9_12190=float2(dot(float2(l9_12189,l9_12188),l9_12190),dot(float2(-l9_12188,l9_12189),l9_12190))+l9_12187;
l9_12184=l9_12190;
float4 l9_12191=float4(0.0);
int l9_12192;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_12193=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12193=0;
}
else
{
l9_12193=in.varStereoViewID;
}
int l9_12194=l9_12193;
l9_12192=1-l9_12194;
}
else
{
int l9_12195=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12195=0;
}
else
{
l9_12195=in.varStereoViewID;
}
int l9_12196=l9_12195;
l9_12192=l9_12196;
}
int l9_12197=l9_12192;
int l9_12198=patternTextureId01Layout_tmp;
int l9_12199=l9_12197;
float2 l9_12200=l9_12184;
bool l9_12201=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_12202=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_12203=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_12204=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_12205=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_12206=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_12207=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_12208=0.0;
bool l9_12209=l9_12206&&(!l9_12204);
float l9_12210=1.0;
float l9_12211=l9_12200.x;
int l9_12212=l9_12203.x;
if (l9_12212==1)
{
l9_12211=fract(l9_12211);
}
else
{
if (l9_12212==2)
{
float l9_12213=fract(l9_12211);
float l9_12214=l9_12211-l9_12213;
float l9_12215=step(0.25,fract(l9_12214*0.5));
l9_12211=mix(l9_12213,1.0-l9_12213,fast::clamp(l9_12215,0.0,1.0));
}
}
l9_12200.x=l9_12211;
float l9_12216=l9_12200.y;
int l9_12217=l9_12203.y;
if (l9_12217==1)
{
l9_12216=fract(l9_12216);
}
else
{
if (l9_12217==2)
{
float l9_12218=fract(l9_12216);
float l9_12219=l9_12216-l9_12218;
float l9_12220=step(0.25,fract(l9_12219*0.5));
l9_12216=mix(l9_12218,1.0-l9_12218,fast::clamp(l9_12220,0.0,1.0));
}
}
l9_12200.y=l9_12216;
if (l9_12204)
{
bool l9_12221=l9_12206;
bool l9_12222;
if (l9_12221)
{
l9_12222=l9_12203.x==3;
}
else
{
l9_12222=l9_12221;
}
float l9_12223=l9_12200.x;
float l9_12224=l9_12205.x;
float l9_12225=l9_12205.z;
bool l9_12226=l9_12222;
float l9_12227=l9_12210;
float l9_12228=fast::clamp(l9_12223,l9_12224,l9_12225);
float l9_12229=step(abs(l9_12223-l9_12228),9.9999997e-06);
l9_12227*=(l9_12229+((1.0-float(l9_12226))*(1.0-l9_12229)));
l9_12223=l9_12228;
l9_12200.x=l9_12223;
l9_12210=l9_12227;
bool l9_12230=l9_12206;
bool l9_12231;
if (l9_12230)
{
l9_12231=l9_12203.y==3;
}
else
{
l9_12231=l9_12230;
}
float l9_12232=l9_12200.y;
float l9_12233=l9_12205.y;
float l9_12234=l9_12205.w;
bool l9_12235=l9_12231;
float l9_12236=l9_12210;
float l9_12237=fast::clamp(l9_12232,l9_12233,l9_12234);
float l9_12238=step(abs(l9_12232-l9_12237),9.9999997e-06);
l9_12236*=(l9_12238+((1.0-float(l9_12235))*(1.0-l9_12238)));
l9_12232=l9_12237;
l9_12200.y=l9_12232;
l9_12210=l9_12236;
}
float2 l9_12239=l9_12200;
bool l9_12240=l9_12201;
float3x3 l9_12241=l9_12202;
if (l9_12240)
{
l9_12239=float2((l9_12241*float3(l9_12239,1.0)).xy);
}
float2 l9_12242=l9_12239;
l9_12200=l9_12242;
float l9_12243=l9_12200.x;
int l9_12244=l9_12203.x;
bool l9_12245=l9_12209;
float l9_12246=l9_12210;
if ((l9_12244==0)||(l9_12244==3))
{
float l9_12247=l9_12243;
float l9_12248=0.0;
float l9_12249=1.0;
bool l9_12250=l9_12245;
float l9_12251=l9_12246;
float l9_12252=fast::clamp(l9_12247,l9_12248,l9_12249);
float l9_12253=step(abs(l9_12247-l9_12252),9.9999997e-06);
l9_12251*=(l9_12253+((1.0-float(l9_12250))*(1.0-l9_12253)));
l9_12247=l9_12252;
l9_12243=l9_12247;
l9_12246=l9_12251;
}
l9_12200.x=l9_12243;
l9_12210=l9_12246;
float l9_12254=l9_12200.y;
int l9_12255=l9_12203.y;
bool l9_12256=l9_12209;
float l9_12257=l9_12210;
if ((l9_12255==0)||(l9_12255==3))
{
float l9_12258=l9_12254;
float l9_12259=0.0;
float l9_12260=1.0;
bool l9_12261=l9_12256;
float l9_12262=l9_12257;
float l9_12263=fast::clamp(l9_12258,l9_12259,l9_12260);
float l9_12264=step(abs(l9_12258-l9_12263),9.9999997e-06);
l9_12262*=(l9_12264+((1.0-float(l9_12261))*(1.0-l9_12264)));
l9_12258=l9_12263;
l9_12254=l9_12258;
l9_12257=l9_12262;
}
l9_12200.y=l9_12254;
l9_12210=l9_12257;
float2 l9_12265=l9_12200;
int l9_12266=l9_12198;
int l9_12267=l9_12199;
float l9_12268=l9_12208;
float2 l9_12269=l9_12265;
int l9_12270=l9_12266;
int l9_12271=l9_12267;
float3 l9_12272=float3(0.0);
if (l9_12270==0)
{
l9_12272=float3(l9_12269,0.0);
}
else
{
if (l9_12270==1)
{
l9_12272=float3(l9_12269.x,(l9_12269.y*0.5)+(0.5-(float(l9_12271)*0.5)),0.0);
}
else
{
l9_12272=float3(l9_12269,float(l9_12271));
}
}
float3 l9_12273=l9_12272;
float3 l9_12274=l9_12273;
float4 l9_12275=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_12274.xy,bias(l9_12268));
float4 l9_12276=l9_12275;
if (l9_12206)
{
l9_12276=mix(l9_12207,l9_12276,float4(l9_12210));
}
float4 l9_12277=l9_12276;
l9_12191=l9_12277;
float l9_12278=0.0;
float3 l9_12279=l9_12191.xyz;
float l9_12280=l9_12279.x;
l9_12278=l9_12280;
l9_12067=float4(l9_12278);
l9_12071=l9_12067;
}
l9_12064=l9_12071;
float4 l9_12281=float4(0.0);
l9_12281=l9_12062*l9_12064;
l9_12056=l9_12281;
l9_12061=l9_12056;
}
else
{
float4 l9_12282=float4(0.0);
float4 l9_12283=(*sc_set0.UserUniforms).colorId01;
l9_12282=l9_12283;
float2 l9_12284=float2(0.0);
l9_12284=l9_12058.Surface_UVCoord0;
float4 l9_12285=float4(0.0);
int l9_12286;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_12287=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12287=0;
}
else
{
l9_12287=in.varStereoViewID;
}
int l9_12288=l9_12287;
l9_12286=1-l9_12288;
}
else
{
int l9_12289=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12289=0;
}
else
{
l9_12289=in.varStereoViewID;
}
int l9_12290=l9_12289;
l9_12286=l9_12290;
}
int l9_12291=l9_12286;
int l9_12292=greyMaskIdLayout_tmp;
int l9_12293=l9_12291;
float2 l9_12294=l9_12284;
bool l9_12295=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_12296=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_12297=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_12298=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_12299=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_12300=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_12301=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_12302=0.0;
bool l9_12303=l9_12300&&(!l9_12298);
float l9_12304=1.0;
float l9_12305=l9_12294.x;
int l9_12306=l9_12297.x;
if (l9_12306==1)
{
l9_12305=fract(l9_12305);
}
else
{
if (l9_12306==2)
{
float l9_12307=fract(l9_12305);
float l9_12308=l9_12305-l9_12307;
float l9_12309=step(0.25,fract(l9_12308*0.5));
l9_12305=mix(l9_12307,1.0-l9_12307,fast::clamp(l9_12309,0.0,1.0));
}
}
l9_12294.x=l9_12305;
float l9_12310=l9_12294.y;
int l9_12311=l9_12297.y;
if (l9_12311==1)
{
l9_12310=fract(l9_12310);
}
else
{
if (l9_12311==2)
{
float l9_12312=fract(l9_12310);
float l9_12313=l9_12310-l9_12312;
float l9_12314=step(0.25,fract(l9_12313*0.5));
l9_12310=mix(l9_12312,1.0-l9_12312,fast::clamp(l9_12314,0.0,1.0));
}
}
l9_12294.y=l9_12310;
if (l9_12298)
{
bool l9_12315=l9_12300;
bool l9_12316;
if (l9_12315)
{
l9_12316=l9_12297.x==3;
}
else
{
l9_12316=l9_12315;
}
float l9_12317=l9_12294.x;
float l9_12318=l9_12299.x;
float l9_12319=l9_12299.z;
bool l9_12320=l9_12316;
float l9_12321=l9_12304;
float l9_12322=fast::clamp(l9_12317,l9_12318,l9_12319);
float l9_12323=step(abs(l9_12317-l9_12322),9.9999997e-06);
l9_12321*=(l9_12323+((1.0-float(l9_12320))*(1.0-l9_12323)));
l9_12317=l9_12322;
l9_12294.x=l9_12317;
l9_12304=l9_12321;
bool l9_12324=l9_12300;
bool l9_12325;
if (l9_12324)
{
l9_12325=l9_12297.y==3;
}
else
{
l9_12325=l9_12324;
}
float l9_12326=l9_12294.y;
float l9_12327=l9_12299.y;
float l9_12328=l9_12299.w;
bool l9_12329=l9_12325;
float l9_12330=l9_12304;
float l9_12331=fast::clamp(l9_12326,l9_12327,l9_12328);
float l9_12332=step(abs(l9_12326-l9_12331),9.9999997e-06);
l9_12330*=(l9_12332+((1.0-float(l9_12329))*(1.0-l9_12332)));
l9_12326=l9_12331;
l9_12294.y=l9_12326;
l9_12304=l9_12330;
}
float2 l9_12333=l9_12294;
bool l9_12334=l9_12295;
float3x3 l9_12335=l9_12296;
if (l9_12334)
{
l9_12333=float2((l9_12335*float3(l9_12333,1.0)).xy);
}
float2 l9_12336=l9_12333;
l9_12294=l9_12336;
float l9_12337=l9_12294.x;
int l9_12338=l9_12297.x;
bool l9_12339=l9_12303;
float l9_12340=l9_12304;
if ((l9_12338==0)||(l9_12338==3))
{
float l9_12341=l9_12337;
float l9_12342=0.0;
float l9_12343=1.0;
bool l9_12344=l9_12339;
float l9_12345=l9_12340;
float l9_12346=fast::clamp(l9_12341,l9_12342,l9_12343);
float l9_12347=step(abs(l9_12341-l9_12346),9.9999997e-06);
l9_12345*=(l9_12347+((1.0-float(l9_12344))*(1.0-l9_12347)));
l9_12341=l9_12346;
l9_12337=l9_12341;
l9_12340=l9_12345;
}
l9_12294.x=l9_12337;
l9_12304=l9_12340;
float l9_12348=l9_12294.y;
int l9_12349=l9_12297.y;
bool l9_12350=l9_12303;
float l9_12351=l9_12304;
if ((l9_12349==0)||(l9_12349==3))
{
float l9_12352=l9_12348;
float l9_12353=0.0;
float l9_12354=1.0;
bool l9_12355=l9_12350;
float l9_12356=l9_12351;
float l9_12357=fast::clamp(l9_12352,l9_12353,l9_12354);
float l9_12358=step(abs(l9_12352-l9_12357),9.9999997e-06);
l9_12356*=(l9_12358+((1.0-float(l9_12355))*(1.0-l9_12358)));
l9_12352=l9_12357;
l9_12348=l9_12352;
l9_12351=l9_12356;
}
l9_12294.y=l9_12348;
l9_12304=l9_12351;
float2 l9_12359=l9_12294;
int l9_12360=l9_12292;
int l9_12361=l9_12293;
float l9_12362=l9_12302;
float2 l9_12363=l9_12359;
int l9_12364=l9_12360;
int l9_12365=l9_12361;
float3 l9_12366=float3(0.0);
if (l9_12364==0)
{
l9_12366=float3(l9_12363,0.0);
}
else
{
if (l9_12364==1)
{
l9_12366=float3(l9_12363.x,(l9_12363.y*0.5)+(0.5-(float(l9_12365)*0.5)),0.0);
}
else
{
l9_12366=float3(l9_12363,float(l9_12365));
}
}
float3 l9_12367=l9_12366;
float3 l9_12368=l9_12367;
float4 l9_12369=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_12368.xy,bias(l9_12362));
float4 l9_12370=l9_12369;
if (l9_12300)
{
l9_12370=mix(l9_12301,l9_12370,float4(l9_12304));
}
float4 l9_12371=l9_12370;
l9_12285=l9_12371;
float l9_12372=0.0;
l9_12372=l9_12285.x;
float l9_12373=0.0;
l9_12373=step(l9_12372,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_12374=float4(0.0);
l9_12374=l9_12282*float4(l9_12373);
l9_12057=l9_12374;
l9_12061=l9_12057;
}
l9_12054=l9_12061;
float2 l9_12375=float2(0.0);
l9_12375=l9_11616.Surface_UVCoord0;
float4 l9_12376=float4(0.0);
int l9_12377;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_12378=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12378=0;
}
else
{
l9_12378=in.varStereoViewID;
}
int l9_12379=l9_12378;
l9_12377=1-l9_12379;
}
else
{
int l9_12380=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12380=0;
}
else
{
l9_12380=in.varStereoViewID;
}
int l9_12381=l9_12380;
l9_12377=l9_12381;
}
int l9_12382=l9_12377;
int l9_12383=greyMaskIdLayout_tmp;
int l9_12384=l9_12382;
float2 l9_12385=l9_12375;
bool l9_12386=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_12387=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_12388=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_12389=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_12390=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_12391=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_12392=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_12393=0.0;
bool l9_12394=l9_12391&&(!l9_12389);
float l9_12395=1.0;
float l9_12396=l9_12385.x;
int l9_12397=l9_12388.x;
if (l9_12397==1)
{
l9_12396=fract(l9_12396);
}
else
{
if (l9_12397==2)
{
float l9_12398=fract(l9_12396);
float l9_12399=l9_12396-l9_12398;
float l9_12400=step(0.25,fract(l9_12399*0.5));
l9_12396=mix(l9_12398,1.0-l9_12398,fast::clamp(l9_12400,0.0,1.0));
}
}
l9_12385.x=l9_12396;
float l9_12401=l9_12385.y;
int l9_12402=l9_12388.y;
if (l9_12402==1)
{
l9_12401=fract(l9_12401);
}
else
{
if (l9_12402==2)
{
float l9_12403=fract(l9_12401);
float l9_12404=l9_12401-l9_12403;
float l9_12405=step(0.25,fract(l9_12404*0.5));
l9_12401=mix(l9_12403,1.0-l9_12403,fast::clamp(l9_12405,0.0,1.0));
}
}
l9_12385.y=l9_12401;
if (l9_12389)
{
bool l9_12406=l9_12391;
bool l9_12407;
if (l9_12406)
{
l9_12407=l9_12388.x==3;
}
else
{
l9_12407=l9_12406;
}
float l9_12408=l9_12385.x;
float l9_12409=l9_12390.x;
float l9_12410=l9_12390.z;
bool l9_12411=l9_12407;
float l9_12412=l9_12395;
float l9_12413=fast::clamp(l9_12408,l9_12409,l9_12410);
float l9_12414=step(abs(l9_12408-l9_12413),9.9999997e-06);
l9_12412*=(l9_12414+((1.0-float(l9_12411))*(1.0-l9_12414)));
l9_12408=l9_12413;
l9_12385.x=l9_12408;
l9_12395=l9_12412;
bool l9_12415=l9_12391;
bool l9_12416;
if (l9_12415)
{
l9_12416=l9_12388.y==3;
}
else
{
l9_12416=l9_12415;
}
float l9_12417=l9_12385.y;
float l9_12418=l9_12390.y;
float l9_12419=l9_12390.w;
bool l9_12420=l9_12416;
float l9_12421=l9_12395;
float l9_12422=fast::clamp(l9_12417,l9_12418,l9_12419);
float l9_12423=step(abs(l9_12417-l9_12422),9.9999997e-06);
l9_12421*=(l9_12423+((1.0-float(l9_12420))*(1.0-l9_12423)));
l9_12417=l9_12422;
l9_12385.y=l9_12417;
l9_12395=l9_12421;
}
float2 l9_12424=l9_12385;
bool l9_12425=l9_12386;
float3x3 l9_12426=l9_12387;
if (l9_12425)
{
l9_12424=float2((l9_12426*float3(l9_12424,1.0)).xy);
}
float2 l9_12427=l9_12424;
l9_12385=l9_12427;
float l9_12428=l9_12385.x;
int l9_12429=l9_12388.x;
bool l9_12430=l9_12394;
float l9_12431=l9_12395;
if ((l9_12429==0)||(l9_12429==3))
{
float l9_12432=l9_12428;
float l9_12433=0.0;
float l9_12434=1.0;
bool l9_12435=l9_12430;
float l9_12436=l9_12431;
float l9_12437=fast::clamp(l9_12432,l9_12433,l9_12434);
float l9_12438=step(abs(l9_12432-l9_12437),9.9999997e-06);
l9_12436*=(l9_12438+((1.0-float(l9_12435))*(1.0-l9_12438)));
l9_12432=l9_12437;
l9_12428=l9_12432;
l9_12431=l9_12436;
}
l9_12385.x=l9_12428;
l9_12395=l9_12431;
float l9_12439=l9_12385.y;
int l9_12440=l9_12388.y;
bool l9_12441=l9_12394;
float l9_12442=l9_12395;
if ((l9_12440==0)||(l9_12440==3))
{
float l9_12443=l9_12439;
float l9_12444=0.0;
float l9_12445=1.0;
bool l9_12446=l9_12441;
float l9_12447=l9_12442;
float l9_12448=fast::clamp(l9_12443,l9_12444,l9_12445);
float l9_12449=step(abs(l9_12443-l9_12448),9.9999997e-06);
l9_12447*=(l9_12449+((1.0-float(l9_12446))*(1.0-l9_12449)));
l9_12443=l9_12448;
l9_12439=l9_12443;
l9_12442=l9_12447;
}
l9_12385.y=l9_12439;
l9_12395=l9_12442;
float2 l9_12450=l9_12385;
int l9_12451=l9_12383;
int l9_12452=l9_12384;
float l9_12453=l9_12393;
float2 l9_12454=l9_12450;
int l9_12455=l9_12451;
int l9_12456=l9_12452;
float3 l9_12457=float3(0.0);
if (l9_12455==0)
{
l9_12457=float3(l9_12454,0.0);
}
else
{
if (l9_12455==1)
{
l9_12457=float3(l9_12454.x,(l9_12454.y*0.5)+(0.5-(float(l9_12456)*0.5)),0.0);
}
else
{
l9_12457=float3(l9_12454,float(l9_12456));
}
}
float3 l9_12458=l9_12457;
float3 l9_12459=l9_12458;
float4 l9_12460=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_12459.xy,bias(l9_12453));
float4 l9_12461=l9_12460;
if (l9_12391)
{
l9_12461=mix(l9_12392,l9_12461,float4(l9_12395));
}
float4 l9_12462=l9_12461;
l9_12376=l9_12462;
float l9_12463=0.0;
l9_12463=l9_12376.x;
float l9_12464=0.0;
l9_12464=step(l9_12463,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_12465=float4(0.0);
l9_12465=l9_12054*float4(l9_12464);
float4 l9_12466=float4(0.0);
float4 l9_12467=(*sc_set0.UserUniforms).colorId01;
l9_12466=l9_12467;
float4 l9_12468=float4(0.0);
l9_12468=l9_12466*float4(l9_12464);
float4 l9_12469=float4(0.0);
float4 l9_12470=l9_12465;
float4 l9_12471=l9_12468;
float4 l9_12472=l9_12470;
float4 l9_12473=l9_12471;
float3 l9_12474=l9_12472.xyz*l9_12472.w;
l9_12472=float4(l9_12474.x,l9_12474.y,l9_12474.z,l9_12472.w);
float4 l9_12475=l9_12472+(l9_12473*(1.0-l9_12472.w));
l9_12469=l9_12475;
l9_11615=l9_12469;
l9_11619=l9_11615;
}
l9_11612=l9_11619;
float l9_12476=0.0;
float l9_12477=(*sc_set0.UserUniforms).metallicId01;
l9_12476=l9_12477;
float l9_12478=0.0;
float l9_12479=(*sc_set0.UserUniforms).rougnessId01;
l9_12478=l9_12479;
float4 l9_12480=float4(0.0);
float3 l9_12481=l9_11612.xyz;
float l9_12482=(*sc_set0.UserUniforms).Port_Opacity_N152;
float3 l9_12483=(*sc_set0.UserUniforms).Port_Emissive_N152;
float l9_12484=l9_12476;
float l9_12485=l9_12478;
float3 l9_12486=(*sc_set0.UserUniforms).Port_AO_N152;
float3 l9_12487=(*sc_set0.UserUniforms).Port_SpecularAO_N152;
ssGlobals l9_12488=l9_11608;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_12488.BumpedNormal=l9_12488.VertexNormal_WorldSpace;
}
float l9_12489=l9_12482;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_12489<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_12490=gl_FragCoord;
float2 l9_12491=floor(mod(l9_12490.xy,float2(4.0)));
float l9_12492=(mod(dot(l9_12491,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_12489<l9_12492)
{
discard_fragment();
}
}
l9_12481=fast::max(l9_12481,float3(0.0));
float4 l9_12493;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_12493=float4(l9_12481,l9_12482);
}
else
{
l9_12484=fast::clamp(l9_12484,0.0,1.0);
l9_12485=fast::clamp(l9_12485,0.0,1.0);
float3 l9_12494=l9_12481;
float l9_12495=l9_12482;
float3 l9_12496=l9_12488.BumpedNormal;
float3 l9_12497=l9_12488.PositionWS;
float3 l9_12498=l9_12488.ViewDirWS;
float3 l9_12499=l9_12483;
float l9_12500=l9_12484;
float l9_12501=l9_12485;
float3 l9_12502=l9_12486;
float3 l9_12503=l9_12487;
l9_12493=ngsCalculateLighting(l9_12494,l9_12495,l9_12496,l9_12497,l9_12498,l9_12499,l9_12500,l9_12501,l9_12502,l9_12503,in.varStereoViewID,sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_RayTracingReflections,sc_set0.sc_RayTracingReflectionsSmpSC,sc_set0.sc_RayTracingGlobalIllumination,sc_set0.sc_RayTracingGlobalIlluminationSmpSC,sc_set0.sc_RayTracingShadows,sc_set0.sc_RayTracingShadowsSmpSC,gl_FragCoord,(*sc_set0.UserUniforms),in.varShadowTex,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,out.sc_FragData0,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
l9_12493=fast::max(l9_12493,float4(0.0));
l9_12480=l9_12493;
l9_11606=l9_12480;
l9_11611=l9_11606;
}
else
{
float4 l9_12504=float4(0.0);
float l9_12505=0.0;
float4 l9_12506=float4(0.0);
float4 l9_12507=float4(0.0);
ssGlobals l9_12508=l9_11608;
float l9_12509=0.0;
float l9_12510=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_12509=l9_12510;
l9_12505=l9_12509;
float4 l9_12511;
if ((l9_12505*1.0)!=0.0)
{
float l9_12512=0.0;
float l9_12513=(*sc_set0.UserUniforms).rimExpId01;
l9_12512=l9_12513;
float l9_12514=0.0;
float l9_12515=(*sc_set0.UserUniforms).rimIntId01;
l9_12514=l9_12515;
float l9_12516=0.0;
float l9_12517=l9_12512;
float l9_12518=l9_12514;
ssGlobals l9_12519=l9_12508;
float l9_12520=abs(dot(-l9_12519.ViewDirWS,l9_12519.VertexNormal_WorldSpace));
float l9_12521=1.0-pow(1.0-l9_12520,l9_12517);
l9_12521=fast::max(l9_12521,0.0);
l9_12521*=l9_12518;
l9_12516=l9_12521;
float4 l9_12522=float4(0.0);
float l9_12523=0.0;
float4 l9_12524=float4(0.0);
float4 l9_12525=float4(0.0);
ssGlobals l9_12526=l9_12508;
float l9_12527=0.0;
float l9_12528=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_12527=l9_12528;
l9_12523=l9_12527;
float4 l9_12529;
if ((l9_12523*1.0)!=0.0)
{
float4 l9_12530=float4(0.0);
float4 l9_12531=(*sc_set0.UserUniforms).patternColorId01;
l9_12530=l9_12531;
float4 l9_12532=float4(0.0);
float l9_12533=0.0;
float4 l9_12534=float4(0.0);
float4 l9_12535=float4(0.0);
ssGlobals l9_12536=l9_12526;
float l9_12537=0.0;
float l9_12538=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_12537=l9_12538;
l9_12533=l9_12537;
float4 l9_12539;
if ((l9_12533*1.0)!=0.0)
{
float2 l9_12540=float2(0.0);
l9_12540=l9_12536.Surface_UVCoord0;
float2 l9_12541=float2(0.0);
float2 l9_12542=(*sc_set0.UserUniforms).patternScaleId01;
l9_12541=l9_12542;
float2 l9_12543=float2(0.0);
l9_12543=((l9_12540-(*sc_set0.UserUniforms).Port_Center_N122)*l9_12541)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_12544=float2(0.0);
float2 l9_12545=(*sc_set0.UserUniforms).patternOffsetId01;
l9_12544=l9_12545;
float2 l9_12546=float2(0.0);
l9_12546=l9_12543+l9_12544;
float l9_12547=0.0;
float l9_12548=(*sc_set0.UserUniforms).patternRotateId01;
l9_12547=l9_12548;
float2 l9_12549=float2(0.0);
float2 l9_12550=l9_12546;
float l9_12551=l9_12547;
float2 l9_12552=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_12553=sin(radians(l9_12551));
float l9_12554=cos(radians(l9_12551));
float2 l9_12555=l9_12550-l9_12552;
l9_12555=float2(dot(float2(l9_12554,l9_12553),l9_12555),dot(float2(-l9_12553,l9_12554),l9_12555))+l9_12552;
l9_12549=l9_12555;
float4 l9_12556=float4(0.0);
int l9_12557;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_12558=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12558=0;
}
else
{
l9_12558=in.varStereoViewID;
}
int l9_12559=l9_12558;
l9_12557=1-l9_12559;
}
else
{
int l9_12560=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12560=0;
}
else
{
l9_12560=in.varStereoViewID;
}
int l9_12561=l9_12560;
l9_12557=l9_12561;
}
int l9_12562=l9_12557;
int l9_12563=patternTextureId01Layout_tmp;
int l9_12564=l9_12562;
float2 l9_12565=l9_12549;
bool l9_12566=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_12567=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_12568=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_12569=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_12570=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_12571=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_12572=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_12573=0.0;
bool l9_12574=l9_12571&&(!l9_12569);
float l9_12575=1.0;
float l9_12576=l9_12565.x;
int l9_12577=l9_12568.x;
if (l9_12577==1)
{
l9_12576=fract(l9_12576);
}
else
{
if (l9_12577==2)
{
float l9_12578=fract(l9_12576);
float l9_12579=l9_12576-l9_12578;
float l9_12580=step(0.25,fract(l9_12579*0.5));
l9_12576=mix(l9_12578,1.0-l9_12578,fast::clamp(l9_12580,0.0,1.0));
}
}
l9_12565.x=l9_12576;
float l9_12581=l9_12565.y;
int l9_12582=l9_12568.y;
if (l9_12582==1)
{
l9_12581=fract(l9_12581);
}
else
{
if (l9_12582==2)
{
float l9_12583=fract(l9_12581);
float l9_12584=l9_12581-l9_12583;
float l9_12585=step(0.25,fract(l9_12584*0.5));
l9_12581=mix(l9_12583,1.0-l9_12583,fast::clamp(l9_12585,0.0,1.0));
}
}
l9_12565.y=l9_12581;
if (l9_12569)
{
bool l9_12586=l9_12571;
bool l9_12587;
if (l9_12586)
{
l9_12587=l9_12568.x==3;
}
else
{
l9_12587=l9_12586;
}
float l9_12588=l9_12565.x;
float l9_12589=l9_12570.x;
float l9_12590=l9_12570.z;
bool l9_12591=l9_12587;
float l9_12592=l9_12575;
float l9_12593=fast::clamp(l9_12588,l9_12589,l9_12590);
float l9_12594=step(abs(l9_12588-l9_12593),9.9999997e-06);
l9_12592*=(l9_12594+((1.0-float(l9_12591))*(1.0-l9_12594)));
l9_12588=l9_12593;
l9_12565.x=l9_12588;
l9_12575=l9_12592;
bool l9_12595=l9_12571;
bool l9_12596;
if (l9_12595)
{
l9_12596=l9_12568.y==3;
}
else
{
l9_12596=l9_12595;
}
float l9_12597=l9_12565.y;
float l9_12598=l9_12570.y;
float l9_12599=l9_12570.w;
bool l9_12600=l9_12596;
float l9_12601=l9_12575;
float l9_12602=fast::clamp(l9_12597,l9_12598,l9_12599);
float l9_12603=step(abs(l9_12597-l9_12602),9.9999997e-06);
l9_12601*=(l9_12603+((1.0-float(l9_12600))*(1.0-l9_12603)));
l9_12597=l9_12602;
l9_12565.y=l9_12597;
l9_12575=l9_12601;
}
float2 l9_12604=l9_12565;
bool l9_12605=l9_12566;
float3x3 l9_12606=l9_12567;
if (l9_12605)
{
l9_12604=float2((l9_12606*float3(l9_12604,1.0)).xy);
}
float2 l9_12607=l9_12604;
l9_12565=l9_12607;
float l9_12608=l9_12565.x;
int l9_12609=l9_12568.x;
bool l9_12610=l9_12574;
float l9_12611=l9_12575;
if ((l9_12609==0)||(l9_12609==3))
{
float l9_12612=l9_12608;
float l9_12613=0.0;
float l9_12614=1.0;
bool l9_12615=l9_12610;
float l9_12616=l9_12611;
float l9_12617=fast::clamp(l9_12612,l9_12613,l9_12614);
float l9_12618=step(abs(l9_12612-l9_12617),9.9999997e-06);
l9_12616*=(l9_12618+((1.0-float(l9_12615))*(1.0-l9_12618)));
l9_12612=l9_12617;
l9_12608=l9_12612;
l9_12611=l9_12616;
}
l9_12565.x=l9_12608;
l9_12575=l9_12611;
float l9_12619=l9_12565.y;
int l9_12620=l9_12568.y;
bool l9_12621=l9_12574;
float l9_12622=l9_12575;
if ((l9_12620==0)||(l9_12620==3))
{
float l9_12623=l9_12619;
float l9_12624=0.0;
float l9_12625=1.0;
bool l9_12626=l9_12621;
float l9_12627=l9_12622;
float l9_12628=fast::clamp(l9_12623,l9_12624,l9_12625);
float l9_12629=step(abs(l9_12623-l9_12628),9.9999997e-06);
l9_12627*=(l9_12629+((1.0-float(l9_12626))*(1.0-l9_12629)));
l9_12623=l9_12628;
l9_12619=l9_12623;
l9_12622=l9_12627;
}
l9_12565.y=l9_12619;
l9_12575=l9_12622;
float2 l9_12630=l9_12565;
int l9_12631=l9_12563;
int l9_12632=l9_12564;
float l9_12633=l9_12573;
float2 l9_12634=l9_12630;
int l9_12635=l9_12631;
int l9_12636=l9_12632;
float3 l9_12637=float3(0.0);
if (l9_12635==0)
{
l9_12637=float3(l9_12634,0.0);
}
else
{
if (l9_12635==1)
{
l9_12637=float3(l9_12634.x,(l9_12634.y*0.5)+(0.5-(float(l9_12636)*0.5)),0.0);
}
else
{
l9_12637=float3(l9_12634,float(l9_12636));
}
}
float3 l9_12638=l9_12637;
float3 l9_12639=l9_12638;
float4 l9_12640=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_12639.xy,bias(l9_12633));
float4 l9_12641=l9_12640;
if (l9_12571)
{
l9_12641=mix(l9_12572,l9_12641,float4(l9_12575));
}
float4 l9_12642=l9_12641;
l9_12556=l9_12642;
l9_12534=l9_12556;
l9_12539=l9_12534;
}
else
{
float2 l9_12643=float2(0.0);
l9_12643=l9_12536.Surface_UVCoord0;
float2 l9_12644=float2(0.0);
float2 l9_12645=(*sc_set0.UserUniforms).patternScaleId01;
l9_12644=l9_12645;
float2 l9_12646=float2(0.0);
l9_12646=((l9_12643-(*sc_set0.UserUniforms).Port_Center_N122)*l9_12644)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_12647=float2(0.0);
float2 l9_12648=(*sc_set0.UserUniforms).patternOffsetId01;
l9_12647=l9_12648;
float2 l9_12649=float2(0.0);
l9_12649=l9_12646+l9_12647;
float l9_12650=0.0;
float l9_12651=(*sc_set0.UserUniforms).patternRotateId01;
l9_12650=l9_12651;
float2 l9_12652=float2(0.0);
float2 l9_12653=l9_12649;
float l9_12654=l9_12650;
float2 l9_12655=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_12656=sin(radians(l9_12654));
float l9_12657=cos(radians(l9_12654));
float2 l9_12658=l9_12653-l9_12655;
l9_12658=float2(dot(float2(l9_12657,l9_12656),l9_12658),dot(float2(-l9_12656,l9_12657),l9_12658))+l9_12655;
l9_12652=l9_12658;
float4 l9_12659=float4(0.0);
int l9_12660;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_12661=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12661=0;
}
else
{
l9_12661=in.varStereoViewID;
}
int l9_12662=l9_12661;
l9_12660=1-l9_12662;
}
else
{
int l9_12663=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12663=0;
}
else
{
l9_12663=in.varStereoViewID;
}
int l9_12664=l9_12663;
l9_12660=l9_12664;
}
int l9_12665=l9_12660;
int l9_12666=patternTextureId01Layout_tmp;
int l9_12667=l9_12665;
float2 l9_12668=l9_12652;
bool l9_12669=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_12670=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_12671=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_12672=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_12673=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_12674=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_12675=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_12676=0.0;
bool l9_12677=l9_12674&&(!l9_12672);
float l9_12678=1.0;
float l9_12679=l9_12668.x;
int l9_12680=l9_12671.x;
if (l9_12680==1)
{
l9_12679=fract(l9_12679);
}
else
{
if (l9_12680==2)
{
float l9_12681=fract(l9_12679);
float l9_12682=l9_12679-l9_12681;
float l9_12683=step(0.25,fract(l9_12682*0.5));
l9_12679=mix(l9_12681,1.0-l9_12681,fast::clamp(l9_12683,0.0,1.0));
}
}
l9_12668.x=l9_12679;
float l9_12684=l9_12668.y;
int l9_12685=l9_12671.y;
if (l9_12685==1)
{
l9_12684=fract(l9_12684);
}
else
{
if (l9_12685==2)
{
float l9_12686=fract(l9_12684);
float l9_12687=l9_12684-l9_12686;
float l9_12688=step(0.25,fract(l9_12687*0.5));
l9_12684=mix(l9_12686,1.0-l9_12686,fast::clamp(l9_12688,0.0,1.0));
}
}
l9_12668.y=l9_12684;
if (l9_12672)
{
bool l9_12689=l9_12674;
bool l9_12690;
if (l9_12689)
{
l9_12690=l9_12671.x==3;
}
else
{
l9_12690=l9_12689;
}
float l9_12691=l9_12668.x;
float l9_12692=l9_12673.x;
float l9_12693=l9_12673.z;
bool l9_12694=l9_12690;
float l9_12695=l9_12678;
float l9_12696=fast::clamp(l9_12691,l9_12692,l9_12693);
float l9_12697=step(abs(l9_12691-l9_12696),9.9999997e-06);
l9_12695*=(l9_12697+((1.0-float(l9_12694))*(1.0-l9_12697)));
l9_12691=l9_12696;
l9_12668.x=l9_12691;
l9_12678=l9_12695;
bool l9_12698=l9_12674;
bool l9_12699;
if (l9_12698)
{
l9_12699=l9_12671.y==3;
}
else
{
l9_12699=l9_12698;
}
float l9_12700=l9_12668.y;
float l9_12701=l9_12673.y;
float l9_12702=l9_12673.w;
bool l9_12703=l9_12699;
float l9_12704=l9_12678;
float l9_12705=fast::clamp(l9_12700,l9_12701,l9_12702);
float l9_12706=step(abs(l9_12700-l9_12705),9.9999997e-06);
l9_12704*=(l9_12706+((1.0-float(l9_12703))*(1.0-l9_12706)));
l9_12700=l9_12705;
l9_12668.y=l9_12700;
l9_12678=l9_12704;
}
float2 l9_12707=l9_12668;
bool l9_12708=l9_12669;
float3x3 l9_12709=l9_12670;
if (l9_12708)
{
l9_12707=float2((l9_12709*float3(l9_12707,1.0)).xy);
}
float2 l9_12710=l9_12707;
l9_12668=l9_12710;
float l9_12711=l9_12668.x;
int l9_12712=l9_12671.x;
bool l9_12713=l9_12677;
float l9_12714=l9_12678;
if ((l9_12712==0)||(l9_12712==3))
{
float l9_12715=l9_12711;
float l9_12716=0.0;
float l9_12717=1.0;
bool l9_12718=l9_12713;
float l9_12719=l9_12714;
float l9_12720=fast::clamp(l9_12715,l9_12716,l9_12717);
float l9_12721=step(abs(l9_12715-l9_12720),9.9999997e-06);
l9_12719*=(l9_12721+((1.0-float(l9_12718))*(1.0-l9_12721)));
l9_12715=l9_12720;
l9_12711=l9_12715;
l9_12714=l9_12719;
}
l9_12668.x=l9_12711;
l9_12678=l9_12714;
float l9_12722=l9_12668.y;
int l9_12723=l9_12671.y;
bool l9_12724=l9_12677;
float l9_12725=l9_12678;
if ((l9_12723==0)||(l9_12723==3))
{
float l9_12726=l9_12722;
float l9_12727=0.0;
float l9_12728=1.0;
bool l9_12729=l9_12724;
float l9_12730=l9_12725;
float l9_12731=fast::clamp(l9_12726,l9_12727,l9_12728);
float l9_12732=step(abs(l9_12726-l9_12731),9.9999997e-06);
l9_12730*=(l9_12732+((1.0-float(l9_12729))*(1.0-l9_12732)));
l9_12726=l9_12731;
l9_12722=l9_12726;
l9_12725=l9_12730;
}
l9_12668.y=l9_12722;
l9_12678=l9_12725;
float2 l9_12733=l9_12668;
int l9_12734=l9_12666;
int l9_12735=l9_12667;
float l9_12736=l9_12676;
float2 l9_12737=l9_12733;
int l9_12738=l9_12734;
int l9_12739=l9_12735;
float3 l9_12740=float3(0.0);
if (l9_12738==0)
{
l9_12740=float3(l9_12737,0.0);
}
else
{
if (l9_12738==1)
{
l9_12740=float3(l9_12737.x,(l9_12737.y*0.5)+(0.5-(float(l9_12739)*0.5)),0.0);
}
else
{
l9_12740=float3(l9_12737,float(l9_12739));
}
}
float3 l9_12741=l9_12740;
float3 l9_12742=l9_12741;
float4 l9_12743=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_12742.xy,bias(l9_12736));
float4 l9_12744=l9_12743;
if (l9_12674)
{
l9_12744=mix(l9_12675,l9_12744,float4(l9_12678));
}
float4 l9_12745=l9_12744;
l9_12659=l9_12745;
float l9_12746=0.0;
float3 l9_12747=l9_12659.xyz;
float l9_12748=l9_12747.x;
l9_12746=l9_12748;
l9_12535=float4(l9_12746);
l9_12539=l9_12535;
}
l9_12532=l9_12539;
float4 l9_12749=float4(0.0);
l9_12749=l9_12530*l9_12532;
l9_12524=l9_12749;
l9_12529=l9_12524;
}
else
{
float4 l9_12750=float4(0.0);
float4 l9_12751=(*sc_set0.UserUniforms).colorId01;
l9_12750=l9_12751;
float2 l9_12752=float2(0.0);
l9_12752=l9_12526.Surface_UVCoord0;
float4 l9_12753=float4(0.0);
int l9_12754;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_12755=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12755=0;
}
else
{
l9_12755=in.varStereoViewID;
}
int l9_12756=l9_12755;
l9_12754=1-l9_12756;
}
else
{
int l9_12757=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12757=0;
}
else
{
l9_12757=in.varStereoViewID;
}
int l9_12758=l9_12757;
l9_12754=l9_12758;
}
int l9_12759=l9_12754;
int l9_12760=greyMaskIdLayout_tmp;
int l9_12761=l9_12759;
float2 l9_12762=l9_12752;
bool l9_12763=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_12764=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_12765=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_12766=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_12767=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_12768=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_12769=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_12770=0.0;
bool l9_12771=l9_12768&&(!l9_12766);
float l9_12772=1.0;
float l9_12773=l9_12762.x;
int l9_12774=l9_12765.x;
if (l9_12774==1)
{
l9_12773=fract(l9_12773);
}
else
{
if (l9_12774==2)
{
float l9_12775=fract(l9_12773);
float l9_12776=l9_12773-l9_12775;
float l9_12777=step(0.25,fract(l9_12776*0.5));
l9_12773=mix(l9_12775,1.0-l9_12775,fast::clamp(l9_12777,0.0,1.0));
}
}
l9_12762.x=l9_12773;
float l9_12778=l9_12762.y;
int l9_12779=l9_12765.y;
if (l9_12779==1)
{
l9_12778=fract(l9_12778);
}
else
{
if (l9_12779==2)
{
float l9_12780=fract(l9_12778);
float l9_12781=l9_12778-l9_12780;
float l9_12782=step(0.25,fract(l9_12781*0.5));
l9_12778=mix(l9_12780,1.0-l9_12780,fast::clamp(l9_12782,0.0,1.0));
}
}
l9_12762.y=l9_12778;
if (l9_12766)
{
bool l9_12783=l9_12768;
bool l9_12784;
if (l9_12783)
{
l9_12784=l9_12765.x==3;
}
else
{
l9_12784=l9_12783;
}
float l9_12785=l9_12762.x;
float l9_12786=l9_12767.x;
float l9_12787=l9_12767.z;
bool l9_12788=l9_12784;
float l9_12789=l9_12772;
float l9_12790=fast::clamp(l9_12785,l9_12786,l9_12787);
float l9_12791=step(abs(l9_12785-l9_12790),9.9999997e-06);
l9_12789*=(l9_12791+((1.0-float(l9_12788))*(1.0-l9_12791)));
l9_12785=l9_12790;
l9_12762.x=l9_12785;
l9_12772=l9_12789;
bool l9_12792=l9_12768;
bool l9_12793;
if (l9_12792)
{
l9_12793=l9_12765.y==3;
}
else
{
l9_12793=l9_12792;
}
float l9_12794=l9_12762.y;
float l9_12795=l9_12767.y;
float l9_12796=l9_12767.w;
bool l9_12797=l9_12793;
float l9_12798=l9_12772;
float l9_12799=fast::clamp(l9_12794,l9_12795,l9_12796);
float l9_12800=step(abs(l9_12794-l9_12799),9.9999997e-06);
l9_12798*=(l9_12800+((1.0-float(l9_12797))*(1.0-l9_12800)));
l9_12794=l9_12799;
l9_12762.y=l9_12794;
l9_12772=l9_12798;
}
float2 l9_12801=l9_12762;
bool l9_12802=l9_12763;
float3x3 l9_12803=l9_12764;
if (l9_12802)
{
l9_12801=float2((l9_12803*float3(l9_12801,1.0)).xy);
}
float2 l9_12804=l9_12801;
l9_12762=l9_12804;
float l9_12805=l9_12762.x;
int l9_12806=l9_12765.x;
bool l9_12807=l9_12771;
float l9_12808=l9_12772;
if ((l9_12806==0)||(l9_12806==3))
{
float l9_12809=l9_12805;
float l9_12810=0.0;
float l9_12811=1.0;
bool l9_12812=l9_12807;
float l9_12813=l9_12808;
float l9_12814=fast::clamp(l9_12809,l9_12810,l9_12811);
float l9_12815=step(abs(l9_12809-l9_12814),9.9999997e-06);
l9_12813*=(l9_12815+((1.0-float(l9_12812))*(1.0-l9_12815)));
l9_12809=l9_12814;
l9_12805=l9_12809;
l9_12808=l9_12813;
}
l9_12762.x=l9_12805;
l9_12772=l9_12808;
float l9_12816=l9_12762.y;
int l9_12817=l9_12765.y;
bool l9_12818=l9_12771;
float l9_12819=l9_12772;
if ((l9_12817==0)||(l9_12817==3))
{
float l9_12820=l9_12816;
float l9_12821=0.0;
float l9_12822=1.0;
bool l9_12823=l9_12818;
float l9_12824=l9_12819;
float l9_12825=fast::clamp(l9_12820,l9_12821,l9_12822);
float l9_12826=step(abs(l9_12820-l9_12825),9.9999997e-06);
l9_12824*=(l9_12826+((1.0-float(l9_12823))*(1.0-l9_12826)));
l9_12820=l9_12825;
l9_12816=l9_12820;
l9_12819=l9_12824;
}
l9_12762.y=l9_12816;
l9_12772=l9_12819;
float2 l9_12827=l9_12762;
int l9_12828=l9_12760;
int l9_12829=l9_12761;
float l9_12830=l9_12770;
float2 l9_12831=l9_12827;
int l9_12832=l9_12828;
int l9_12833=l9_12829;
float3 l9_12834=float3(0.0);
if (l9_12832==0)
{
l9_12834=float3(l9_12831,0.0);
}
else
{
if (l9_12832==1)
{
l9_12834=float3(l9_12831.x,(l9_12831.y*0.5)+(0.5-(float(l9_12833)*0.5)),0.0);
}
else
{
l9_12834=float3(l9_12831,float(l9_12833));
}
}
float3 l9_12835=l9_12834;
float3 l9_12836=l9_12835;
float4 l9_12837=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_12836.xy,bias(l9_12830));
float4 l9_12838=l9_12837;
if (l9_12768)
{
l9_12838=mix(l9_12769,l9_12838,float4(l9_12772));
}
float4 l9_12839=l9_12838;
l9_12753=l9_12839;
float l9_12840=0.0;
l9_12840=l9_12753.x;
float l9_12841=0.0;
l9_12841=step(l9_12840,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_12842=float4(0.0);
l9_12842=l9_12750*float4(l9_12841);
l9_12525=l9_12842;
l9_12529=l9_12525;
}
l9_12522=l9_12529;
float2 l9_12843=float2(0.0);
l9_12843=l9_12508.Surface_UVCoord0;
float4 l9_12844=float4(0.0);
int l9_12845;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_12846=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12846=0;
}
else
{
l9_12846=in.varStereoViewID;
}
int l9_12847=l9_12846;
l9_12845=1-l9_12847;
}
else
{
int l9_12848=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12848=0;
}
else
{
l9_12848=in.varStereoViewID;
}
int l9_12849=l9_12848;
l9_12845=l9_12849;
}
int l9_12850=l9_12845;
int l9_12851=greyMaskIdLayout_tmp;
int l9_12852=l9_12850;
float2 l9_12853=l9_12843;
bool l9_12854=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_12855=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_12856=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_12857=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_12858=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_12859=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_12860=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_12861=0.0;
bool l9_12862=l9_12859&&(!l9_12857);
float l9_12863=1.0;
float l9_12864=l9_12853.x;
int l9_12865=l9_12856.x;
if (l9_12865==1)
{
l9_12864=fract(l9_12864);
}
else
{
if (l9_12865==2)
{
float l9_12866=fract(l9_12864);
float l9_12867=l9_12864-l9_12866;
float l9_12868=step(0.25,fract(l9_12867*0.5));
l9_12864=mix(l9_12866,1.0-l9_12866,fast::clamp(l9_12868,0.0,1.0));
}
}
l9_12853.x=l9_12864;
float l9_12869=l9_12853.y;
int l9_12870=l9_12856.y;
if (l9_12870==1)
{
l9_12869=fract(l9_12869);
}
else
{
if (l9_12870==2)
{
float l9_12871=fract(l9_12869);
float l9_12872=l9_12869-l9_12871;
float l9_12873=step(0.25,fract(l9_12872*0.5));
l9_12869=mix(l9_12871,1.0-l9_12871,fast::clamp(l9_12873,0.0,1.0));
}
}
l9_12853.y=l9_12869;
if (l9_12857)
{
bool l9_12874=l9_12859;
bool l9_12875;
if (l9_12874)
{
l9_12875=l9_12856.x==3;
}
else
{
l9_12875=l9_12874;
}
float l9_12876=l9_12853.x;
float l9_12877=l9_12858.x;
float l9_12878=l9_12858.z;
bool l9_12879=l9_12875;
float l9_12880=l9_12863;
float l9_12881=fast::clamp(l9_12876,l9_12877,l9_12878);
float l9_12882=step(abs(l9_12876-l9_12881),9.9999997e-06);
l9_12880*=(l9_12882+((1.0-float(l9_12879))*(1.0-l9_12882)));
l9_12876=l9_12881;
l9_12853.x=l9_12876;
l9_12863=l9_12880;
bool l9_12883=l9_12859;
bool l9_12884;
if (l9_12883)
{
l9_12884=l9_12856.y==3;
}
else
{
l9_12884=l9_12883;
}
float l9_12885=l9_12853.y;
float l9_12886=l9_12858.y;
float l9_12887=l9_12858.w;
bool l9_12888=l9_12884;
float l9_12889=l9_12863;
float l9_12890=fast::clamp(l9_12885,l9_12886,l9_12887);
float l9_12891=step(abs(l9_12885-l9_12890),9.9999997e-06);
l9_12889*=(l9_12891+((1.0-float(l9_12888))*(1.0-l9_12891)));
l9_12885=l9_12890;
l9_12853.y=l9_12885;
l9_12863=l9_12889;
}
float2 l9_12892=l9_12853;
bool l9_12893=l9_12854;
float3x3 l9_12894=l9_12855;
if (l9_12893)
{
l9_12892=float2((l9_12894*float3(l9_12892,1.0)).xy);
}
float2 l9_12895=l9_12892;
l9_12853=l9_12895;
float l9_12896=l9_12853.x;
int l9_12897=l9_12856.x;
bool l9_12898=l9_12862;
float l9_12899=l9_12863;
if ((l9_12897==0)||(l9_12897==3))
{
float l9_12900=l9_12896;
float l9_12901=0.0;
float l9_12902=1.0;
bool l9_12903=l9_12898;
float l9_12904=l9_12899;
float l9_12905=fast::clamp(l9_12900,l9_12901,l9_12902);
float l9_12906=step(abs(l9_12900-l9_12905),9.9999997e-06);
l9_12904*=(l9_12906+((1.0-float(l9_12903))*(1.0-l9_12906)));
l9_12900=l9_12905;
l9_12896=l9_12900;
l9_12899=l9_12904;
}
l9_12853.x=l9_12896;
l9_12863=l9_12899;
float l9_12907=l9_12853.y;
int l9_12908=l9_12856.y;
bool l9_12909=l9_12862;
float l9_12910=l9_12863;
if ((l9_12908==0)||(l9_12908==3))
{
float l9_12911=l9_12907;
float l9_12912=0.0;
float l9_12913=1.0;
bool l9_12914=l9_12909;
float l9_12915=l9_12910;
float l9_12916=fast::clamp(l9_12911,l9_12912,l9_12913);
float l9_12917=step(abs(l9_12911-l9_12916),9.9999997e-06);
l9_12915*=(l9_12917+((1.0-float(l9_12914))*(1.0-l9_12917)));
l9_12911=l9_12916;
l9_12907=l9_12911;
l9_12910=l9_12915;
}
l9_12853.y=l9_12907;
l9_12863=l9_12910;
float2 l9_12918=l9_12853;
int l9_12919=l9_12851;
int l9_12920=l9_12852;
float l9_12921=l9_12861;
float2 l9_12922=l9_12918;
int l9_12923=l9_12919;
int l9_12924=l9_12920;
float3 l9_12925=float3(0.0);
if (l9_12923==0)
{
l9_12925=float3(l9_12922,0.0);
}
else
{
if (l9_12923==1)
{
l9_12925=float3(l9_12922.x,(l9_12922.y*0.5)+(0.5-(float(l9_12924)*0.5)),0.0);
}
else
{
l9_12925=float3(l9_12922,float(l9_12924));
}
}
float3 l9_12926=l9_12925;
float3 l9_12927=l9_12926;
float4 l9_12928=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_12927.xy,bias(l9_12921));
float4 l9_12929=l9_12928;
if (l9_12859)
{
l9_12929=mix(l9_12860,l9_12929,float4(l9_12863));
}
float4 l9_12930=l9_12929;
l9_12844=l9_12930;
float l9_12931=0.0;
l9_12931=l9_12844.x;
float l9_12932=0.0;
l9_12932=step(l9_12931,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_12933=float4(0.0);
l9_12933=l9_12522*float4(l9_12932);
float4 l9_12934=float4(0.0);
float4 l9_12935=(*sc_set0.UserUniforms).colorId01;
l9_12934=l9_12935;
float4 l9_12936=float4(0.0);
l9_12936=l9_12934*float4(l9_12932);
float4 l9_12937=float4(0.0);
float4 l9_12938=l9_12933;
float4 l9_12939=l9_12936;
float4 l9_12940=l9_12938;
float4 l9_12941=l9_12939;
float3 l9_12942=l9_12940.xyz*l9_12940.w;
l9_12940=float4(l9_12942.x,l9_12942.y,l9_12942.z,l9_12940.w);
float4 l9_12943=l9_12940+(l9_12941*(1.0-l9_12940.w));
l9_12937=l9_12943;
float4 l9_12944=float4(0.0);
l9_12944=float4(l9_12516)*l9_12937;
float4 l9_12945=float4(0.0);
l9_12945=l9_12944+l9_12937;
l9_12506=l9_12945;
l9_12511=l9_12506;
}
else
{
float4 l9_12946=float4(0.0);
float l9_12947=0.0;
float4 l9_12948=float4(0.0);
float4 l9_12949=float4(0.0);
ssGlobals l9_12950=l9_12508;
float l9_12951=0.0;
float l9_12952=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_12951=l9_12952;
l9_12947=l9_12951;
float4 l9_12953;
if ((l9_12947*1.0)!=0.0)
{
float4 l9_12954=float4(0.0);
float4 l9_12955=(*sc_set0.UserUniforms).patternColorId01;
l9_12954=l9_12955;
float4 l9_12956=float4(0.0);
float l9_12957=0.0;
float4 l9_12958=float4(0.0);
float4 l9_12959=float4(0.0);
ssGlobals l9_12960=l9_12950;
float l9_12961=0.0;
float l9_12962=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_12961=l9_12962;
l9_12957=l9_12961;
float4 l9_12963;
if ((l9_12957*1.0)!=0.0)
{
float2 l9_12964=float2(0.0);
l9_12964=l9_12960.Surface_UVCoord0;
float2 l9_12965=float2(0.0);
float2 l9_12966=(*sc_set0.UserUniforms).patternScaleId01;
l9_12965=l9_12966;
float2 l9_12967=float2(0.0);
l9_12967=((l9_12964-(*sc_set0.UserUniforms).Port_Center_N122)*l9_12965)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_12968=float2(0.0);
float2 l9_12969=(*sc_set0.UserUniforms).patternOffsetId01;
l9_12968=l9_12969;
float2 l9_12970=float2(0.0);
l9_12970=l9_12967+l9_12968;
float l9_12971=0.0;
float l9_12972=(*sc_set0.UserUniforms).patternRotateId01;
l9_12971=l9_12972;
float2 l9_12973=float2(0.0);
float2 l9_12974=l9_12970;
float l9_12975=l9_12971;
float2 l9_12976=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_12977=sin(radians(l9_12975));
float l9_12978=cos(radians(l9_12975));
float2 l9_12979=l9_12974-l9_12976;
l9_12979=float2(dot(float2(l9_12978,l9_12977),l9_12979),dot(float2(-l9_12977,l9_12978),l9_12979))+l9_12976;
l9_12973=l9_12979;
float4 l9_12980=float4(0.0);
int l9_12981;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_12982=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12982=0;
}
else
{
l9_12982=in.varStereoViewID;
}
int l9_12983=l9_12982;
l9_12981=1-l9_12983;
}
else
{
int l9_12984=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_12984=0;
}
else
{
l9_12984=in.varStereoViewID;
}
int l9_12985=l9_12984;
l9_12981=l9_12985;
}
int l9_12986=l9_12981;
int l9_12987=patternTextureId01Layout_tmp;
int l9_12988=l9_12986;
float2 l9_12989=l9_12973;
bool l9_12990=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_12991=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_12992=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_12993=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_12994=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_12995=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_12996=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_12997=0.0;
bool l9_12998=l9_12995&&(!l9_12993);
float l9_12999=1.0;
float l9_13000=l9_12989.x;
int l9_13001=l9_12992.x;
if (l9_13001==1)
{
l9_13000=fract(l9_13000);
}
else
{
if (l9_13001==2)
{
float l9_13002=fract(l9_13000);
float l9_13003=l9_13000-l9_13002;
float l9_13004=step(0.25,fract(l9_13003*0.5));
l9_13000=mix(l9_13002,1.0-l9_13002,fast::clamp(l9_13004,0.0,1.0));
}
}
l9_12989.x=l9_13000;
float l9_13005=l9_12989.y;
int l9_13006=l9_12992.y;
if (l9_13006==1)
{
l9_13005=fract(l9_13005);
}
else
{
if (l9_13006==2)
{
float l9_13007=fract(l9_13005);
float l9_13008=l9_13005-l9_13007;
float l9_13009=step(0.25,fract(l9_13008*0.5));
l9_13005=mix(l9_13007,1.0-l9_13007,fast::clamp(l9_13009,0.0,1.0));
}
}
l9_12989.y=l9_13005;
if (l9_12993)
{
bool l9_13010=l9_12995;
bool l9_13011;
if (l9_13010)
{
l9_13011=l9_12992.x==3;
}
else
{
l9_13011=l9_13010;
}
float l9_13012=l9_12989.x;
float l9_13013=l9_12994.x;
float l9_13014=l9_12994.z;
bool l9_13015=l9_13011;
float l9_13016=l9_12999;
float l9_13017=fast::clamp(l9_13012,l9_13013,l9_13014);
float l9_13018=step(abs(l9_13012-l9_13017),9.9999997e-06);
l9_13016*=(l9_13018+((1.0-float(l9_13015))*(1.0-l9_13018)));
l9_13012=l9_13017;
l9_12989.x=l9_13012;
l9_12999=l9_13016;
bool l9_13019=l9_12995;
bool l9_13020;
if (l9_13019)
{
l9_13020=l9_12992.y==3;
}
else
{
l9_13020=l9_13019;
}
float l9_13021=l9_12989.y;
float l9_13022=l9_12994.y;
float l9_13023=l9_12994.w;
bool l9_13024=l9_13020;
float l9_13025=l9_12999;
float l9_13026=fast::clamp(l9_13021,l9_13022,l9_13023);
float l9_13027=step(abs(l9_13021-l9_13026),9.9999997e-06);
l9_13025*=(l9_13027+((1.0-float(l9_13024))*(1.0-l9_13027)));
l9_13021=l9_13026;
l9_12989.y=l9_13021;
l9_12999=l9_13025;
}
float2 l9_13028=l9_12989;
bool l9_13029=l9_12990;
float3x3 l9_13030=l9_12991;
if (l9_13029)
{
l9_13028=float2((l9_13030*float3(l9_13028,1.0)).xy);
}
float2 l9_13031=l9_13028;
l9_12989=l9_13031;
float l9_13032=l9_12989.x;
int l9_13033=l9_12992.x;
bool l9_13034=l9_12998;
float l9_13035=l9_12999;
if ((l9_13033==0)||(l9_13033==3))
{
float l9_13036=l9_13032;
float l9_13037=0.0;
float l9_13038=1.0;
bool l9_13039=l9_13034;
float l9_13040=l9_13035;
float l9_13041=fast::clamp(l9_13036,l9_13037,l9_13038);
float l9_13042=step(abs(l9_13036-l9_13041),9.9999997e-06);
l9_13040*=(l9_13042+((1.0-float(l9_13039))*(1.0-l9_13042)));
l9_13036=l9_13041;
l9_13032=l9_13036;
l9_13035=l9_13040;
}
l9_12989.x=l9_13032;
l9_12999=l9_13035;
float l9_13043=l9_12989.y;
int l9_13044=l9_12992.y;
bool l9_13045=l9_12998;
float l9_13046=l9_12999;
if ((l9_13044==0)||(l9_13044==3))
{
float l9_13047=l9_13043;
float l9_13048=0.0;
float l9_13049=1.0;
bool l9_13050=l9_13045;
float l9_13051=l9_13046;
float l9_13052=fast::clamp(l9_13047,l9_13048,l9_13049);
float l9_13053=step(abs(l9_13047-l9_13052),9.9999997e-06);
l9_13051*=(l9_13053+((1.0-float(l9_13050))*(1.0-l9_13053)));
l9_13047=l9_13052;
l9_13043=l9_13047;
l9_13046=l9_13051;
}
l9_12989.y=l9_13043;
l9_12999=l9_13046;
float2 l9_13054=l9_12989;
int l9_13055=l9_12987;
int l9_13056=l9_12988;
float l9_13057=l9_12997;
float2 l9_13058=l9_13054;
int l9_13059=l9_13055;
int l9_13060=l9_13056;
float3 l9_13061=float3(0.0);
if (l9_13059==0)
{
l9_13061=float3(l9_13058,0.0);
}
else
{
if (l9_13059==1)
{
l9_13061=float3(l9_13058.x,(l9_13058.y*0.5)+(0.5-(float(l9_13060)*0.5)),0.0);
}
else
{
l9_13061=float3(l9_13058,float(l9_13060));
}
}
float3 l9_13062=l9_13061;
float3 l9_13063=l9_13062;
float4 l9_13064=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_13063.xy,bias(l9_13057));
float4 l9_13065=l9_13064;
if (l9_12995)
{
l9_13065=mix(l9_12996,l9_13065,float4(l9_12999));
}
float4 l9_13066=l9_13065;
l9_12980=l9_13066;
l9_12958=l9_12980;
l9_12963=l9_12958;
}
else
{
float2 l9_13067=float2(0.0);
l9_13067=l9_12960.Surface_UVCoord0;
float2 l9_13068=float2(0.0);
float2 l9_13069=(*sc_set0.UserUniforms).patternScaleId01;
l9_13068=l9_13069;
float2 l9_13070=float2(0.0);
l9_13070=((l9_13067-(*sc_set0.UserUniforms).Port_Center_N122)*l9_13068)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_13071=float2(0.0);
float2 l9_13072=(*sc_set0.UserUniforms).patternOffsetId01;
l9_13071=l9_13072;
float2 l9_13073=float2(0.0);
l9_13073=l9_13070+l9_13071;
float l9_13074=0.0;
float l9_13075=(*sc_set0.UserUniforms).patternRotateId01;
l9_13074=l9_13075;
float2 l9_13076=float2(0.0);
float2 l9_13077=l9_13073;
float l9_13078=l9_13074;
float2 l9_13079=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_13080=sin(radians(l9_13078));
float l9_13081=cos(radians(l9_13078));
float2 l9_13082=l9_13077-l9_13079;
l9_13082=float2(dot(float2(l9_13081,l9_13080),l9_13082),dot(float2(-l9_13080,l9_13081),l9_13082))+l9_13079;
l9_13076=l9_13082;
float4 l9_13083=float4(0.0);
int l9_13084;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_13085=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13085=0;
}
else
{
l9_13085=in.varStereoViewID;
}
int l9_13086=l9_13085;
l9_13084=1-l9_13086;
}
else
{
int l9_13087=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13087=0;
}
else
{
l9_13087=in.varStereoViewID;
}
int l9_13088=l9_13087;
l9_13084=l9_13088;
}
int l9_13089=l9_13084;
int l9_13090=patternTextureId01Layout_tmp;
int l9_13091=l9_13089;
float2 l9_13092=l9_13076;
bool l9_13093=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_13094=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_13095=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_13096=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_13097=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_13098=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_13099=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_13100=0.0;
bool l9_13101=l9_13098&&(!l9_13096);
float l9_13102=1.0;
float l9_13103=l9_13092.x;
int l9_13104=l9_13095.x;
if (l9_13104==1)
{
l9_13103=fract(l9_13103);
}
else
{
if (l9_13104==2)
{
float l9_13105=fract(l9_13103);
float l9_13106=l9_13103-l9_13105;
float l9_13107=step(0.25,fract(l9_13106*0.5));
l9_13103=mix(l9_13105,1.0-l9_13105,fast::clamp(l9_13107,0.0,1.0));
}
}
l9_13092.x=l9_13103;
float l9_13108=l9_13092.y;
int l9_13109=l9_13095.y;
if (l9_13109==1)
{
l9_13108=fract(l9_13108);
}
else
{
if (l9_13109==2)
{
float l9_13110=fract(l9_13108);
float l9_13111=l9_13108-l9_13110;
float l9_13112=step(0.25,fract(l9_13111*0.5));
l9_13108=mix(l9_13110,1.0-l9_13110,fast::clamp(l9_13112,0.0,1.0));
}
}
l9_13092.y=l9_13108;
if (l9_13096)
{
bool l9_13113=l9_13098;
bool l9_13114;
if (l9_13113)
{
l9_13114=l9_13095.x==3;
}
else
{
l9_13114=l9_13113;
}
float l9_13115=l9_13092.x;
float l9_13116=l9_13097.x;
float l9_13117=l9_13097.z;
bool l9_13118=l9_13114;
float l9_13119=l9_13102;
float l9_13120=fast::clamp(l9_13115,l9_13116,l9_13117);
float l9_13121=step(abs(l9_13115-l9_13120),9.9999997e-06);
l9_13119*=(l9_13121+((1.0-float(l9_13118))*(1.0-l9_13121)));
l9_13115=l9_13120;
l9_13092.x=l9_13115;
l9_13102=l9_13119;
bool l9_13122=l9_13098;
bool l9_13123;
if (l9_13122)
{
l9_13123=l9_13095.y==3;
}
else
{
l9_13123=l9_13122;
}
float l9_13124=l9_13092.y;
float l9_13125=l9_13097.y;
float l9_13126=l9_13097.w;
bool l9_13127=l9_13123;
float l9_13128=l9_13102;
float l9_13129=fast::clamp(l9_13124,l9_13125,l9_13126);
float l9_13130=step(abs(l9_13124-l9_13129),9.9999997e-06);
l9_13128*=(l9_13130+((1.0-float(l9_13127))*(1.0-l9_13130)));
l9_13124=l9_13129;
l9_13092.y=l9_13124;
l9_13102=l9_13128;
}
float2 l9_13131=l9_13092;
bool l9_13132=l9_13093;
float3x3 l9_13133=l9_13094;
if (l9_13132)
{
l9_13131=float2((l9_13133*float3(l9_13131,1.0)).xy);
}
float2 l9_13134=l9_13131;
l9_13092=l9_13134;
float l9_13135=l9_13092.x;
int l9_13136=l9_13095.x;
bool l9_13137=l9_13101;
float l9_13138=l9_13102;
if ((l9_13136==0)||(l9_13136==3))
{
float l9_13139=l9_13135;
float l9_13140=0.0;
float l9_13141=1.0;
bool l9_13142=l9_13137;
float l9_13143=l9_13138;
float l9_13144=fast::clamp(l9_13139,l9_13140,l9_13141);
float l9_13145=step(abs(l9_13139-l9_13144),9.9999997e-06);
l9_13143*=(l9_13145+((1.0-float(l9_13142))*(1.0-l9_13145)));
l9_13139=l9_13144;
l9_13135=l9_13139;
l9_13138=l9_13143;
}
l9_13092.x=l9_13135;
l9_13102=l9_13138;
float l9_13146=l9_13092.y;
int l9_13147=l9_13095.y;
bool l9_13148=l9_13101;
float l9_13149=l9_13102;
if ((l9_13147==0)||(l9_13147==3))
{
float l9_13150=l9_13146;
float l9_13151=0.0;
float l9_13152=1.0;
bool l9_13153=l9_13148;
float l9_13154=l9_13149;
float l9_13155=fast::clamp(l9_13150,l9_13151,l9_13152);
float l9_13156=step(abs(l9_13150-l9_13155),9.9999997e-06);
l9_13154*=(l9_13156+((1.0-float(l9_13153))*(1.0-l9_13156)));
l9_13150=l9_13155;
l9_13146=l9_13150;
l9_13149=l9_13154;
}
l9_13092.y=l9_13146;
l9_13102=l9_13149;
float2 l9_13157=l9_13092;
int l9_13158=l9_13090;
int l9_13159=l9_13091;
float l9_13160=l9_13100;
float2 l9_13161=l9_13157;
int l9_13162=l9_13158;
int l9_13163=l9_13159;
float3 l9_13164=float3(0.0);
if (l9_13162==0)
{
l9_13164=float3(l9_13161,0.0);
}
else
{
if (l9_13162==1)
{
l9_13164=float3(l9_13161.x,(l9_13161.y*0.5)+(0.5-(float(l9_13163)*0.5)),0.0);
}
else
{
l9_13164=float3(l9_13161,float(l9_13163));
}
}
float3 l9_13165=l9_13164;
float3 l9_13166=l9_13165;
float4 l9_13167=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_13166.xy,bias(l9_13160));
float4 l9_13168=l9_13167;
if (l9_13098)
{
l9_13168=mix(l9_13099,l9_13168,float4(l9_13102));
}
float4 l9_13169=l9_13168;
l9_13083=l9_13169;
float l9_13170=0.0;
float3 l9_13171=l9_13083.xyz;
float l9_13172=l9_13171.x;
l9_13170=l9_13172;
l9_12959=float4(l9_13170);
l9_12963=l9_12959;
}
l9_12956=l9_12963;
float4 l9_13173=float4(0.0);
l9_13173=l9_12954*l9_12956;
l9_12948=l9_13173;
l9_12953=l9_12948;
}
else
{
float4 l9_13174=float4(0.0);
float4 l9_13175=(*sc_set0.UserUniforms).colorId01;
l9_13174=l9_13175;
float2 l9_13176=float2(0.0);
l9_13176=l9_12950.Surface_UVCoord0;
float4 l9_13177=float4(0.0);
int l9_13178;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_13179=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13179=0;
}
else
{
l9_13179=in.varStereoViewID;
}
int l9_13180=l9_13179;
l9_13178=1-l9_13180;
}
else
{
int l9_13181=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13181=0;
}
else
{
l9_13181=in.varStereoViewID;
}
int l9_13182=l9_13181;
l9_13178=l9_13182;
}
int l9_13183=l9_13178;
int l9_13184=greyMaskIdLayout_tmp;
int l9_13185=l9_13183;
float2 l9_13186=l9_13176;
bool l9_13187=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_13188=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_13189=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_13190=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_13191=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_13192=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_13193=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_13194=0.0;
bool l9_13195=l9_13192&&(!l9_13190);
float l9_13196=1.0;
float l9_13197=l9_13186.x;
int l9_13198=l9_13189.x;
if (l9_13198==1)
{
l9_13197=fract(l9_13197);
}
else
{
if (l9_13198==2)
{
float l9_13199=fract(l9_13197);
float l9_13200=l9_13197-l9_13199;
float l9_13201=step(0.25,fract(l9_13200*0.5));
l9_13197=mix(l9_13199,1.0-l9_13199,fast::clamp(l9_13201,0.0,1.0));
}
}
l9_13186.x=l9_13197;
float l9_13202=l9_13186.y;
int l9_13203=l9_13189.y;
if (l9_13203==1)
{
l9_13202=fract(l9_13202);
}
else
{
if (l9_13203==2)
{
float l9_13204=fract(l9_13202);
float l9_13205=l9_13202-l9_13204;
float l9_13206=step(0.25,fract(l9_13205*0.5));
l9_13202=mix(l9_13204,1.0-l9_13204,fast::clamp(l9_13206,0.0,1.0));
}
}
l9_13186.y=l9_13202;
if (l9_13190)
{
bool l9_13207=l9_13192;
bool l9_13208;
if (l9_13207)
{
l9_13208=l9_13189.x==3;
}
else
{
l9_13208=l9_13207;
}
float l9_13209=l9_13186.x;
float l9_13210=l9_13191.x;
float l9_13211=l9_13191.z;
bool l9_13212=l9_13208;
float l9_13213=l9_13196;
float l9_13214=fast::clamp(l9_13209,l9_13210,l9_13211);
float l9_13215=step(abs(l9_13209-l9_13214),9.9999997e-06);
l9_13213*=(l9_13215+((1.0-float(l9_13212))*(1.0-l9_13215)));
l9_13209=l9_13214;
l9_13186.x=l9_13209;
l9_13196=l9_13213;
bool l9_13216=l9_13192;
bool l9_13217;
if (l9_13216)
{
l9_13217=l9_13189.y==3;
}
else
{
l9_13217=l9_13216;
}
float l9_13218=l9_13186.y;
float l9_13219=l9_13191.y;
float l9_13220=l9_13191.w;
bool l9_13221=l9_13217;
float l9_13222=l9_13196;
float l9_13223=fast::clamp(l9_13218,l9_13219,l9_13220);
float l9_13224=step(abs(l9_13218-l9_13223),9.9999997e-06);
l9_13222*=(l9_13224+((1.0-float(l9_13221))*(1.0-l9_13224)));
l9_13218=l9_13223;
l9_13186.y=l9_13218;
l9_13196=l9_13222;
}
float2 l9_13225=l9_13186;
bool l9_13226=l9_13187;
float3x3 l9_13227=l9_13188;
if (l9_13226)
{
l9_13225=float2((l9_13227*float3(l9_13225,1.0)).xy);
}
float2 l9_13228=l9_13225;
l9_13186=l9_13228;
float l9_13229=l9_13186.x;
int l9_13230=l9_13189.x;
bool l9_13231=l9_13195;
float l9_13232=l9_13196;
if ((l9_13230==0)||(l9_13230==3))
{
float l9_13233=l9_13229;
float l9_13234=0.0;
float l9_13235=1.0;
bool l9_13236=l9_13231;
float l9_13237=l9_13232;
float l9_13238=fast::clamp(l9_13233,l9_13234,l9_13235);
float l9_13239=step(abs(l9_13233-l9_13238),9.9999997e-06);
l9_13237*=(l9_13239+((1.0-float(l9_13236))*(1.0-l9_13239)));
l9_13233=l9_13238;
l9_13229=l9_13233;
l9_13232=l9_13237;
}
l9_13186.x=l9_13229;
l9_13196=l9_13232;
float l9_13240=l9_13186.y;
int l9_13241=l9_13189.y;
bool l9_13242=l9_13195;
float l9_13243=l9_13196;
if ((l9_13241==0)||(l9_13241==3))
{
float l9_13244=l9_13240;
float l9_13245=0.0;
float l9_13246=1.0;
bool l9_13247=l9_13242;
float l9_13248=l9_13243;
float l9_13249=fast::clamp(l9_13244,l9_13245,l9_13246);
float l9_13250=step(abs(l9_13244-l9_13249),9.9999997e-06);
l9_13248*=(l9_13250+((1.0-float(l9_13247))*(1.0-l9_13250)));
l9_13244=l9_13249;
l9_13240=l9_13244;
l9_13243=l9_13248;
}
l9_13186.y=l9_13240;
l9_13196=l9_13243;
float2 l9_13251=l9_13186;
int l9_13252=l9_13184;
int l9_13253=l9_13185;
float l9_13254=l9_13194;
float2 l9_13255=l9_13251;
int l9_13256=l9_13252;
int l9_13257=l9_13253;
float3 l9_13258=float3(0.0);
if (l9_13256==0)
{
l9_13258=float3(l9_13255,0.0);
}
else
{
if (l9_13256==1)
{
l9_13258=float3(l9_13255.x,(l9_13255.y*0.5)+(0.5-(float(l9_13257)*0.5)),0.0);
}
else
{
l9_13258=float3(l9_13255,float(l9_13257));
}
}
float3 l9_13259=l9_13258;
float3 l9_13260=l9_13259;
float4 l9_13261=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_13260.xy,bias(l9_13254));
float4 l9_13262=l9_13261;
if (l9_13192)
{
l9_13262=mix(l9_13193,l9_13262,float4(l9_13196));
}
float4 l9_13263=l9_13262;
l9_13177=l9_13263;
float l9_13264=0.0;
l9_13264=l9_13177.x;
float l9_13265=0.0;
l9_13265=step(l9_13264,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_13266=float4(0.0);
l9_13266=l9_13174*float4(l9_13265);
l9_12949=l9_13266;
l9_12953=l9_12949;
}
l9_12946=l9_12953;
float2 l9_13267=float2(0.0);
l9_13267=l9_12508.Surface_UVCoord0;
float4 l9_13268=float4(0.0);
int l9_13269;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_13270=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13270=0;
}
else
{
l9_13270=in.varStereoViewID;
}
int l9_13271=l9_13270;
l9_13269=1-l9_13271;
}
else
{
int l9_13272=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13272=0;
}
else
{
l9_13272=in.varStereoViewID;
}
int l9_13273=l9_13272;
l9_13269=l9_13273;
}
int l9_13274=l9_13269;
int l9_13275=greyMaskIdLayout_tmp;
int l9_13276=l9_13274;
float2 l9_13277=l9_13267;
bool l9_13278=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_13279=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_13280=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_13281=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_13282=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_13283=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_13284=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_13285=0.0;
bool l9_13286=l9_13283&&(!l9_13281);
float l9_13287=1.0;
float l9_13288=l9_13277.x;
int l9_13289=l9_13280.x;
if (l9_13289==1)
{
l9_13288=fract(l9_13288);
}
else
{
if (l9_13289==2)
{
float l9_13290=fract(l9_13288);
float l9_13291=l9_13288-l9_13290;
float l9_13292=step(0.25,fract(l9_13291*0.5));
l9_13288=mix(l9_13290,1.0-l9_13290,fast::clamp(l9_13292,0.0,1.0));
}
}
l9_13277.x=l9_13288;
float l9_13293=l9_13277.y;
int l9_13294=l9_13280.y;
if (l9_13294==1)
{
l9_13293=fract(l9_13293);
}
else
{
if (l9_13294==2)
{
float l9_13295=fract(l9_13293);
float l9_13296=l9_13293-l9_13295;
float l9_13297=step(0.25,fract(l9_13296*0.5));
l9_13293=mix(l9_13295,1.0-l9_13295,fast::clamp(l9_13297,0.0,1.0));
}
}
l9_13277.y=l9_13293;
if (l9_13281)
{
bool l9_13298=l9_13283;
bool l9_13299;
if (l9_13298)
{
l9_13299=l9_13280.x==3;
}
else
{
l9_13299=l9_13298;
}
float l9_13300=l9_13277.x;
float l9_13301=l9_13282.x;
float l9_13302=l9_13282.z;
bool l9_13303=l9_13299;
float l9_13304=l9_13287;
float l9_13305=fast::clamp(l9_13300,l9_13301,l9_13302);
float l9_13306=step(abs(l9_13300-l9_13305),9.9999997e-06);
l9_13304*=(l9_13306+((1.0-float(l9_13303))*(1.0-l9_13306)));
l9_13300=l9_13305;
l9_13277.x=l9_13300;
l9_13287=l9_13304;
bool l9_13307=l9_13283;
bool l9_13308;
if (l9_13307)
{
l9_13308=l9_13280.y==3;
}
else
{
l9_13308=l9_13307;
}
float l9_13309=l9_13277.y;
float l9_13310=l9_13282.y;
float l9_13311=l9_13282.w;
bool l9_13312=l9_13308;
float l9_13313=l9_13287;
float l9_13314=fast::clamp(l9_13309,l9_13310,l9_13311);
float l9_13315=step(abs(l9_13309-l9_13314),9.9999997e-06);
l9_13313*=(l9_13315+((1.0-float(l9_13312))*(1.0-l9_13315)));
l9_13309=l9_13314;
l9_13277.y=l9_13309;
l9_13287=l9_13313;
}
float2 l9_13316=l9_13277;
bool l9_13317=l9_13278;
float3x3 l9_13318=l9_13279;
if (l9_13317)
{
l9_13316=float2((l9_13318*float3(l9_13316,1.0)).xy);
}
float2 l9_13319=l9_13316;
l9_13277=l9_13319;
float l9_13320=l9_13277.x;
int l9_13321=l9_13280.x;
bool l9_13322=l9_13286;
float l9_13323=l9_13287;
if ((l9_13321==0)||(l9_13321==3))
{
float l9_13324=l9_13320;
float l9_13325=0.0;
float l9_13326=1.0;
bool l9_13327=l9_13322;
float l9_13328=l9_13323;
float l9_13329=fast::clamp(l9_13324,l9_13325,l9_13326);
float l9_13330=step(abs(l9_13324-l9_13329),9.9999997e-06);
l9_13328*=(l9_13330+((1.0-float(l9_13327))*(1.0-l9_13330)));
l9_13324=l9_13329;
l9_13320=l9_13324;
l9_13323=l9_13328;
}
l9_13277.x=l9_13320;
l9_13287=l9_13323;
float l9_13331=l9_13277.y;
int l9_13332=l9_13280.y;
bool l9_13333=l9_13286;
float l9_13334=l9_13287;
if ((l9_13332==0)||(l9_13332==3))
{
float l9_13335=l9_13331;
float l9_13336=0.0;
float l9_13337=1.0;
bool l9_13338=l9_13333;
float l9_13339=l9_13334;
float l9_13340=fast::clamp(l9_13335,l9_13336,l9_13337);
float l9_13341=step(abs(l9_13335-l9_13340),9.9999997e-06);
l9_13339*=(l9_13341+((1.0-float(l9_13338))*(1.0-l9_13341)));
l9_13335=l9_13340;
l9_13331=l9_13335;
l9_13334=l9_13339;
}
l9_13277.y=l9_13331;
l9_13287=l9_13334;
float2 l9_13342=l9_13277;
int l9_13343=l9_13275;
int l9_13344=l9_13276;
float l9_13345=l9_13285;
float2 l9_13346=l9_13342;
int l9_13347=l9_13343;
int l9_13348=l9_13344;
float3 l9_13349=float3(0.0);
if (l9_13347==0)
{
l9_13349=float3(l9_13346,0.0);
}
else
{
if (l9_13347==1)
{
l9_13349=float3(l9_13346.x,(l9_13346.y*0.5)+(0.5-(float(l9_13348)*0.5)),0.0);
}
else
{
l9_13349=float3(l9_13346,float(l9_13348));
}
}
float3 l9_13350=l9_13349;
float3 l9_13351=l9_13350;
float4 l9_13352=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_13351.xy,bias(l9_13345));
float4 l9_13353=l9_13352;
if (l9_13283)
{
l9_13353=mix(l9_13284,l9_13353,float4(l9_13287));
}
float4 l9_13354=l9_13353;
l9_13268=l9_13354;
float l9_13355=0.0;
l9_13355=l9_13268.x;
float l9_13356=0.0;
l9_13356=step(l9_13355,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_13357=float4(0.0);
l9_13357=l9_12946*float4(l9_13356);
float4 l9_13358=float4(0.0);
float4 l9_13359=(*sc_set0.UserUniforms).colorId01;
l9_13358=l9_13359;
float4 l9_13360=float4(0.0);
l9_13360=l9_13358*float4(l9_13356);
float4 l9_13361=float4(0.0);
float4 l9_13362=l9_13357;
float4 l9_13363=l9_13360;
float4 l9_13364=l9_13362;
float4 l9_13365=l9_13363;
float3 l9_13366=l9_13364.xyz*l9_13364.w;
l9_13364=float4(l9_13366.x,l9_13366.y,l9_13366.z,l9_13364.w);
float4 l9_13367=l9_13364+(l9_13365*(1.0-l9_13364.w));
l9_13361=l9_13367;
l9_12507=l9_13361;
l9_12511=l9_12507;
}
l9_12504=l9_12511;
l9_11607=l9_12504;
l9_11611=l9_11607;
}
l9_11604=l9_11611;
float2 l9_13368=float2(0.0);
l9_13368=l9_7793.Surface_UVCoord0;
float4 l9_13369=float4(0.0);
int l9_13370;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_13371=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13371=0;
}
else
{
l9_13371=in.varStereoViewID;
}
int l9_13372=l9_13371;
l9_13370=1-l9_13372;
}
else
{
int l9_13373=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13373=0;
}
else
{
l9_13373=in.varStereoViewID;
}
int l9_13374=l9_13373;
l9_13370=l9_13374;
}
int l9_13375=l9_13370;
int l9_13376=greyMaskIdLayout_tmp;
int l9_13377=l9_13375;
float2 l9_13378=l9_13368;
bool l9_13379=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_13380=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_13381=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_13382=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_13383=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_13384=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_13385=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_13386=0.0;
bool l9_13387=l9_13384&&(!l9_13382);
float l9_13388=1.0;
float l9_13389=l9_13378.x;
int l9_13390=l9_13381.x;
if (l9_13390==1)
{
l9_13389=fract(l9_13389);
}
else
{
if (l9_13390==2)
{
float l9_13391=fract(l9_13389);
float l9_13392=l9_13389-l9_13391;
float l9_13393=step(0.25,fract(l9_13392*0.5));
l9_13389=mix(l9_13391,1.0-l9_13391,fast::clamp(l9_13393,0.0,1.0));
}
}
l9_13378.x=l9_13389;
float l9_13394=l9_13378.y;
int l9_13395=l9_13381.y;
if (l9_13395==1)
{
l9_13394=fract(l9_13394);
}
else
{
if (l9_13395==2)
{
float l9_13396=fract(l9_13394);
float l9_13397=l9_13394-l9_13396;
float l9_13398=step(0.25,fract(l9_13397*0.5));
l9_13394=mix(l9_13396,1.0-l9_13396,fast::clamp(l9_13398,0.0,1.0));
}
}
l9_13378.y=l9_13394;
if (l9_13382)
{
bool l9_13399=l9_13384;
bool l9_13400;
if (l9_13399)
{
l9_13400=l9_13381.x==3;
}
else
{
l9_13400=l9_13399;
}
float l9_13401=l9_13378.x;
float l9_13402=l9_13383.x;
float l9_13403=l9_13383.z;
bool l9_13404=l9_13400;
float l9_13405=l9_13388;
float l9_13406=fast::clamp(l9_13401,l9_13402,l9_13403);
float l9_13407=step(abs(l9_13401-l9_13406),9.9999997e-06);
l9_13405*=(l9_13407+((1.0-float(l9_13404))*(1.0-l9_13407)));
l9_13401=l9_13406;
l9_13378.x=l9_13401;
l9_13388=l9_13405;
bool l9_13408=l9_13384;
bool l9_13409;
if (l9_13408)
{
l9_13409=l9_13381.y==3;
}
else
{
l9_13409=l9_13408;
}
float l9_13410=l9_13378.y;
float l9_13411=l9_13383.y;
float l9_13412=l9_13383.w;
bool l9_13413=l9_13409;
float l9_13414=l9_13388;
float l9_13415=fast::clamp(l9_13410,l9_13411,l9_13412);
float l9_13416=step(abs(l9_13410-l9_13415),9.9999997e-06);
l9_13414*=(l9_13416+((1.0-float(l9_13413))*(1.0-l9_13416)));
l9_13410=l9_13415;
l9_13378.y=l9_13410;
l9_13388=l9_13414;
}
float2 l9_13417=l9_13378;
bool l9_13418=l9_13379;
float3x3 l9_13419=l9_13380;
if (l9_13418)
{
l9_13417=float2((l9_13419*float3(l9_13417,1.0)).xy);
}
float2 l9_13420=l9_13417;
l9_13378=l9_13420;
float l9_13421=l9_13378.x;
int l9_13422=l9_13381.x;
bool l9_13423=l9_13387;
float l9_13424=l9_13388;
if ((l9_13422==0)||(l9_13422==3))
{
float l9_13425=l9_13421;
float l9_13426=0.0;
float l9_13427=1.0;
bool l9_13428=l9_13423;
float l9_13429=l9_13424;
float l9_13430=fast::clamp(l9_13425,l9_13426,l9_13427);
float l9_13431=step(abs(l9_13425-l9_13430),9.9999997e-06);
l9_13429*=(l9_13431+((1.0-float(l9_13428))*(1.0-l9_13431)));
l9_13425=l9_13430;
l9_13421=l9_13425;
l9_13424=l9_13429;
}
l9_13378.x=l9_13421;
l9_13388=l9_13424;
float l9_13432=l9_13378.y;
int l9_13433=l9_13381.y;
bool l9_13434=l9_13387;
float l9_13435=l9_13388;
if ((l9_13433==0)||(l9_13433==3))
{
float l9_13436=l9_13432;
float l9_13437=0.0;
float l9_13438=1.0;
bool l9_13439=l9_13434;
float l9_13440=l9_13435;
float l9_13441=fast::clamp(l9_13436,l9_13437,l9_13438);
float l9_13442=step(abs(l9_13436-l9_13441),9.9999997e-06);
l9_13440*=(l9_13442+((1.0-float(l9_13439))*(1.0-l9_13442)));
l9_13436=l9_13441;
l9_13432=l9_13436;
l9_13435=l9_13440;
}
l9_13378.y=l9_13432;
l9_13388=l9_13435;
float2 l9_13443=l9_13378;
int l9_13444=l9_13376;
int l9_13445=l9_13377;
float l9_13446=l9_13386;
float2 l9_13447=l9_13443;
int l9_13448=l9_13444;
int l9_13449=l9_13445;
float3 l9_13450=float3(0.0);
if (l9_13448==0)
{
l9_13450=float3(l9_13447,0.0);
}
else
{
if (l9_13448==1)
{
l9_13450=float3(l9_13447.x,(l9_13447.y*0.5)+(0.5-(float(l9_13449)*0.5)),0.0);
}
else
{
l9_13450=float3(l9_13447,float(l9_13449));
}
}
float3 l9_13451=l9_13450;
float3 l9_13452=l9_13451;
float4 l9_13453=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_13452.xy,bias(l9_13446));
float4 l9_13454=l9_13453;
if (l9_13384)
{
l9_13454=mix(l9_13385,l9_13454,float4(l9_13388));
}
float4 l9_13455=l9_13454;
l9_13369=l9_13455;
float l9_13456=0.0;
l9_13456=l9_13369.x;
float l9_13457=0.0;
l9_13457=step(l9_13456,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_13458=float4(0.0);
l9_13458=l9_11604*float4(l9_13457);
l9_7792=l9_13458;
l9_7796=l9_7792;
}
l9_7789=l9_7796;
param_30=l9_7789;
param_31=param_30;
}
Result_N419=param_31;
float4 Output_N27=float4(0.0);
Output_N27=Output_N26+Result_N419;
float4 Output_N50=float4(0.0);
Output_N50=((Output_N27*Output_N27)*Output_N27)*Output_N27;
float4 Output_N51=float4(0.0);
Output_N51=fast::clamp(Output_N50+float4(0.001),(*sc_set0.UserUniforms).Port_Input1_N051+float4(0.001),(*sc_set0.UserUniforms).Port_Input2_N051+float4(0.001))-float4(0.001);
float4 Output_N57=float4(0.0);
Output_N57=float4(1.0)-Output_N52;
float4 Value_N59=float4(0.0);
Value_N59=Output_N57;
float Value_N60=0.0;
Value_N60=fast::clamp((*sc_set0.UserUniforms).Port_Import_N060,0.0,5.0);
float4 Output_N61=float4(0.0);
Output_N61=Value_N59*float4(Value_N60);
float Output_N62=0.0;
Output_N62=dot(Output_N61,(*sc_set0.UserUniforms).Port_Input1_N062);
float Value_N63=0.0;
Value_N63=fast::clamp((*sc_set0.UserUniforms).Port_Import_N063,0.0,2.0);
float4 Output_N98=float4(0.0);
Output_N98=mix(float4(Output_N62),Output_N61,float4(Value_N63));
float Value_N100=0.0;
Value_N100=fast::clamp((*sc_set0.UserUniforms).Port_Import_N100,0.0,2.0);
float4 Output_N102=float4(0.0);
Output_N102=mix((*sc_set0.UserUniforms).Port_Input0_N102,Output_N98,float4(Value_N100));
float4 Export_N64=float4(0.0);
Export_N64=Output_N102;
float4 Output_N67=float4(0.0);
Output_N67=mix(Output_N27,Output_N51,Export_N64);
float Output_N68=0.0;
float param_33=(*sc_set0.UserUniforms).Tweak_N47;
Output_N68=param_33;
float4 Output_N69=float4(0.0);
float4 param_34=Output_N67;
float param_35=Output_N68;
float l9_13459=dot(param_34.xyz,float3(0.29899999,0.58700001,0.114));
float4 param_36=float4(mix(float3(l9_13459),param_34.xyz,float3(param_35)),param_34.w);
Output_N69=param_36;
float4 Output_N70=float4(0.0);
Output_N70=fast::clamp(Output_N69+float4(0.001),(*sc_set0.UserUniforms).Port_Input1_N070+float4(0.001),(*sc_set0.UserUniforms).Port_Input2_N070+float4(0.001))-float4(0.001);
FinalColor=Output_N70;
if ((*sc_set0.UserUniforms).sc_RayTracingCasterConfiguration.x!=0u)
{
float4 param_37=FinalColor;
if ((int(sc_RayTracingCasterForceOpaque_tmp)!=0))
{
param_37.w=1.0;
}
float4 l9_13460=fast::max(param_37,float4(0.0));
float4 param_38=l9_13460;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_38.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.sc_FragData0=param_38;
return out;
}
float4 param_39=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_13461=param_39;
float4 l9_13462=l9_13461;
float l9_13463=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_13463=l9_13462.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_13463=fast::clamp(l9_13462.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_13463=fast::clamp(dot(l9_13462.xyz,float3(l9_13462.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_13463=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_13463=(1.0-dot(l9_13462.xyz,float3(0.33333001)))*l9_13462.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_13463=(1.0-fast::clamp(dot(l9_13462.xyz,float3(1.0)),0.0,1.0))*l9_13462.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_13463=fast::clamp(dot(l9_13462.xyz,float3(1.0)),0.0,1.0)*l9_13462.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_13463=fast::clamp(dot(l9_13462.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_13463=fast::clamp(dot(l9_13462.xyz,float3(1.0)),0.0,1.0)*l9_13462.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_13463=dot(l9_13462.xyz,float3(0.33333001))*l9_13462.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_13463=1.0-fast::clamp(dot(l9_13462.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_13463=fast::clamp(dot(l9_13462.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_13464=l9_13463;
float l9_13465=l9_13464;
float l9_13466=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_13465;
float3 l9_13467=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_13461.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_13468=float4(l9_13467.x,l9_13467.y,l9_13467.z,l9_13466);
param_39=l9_13468;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_39=float4(param_39.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_13469=param_39;
float4 l9_13470=float4(0.0);
float4 l9_13471=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_13472=out.sc_FragData0;
l9_13471=l9_13472;
}
else
{
float4 l9_13473=gl_FragCoord;
float2 l9_13474=l9_13473.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_13475=l9_13474;
float2 l9_13476=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_13477=1;
int l9_13478=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13478=0;
}
else
{
l9_13478=in.varStereoViewID;
}
int l9_13479=l9_13478;
int l9_13480=l9_13479;
float3 l9_13481=float3(l9_13475,0.0);
int l9_13482=l9_13477;
int l9_13483=l9_13480;
if (l9_13482==1)
{
l9_13481.y=((2.0*l9_13481.y)+float(l9_13483))-1.0;
}
float2 l9_13484=l9_13481.xy;
l9_13476=l9_13484;
}
else
{
l9_13476=l9_13475;
}
float2 l9_13485=l9_13476;
float2 l9_13486=l9_13485;
float2 l9_13487=l9_13486;
float2 l9_13488=l9_13487;
float l9_13489=0.0;
int l9_13490;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_13491=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13491=0;
}
else
{
l9_13491=in.varStereoViewID;
}
int l9_13492=l9_13491;
l9_13490=1-l9_13492;
}
else
{
int l9_13493=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_13493=0;
}
else
{
l9_13493=in.varStereoViewID;
}
int l9_13494=l9_13493;
l9_13490=l9_13494;
}
int l9_13495=l9_13490;
float2 l9_13496=l9_13488;
int l9_13497=sc_ScreenTextureLayout_tmp;
int l9_13498=l9_13495;
float l9_13499=l9_13489;
float2 l9_13500=l9_13496;
int l9_13501=l9_13497;
int l9_13502=l9_13498;
float3 l9_13503=float3(0.0);
if (l9_13501==0)
{
l9_13503=float3(l9_13500,0.0);
}
else
{
if (l9_13501==1)
{
l9_13503=float3(l9_13500.x,(l9_13500.y*0.5)+(0.5-(float(l9_13502)*0.5)),0.0);
}
else
{
l9_13503=float3(l9_13500,float(l9_13502));
}
}
float3 l9_13504=l9_13503;
float3 l9_13505=l9_13504;
float4 l9_13506=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_13505.xy,bias(l9_13499));
float4 l9_13507=l9_13506;
float4 l9_13508=l9_13507;
l9_13471=l9_13508;
}
float4 l9_13509=l9_13471;
float3 l9_13510=l9_13509.xyz;
float3 l9_13511=l9_13510;
float3 l9_13512=l9_13469.xyz;
float3 l9_13513=definedBlend(l9_13511,l9_13512,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_13470=float4(l9_13513.x,l9_13513.y,l9_13513.z,l9_13470.w);
float3 l9_13514=mix(l9_13510,l9_13470.xyz,float3(l9_13469.w));
l9_13470=float4(l9_13514.x,l9_13514.y,l9_13514.z,l9_13470.w);
l9_13470.w=1.0;
float4 l9_13515=l9_13470;
param_39=l9_13515;
}
else
{
if ((int(sc_Voxelization_tmp)!=0))
{
float4 l9_13516=float4(in.varScreenPos.xyz,1.0);
param_39=l9_13516;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
float4 l9_13517=gl_FragCoord;
float l9_13518=fast::clamp(abs(l9_13517.z),0.0,1.0);
float4 l9_13519=float4(l9_13518,1.0-l9_13518,1.0,1.0);
param_39=l9_13519;
}
else
{
float4 l9_13520=param_39;
float4 l9_13521=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_13521=float4(mix(float3(1.0),l9_13520.xyz,float3(l9_13520.w)),l9_13520.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_13522=l9_13520.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_13522=fast::clamp(l9_13522,0.0,1.0);
}
l9_13521=float4(l9_13520.xyz*l9_13522,l9_13522);
}
else
{
l9_13521=l9_13520;
}
}
float4 l9_13523=l9_13521;
param_39=l9_13523;
}
}
}
}
}
float4 l9_13524=param_39;
FinalColor=l9_13524;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_13525=float4(0.0);
l9_13525=float4(0.0);
float4 l9_13526=l9_13525;
float4 Cost=l9_13526;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_40=FinalColor;
FinalColor=sc_OutputMotionVectorIfNeeded(param_40,in.varPosAndMotion,in.varNormalAndMotion);
float4 param_41=FinalColor;
float4 l9_13527=param_41;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_13527.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.sc_FragData0=l9_13527;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 VertexNormal_WorldSpace;
float3 VertexTangent_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 ViewDirWS;
float3 SurfacePosition_WorldSpace;
float2 Surface_UVCoord0;
float3 BumpedNormal;
float3 PositionWS;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int sc_RayTracingReceiverEffectsMask;
float4 sc_RayTracingReflectionsSize;
float4 sc_RayTracingReflectionsDims;
float4 sc_RayTracingReflectionsView;
float4 sc_RayTracingGlobalIlluminationSize;
float4 sc_RayTracingGlobalIlluminationDims;
float4 sc_RayTracingGlobalIlluminationView;
float4 sc_RayTracingShadowsSize;
float4 sc_RayTracingShadowsDims;
float4 sc_RayTracingShadowsView;
float3 sc_RayTracingOriginScale;
uint sc_RayTracingReceiverMask;
float3 sc_RayTracingOriginScaleInv;
float3 sc_RayTracingOriginOffset;
uint sc_RayTracingReceiverId;
uint4 sc_RayTracingCasterConfiguration;
uint4 sc_RayTracingCasterOffsetPNTC;
uint4 sc_RayTracingCasterOffsetTexture;
uint4 sc_RayTracingCasterFormatPNTC;
uint4 sc_RayTracingCasterFormatTexture;
float4 sc_RayTracingRayDirectionSize;
float4 sc_RayTracingRayDirectionDims;
float4 sc_RayTracingRayDirectionView;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float Tweak_N16;
float4 Tweak_N25Size;
float4 Tweak_N25Dims;
float4 Tweak_N25View;
float3x3 Tweak_N25Transform;
float4 Tweak_N25UvMinMax;
float4 Tweak_N25BorderColor;
float4 Tweak_N27Size;
float4 Tweak_N27Dims;
float4 Tweak_N27View;
float3x3 Tweak_N27Transform;
float4 Tweak_N27UvMinMax;
float4 Tweak_N27BorderColor;
int ColorOnOffid03;
int pbrOnOffId03;
int rimOnOffId03;
float rimExpId03;
float rimIntId03;
int patternOnOffId03;
float4 patternColorId03;
int pngPatternId03;
float4 patternTextureId03Size;
float4 patternTextureId03Dims;
float4 patternTextureId03View;
float3x3 patternTextureId03Transform;
float4 patternTextureId03UvMinMax;
float4 patternTextureId03BorderColor;
float2 patternScaleId03;
float2 patternOffsetId03;
float patternRotateId03;
float4 colorId03;
float4 greyMaskIdSize;
float4 greyMaskIdDims;
float4 greyMaskIdView;
float3x3 greyMaskIdTransform;
float4 greyMaskIdUvMinMax;
float4 greyMaskIdBorderColor;
float metallicId03;
float rougnessId03;
int ColorOnOffid02;
int pbrOnOffId02;
int rimOnOffId02;
float rimExpId02;
float rimIntId02;
int patternOnOffId02;
float4 patternColorId02;
int pngPatternId02;
float4 patternTextureId02Size;
float4 patternTextureId02Dims;
float4 patternTextureId02View;
float3x3 patternTextureId02Transform;
float4 patternTextureId02UvMinMax;
float4 patternTextureId02BorderColor;
float2 patternScaleId02;
float2 patternOffsetId02;
float patternRotateId02;
float4 colorId02;
float metallicId02;
float rougnessId02;
int pbrOnOffId01;
int rimOnOffId01;
float rimExpId01;
float rimIntId01;
int patternOnOffId01;
float4 patternColorId01;
int pngPatternId01;
float4 patternTextureId01Size;
float4 patternTextureId01Dims;
float4 patternTextureId01View;
float3x3 patternTextureId01Transform;
float4 patternTextureId01UvMinMax;
float4 patternTextureId01BorderColor;
float2 patternScaleId01;
float2 patternOffsetId01;
float patternRotateId01;
float4 colorId01;
float metallicId01;
float rougnessId01;
float Tweak_N47;
float Port_Import_N008;
float3 Port_Import_N014;
float2 Port_Center_N379;
float2 Port_Center_N383;
float Port_Input1_N006;
float Port_Input1_N009;
float4 Port_Default_N358;
float Port_Mask_N399;
float Port_Opacity_N410;
float3 Port_Normal_N410;
float3 Port_Emissive_N410;
float3 Port_AO_N410;
float3 Port_SpecularAO_N410;
float2 Port_Center_N282;
float2 Port_Center_N286;
float Port_Input1_N038;
float Port_Input1_N035;
float4 Port_Default_N338;
float Port_Mask_N302;
float Port_Opacity_N313;
float3 Port_Normal_N313;
float3 Port_Emissive_N313;
float3 Port_AO_N313;
float3 Port_SpecularAO_N313;
float2 Port_Center_N122;
float2 Port_Center_N126;
float Port_Input1_N034;
float Port_Mask_N139;
float Port_Opacity_N152;
float3 Port_Normal_N152;
float3 Port_Emissive_N152;
float3 Port_AO_N152;
float3 Port_SpecularAO_N152;
float Port_Mask_N263;
float Port_Mask_N418;
float4 Port_Input1_N051;
float4 Port_Input2_N051;
float4 Port_Input0_N102;
float4 Port_Import_N059;
float Port_Import_N060;
float4 Port_Input1_N062;
float Port_Import_N063;
float Port_Import_N100;
float4 Port_Input1_N070;
float4 Port_Input2_N070;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_RayTracingCasterIndexBuffer_obj
{
uint sc_RayTracingCasterTriangles[1];
};
struct sc_RayTracingCasterVertexBuffer_obj
{
float sc_RayTracingCasterVertices[1];
};
struct sc_RayTracingCasterNonAnimatedVertexBuffer_obj
{
float sc_RayTracingCasterNonAnimatedVertices[1];
};
struct sc_Set0
{
const device sc_RayTracingCasterIndexBuffer_obj* sc_RayTracingCasterIndexBuffer [[id(0)]];
const device sc_RayTracingCasterVertexBuffer_obj* sc_RayTracingCasterVertexBuffer [[id(1)]];
const device sc_RayTracingCasterNonAnimatedVertexBuffer_obj* sc_RayTracingCasterNonAnimatedVertexBuffer [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> Tweak_N25 [[id(4)]];
texture2d<float> Tweak_N27 [[id(5)]];
texture2d<float> greyMaskId [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> patternTextureId01 [[id(8)]];
texture2d<float> patternTextureId02 [[id(9)]];
texture2d<float> patternTextureId03 [[id(10)]];
texture2d<float> sc_EnvmapDiffuse [[id(11)]];
texture2d<float> sc_EnvmapSpecular [[id(12)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(21)]];
texture2d<uint> sc_RayTracingHitCasterIdAndBarycentric [[id(22)]];
texture2d<float> sc_RayTracingRayDirection [[id(23)]];
texture2d<float> sc_RayTracingReflections [[id(24)]];
texture2d<float> sc_RayTracingShadows [[id(25)]];
texture2d<float> sc_SSAOTexture [[id(26)]];
texture2d<float> sc_ScreenTexture [[id(27)]];
texture2d<float> sc_ShadowTexture [[id(28)]];
sampler Tweak_N25SmpSC [[id(30)]];
sampler Tweak_N27SmpSC [[id(31)]];
sampler greyMaskIdSmpSC [[id(32)]];
sampler intensityTextureSmpSC [[id(33)]];
sampler patternTextureId01SmpSC [[id(34)]];
sampler patternTextureId02SmpSC [[id(35)]];
sampler patternTextureId03SmpSC [[id(36)]];
sampler sc_EnvmapDiffuseSmpSC [[id(37)]];
sampler sc_EnvmapSpecularSmpSC [[id(38)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(40)]];
sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC [[id(41)]];
sampler sc_RayTracingRayDirectionSmpSC [[id(42)]];
sampler sc_RayTracingReflectionsSmpSC [[id(43)]];
sampler sc_RayTracingShadowsSmpSC [[id(44)]];
sampler sc_SSAOTextureSmpSC [[id(45)]];
sampler sc_ScreenTextureSmpSC [[id(46)]];
sampler sc_ShadowTextureSmpSC [[id(47)]];
constant userUniformsObj* UserUniforms [[id(49)]];
};
struct main_recv_out
{
uint4 sc_RayTracingPositionAndMask [[color(0)]];
uint4 sc_RayTracingNormalAndMore [[color(1)]];
};
struct main_recv_in
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.VertexNormal_WorldSpace=normalize(in.varNormalAndMotion.xyz);
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPosAndMotion.xyz;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
Globals.Surface_UVCoord0=in.varTex01.xy;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPosAndMotion.xyz);
Globals.PositionWS=in.varPosAndMotion.xyz;
float param=0.0;
ssGlobals param_1=Globals;
float l9_0=0.0;
float l9_1=float((*sc_set0.UserUniforms).ColorOnOffid03!=0);
l9_0=l9_1;
param=l9_0;
if ((param*1.0)!=0.0)
{
float l9_2=0.0;
ssGlobals l9_3=param_1;
float l9_4=0.0;
float l9_5=float((*sc_set0.UserUniforms).pbrOnOffId03!=0);
l9_4=l9_5;
l9_2=l9_4;
if ((l9_2*1.0)!=0.0)
{
float l9_6=0.0;
float l9_7=(*sc_set0.UserUniforms).rougnessId03;
l9_6=l9_7;
float l9_8=(*sc_set0.UserUniforms).Port_Opacity_N410;
float l9_9=l9_6;
ssGlobals l9_10=l9_3;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_10.BumpedNormal=l9_10.VertexNormal_WorldSpace;
}
float l9_11=l9_8;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_11<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_12=gl_FragCoord;
float2 l9_13=floor(mod(l9_12.xy,float2(4.0)));
float l9_14=(mod(dot(l9_13,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_11<l9_14)
{
discard_fragment();
}
}
float3 l9_15=l9_10.PositionWS;
float3 l9_16=l9_10.BumpedNormal;
float l9_17=l9_9;
float3 l9_18=l9_15;
float3 l9_19=l9_16;
float l9_20=l9_17;
uint l9_21=0u;
uint3 l9_22=uint3(round((l9_18-(*sc_set0.UserUniforms).sc_RayTracingOriginOffset)*(*sc_set0.UserUniforms).sc_RayTracingOriginScale));
out.sc_RayTracingPositionAndMask=uint4(l9_22.x,l9_22.y,l9_22.z,out.sc_RayTracingPositionAndMask.w);
out.sc_RayTracingPositionAndMask.w=(*sc_set0.UserUniforms).sc_RayTracingReceiverMask;
float3 l9_23=l9_19;
float l9_24=dot(abs(l9_23),float3(1.0));
l9_23/=float3(l9_24);
float2 l9_25=float2(fast::clamp(-l9_23.z,0.0,1.0));
float2 l9_26=l9_23.xy+mix(-l9_25,l9_25,step(float2(0.0),l9_23.xy));
uint l9_27=as_type<uint>(half2(l9_26));
uint2 l9_28=uint2(l9_27&65535u,l9_27>>16u);
out.sc_RayTracingNormalAndMore=uint4(l9_28.x,l9_28.y,out.sc_RayTracingNormalAndMore.z,out.sc_RayTracingNormalAndMore.w);
out.sc_RayTracingNormalAndMore.z=l9_21;
uint l9_29=uint(fast::clamp(l9_20,0.0,1.0)*1000.0);
l9_29 |= (((*sc_set0.UserUniforms).sc_RayTracingReceiverId%32u)<<10u);
out.sc_RayTracingNormalAndMore.w=l9_29;
}
else
{
}
float l9_30=0.0;
ssGlobals l9_31=param_1;
float l9_32=0.0;
float l9_33=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_32=l9_33;
l9_30=l9_32;
if ((l9_30*1.0)!=0.0)
{
float l9_34=0.0;
ssGlobals l9_35=l9_31;
float l9_36=0.0;
float l9_37=float((*sc_set0.UserUniforms).pbrOnOffId02!=0);
l9_36=l9_37;
l9_34=l9_36;
if ((l9_34*1.0)!=0.0)
{
float l9_38=0.0;
float l9_39=(*sc_set0.UserUniforms).rougnessId02;
l9_38=l9_39;
float l9_40=(*sc_set0.UserUniforms).Port_Opacity_N313;
float l9_41=l9_38;
ssGlobals l9_42=l9_35;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_42.BumpedNormal=l9_42.VertexNormal_WorldSpace;
}
float l9_43=l9_40;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_43<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_44=gl_FragCoord;
float2 l9_45=floor(mod(l9_44.xy,float2(4.0)));
float l9_46=(mod(dot(l9_45,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_43<l9_46)
{
discard_fragment();
}
}
float3 l9_47=l9_42.PositionWS;
float3 l9_48=l9_42.BumpedNormal;
float l9_49=l9_41;
float3 l9_50=l9_47;
float3 l9_51=l9_48;
float l9_52=l9_49;
uint l9_53=0u;
uint3 l9_54=uint3(round((l9_50-(*sc_set0.UserUniforms).sc_RayTracingOriginOffset)*(*sc_set0.UserUniforms).sc_RayTracingOriginScale));
out.sc_RayTracingPositionAndMask=uint4(l9_54.x,l9_54.y,l9_54.z,out.sc_RayTracingPositionAndMask.w);
out.sc_RayTracingPositionAndMask.w=(*sc_set0.UserUniforms).sc_RayTracingReceiverMask;
float3 l9_55=l9_51;
float l9_56=dot(abs(l9_55),float3(1.0));
l9_55/=float3(l9_56);
float2 l9_57=float2(fast::clamp(-l9_55.z,0.0,1.0));
float2 l9_58=l9_55.xy+mix(-l9_57,l9_57,step(float2(0.0),l9_55.xy));
uint l9_59=as_type<uint>(half2(l9_58));
uint2 l9_60=uint2(l9_59&65535u,l9_59>>16u);
out.sc_RayTracingNormalAndMore=uint4(l9_60.x,l9_60.y,out.sc_RayTracingNormalAndMore.z,out.sc_RayTracingNormalAndMore.w);
out.sc_RayTracingNormalAndMore.z=l9_53;
uint l9_61=uint(fast::clamp(l9_52,0.0,1.0)*1000.0);
l9_61 |= (((*sc_set0.UserUniforms).sc_RayTracingReceiverId%32u)<<10u);
out.sc_RayTracingNormalAndMore.w=l9_61;
}
else
{
}
float l9_62=0.0;
ssGlobals l9_63=l9_31;
float l9_64=0.0;
float l9_65=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
l9_64=l9_65;
l9_62=l9_64;
if ((l9_62*1.0)!=0.0)
{
float l9_66=0.0;
float l9_67=(*sc_set0.UserUniforms).rougnessId01;
l9_66=l9_67;
float l9_68=(*sc_set0.UserUniforms).Port_Opacity_N152;
float l9_69=l9_66;
ssGlobals l9_70=l9_63;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_70.BumpedNormal=l9_70.VertexNormal_WorldSpace;
}
float l9_71=l9_68;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_71<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_72=gl_FragCoord;
float2 l9_73=floor(mod(l9_72.xy,float2(4.0)));
float l9_74=(mod(dot(l9_73,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_71<l9_74)
{
discard_fragment();
}
}
float3 l9_75=l9_70.PositionWS;
float3 l9_76=l9_70.BumpedNormal;
float l9_77=l9_69;
float3 l9_78=l9_75;
float3 l9_79=l9_76;
float l9_80=l9_77;
uint l9_81=0u;
uint3 l9_82=uint3(round((l9_78-(*sc_set0.UserUniforms).sc_RayTracingOriginOffset)*(*sc_set0.UserUniforms).sc_RayTracingOriginScale));
out.sc_RayTracingPositionAndMask=uint4(l9_82.x,l9_82.y,l9_82.z,out.sc_RayTracingPositionAndMask.w);
out.sc_RayTracingPositionAndMask.w=(*sc_set0.UserUniforms).sc_RayTracingReceiverMask;
float3 l9_83=l9_79;
float l9_84=dot(abs(l9_83),float3(1.0));
l9_83/=float3(l9_84);
float2 l9_85=float2(fast::clamp(-l9_83.z,0.0,1.0));
float2 l9_86=l9_83.xy+mix(-l9_85,l9_85,step(float2(0.0),l9_83.xy));
uint l9_87=as_type<uint>(half2(l9_86));
uint2 l9_88=uint2(l9_87&65535u,l9_87>>16u);
out.sc_RayTracingNormalAndMore=uint4(l9_88.x,l9_88.y,out.sc_RayTracingNormalAndMore.z,out.sc_RayTracingNormalAndMore.w);
out.sc_RayTracingNormalAndMore.z=l9_81;
uint l9_89=uint(fast::clamp(l9_80,0.0,1.0)*1000.0);
l9_89 |= (((*sc_set0.UserUniforms).sc_RayTracingReceiverId%32u)<<10u);
out.sc_RayTracingNormalAndMore.w=l9_89;
}
else
{
}
}
else
{
float l9_90=0.0;
ssGlobals l9_91=l9_31;
float l9_92=0.0;
float l9_93=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
l9_92=l9_93;
l9_90=l9_92;
if ((l9_90*1.0)!=0.0)
{
float l9_94=0.0;
float l9_95=(*sc_set0.UserUniforms).rougnessId01;
l9_94=l9_95;
float l9_96=(*sc_set0.UserUniforms).Port_Opacity_N152;
float l9_97=l9_94;
ssGlobals l9_98=l9_91;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_98.BumpedNormal=l9_98.VertexNormal_WorldSpace;
}
float l9_99=l9_96;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_99<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_100=gl_FragCoord;
float2 l9_101=floor(mod(l9_100.xy,float2(4.0)));
float l9_102=(mod(dot(l9_101,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_99<l9_102)
{
discard_fragment();
}
}
float3 l9_103=l9_98.PositionWS;
float3 l9_104=l9_98.BumpedNormal;
float l9_105=l9_97;
float3 l9_106=l9_103;
float3 l9_107=l9_104;
float l9_108=l9_105;
uint l9_109=0u;
uint3 l9_110=uint3(round((l9_106-(*sc_set0.UserUniforms).sc_RayTracingOriginOffset)*(*sc_set0.UserUniforms).sc_RayTracingOriginScale));
out.sc_RayTracingPositionAndMask=uint4(l9_110.x,l9_110.y,l9_110.z,out.sc_RayTracingPositionAndMask.w);
out.sc_RayTracingPositionAndMask.w=(*sc_set0.UserUniforms).sc_RayTracingReceiverMask;
float3 l9_111=l9_107;
float l9_112=dot(abs(l9_111),float3(1.0));
l9_111/=float3(l9_112);
float2 l9_113=float2(fast::clamp(-l9_111.z,0.0,1.0));
float2 l9_114=l9_111.xy+mix(-l9_113,l9_113,step(float2(0.0),l9_111.xy));
uint l9_115=as_type<uint>(half2(l9_114));
uint2 l9_116=uint2(l9_115&65535u,l9_115>>16u);
out.sc_RayTracingNormalAndMore=uint4(l9_116.x,l9_116.y,out.sc_RayTracingNormalAndMore.z,out.sc_RayTracingNormalAndMore.w);
out.sc_RayTracingNormalAndMore.z=l9_109;
uint l9_117=uint(fast::clamp(l9_108,0.0,1.0)*1000.0);
l9_117 |= (((*sc_set0.UserUniforms).sc_RayTracingReceiverId%32u)<<10u);
out.sc_RayTracingNormalAndMore.w=l9_117;
}
else
{
}
}
}
else
{
float l9_118=0.0;
ssGlobals l9_119=param_1;
float l9_120=0.0;
float l9_121=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_120=l9_121;
l9_118=l9_120;
if ((l9_118*1.0)!=0.0)
{
float l9_122=0.0;
ssGlobals l9_123=l9_119;
float l9_124=0.0;
float l9_125=float((*sc_set0.UserUniforms).pbrOnOffId02!=0);
l9_124=l9_125;
l9_122=l9_124;
if ((l9_122*1.0)!=0.0)
{
float l9_126=0.0;
float l9_127=(*sc_set0.UserUniforms).rougnessId02;
l9_126=l9_127;
float l9_128=(*sc_set0.UserUniforms).Port_Opacity_N313;
float l9_129=l9_126;
ssGlobals l9_130=l9_123;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_130.BumpedNormal=l9_130.VertexNormal_WorldSpace;
}
float l9_131=l9_128;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_131<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_132=gl_FragCoord;
float2 l9_133=floor(mod(l9_132.xy,float2(4.0)));
float l9_134=(mod(dot(l9_133,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_131<l9_134)
{
discard_fragment();
}
}
float3 l9_135=l9_130.PositionWS;
float3 l9_136=l9_130.BumpedNormal;
float l9_137=l9_129;
float3 l9_138=l9_135;
float3 l9_139=l9_136;
float l9_140=l9_137;
uint l9_141=0u;
uint3 l9_142=uint3(round((l9_138-(*sc_set0.UserUniforms).sc_RayTracingOriginOffset)*(*sc_set0.UserUniforms).sc_RayTracingOriginScale));
out.sc_RayTracingPositionAndMask=uint4(l9_142.x,l9_142.y,l9_142.z,out.sc_RayTracingPositionAndMask.w);
out.sc_RayTracingPositionAndMask.w=(*sc_set0.UserUniforms).sc_RayTracingReceiverMask;
float3 l9_143=l9_139;
float l9_144=dot(abs(l9_143),float3(1.0));
l9_143/=float3(l9_144);
float2 l9_145=float2(fast::clamp(-l9_143.z,0.0,1.0));
float2 l9_146=l9_143.xy+mix(-l9_145,l9_145,step(float2(0.0),l9_143.xy));
uint l9_147=as_type<uint>(half2(l9_146));
uint2 l9_148=uint2(l9_147&65535u,l9_147>>16u);
out.sc_RayTracingNormalAndMore=uint4(l9_148.x,l9_148.y,out.sc_RayTracingNormalAndMore.z,out.sc_RayTracingNormalAndMore.w);
out.sc_RayTracingNormalAndMore.z=l9_141;
uint l9_149=uint(fast::clamp(l9_140,0.0,1.0)*1000.0);
l9_149 |= (((*sc_set0.UserUniforms).sc_RayTracingReceiverId%32u)<<10u);
out.sc_RayTracingNormalAndMore.w=l9_149;
}
else
{
}
float l9_150=0.0;
ssGlobals l9_151=l9_119;
float l9_152=0.0;
float l9_153=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
l9_152=l9_153;
l9_150=l9_152;
if ((l9_150*1.0)!=0.0)
{
float l9_154=0.0;
float l9_155=(*sc_set0.UserUniforms).rougnessId01;
l9_154=l9_155;
float l9_156=(*sc_set0.UserUniforms).Port_Opacity_N152;
float l9_157=l9_154;
ssGlobals l9_158=l9_151;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_158.BumpedNormal=l9_158.VertexNormal_WorldSpace;
}
float l9_159=l9_156;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_159<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_160=gl_FragCoord;
float2 l9_161=floor(mod(l9_160.xy,float2(4.0)));
float l9_162=(mod(dot(l9_161,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_159<l9_162)
{
discard_fragment();
}
}
float3 l9_163=l9_158.PositionWS;
float3 l9_164=l9_158.BumpedNormal;
float l9_165=l9_157;
float3 l9_166=l9_163;
float3 l9_167=l9_164;
float l9_168=l9_165;
uint l9_169=0u;
uint3 l9_170=uint3(round((l9_166-(*sc_set0.UserUniforms).sc_RayTracingOriginOffset)*(*sc_set0.UserUniforms).sc_RayTracingOriginScale));
out.sc_RayTracingPositionAndMask=uint4(l9_170.x,l9_170.y,l9_170.z,out.sc_RayTracingPositionAndMask.w);
out.sc_RayTracingPositionAndMask.w=(*sc_set0.UserUniforms).sc_RayTracingReceiverMask;
float3 l9_171=l9_167;
float l9_172=dot(abs(l9_171),float3(1.0));
l9_171/=float3(l9_172);
float2 l9_173=float2(fast::clamp(-l9_171.z,0.0,1.0));
float2 l9_174=l9_171.xy+mix(-l9_173,l9_173,step(float2(0.0),l9_171.xy));
uint l9_175=as_type<uint>(half2(l9_174));
uint2 l9_176=uint2(l9_175&65535u,l9_175>>16u);
out.sc_RayTracingNormalAndMore=uint4(l9_176.x,l9_176.y,out.sc_RayTracingNormalAndMore.z,out.sc_RayTracingNormalAndMore.w);
out.sc_RayTracingNormalAndMore.z=l9_169;
uint l9_177=uint(fast::clamp(l9_168,0.0,1.0)*1000.0);
l9_177 |= (((*sc_set0.UserUniforms).sc_RayTracingReceiverId%32u)<<10u);
out.sc_RayTracingNormalAndMore.w=l9_177;
}
else
{
}
}
else
{
float l9_178=0.0;
ssGlobals l9_179=l9_119;
float l9_180=0.0;
float l9_181=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
l9_180=l9_181;
l9_178=l9_180;
if ((l9_178*1.0)!=0.0)
{
float l9_182=0.0;
float l9_183=(*sc_set0.UserUniforms).rougnessId01;
l9_182=l9_183;
float l9_184=(*sc_set0.UserUniforms).Port_Opacity_N152;
float l9_185=l9_182;
ssGlobals l9_186=l9_179;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_186.BumpedNormal=l9_186.VertexNormal_WorldSpace;
}
float l9_187=l9_184;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_187<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_188=gl_FragCoord;
float2 l9_189=floor(mod(l9_188.xy,float2(4.0)));
float l9_190=(mod(dot(l9_189,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_187<l9_190)
{
discard_fragment();
}
}
float3 l9_191=l9_186.PositionWS;
float3 l9_192=l9_186.BumpedNormal;
float l9_193=l9_185;
float3 l9_194=l9_191;
float3 l9_195=l9_192;
float l9_196=l9_193;
uint l9_197=0u;
uint3 l9_198=uint3(round((l9_194-(*sc_set0.UserUniforms).sc_RayTracingOriginOffset)*(*sc_set0.UserUniforms).sc_RayTracingOriginScale));
out.sc_RayTracingPositionAndMask=uint4(l9_198.x,l9_198.y,l9_198.z,out.sc_RayTracingPositionAndMask.w);
out.sc_RayTracingPositionAndMask.w=(*sc_set0.UserUniforms).sc_RayTracingReceiverMask;
float3 l9_199=l9_195;
float l9_200=dot(abs(l9_199),float3(1.0));
l9_199/=float3(l9_200);
float2 l9_201=float2(fast::clamp(-l9_199.z,0.0,1.0));
float2 l9_202=l9_199.xy+mix(-l9_201,l9_201,step(float2(0.0),l9_199.xy));
uint l9_203=as_type<uint>(half2(l9_202));
uint2 l9_204=uint2(l9_203&65535u,l9_203>>16u);
out.sc_RayTracingNormalAndMore=uint4(l9_204.x,l9_204.y,out.sc_RayTracingNormalAndMore.z,out.sc_RayTracingNormalAndMore.w);
out.sc_RayTracingNormalAndMore.z=l9_197;
uint l9_205=uint(fast::clamp(l9_196,0.0,1.0)*1000.0);
l9_205 |= (((*sc_set0.UserUniforms).sc_RayTracingReceiverId%32u)<<10u);
out.sc_RayTracingNormalAndMore.w=l9_205;
}
else
{
}
}
}
return out;
}
} // RECEIVER MODE SHADER

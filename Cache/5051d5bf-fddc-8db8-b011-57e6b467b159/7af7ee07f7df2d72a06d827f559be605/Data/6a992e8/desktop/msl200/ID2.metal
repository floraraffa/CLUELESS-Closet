#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
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
//sampler sampler Tweak_N25SmpSC 0:29
//sampler sampler Tweak_N27SmpSC 0:30
//sampler sampler greyMaskIdSmpSC 0:31
//sampler sampler intensityTextureSmpSC 0:32
//sampler sampler patternTextureId01SmpSC 0:33
//sampler sampler patternTextureId02SmpSC 0:34
//sampler sampler sc_EnvmapDiffuseSmpSC 0:35
//sampler sampler sc_EnvmapSpecularSmpSC 0:36
//sampler sampler sc_RayTracingGlobalIlluminationSmpSC 0:38
//sampler sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC 0:39
//sampler sampler sc_RayTracingRayDirectionSmpSC 0:40
//sampler sampler sc_RayTracingReflectionsSmpSC 0:41
//sampler sampler sc_RayTracingShadowsSmpSC 0:42
//sampler sampler sc_SSAOTextureSmpSC 0:43
//sampler sampler sc_ScreenTextureSmpSC 0:44
//sampler sampler sc_ShadowTextureSmpSC 0:45
//texture texture2D Tweak_N25 0:4:0:29
//texture texture2D Tweak_N27 0:5:0:30
//texture texture2D greyMaskId 0:6:0:31
//texture texture2D intensityTexture 0:7:0:32
//texture texture2D patternTextureId01 0:8:0:33
//texture texture2D patternTextureId02 0:9:0:34
//texture texture2D sc_EnvmapDiffuse 0:10:0:35
//texture texture2D sc_EnvmapSpecular 0:11:0:36
//texture texture2D sc_RayTracingGlobalIllumination 0:20:0:38
//texture utexture2D sc_RayTracingHitCasterIdAndBarycentric 0:21:0:39
//texture texture2D sc_RayTracingRayDirection 0:22:0:40
//texture texture2D sc_RayTracingReflections 0:23:0:41
//texture texture2D sc_RayTracingShadows 0:24:0:42
//texture texture2D sc_SSAOTexture 0:25:0:43
//texture texture2D sc_ScreenTexture 0:26:0:44
//texture texture2D sc_ShadowTexture 0:27:0:45
//ubo float sc_BonesUBO 0:3:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:47:5952 {
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
//bool ColorOnOffid02 4896
//bool pbrOnOffId02 4900
//bool rimOnOffId02 4904
//float rimExpId02 4908
//float rimIntId02 4912
//bool patternOnOffId02 4916
//float4 patternColorId02 4928
//bool pngPatternId02 4944
//float3x3 patternTextureId02Transform 5008
//float4 patternTextureId02UvMinMax 5056
//float4 patternTextureId02BorderColor 5072
//float2 patternScaleId02 5088
//float2 patternOffsetId02 5096
//float patternRotateId02 5104
//float4 colorId02 5120
//float3x3 greyMaskIdTransform 5184
//float4 greyMaskIdUvMinMax 5232
//float4 greyMaskIdBorderColor 5248
//float metallicId02 5264
//float rougnessId02 5268
//bool pbrOnOffId01 5272
//bool rimOnOffId01 5276
//float rimExpId01 5280
//float rimIntId01 5284
//bool patternOnOffId01 5288
//float4 patternColorId01 5296
//bool pngPatternId01 5312
//float3x3 patternTextureId01Transform 5376
//float4 patternTextureId01UvMinMax 5424
//float4 patternTextureId01BorderColor 5440
//float2 patternScaleId01 5456
//float2 patternOffsetId01 5464
//float patternRotateId01 5472
//float4 colorId01 5488
//float metallicId01 5504
//float rougnessId01 5508
//float Tweak_N47 5512
//float3 Port_Import_N009 5520
//float4 Port_Input2_N015 5536
//float2 Port_Center_N282 5552
//float2 Port_Center_N286 5560
//float Port_Input1_N038 5568
//float Port_Input1_N035 5572
//float4 Port_Default_N338 5584
//float Port_Opacity_N313 5604
//float3 Port_Emissive_N313 5632
//float3 Port_AO_N313 5648
//float3 Port_SpecularAO_N313 5664
//float2 Port_Center_N122 5680
//float2 Port_Center_N126 5688
//float Port_Input1_N034 5696
//float Port_Opacity_N152 5704
//float3 Port_Emissive_N152 5728
//float3 Port_AO_N152 5744
//float3 Port_SpecularAO_N152 5760
//float4 Port_Input1_N051 5792
//float4 Port_Input2_N051 5808
//float4 Port_Input0_N102 5824
//float Port_Import_N060 5856
//float4 Port_Input1_N062 5872
//float Port_Import_N063 5888
//float Port_Import_N100 5892
//float4 Port_Input1_N070 5904
//float4 Port_Input2_N070 5920
//float depthRef 5936
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
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N25 37 0
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N27 38 0
//spec_const bool SC_USE_UV_MIN_MAX_greyMaskId 39 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 40 0
//spec_const bool SC_USE_UV_MIN_MAX_patternTextureId01 41 0
//spec_const bool SC_USE_UV_MIN_MAX_patternTextureId02 42 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N25 43 0
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N27 44 0
//spec_const bool SC_USE_UV_TRANSFORM_greyMaskId 45 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 46 0
//spec_const bool SC_USE_UV_TRANSFORM_patternTextureId01 47 0
//spec_const bool SC_USE_UV_TRANSFORM_patternTextureId02 48 0
//spec_const bool Tweak_N25HasSwappedViews 49 0
//spec_const bool Tweak_N27HasSwappedViews 50 0
//spec_const bool UseViewSpaceDepthVariant 51 1
//spec_const bool greyMaskIdHasSwappedViews 52 0
//spec_const bool intensityTextureHasSwappedViews 53 0
//spec_const bool patternTextureId01HasSwappedViews 54 0
//spec_const bool patternTextureId02HasSwappedViews 55 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 56 0
//spec_const bool sc_BlendMode_Add 57 0
//spec_const bool sc_BlendMode_AlphaTest 58 0
//spec_const bool sc_BlendMode_AlphaToCoverage 59 0
//spec_const bool sc_BlendMode_ColoredGlass 60 0
//spec_const bool sc_BlendMode_Custom 61 0
//spec_const bool sc_BlendMode_Max 62 0
//spec_const bool sc_BlendMode_Min 63 0
//spec_const bool sc_BlendMode_MultiplyOriginal 64 0
//spec_const bool sc_BlendMode_Multiply 65 0
//spec_const bool sc_BlendMode_Normal 66 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 67 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 68 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 69 0
//spec_const bool sc_BlendMode_Screen 70 0
//spec_const bool sc_DepthOnly 71 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 72 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 73 0
//spec_const bool sc_FramebufferFetch 74 0
//spec_const bool sc_HasDiffuseEnvmap 75 0
//spec_const bool sc_IsEditor 76 0
//spec_const bool sc_LightEstimation 77 0
//spec_const bool sc_MotionVectorsPass 78 0
//spec_const bool sc_OITCompositingPass 79 0
//spec_const bool sc_OITDepthBoundsPass 80 0
//spec_const bool sc_OITDepthGatherPass 81 0
//spec_const bool sc_OutputBounds 82 0
//spec_const bool sc_ProjectiveShadowsCaster 83 0
//spec_const bool sc_ProjectiveShadowsReceiver 84 0
//spec_const bool sc_RayTracingCasterForceOpaque 85 0
//spec_const bool sc_RayTracingGlobalIlluminationHasSwappedViews 86 0
//spec_const bool sc_RayTracingReflectionsHasSwappedViews 87 0
//spec_const bool sc_RayTracingShadowsHasSwappedViews 88 0
//spec_const bool sc_RenderAlphaToColor 89 0
//spec_const bool sc_SSAOEnabled 90 0
//spec_const bool sc_ScreenTextureHasSwappedViews 91 0
//spec_const bool sc_TAAEnabled 92 0
//spec_const bool sc_VertexBlendingUseNormals 93 0
//spec_const bool sc_VertexBlending 94 0
//spec_const bool sc_Voxelization 95 0
//spec_const int SC_DEVICE_CLASS 96 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N25 97 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N27 98 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_greyMaskId 99 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 100 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_patternTextureId01 101 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_patternTextureId02 102 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N25 103 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N27 104 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_greyMaskId 105 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 106 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_patternTextureId01 107 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_patternTextureId02 108 -1
//spec_const int Tweak_N25Layout 109 0
//spec_const int Tweak_N27Layout 110 0
//spec_const int greyMaskIdLayout 111 0
//spec_const int intensityTextureLayout 112 0
//spec_const int patternTextureId01Layout 113 0
//spec_const int patternTextureId02Layout 114 0
//spec_const int sc_AmbientLightMode0 115 0
//spec_const int sc_AmbientLightMode1 116 0
//spec_const int sc_AmbientLightMode2 117 0
//spec_const int sc_AmbientLightMode_Constant 118 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 119 0
//spec_const int sc_AmbientLightMode_FromCamera 120 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 121 0
//spec_const int sc_AmbientLightsCount 122 0
//spec_const int sc_DepthBufferMode 123 0
//spec_const int sc_DirectionalLightsCount 124 0
//spec_const int sc_EnvLightMode 125 0
//spec_const int sc_EnvmapDiffuseLayout 126 0
//spec_const int sc_EnvmapSpecularLayout 127 0
//spec_const int sc_LightEstimationSGCount 128 0
//spec_const int sc_PointLightsCount 129 0
//spec_const int sc_RayTracingGlobalIlluminationLayout 130 0
//spec_const int sc_RayTracingReflectionsLayout 131 0
//spec_const int sc_RayTracingShadowsLayout 132 0
//spec_const int sc_RenderingSpace 133 -1
//spec_const int sc_ScreenTextureLayout 134 0
//spec_const int sc_ShaderCacheConstant 135 0
//spec_const int sc_SkinBonesCount 136 0
//spec_const int sc_StereoRenderingMode 137 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 138 0
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
constant bool SC_USE_UV_MIN_MAX_Tweak_N25 [[function_constant(37)]];
constant bool SC_USE_UV_MIN_MAX_Tweak_N25_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_Tweak_N25) ? SC_USE_UV_MIN_MAX_Tweak_N25 : false;
constant bool SC_USE_UV_MIN_MAX_Tweak_N27 [[function_constant(38)]];
constant bool SC_USE_UV_MIN_MAX_Tweak_N27_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_Tweak_N27) ? SC_USE_UV_MIN_MAX_Tweak_N27 : false;
constant bool SC_USE_UV_MIN_MAX_greyMaskId [[function_constant(39)]];
constant bool SC_USE_UV_MIN_MAX_greyMaskId_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_greyMaskId) ? SC_USE_UV_MIN_MAX_greyMaskId : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(40)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_patternTextureId01 [[function_constant(41)]];
constant bool SC_USE_UV_MIN_MAX_patternTextureId01_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_patternTextureId01) ? SC_USE_UV_MIN_MAX_patternTextureId01 : false;
constant bool SC_USE_UV_MIN_MAX_patternTextureId02 [[function_constant(42)]];
constant bool SC_USE_UV_MIN_MAX_patternTextureId02_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_patternTextureId02) ? SC_USE_UV_MIN_MAX_patternTextureId02 : false;
constant bool SC_USE_UV_TRANSFORM_Tweak_N25 [[function_constant(43)]];
constant bool SC_USE_UV_TRANSFORM_Tweak_N25_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_Tweak_N25) ? SC_USE_UV_TRANSFORM_Tweak_N25 : false;
constant bool SC_USE_UV_TRANSFORM_Tweak_N27 [[function_constant(44)]];
constant bool SC_USE_UV_TRANSFORM_Tweak_N27_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_Tweak_N27) ? SC_USE_UV_TRANSFORM_Tweak_N27 : false;
constant bool SC_USE_UV_TRANSFORM_greyMaskId [[function_constant(45)]];
constant bool SC_USE_UV_TRANSFORM_greyMaskId_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_greyMaskId) ? SC_USE_UV_TRANSFORM_greyMaskId : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(46)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_patternTextureId01 [[function_constant(47)]];
constant bool SC_USE_UV_TRANSFORM_patternTextureId01_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_patternTextureId01) ? SC_USE_UV_TRANSFORM_patternTextureId01 : false;
constant bool SC_USE_UV_TRANSFORM_patternTextureId02 [[function_constant(48)]];
constant bool SC_USE_UV_TRANSFORM_patternTextureId02_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_patternTextureId02) ? SC_USE_UV_TRANSFORM_patternTextureId02 : false;
constant bool Tweak_N25HasSwappedViews [[function_constant(49)]];
constant bool Tweak_N25HasSwappedViews_tmp = is_function_constant_defined(Tweak_N25HasSwappedViews) ? Tweak_N25HasSwappedViews : false;
constant bool Tweak_N27HasSwappedViews [[function_constant(50)]];
constant bool Tweak_N27HasSwappedViews_tmp = is_function_constant_defined(Tweak_N27HasSwappedViews) ? Tweak_N27HasSwappedViews : false;
constant bool UseViewSpaceDepthVariant [[function_constant(51)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool greyMaskIdHasSwappedViews [[function_constant(52)]];
constant bool greyMaskIdHasSwappedViews_tmp = is_function_constant_defined(greyMaskIdHasSwappedViews) ? greyMaskIdHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(53)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool patternTextureId01HasSwappedViews [[function_constant(54)]];
constant bool patternTextureId01HasSwappedViews_tmp = is_function_constant_defined(patternTextureId01HasSwappedViews) ? patternTextureId01HasSwappedViews : false;
constant bool patternTextureId02HasSwappedViews [[function_constant(55)]];
constant bool patternTextureId02HasSwappedViews_tmp = is_function_constant_defined(patternTextureId02HasSwappedViews) ? patternTextureId02HasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(56)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(57)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(58)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(59)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(60)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(61)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(62)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(63)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(64)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(65)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(66)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(67)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(68)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(69)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(70)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(71)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(72)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(73)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(74)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(75)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_IsEditor [[function_constant(76)]];
constant bool sc_IsEditor_tmp = is_function_constant_defined(sc_IsEditor) ? sc_IsEditor : false;
constant bool sc_LightEstimation [[function_constant(77)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(78)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(79)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(80)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(81)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_OutputBounds [[function_constant(82)]];
constant bool sc_OutputBounds_tmp = is_function_constant_defined(sc_OutputBounds) ? sc_OutputBounds : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(83)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(84)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RayTracingCasterForceOpaque [[function_constant(85)]];
constant bool sc_RayTracingCasterForceOpaque_tmp = is_function_constant_defined(sc_RayTracingCasterForceOpaque) ? sc_RayTracingCasterForceOpaque : false;
constant bool sc_RayTracingGlobalIlluminationHasSwappedViews [[function_constant(86)]];
constant bool sc_RayTracingGlobalIlluminationHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingGlobalIlluminationHasSwappedViews) ? sc_RayTracingGlobalIlluminationHasSwappedViews : false;
constant bool sc_RayTracingReflectionsHasSwappedViews [[function_constant(87)]];
constant bool sc_RayTracingReflectionsHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingReflectionsHasSwappedViews) ? sc_RayTracingReflectionsHasSwappedViews : false;
constant bool sc_RayTracingShadowsHasSwappedViews [[function_constant(88)]];
constant bool sc_RayTracingShadowsHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingShadowsHasSwappedViews) ? sc_RayTracingShadowsHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(89)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(90)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(91)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_TAAEnabled [[function_constant(92)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(93)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(94)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool sc_Voxelization [[function_constant(95)]];
constant bool sc_Voxelization_tmp = is_function_constant_defined(sc_Voxelization) ? sc_Voxelization : false;
constant int SC_DEVICE_CLASS [[function_constant(96)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N25 [[function_constant(97)]];
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N25_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_Tweak_N25) ? SC_SOFTWARE_WRAP_MODE_U_Tweak_N25 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N27 [[function_constant(98)]];
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N27_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_Tweak_N27) ? SC_SOFTWARE_WRAP_MODE_U_Tweak_N27 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_greyMaskId [[function_constant(99)]];
constant int SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_greyMaskId) ? SC_SOFTWARE_WRAP_MODE_U_greyMaskId : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(100)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_patternTextureId01 [[function_constant(101)]];
constant int SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01) ? SC_SOFTWARE_WRAP_MODE_U_patternTextureId01 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_patternTextureId02 [[function_constant(102)]];
constant int SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02) ? SC_SOFTWARE_WRAP_MODE_U_patternTextureId02 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N25 [[function_constant(103)]];
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N25_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_Tweak_N25) ? SC_SOFTWARE_WRAP_MODE_V_Tweak_N25 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N27 [[function_constant(104)]];
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N27_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_Tweak_N27) ? SC_SOFTWARE_WRAP_MODE_V_Tweak_N27 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_greyMaskId [[function_constant(105)]];
constant int SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_greyMaskId) ? SC_SOFTWARE_WRAP_MODE_V_greyMaskId : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(106)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_patternTextureId01 [[function_constant(107)]];
constant int SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_patternTextureId01) ? SC_SOFTWARE_WRAP_MODE_V_patternTextureId01 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_patternTextureId02 [[function_constant(108)]];
constant int SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_patternTextureId02) ? SC_SOFTWARE_WRAP_MODE_V_patternTextureId02 : -1;
constant int Tweak_N25Layout [[function_constant(109)]];
constant int Tweak_N25Layout_tmp = is_function_constant_defined(Tweak_N25Layout) ? Tweak_N25Layout : 0;
constant int Tweak_N27Layout [[function_constant(110)]];
constant int Tweak_N27Layout_tmp = is_function_constant_defined(Tweak_N27Layout) ? Tweak_N27Layout : 0;
constant int greyMaskIdLayout [[function_constant(111)]];
constant int greyMaskIdLayout_tmp = is_function_constant_defined(greyMaskIdLayout) ? greyMaskIdLayout : 0;
constant int intensityTextureLayout [[function_constant(112)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int patternTextureId01Layout [[function_constant(113)]];
constant int patternTextureId01Layout_tmp = is_function_constant_defined(patternTextureId01Layout) ? patternTextureId01Layout : 0;
constant int patternTextureId02Layout [[function_constant(114)]];
constant int patternTextureId02Layout_tmp = is_function_constant_defined(patternTextureId02Layout) ? patternTextureId02Layout : 0;
constant int sc_AmbientLightMode0 [[function_constant(115)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(116)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(117)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(118)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(119)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(120)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(121)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(122)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(123)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(124)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(125)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(126)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(127)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(128)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_PointLightsCount [[function_constant(129)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracingGlobalIlluminationLayout [[function_constant(130)]];
constant int sc_RayTracingGlobalIlluminationLayout_tmp = is_function_constant_defined(sc_RayTracingGlobalIlluminationLayout) ? sc_RayTracingGlobalIlluminationLayout : 0;
constant int sc_RayTracingReflectionsLayout [[function_constant(131)]];
constant int sc_RayTracingReflectionsLayout_tmp = is_function_constant_defined(sc_RayTracingReflectionsLayout) ? sc_RayTracingReflectionsLayout : 0;
constant int sc_RayTracingShadowsLayout [[function_constant(132)]];
constant int sc_RayTracingShadowsLayout_tmp = is_function_constant_defined(sc_RayTracingShadowsLayout) ? sc_RayTracingShadowsLayout : 0;
constant int sc_RenderingSpace [[function_constant(133)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(134)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(135)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(136)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(137)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(138)]];
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
float4 greyMaskIdSize;
float4 greyMaskIdDims;
float4 greyMaskIdView;
float3x3 greyMaskIdTransform;
float4 greyMaskIdUvMinMax;
float4 greyMaskIdBorderColor;
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
float Port_Import_N007;
float3 Port_Import_N009;
float4 Port_Input2_N015;
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
texture2d<float> sc_EnvmapDiffuse [[id(10)]];
texture2d<float> sc_EnvmapSpecular [[id(11)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(20)]];
texture2d<uint> sc_RayTracingHitCasterIdAndBarycentric [[id(21)]];
texture2d<float> sc_RayTracingRayDirection [[id(22)]];
texture2d<float> sc_RayTracingReflections [[id(23)]];
texture2d<float> sc_RayTracingShadows [[id(24)]];
texture2d<float> sc_SSAOTexture [[id(25)]];
texture2d<float> sc_ScreenTexture [[id(26)]];
texture2d<float> sc_ShadowTexture [[id(27)]];
sampler Tweak_N25SmpSC [[id(29)]];
sampler Tweak_N27SmpSC [[id(30)]];
sampler greyMaskIdSmpSC [[id(31)]];
sampler intensityTextureSmpSC [[id(32)]];
sampler patternTextureId01SmpSC [[id(33)]];
sampler patternTextureId02SmpSC [[id(34)]];
sampler sc_EnvmapDiffuseSmpSC [[id(35)]];
sampler sc_EnvmapSpecularSmpSC [[id(36)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(38)]];
sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC [[id(39)]];
sampler sc_RayTracingRayDirectionSmpSC [[id(40)]];
sampler sc_RayTracingReflectionsSmpSC [[id(41)]];
sampler sc_RayTracingShadowsSmpSC [[id(42)]];
sampler sc_SSAOTextureSmpSC [[id(43)]];
sampler sc_ScreenTextureSmpSC [[id(44)]];
sampler sc_ShadowTextureSmpSC [[id(45)]];
constant userUniformsObj* UserUniforms [[id(47)]];
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
float4 greyMaskIdSize;
float4 greyMaskIdDims;
float4 greyMaskIdView;
float3x3 greyMaskIdTransform;
float4 greyMaskIdUvMinMax;
float4 greyMaskIdBorderColor;
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
float Port_Import_N007;
float3 Port_Import_N009;
float4 Port_Input2_N015;
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
texture2d<float> sc_EnvmapDiffuse [[id(10)]];
texture2d<float> sc_EnvmapSpecular [[id(11)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(20)]];
texture2d<uint> sc_RayTracingHitCasterIdAndBarycentric [[id(21)]];
texture2d<float> sc_RayTracingRayDirection [[id(22)]];
texture2d<float> sc_RayTracingReflections [[id(23)]];
texture2d<float> sc_RayTracingShadows [[id(24)]];
texture2d<float> sc_SSAOTexture [[id(25)]];
texture2d<float> sc_ScreenTexture [[id(26)]];
texture2d<float> sc_ShadowTexture [[id(27)]];
sampler Tweak_N25SmpSC [[id(29)]];
sampler Tweak_N27SmpSC [[id(30)]];
sampler greyMaskIdSmpSC [[id(31)]];
sampler intensityTextureSmpSC [[id(32)]];
sampler patternTextureId01SmpSC [[id(33)]];
sampler patternTextureId02SmpSC [[id(34)]];
sampler sc_EnvmapDiffuseSmpSC [[id(35)]];
sampler sc_EnvmapSpecularSmpSC [[id(36)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(38)]];
sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC [[id(39)]];
sampler sc_RayTracingRayDirectionSmpSC [[id(40)]];
sampler sc_RayTracingReflectionsSmpSC [[id(41)]];
sampler sc_RayTracingShadowsSmpSC [[id(42)]];
sampler sc_SSAOTextureSmpSC [[id(43)]];
sampler sc_ScreenTextureSmpSC [[id(44)]];
sampler sc_ShadowTextureSmpSC [[id(45)]];
constant userUniformsObj* UserUniforms [[id(47)]];
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
int N11_NormalSpace=0;
float3 N11_Normal=float3(0.0);
float2 N11_ReflectionUV=float2(0.0);
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
float Value_N7=0.0;
Value_N7=Output_N16;
float Value_N10=0.0;
Value_N10=1.0;
float3 Value_N9=float3(0.0);
Value_N9=(*sc_set0.UserUniforms).Port_Import_N009;
float2 ReflectionUV_N11=float2(0.0);
float param_2=Value_N10;
float3 param_3=Value_N9;
ssGlobals param_5=Globals;
ssGlobals tempGlobals=param_5;
float2 param_4=float2(0.0);
N11_NormalSpace=int(param_2);
N11_Normal=param_3;
float3 l9_1=N11_Normal;
if (N11_NormalSpace==1)
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
N11_ReflectionUV=(l9_1.xy*0.5)+float2(0.5);
param_4=N11_ReflectionUV;
ReflectionUV_N11=param_4;
float4 Color_N12=float4(0.0);
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
float2 param_8=ReflectionUV_N11;
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
Color_N12=l9_89;
float4 Output_N13=float4(0.0);
Output_N13=float4(Value_N7)*Color_N12;
float4 Export_N14=float4(0.0);
Export_N14=Output_N13;
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
float4 Output_N15=float4(0.0);
Output_N15=(Export_N14*Output_N52)*(*sc_set0.UserUniforms).Port_Input2_N015;
float4 Result_N184=float4(0.0);
float param_28=0.0;
float4 param_29=float4(0.0);
float4 param_30=float4(0.0);
ssGlobals param_32=Globals;
float l9_165=0.0;
float l9_166=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
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
float l9_173=float((*sc_set0.UserUniforms).pbrOnOffId02!=0);
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
float l9_181=float((*sc_set0.UserUniforms).rimOnOffId02!=0);
l9_180=l9_181;
l9_176=l9_180;
float4 l9_182;
if ((l9_176*1.0)!=0.0)
{
float l9_183=0.0;
float l9_184=(*sc_set0.UserUniforms).rimExpId02;
l9_183=l9_184;
float l9_185=0.0;
float l9_186=(*sc_set0.UserUniforms).rimIntId02;
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
float l9_199=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_198=l9_199;
l9_194=l9_198;
float4 l9_200;
if ((l9_194*1.0)!=0.0)
{
float4 l9_201=float4(0.0);
float4 l9_202=(*sc_set0.UserUniforms).patternColorId02;
l9_201=l9_202;
float4 l9_203=float4(0.0);
float l9_204=0.0;
float4 l9_205=float4(0.0);
float4 l9_206=float4(0.0);
ssGlobals l9_207=l9_197;
float l9_208=0.0;
float l9_209=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_208=l9_209;
l9_204=l9_208;
float4 l9_210;
if ((l9_204*1.0)!=0.0)
{
float2 l9_211=float2(0.0);
l9_211=l9_207.Surface_UVCoord0;
float2 l9_212=float2(0.0);
float2 l9_213=(*sc_set0.UserUniforms).patternScaleId02;
l9_212=l9_213;
float2 l9_214=float2(0.0);
l9_214=((l9_211-(*sc_set0.UserUniforms).Port_Center_N282)*l9_212)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_215=float2(0.0);
float2 l9_216=(*sc_set0.UserUniforms).patternOffsetId02;
l9_215=l9_216;
float2 l9_217=float2(0.0);
l9_217=l9_214+l9_215;
float l9_218=0.0;
float l9_219=(*sc_set0.UserUniforms).patternRotateId02;
l9_218=l9_219;
float2 l9_220=float2(0.0);
float2 l9_221=l9_217;
float l9_222=l9_218;
float2 l9_223=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_224=sin(radians(l9_222));
float l9_225=cos(radians(l9_222));
float2 l9_226=l9_221-l9_223;
l9_226=float2(dot(float2(l9_225,l9_224),l9_226),dot(float2(-l9_224,l9_225),l9_226))+l9_223;
l9_220=l9_226;
float4 l9_227=float4(0.0);
int l9_228;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
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
int l9_234=patternTextureId02Layout_tmp;
int l9_235=l9_233;
float2 l9_236=l9_220;
bool l9_237=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_238=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_241=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_243=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
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
float4 l9_311=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_310.xy,bias(l9_304));
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
float2 l9_316=(*sc_set0.UserUniforms).patternScaleId02;
l9_315=l9_316;
float2 l9_317=float2(0.0);
l9_317=((l9_314-(*sc_set0.UserUniforms).Port_Center_N282)*l9_315)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_318=float2(0.0);
float2 l9_319=(*sc_set0.UserUniforms).patternOffsetId02;
l9_318=l9_319;
float2 l9_320=float2(0.0);
l9_320=l9_317+l9_318;
float l9_321=0.0;
float l9_322=(*sc_set0.UserUniforms).patternRotateId02;
l9_321=l9_322;
float2 l9_323=float2(0.0);
float2 l9_324=l9_320;
float l9_325=l9_321;
float2 l9_326=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_327=sin(radians(l9_325));
float l9_328=cos(radians(l9_325));
float2 l9_329=l9_324-l9_326;
l9_329=float2(dot(float2(l9_328,l9_327),l9_329),dot(float2(-l9_327,l9_328),l9_329))+l9_326;
l9_323=l9_329;
float4 l9_330=float4(0.0);
int l9_331;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
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
int l9_337=patternTextureId02Layout_tmp;
int l9_338=l9_336;
float2 l9_339=l9_323;
bool l9_340=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_341=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_342=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_343=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_344=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_345=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_346=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
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
float4 l9_414=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_413.xy,bias(l9_407));
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
float4 l9_422=(*sc_set0.UserUniforms).colorId02;
l9_421=l9_422;
float4 l9_423=float4(0.0);
float l9_424=0.0;
float4 l9_425=float4(0.0);
float4 l9_426=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_427=l9_197;
float l9_428=0.0;
float l9_429=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
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
l9_520=step(l9_519,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_521=0.0;
l9_521=step(l9_519,(*sc_set0.UserUniforms).Port_Input1_N035);
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
float4 l9_527=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_528=l9_179;
float l9_529=0.0;
float l9_530=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
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
l9_621=step(l9_620,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_622=0.0;
l9_622=step(l9_620,(*sc_set0.UserUniforms).Port_Input1_N035);
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
float4 l9_626=(*sc_set0.UserUniforms).colorId02;
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
float l9_643=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_642=l9_643;
l9_638=l9_642;
float4 l9_644;
if ((l9_638*1.0)!=0.0)
{
float4 l9_645=float4(0.0);
float4 l9_646=(*sc_set0.UserUniforms).patternColorId02;
l9_645=l9_646;
float4 l9_647=float4(0.0);
float l9_648=0.0;
float4 l9_649=float4(0.0);
float4 l9_650=float4(0.0);
ssGlobals l9_651=l9_641;
float l9_652=0.0;
float l9_653=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_652=l9_653;
l9_648=l9_652;
float4 l9_654;
if ((l9_648*1.0)!=0.0)
{
float2 l9_655=float2(0.0);
l9_655=l9_651.Surface_UVCoord0;
float2 l9_656=float2(0.0);
float2 l9_657=(*sc_set0.UserUniforms).patternScaleId02;
l9_656=l9_657;
float2 l9_658=float2(0.0);
l9_658=((l9_655-(*sc_set0.UserUniforms).Port_Center_N282)*l9_656)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_659=float2(0.0);
float2 l9_660=(*sc_set0.UserUniforms).patternOffsetId02;
l9_659=l9_660;
float2 l9_661=float2(0.0);
l9_661=l9_658+l9_659;
float l9_662=0.0;
float l9_663=(*sc_set0.UserUniforms).patternRotateId02;
l9_662=l9_663;
float2 l9_664=float2(0.0);
float2 l9_665=l9_661;
float l9_666=l9_662;
float2 l9_667=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_668=sin(radians(l9_666));
float l9_669=cos(radians(l9_666));
float2 l9_670=l9_665-l9_667;
l9_670=float2(dot(float2(l9_669,l9_668),l9_670),dot(float2(-l9_668,l9_669),l9_670))+l9_667;
l9_664=l9_670;
float4 l9_671=float4(0.0);
int l9_672;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
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
int l9_678=patternTextureId02Layout_tmp;
int l9_679=l9_677;
float2 l9_680=l9_664;
bool l9_681=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_682=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_683=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_684=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_685=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_686=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_687=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
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
float4 l9_755=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_754.xy,bias(l9_748));
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
float2 l9_760=(*sc_set0.UserUniforms).patternScaleId02;
l9_759=l9_760;
float2 l9_761=float2(0.0);
l9_761=((l9_758-(*sc_set0.UserUniforms).Port_Center_N282)*l9_759)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_762=float2(0.0);
float2 l9_763=(*sc_set0.UserUniforms).patternOffsetId02;
l9_762=l9_763;
float2 l9_764=float2(0.0);
l9_764=l9_761+l9_762;
float l9_765=0.0;
float l9_766=(*sc_set0.UserUniforms).patternRotateId02;
l9_765=l9_766;
float2 l9_767=float2(0.0);
float2 l9_768=l9_764;
float l9_769=l9_765;
float2 l9_770=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_771=sin(radians(l9_769));
float l9_772=cos(radians(l9_769));
float2 l9_773=l9_768-l9_770;
l9_773=float2(dot(float2(l9_772,l9_771),l9_773),dot(float2(-l9_771,l9_772),l9_773))+l9_770;
l9_767=l9_773;
float4 l9_774=float4(0.0);
int l9_775;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
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
int l9_781=patternTextureId02Layout_tmp;
int l9_782=l9_780;
float2 l9_783=l9_767;
bool l9_784=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_785=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_786=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_787=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_788=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_789=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_790=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
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
float4 l9_858=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_857.xy,bias(l9_851));
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
float4 l9_866=(*sc_set0.UserUniforms).colorId02;
l9_865=l9_866;
float4 l9_867=float4(0.0);
float l9_868=0.0;
float4 l9_869=float4(0.0);
float4 l9_870=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_871=l9_641;
float l9_872=0.0;
float l9_873=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
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
l9_964=step(l9_963,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_965=0.0;
l9_965=step(l9_963,(*sc_set0.UserUniforms).Port_Input1_N035);
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
float4 l9_971=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_972=l9_179;
float l9_973=0.0;
float l9_974=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
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
l9_1065=step(l9_1064,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_1066=0.0;
l9_1066=step(l9_1064,(*sc_set0.UserUniforms).Port_Input1_N035);
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
float4 l9_1070=(*sc_set0.UserUniforms).colorId02;
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
float l9_1080=(*sc_set0.UserUniforms).metallicId02;
l9_1079=l9_1080;
float l9_1081=0.0;
float l9_1082=(*sc_set0.UserUniforms).rougnessId02;
l9_1081=l9_1082;
float4 l9_1083=float4(0.0);
float3 l9_1084=l9_175.xyz;
float l9_1085=(*sc_set0.UserUniforms).Port_Opacity_N313;
float3 l9_1086=(*sc_set0.UserUniforms).Port_Emissive_N313;
float l9_1087=l9_1079;
float l9_1088=l9_1081;
float3 l9_1089=(*sc_set0.UserUniforms).Port_AO_N313;
float3 l9_1090=(*sc_set0.UserUniforms).Port_SpecularAO_N313;
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
float l9_1113=float((*sc_set0.UserUniforms).rimOnOffId02!=0);
l9_1112=l9_1113;
l9_1108=l9_1112;
float4 l9_1114;
if ((l9_1108*1.0)!=0.0)
{
float l9_1115=0.0;
float l9_1116=(*sc_set0.UserUniforms).rimExpId02;
l9_1115=l9_1116;
float l9_1117=0.0;
float l9_1118=(*sc_set0.UserUniforms).rimIntId02;
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
float l9_1131=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_1130=l9_1131;
l9_1126=l9_1130;
float4 l9_1132;
if ((l9_1126*1.0)!=0.0)
{
float4 l9_1133=float4(0.0);
float4 l9_1134=(*sc_set0.UserUniforms).patternColorId02;
l9_1133=l9_1134;
float4 l9_1135=float4(0.0);
float l9_1136=0.0;
float4 l9_1137=float4(0.0);
float4 l9_1138=float4(0.0);
ssGlobals l9_1139=l9_1129;
float l9_1140=0.0;
float l9_1141=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_1140=l9_1141;
l9_1136=l9_1140;
float4 l9_1142;
if ((l9_1136*1.0)!=0.0)
{
float2 l9_1143=float2(0.0);
l9_1143=l9_1139.Surface_UVCoord0;
float2 l9_1144=float2(0.0);
float2 l9_1145=(*sc_set0.UserUniforms).patternScaleId02;
l9_1144=l9_1145;
float2 l9_1146=float2(0.0);
l9_1146=((l9_1143-(*sc_set0.UserUniforms).Port_Center_N282)*l9_1144)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_1147=float2(0.0);
float2 l9_1148=(*sc_set0.UserUniforms).patternOffsetId02;
l9_1147=l9_1148;
float2 l9_1149=float2(0.0);
l9_1149=l9_1146+l9_1147;
float l9_1150=0.0;
float l9_1151=(*sc_set0.UserUniforms).patternRotateId02;
l9_1150=l9_1151;
float2 l9_1152=float2(0.0);
float2 l9_1153=l9_1149;
float l9_1154=l9_1150;
float2 l9_1155=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_1156=sin(radians(l9_1154));
float l9_1157=cos(radians(l9_1154));
float2 l9_1158=l9_1153-l9_1155;
l9_1158=float2(dot(float2(l9_1157,l9_1156),l9_1158),dot(float2(-l9_1156,l9_1157),l9_1158))+l9_1155;
l9_1152=l9_1158;
float4 l9_1159=float4(0.0);
int l9_1160;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
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
int l9_1166=patternTextureId02Layout_tmp;
int l9_1167=l9_1165;
float2 l9_1168=l9_1152;
bool l9_1169=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_1170=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_1171=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_1172=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_1173=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_1174=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_1175=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
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
float4 l9_1243=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_1242.xy,bias(l9_1236));
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
float2 l9_1248=(*sc_set0.UserUniforms).patternScaleId02;
l9_1247=l9_1248;
float2 l9_1249=float2(0.0);
l9_1249=((l9_1246-(*sc_set0.UserUniforms).Port_Center_N282)*l9_1247)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_1250=float2(0.0);
float2 l9_1251=(*sc_set0.UserUniforms).patternOffsetId02;
l9_1250=l9_1251;
float2 l9_1252=float2(0.0);
l9_1252=l9_1249+l9_1250;
float l9_1253=0.0;
float l9_1254=(*sc_set0.UserUniforms).patternRotateId02;
l9_1253=l9_1254;
float2 l9_1255=float2(0.0);
float2 l9_1256=l9_1252;
float l9_1257=l9_1253;
float2 l9_1258=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_1259=sin(radians(l9_1257));
float l9_1260=cos(radians(l9_1257));
float2 l9_1261=l9_1256-l9_1258;
l9_1261=float2(dot(float2(l9_1260,l9_1259),l9_1261),dot(float2(-l9_1259,l9_1260),l9_1261))+l9_1258;
l9_1255=l9_1261;
float4 l9_1262=float4(0.0);
int l9_1263;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
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
int l9_1269=patternTextureId02Layout_tmp;
int l9_1270=l9_1268;
float2 l9_1271=l9_1255;
bool l9_1272=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_1273=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_1274=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_1275=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_1276=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_1277=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_1278=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
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
float4 l9_1346=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_1345.xy,bias(l9_1339));
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
float4 l9_1354=(*sc_set0.UserUniforms).colorId02;
l9_1353=l9_1354;
float4 l9_1355=float4(0.0);
float l9_1356=0.0;
float4 l9_1357=float4(0.0);
float4 l9_1358=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_1359=l9_1129;
float l9_1360=0.0;
float l9_1361=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
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
l9_1452=step(l9_1451,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_1453=0.0;
l9_1453=step(l9_1451,(*sc_set0.UserUniforms).Port_Input1_N035);
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
float4 l9_1459=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_1460=l9_1111;
float l9_1461=0.0;
float l9_1462=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
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
l9_1553=step(l9_1552,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_1554=0.0;
l9_1554=step(l9_1552,(*sc_set0.UserUniforms).Port_Input1_N035);
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
float4 l9_1558=(*sc_set0.UserUniforms).colorId02;
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
float l9_1575=float((*sc_set0.UserUniforms).patternOnOffId02!=0);
l9_1574=l9_1575;
l9_1570=l9_1574;
float4 l9_1576;
if ((l9_1570*1.0)!=0.0)
{
float4 l9_1577=float4(0.0);
float4 l9_1578=(*sc_set0.UserUniforms).patternColorId02;
l9_1577=l9_1578;
float4 l9_1579=float4(0.0);
float l9_1580=0.0;
float4 l9_1581=float4(0.0);
float4 l9_1582=float4(0.0);
ssGlobals l9_1583=l9_1573;
float l9_1584=0.0;
float l9_1585=float((*sc_set0.UserUniforms).pngPatternId02!=0);
l9_1584=l9_1585;
l9_1580=l9_1584;
float4 l9_1586;
if ((l9_1580*1.0)!=0.0)
{
float2 l9_1587=float2(0.0);
l9_1587=l9_1583.Surface_UVCoord0;
float2 l9_1588=float2(0.0);
float2 l9_1589=(*sc_set0.UserUniforms).patternScaleId02;
l9_1588=l9_1589;
float2 l9_1590=float2(0.0);
l9_1590=((l9_1587-(*sc_set0.UserUniforms).Port_Center_N282)*l9_1588)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_1591=float2(0.0);
float2 l9_1592=(*sc_set0.UserUniforms).patternOffsetId02;
l9_1591=l9_1592;
float2 l9_1593=float2(0.0);
l9_1593=l9_1590+l9_1591;
float l9_1594=0.0;
float l9_1595=(*sc_set0.UserUniforms).patternRotateId02;
l9_1594=l9_1595;
float2 l9_1596=float2(0.0);
float2 l9_1597=l9_1593;
float l9_1598=l9_1594;
float2 l9_1599=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_1600=sin(radians(l9_1598));
float l9_1601=cos(radians(l9_1598));
float2 l9_1602=l9_1597-l9_1599;
l9_1602=float2(dot(float2(l9_1601,l9_1600),l9_1602),dot(float2(-l9_1600,l9_1601),l9_1602))+l9_1599;
l9_1596=l9_1602;
float4 l9_1603=float4(0.0);
int l9_1604;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
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
int l9_1610=patternTextureId02Layout_tmp;
int l9_1611=l9_1609;
float2 l9_1612=l9_1596;
bool l9_1613=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_1614=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_1615=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_1616=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_1617=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_1618=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_1619=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
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
float4 l9_1687=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_1686.xy,bias(l9_1680));
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
float2 l9_1692=(*sc_set0.UserUniforms).patternScaleId02;
l9_1691=l9_1692;
float2 l9_1693=float2(0.0);
l9_1693=((l9_1690-(*sc_set0.UserUniforms).Port_Center_N282)*l9_1691)+(*sc_set0.UserUniforms).Port_Center_N282;
float2 l9_1694=float2(0.0);
float2 l9_1695=(*sc_set0.UserUniforms).patternOffsetId02;
l9_1694=l9_1695;
float2 l9_1696=float2(0.0);
l9_1696=l9_1693+l9_1694;
float l9_1697=0.0;
float l9_1698=(*sc_set0.UserUniforms).patternRotateId02;
l9_1697=l9_1698;
float2 l9_1699=float2(0.0);
float2 l9_1700=l9_1696;
float l9_1701=l9_1697;
float2 l9_1702=(*sc_set0.UserUniforms).Port_Center_N286;
float l9_1703=sin(radians(l9_1701));
float l9_1704=cos(radians(l9_1701));
float2 l9_1705=l9_1700-l9_1702;
l9_1705=float2(dot(float2(l9_1704,l9_1703),l9_1705),dot(float2(-l9_1703,l9_1704),l9_1705))+l9_1702;
l9_1699=l9_1705;
float4 l9_1706=float4(0.0);
int l9_1707;
if ((int(patternTextureId02HasSwappedViews_tmp)!=0))
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
int l9_1713=patternTextureId02Layout_tmp;
int l9_1714=l9_1712;
float2 l9_1715=l9_1699;
bool l9_1716=(int(SC_USE_UV_TRANSFORM_patternTextureId02_tmp)!=0);
float3x3 l9_1717=(*sc_set0.UserUniforms).patternTextureId02Transform;
int2 l9_1718=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId02_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId02_tmp);
bool l9_1719=(int(SC_USE_UV_MIN_MAX_patternTextureId02_tmp)!=0);
float4 l9_1720=(*sc_set0.UserUniforms).patternTextureId02UvMinMax;
bool l9_1721=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId02_tmp)!=0);
float4 l9_1722=(*sc_set0.UserUniforms).patternTextureId02BorderColor;
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
float4 l9_1790=sc_set0.patternTextureId02.sample(sc_set0.patternTextureId02SmpSC,l9_1789.xy,bias(l9_1783));
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
float4 l9_1798=(*sc_set0.UserUniforms).colorId02;
l9_1797=l9_1798;
float4 l9_1799=float4(0.0);
float l9_1800=0.0;
float4 l9_1801=float4(0.0);
float4 l9_1802=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_1803=l9_1573;
float l9_1804=0.0;
float l9_1805=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
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
l9_1896=step(l9_1895,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_1897=0.0;
l9_1897=step(l9_1895,(*sc_set0.UserUniforms).Port_Input1_N035);
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
float4 l9_1903=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_1904=l9_1111;
float l9_1905=0.0;
float l9_1906=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
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
l9_1997=step(l9_1996,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_1998=0.0;
l9_1998=step(l9_1996,(*sc_set0.UserUniforms).Port_Input1_N035);
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
float4 l9_2002=(*sc_set0.UserUniforms).colorId02;
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
float4 l9_2014=(*sc_set0.UserUniforms).Port_Default_N338;
ssGlobals l9_2015=param_32;
float l9_2016=0.0;
float l9_2017=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
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
l9_2108=step(l9_2107,(*sc_set0.UserUniforms).Port_Input1_N038);
float l9_2109=0.0;
l9_2109=step(l9_2107,(*sc_set0.UserUniforms).Port_Input1_N035);
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
float l9_2118=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
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
float l9_2126=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_2125=l9_2126;
l9_2121=l9_2125;
float4 l9_2127;
if ((l9_2121*1.0)!=0.0)
{
float l9_2128=0.0;
float l9_2129=(*sc_set0.UserUniforms).rimExpId01;
l9_2128=l9_2129;
float l9_2130=0.0;
float l9_2131=(*sc_set0.UserUniforms).rimIntId01;
l9_2130=l9_2131;
float l9_2132=0.0;
float l9_2133=l9_2128;
float l9_2134=l9_2130;
ssGlobals l9_2135=l9_2124;
float l9_2136=abs(dot(-l9_2135.ViewDirWS,l9_2135.VertexNormal_WorldSpace));
float l9_2137=1.0-pow(1.0-l9_2136,l9_2133);
l9_2137=fast::max(l9_2137,0.0);
l9_2137*=l9_2134;
l9_2132=l9_2137;
float4 l9_2138=float4(0.0);
float l9_2139=0.0;
float4 l9_2140=float4(0.0);
float4 l9_2141=float4(0.0);
ssGlobals l9_2142=l9_2124;
float l9_2143=0.0;
float l9_2144=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_2143=l9_2144;
l9_2139=l9_2143;
float4 l9_2145;
if ((l9_2139*1.0)!=0.0)
{
float4 l9_2146=float4(0.0);
float4 l9_2147=(*sc_set0.UserUniforms).patternColorId01;
l9_2146=l9_2147;
float4 l9_2148=float4(0.0);
float l9_2149=0.0;
float4 l9_2150=float4(0.0);
float4 l9_2151=float4(0.0);
ssGlobals l9_2152=l9_2142;
float l9_2153=0.0;
float l9_2154=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_2153=l9_2154;
l9_2149=l9_2153;
float4 l9_2155;
if ((l9_2149*1.0)!=0.0)
{
float2 l9_2156=float2(0.0);
l9_2156=l9_2152.Surface_UVCoord0;
float2 l9_2157=float2(0.0);
float2 l9_2158=(*sc_set0.UserUniforms).patternScaleId01;
l9_2157=l9_2158;
float2 l9_2159=float2(0.0);
l9_2159=((l9_2156-(*sc_set0.UserUniforms).Port_Center_N122)*l9_2157)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_2160=float2(0.0);
float2 l9_2161=(*sc_set0.UserUniforms).patternOffsetId01;
l9_2160=l9_2161;
float2 l9_2162=float2(0.0);
l9_2162=l9_2159+l9_2160;
float l9_2163=0.0;
float l9_2164=(*sc_set0.UserUniforms).patternRotateId01;
l9_2163=l9_2164;
float2 l9_2165=float2(0.0);
float2 l9_2166=l9_2162;
float l9_2167=l9_2163;
float2 l9_2168=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_2169=sin(radians(l9_2167));
float l9_2170=cos(radians(l9_2167));
float2 l9_2171=l9_2166-l9_2168;
l9_2171=float2(dot(float2(l9_2170,l9_2169),l9_2171),dot(float2(-l9_2169,l9_2170),l9_2171))+l9_2168;
l9_2165=l9_2171;
float4 l9_2172=float4(0.0);
int l9_2173;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_2174=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2174=0;
}
else
{
l9_2174=in.varStereoViewID;
}
int l9_2175=l9_2174;
l9_2173=1-l9_2175;
}
else
{
int l9_2176=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2176=0;
}
else
{
l9_2176=in.varStereoViewID;
}
int l9_2177=l9_2176;
l9_2173=l9_2177;
}
int l9_2178=l9_2173;
int l9_2179=patternTextureId01Layout_tmp;
int l9_2180=l9_2178;
float2 l9_2181=l9_2165;
bool l9_2182=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_2183=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_2184=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_2185=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_2186=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_2187=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_2188=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_2189=0.0;
bool l9_2190=l9_2187&&(!l9_2185);
float l9_2191=1.0;
float l9_2192=l9_2181.x;
int l9_2193=l9_2184.x;
if (l9_2193==1)
{
l9_2192=fract(l9_2192);
}
else
{
if (l9_2193==2)
{
float l9_2194=fract(l9_2192);
float l9_2195=l9_2192-l9_2194;
float l9_2196=step(0.25,fract(l9_2195*0.5));
l9_2192=mix(l9_2194,1.0-l9_2194,fast::clamp(l9_2196,0.0,1.0));
}
}
l9_2181.x=l9_2192;
float l9_2197=l9_2181.y;
int l9_2198=l9_2184.y;
if (l9_2198==1)
{
l9_2197=fract(l9_2197);
}
else
{
if (l9_2198==2)
{
float l9_2199=fract(l9_2197);
float l9_2200=l9_2197-l9_2199;
float l9_2201=step(0.25,fract(l9_2200*0.5));
l9_2197=mix(l9_2199,1.0-l9_2199,fast::clamp(l9_2201,0.0,1.0));
}
}
l9_2181.y=l9_2197;
if (l9_2185)
{
bool l9_2202=l9_2187;
bool l9_2203;
if (l9_2202)
{
l9_2203=l9_2184.x==3;
}
else
{
l9_2203=l9_2202;
}
float l9_2204=l9_2181.x;
float l9_2205=l9_2186.x;
float l9_2206=l9_2186.z;
bool l9_2207=l9_2203;
float l9_2208=l9_2191;
float l9_2209=fast::clamp(l9_2204,l9_2205,l9_2206);
float l9_2210=step(abs(l9_2204-l9_2209),9.9999997e-06);
l9_2208*=(l9_2210+((1.0-float(l9_2207))*(1.0-l9_2210)));
l9_2204=l9_2209;
l9_2181.x=l9_2204;
l9_2191=l9_2208;
bool l9_2211=l9_2187;
bool l9_2212;
if (l9_2211)
{
l9_2212=l9_2184.y==3;
}
else
{
l9_2212=l9_2211;
}
float l9_2213=l9_2181.y;
float l9_2214=l9_2186.y;
float l9_2215=l9_2186.w;
bool l9_2216=l9_2212;
float l9_2217=l9_2191;
float l9_2218=fast::clamp(l9_2213,l9_2214,l9_2215);
float l9_2219=step(abs(l9_2213-l9_2218),9.9999997e-06);
l9_2217*=(l9_2219+((1.0-float(l9_2216))*(1.0-l9_2219)));
l9_2213=l9_2218;
l9_2181.y=l9_2213;
l9_2191=l9_2217;
}
float2 l9_2220=l9_2181;
bool l9_2221=l9_2182;
float3x3 l9_2222=l9_2183;
if (l9_2221)
{
l9_2220=float2((l9_2222*float3(l9_2220,1.0)).xy);
}
float2 l9_2223=l9_2220;
l9_2181=l9_2223;
float l9_2224=l9_2181.x;
int l9_2225=l9_2184.x;
bool l9_2226=l9_2190;
float l9_2227=l9_2191;
if ((l9_2225==0)||(l9_2225==3))
{
float l9_2228=l9_2224;
float l9_2229=0.0;
float l9_2230=1.0;
bool l9_2231=l9_2226;
float l9_2232=l9_2227;
float l9_2233=fast::clamp(l9_2228,l9_2229,l9_2230);
float l9_2234=step(abs(l9_2228-l9_2233),9.9999997e-06);
l9_2232*=(l9_2234+((1.0-float(l9_2231))*(1.0-l9_2234)));
l9_2228=l9_2233;
l9_2224=l9_2228;
l9_2227=l9_2232;
}
l9_2181.x=l9_2224;
l9_2191=l9_2227;
float l9_2235=l9_2181.y;
int l9_2236=l9_2184.y;
bool l9_2237=l9_2190;
float l9_2238=l9_2191;
if ((l9_2236==0)||(l9_2236==3))
{
float l9_2239=l9_2235;
float l9_2240=0.0;
float l9_2241=1.0;
bool l9_2242=l9_2237;
float l9_2243=l9_2238;
float l9_2244=fast::clamp(l9_2239,l9_2240,l9_2241);
float l9_2245=step(abs(l9_2239-l9_2244),9.9999997e-06);
l9_2243*=(l9_2245+((1.0-float(l9_2242))*(1.0-l9_2245)));
l9_2239=l9_2244;
l9_2235=l9_2239;
l9_2238=l9_2243;
}
l9_2181.y=l9_2235;
l9_2191=l9_2238;
float2 l9_2246=l9_2181;
int l9_2247=l9_2179;
int l9_2248=l9_2180;
float l9_2249=l9_2189;
float2 l9_2250=l9_2246;
int l9_2251=l9_2247;
int l9_2252=l9_2248;
float3 l9_2253=float3(0.0);
if (l9_2251==0)
{
l9_2253=float3(l9_2250,0.0);
}
else
{
if (l9_2251==1)
{
l9_2253=float3(l9_2250.x,(l9_2250.y*0.5)+(0.5-(float(l9_2252)*0.5)),0.0);
}
else
{
l9_2253=float3(l9_2250,float(l9_2252));
}
}
float3 l9_2254=l9_2253;
float3 l9_2255=l9_2254;
float4 l9_2256=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_2255.xy,bias(l9_2249));
float4 l9_2257=l9_2256;
if (l9_2187)
{
l9_2257=mix(l9_2188,l9_2257,float4(l9_2191));
}
float4 l9_2258=l9_2257;
l9_2172=l9_2258;
l9_2150=l9_2172;
l9_2155=l9_2150;
}
else
{
float2 l9_2259=float2(0.0);
l9_2259=l9_2152.Surface_UVCoord0;
float2 l9_2260=float2(0.0);
float2 l9_2261=(*sc_set0.UserUniforms).patternScaleId01;
l9_2260=l9_2261;
float2 l9_2262=float2(0.0);
l9_2262=((l9_2259-(*sc_set0.UserUniforms).Port_Center_N122)*l9_2260)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_2263=float2(0.0);
float2 l9_2264=(*sc_set0.UserUniforms).patternOffsetId01;
l9_2263=l9_2264;
float2 l9_2265=float2(0.0);
l9_2265=l9_2262+l9_2263;
float l9_2266=0.0;
float l9_2267=(*sc_set0.UserUniforms).patternRotateId01;
l9_2266=l9_2267;
float2 l9_2268=float2(0.0);
float2 l9_2269=l9_2265;
float l9_2270=l9_2266;
float2 l9_2271=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_2272=sin(radians(l9_2270));
float l9_2273=cos(radians(l9_2270));
float2 l9_2274=l9_2269-l9_2271;
l9_2274=float2(dot(float2(l9_2273,l9_2272),l9_2274),dot(float2(-l9_2272,l9_2273),l9_2274))+l9_2271;
l9_2268=l9_2274;
float4 l9_2275=float4(0.0);
int l9_2276;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_2277=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2277=0;
}
else
{
l9_2277=in.varStereoViewID;
}
int l9_2278=l9_2277;
l9_2276=1-l9_2278;
}
else
{
int l9_2279=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2279=0;
}
else
{
l9_2279=in.varStereoViewID;
}
int l9_2280=l9_2279;
l9_2276=l9_2280;
}
int l9_2281=l9_2276;
int l9_2282=patternTextureId01Layout_tmp;
int l9_2283=l9_2281;
float2 l9_2284=l9_2268;
bool l9_2285=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_2286=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_2287=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_2288=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_2289=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_2290=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_2291=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_2292=0.0;
bool l9_2293=l9_2290&&(!l9_2288);
float l9_2294=1.0;
float l9_2295=l9_2284.x;
int l9_2296=l9_2287.x;
if (l9_2296==1)
{
l9_2295=fract(l9_2295);
}
else
{
if (l9_2296==2)
{
float l9_2297=fract(l9_2295);
float l9_2298=l9_2295-l9_2297;
float l9_2299=step(0.25,fract(l9_2298*0.5));
l9_2295=mix(l9_2297,1.0-l9_2297,fast::clamp(l9_2299,0.0,1.0));
}
}
l9_2284.x=l9_2295;
float l9_2300=l9_2284.y;
int l9_2301=l9_2287.y;
if (l9_2301==1)
{
l9_2300=fract(l9_2300);
}
else
{
if (l9_2301==2)
{
float l9_2302=fract(l9_2300);
float l9_2303=l9_2300-l9_2302;
float l9_2304=step(0.25,fract(l9_2303*0.5));
l9_2300=mix(l9_2302,1.0-l9_2302,fast::clamp(l9_2304,0.0,1.0));
}
}
l9_2284.y=l9_2300;
if (l9_2288)
{
bool l9_2305=l9_2290;
bool l9_2306;
if (l9_2305)
{
l9_2306=l9_2287.x==3;
}
else
{
l9_2306=l9_2305;
}
float l9_2307=l9_2284.x;
float l9_2308=l9_2289.x;
float l9_2309=l9_2289.z;
bool l9_2310=l9_2306;
float l9_2311=l9_2294;
float l9_2312=fast::clamp(l9_2307,l9_2308,l9_2309);
float l9_2313=step(abs(l9_2307-l9_2312),9.9999997e-06);
l9_2311*=(l9_2313+((1.0-float(l9_2310))*(1.0-l9_2313)));
l9_2307=l9_2312;
l9_2284.x=l9_2307;
l9_2294=l9_2311;
bool l9_2314=l9_2290;
bool l9_2315;
if (l9_2314)
{
l9_2315=l9_2287.y==3;
}
else
{
l9_2315=l9_2314;
}
float l9_2316=l9_2284.y;
float l9_2317=l9_2289.y;
float l9_2318=l9_2289.w;
bool l9_2319=l9_2315;
float l9_2320=l9_2294;
float l9_2321=fast::clamp(l9_2316,l9_2317,l9_2318);
float l9_2322=step(abs(l9_2316-l9_2321),9.9999997e-06);
l9_2320*=(l9_2322+((1.0-float(l9_2319))*(1.0-l9_2322)));
l9_2316=l9_2321;
l9_2284.y=l9_2316;
l9_2294=l9_2320;
}
float2 l9_2323=l9_2284;
bool l9_2324=l9_2285;
float3x3 l9_2325=l9_2286;
if (l9_2324)
{
l9_2323=float2((l9_2325*float3(l9_2323,1.0)).xy);
}
float2 l9_2326=l9_2323;
l9_2284=l9_2326;
float l9_2327=l9_2284.x;
int l9_2328=l9_2287.x;
bool l9_2329=l9_2293;
float l9_2330=l9_2294;
if ((l9_2328==0)||(l9_2328==3))
{
float l9_2331=l9_2327;
float l9_2332=0.0;
float l9_2333=1.0;
bool l9_2334=l9_2329;
float l9_2335=l9_2330;
float l9_2336=fast::clamp(l9_2331,l9_2332,l9_2333);
float l9_2337=step(abs(l9_2331-l9_2336),9.9999997e-06);
l9_2335*=(l9_2337+((1.0-float(l9_2334))*(1.0-l9_2337)));
l9_2331=l9_2336;
l9_2327=l9_2331;
l9_2330=l9_2335;
}
l9_2284.x=l9_2327;
l9_2294=l9_2330;
float l9_2338=l9_2284.y;
int l9_2339=l9_2287.y;
bool l9_2340=l9_2293;
float l9_2341=l9_2294;
if ((l9_2339==0)||(l9_2339==3))
{
float l9_2342=l9_2338;
float l9_2343=0.0;
float l9_2344=1.0;
bool l9_2345=l9_2340;
float l9_2346=l9_2341;
float l9_2347=fast::clamp(l9_2342,l9_2343,l9_2344);
float l9_2348=step(abs(l9_2342-l9_2347),9.9999997e-06);
l9_2346*=(l9_2348+((1.0-float(l9_2345))*(1.0-l9_2348)));
l9_2342=l9_2347;
l9_2338=l9_2342;
l9_2341=l9_2346;
}
l9_2284.y=l9_2338;
l9_2294=l9_2341;
float2 l9_2349=l9_2284;
int l9_2350=l9_2282;
int l9_2351=l9_2283;
float l9_2352=l9_2292;
float2 l9_2353=l9_2349;
int l9_2354=l9_2350;
int l9_2355=l9_2351;
float3 l9_2356=float3(0.0);
if (l9_2354==0)
{
l9_2356=float3(l9_2353,0.0);
}
else
{
if (l9_2354==1)
{
l9_2356=float3(l9_2353.x,(l9_2353.y*0.5)+(0.5-(float(l9_2355)*0.5)),0.0);
}
else
{
l9_2356=float3(l9_2353,float(l9_2355));
}
}
float3 l9_2357=l9_2356;
float3 l9_2358=l9_2357;
float4 l9_2359=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_2358.xy,bias(l9_2352));
float4 l9_2360=l9_2359;
if (l9_2290)
{
l9_2360=mix(l9_2291,l9_2360,float4(l9_2294));
}
float4 l9_2361=l9_2360;
l9_2275=l9_2361;
float l9_2362=0.0;
float3 l9_2363=l9_2275.xyz;
float l9_2364=l9_2363.x;
l9_2362=l9_2364;
l9_2151=float4(l9_2362);
l9_2155=l9_2151;
}
l9_2148=l9_2155;
float4 l9_2365=float4(0.0);
l9_2365=l9_2146*l9_2148;
l9_2140=l9_2365;
l9_2145=l9_2140;
}
else
{
float4 l9_2366=float4(0.0);
float4 l9_2367=(*sc_set0.UserUniforms).colorId01;
l9_2366=l9_2367;
float2 l9_2368=float2(0.0);
l9_2368=l9_2142.Surface_UVCoord0;
float4 l9_2369=float4(0.0);
int l9_2370;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_2371=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2371=0;
}
else
{
l9_2371=in.varStereoViewID;
}
int l9_2372=l9_2371;
l9_2370=1-l9_2372;
}
else
{
int l9_2373=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2373=0;
}
else
{
l9_2373=in.varStereoViewID;
}
int l9_2374=l9_2373;
l9_2370=l9_2374;
}
int l9_2375=l9_2370;
int l9_2376=greyMaskIdLayout_tmp;
int l9_2377=l9_2375;
float2 l9_2378=l9_2368;
bool l9_2379=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_2380=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_2381=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_2382=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_2383=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_2384=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_2385=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_2386=0.0;
bool l9_2387=l9_2384&&(!l9_2382);
float l9_2388=1.0;
float l9_2389=l9_2378.x;
int l9_2390=l9_2381.x;
if (l9_2390==1)
{
l9_2389=fract(l9_2389);
}
else
{
if (l9_2390==2)
{
float l9_2391=fract(l9_2389);
float l9_2392=l9_2389-l9_2391;
float l9_2393=step(0.25,fract(l9_2392*0.5));
l9_2389=mix(l9_2391,1.0-l9_2391,fast::clamp(l9_2393,0.0,1.0));
}
}
l9_2378.x=l9_2389;
float l9_2394=l9_2378.y;
int l9_2395=l9_2381.y;
if (l9_2395==1)
{
l9_2394=fract(l9_2394);
}
else
{
if (l9_2395==2)
{
float l9_2396=fract(l9_2394);
float l9_2397=l9_2394-l9_2396;
float l9_2398=step(0.25,fract(l9_2397*0.5));
l9_2394=mix(l9_2396,1.0-l9_2396,fast::clamp(l9_2398,0.0,1.0));
}
}
l9_2378.y=l9_2394;
if (l9_2382)
{
bool l9_2399=l9_2384;
bool l9_2400;
if (l9_2399)
{
l9_2400=l9_2381.x==3;
}
else
{
l9_2400=l9_2399;
}
float l9_2401=l9_2378.x;
float l9_2402=l9_2383.x;
float l9_2403=l9_2383.z;
bool l9_2404=l9_2400;
float l9_2405=l9_2388;
float l9_2406=fast::clamp(l9_2401,l9_2402,l9_2403);
float l9_2407=step(abs(l9_2401-l9_2406),9.9999997e-06);
l9_2405*=(l9_2407+((1.0-float(l9_2404))*(1.0-l9_2407)));
l9_2401=l9_2406;
l9_2378.x=l9_2401;
l9_2388=l9_2405;
bool l9_2408=l9_2384;
bool l9_2409;
if (l9_2408)
{
l9_2409=l9_2381.y==3;
}
else
{
l9_2409=l9_2408;
}
float l9_2410=l9_2378.y;
float l9_2411=l9_2383.y;
float l9_2412=l9_2383.w;
bool l9_2413=l9_2409;
float l9_2414=l9_2388;
float l9_2415=fast::clamp(l9_2410,l9_2411,l9_2412);
float l9_2416=step(abs(l9_2410-l9_2415),9.9999997e-06);
l9_2414*=(l9_2416+((1.0-float(l9_2413))*(1.0-l9_2416)));
l9_2410=l9_2415;
l9_2378.y=l9_2410;
l9_2388=l9_2414;
}
float2 l9_2417=l9_2378;
bool l9_2418=l9_2379;
float3x3 l9_2419=l9_2380;
if (l9_2418)
{
l9_2417=float2((l9_2419*float3(l9_2417,1.0)).xy);
}
float2 l9_2420=l9_2417;
l9_2378=l9_2420;
float l9_2421=l9_2378.x;
int l9_2422=l9_2381.x;
bool l9_2423=l9_2387;
float l9_2424=l9_2388;
if ((l9_2422==0)||(l9_2422==3))
{
float l9_2425=l9_2421;
float l9_2426=0.0;
float l9_2427=1.0;
bool l9_2428=l9_2423;
float l9_2429=l9_2424;
float l9_2430=fast::clamp(l9_2425,l9_2426,l9_2427);
float l9_2431=step(abs(l9_2425-l9_2430),9.9999997e-06);
l9_2429*=(l9_2431+((1.0-float(l9_2428))*(1.0-l9_2431)));
l9_2425=l9_2430;
l9_2421=l9_2425;
l9_2424=l9_2429;
}
l9_2378.x=l9_2421;
l9_2388=l9_2424;
float l9_2432=l9_2378.y;
int l9_2433=l9_2381.y;
bool l9_2434=l9_2387;
float l9_2435=l9_2388;
if ((l9_2433==0)||(l9_2433==3))
{
float l9_2436=l9_2432;
float l9_2437=0.0;
float l9_2438=1.0;
bool l9_2439=l9_2434;
float l9_2440=l9_2435;
float l9_2441=fast::clamp(l9_2436,l9_2437,l9_2438);
float l9_2442=step(abs(l9_2436-l9_2441),9.9999997e-06);
l9_2440*=(l9_2442+((1.0-float(l9_2439))*(1.0-l9_2442)));
l9_2436=l9_2441;
l9_2432=l9_2436;
l9_2435=l9_2440;
}
l9_2378.y=l9_2432;
l9_2388=l9_2435;
float2 l9_2443=l9_2378;
int l9_2444=l9_2376;
int l9_2445=l9_2377;
float l9_2446=l9_2386;
float2 l9_2447=l9_2443;
int l9_2448=l9_2444;
int l9_2449=l9_2445;
float3 l9_2450=float3(0.0);
if (l9_2448==0)
{
l9_2450=float3(l9_2447,0.0);
}
else
{
if (l9_2448==1)
{
l9_2450=float3(l9_2447.x,(l9_2447.y*0.5)+(0.5-(float(l9_2449)*0.5)),0.0);
}
else
{
l9_2450=float3(l9_2447,float(l9_2449));
}
}
float3 l9_2451=l9_2450;
float3 l9_2452=l9_2451;
float4 l9_2453=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_2452.xy,bias(l9_2446));
float4 l9_2454=l9_2453;
if (l9_2384)
{
l9_2454=mix(l9_2385,l9_2454,float4(l9_2388));
}
float4 l9_2455=l9_2454;
l9_2369=l9_2455;
float l9_2456=0.0;
l9_2456=l9_2369.x;
float l9_2457=0.0;
l9_2457=step(l9_2456,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_2458=float4(0.0);
l9_2458=l9_2366*float4(l9_2457);
l9_2141=l9_2458;
l9_2145=l9_2141;
}
l9_2138=l9_2145;
float2 l9_2459=float2(0.0);
l9_2459=l9_2124.Surface_UVCoord0;
float4 l9_2460=float4(0.0);
int l9_2461;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_2462=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2462=0;
}
else
{
l9_2462=in.varStereoViewID;
}
int l9_2463=l9_2462;
l9_2461=1-l9_2463;
}
else
{
int l9_2464=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2464=0;
}
else
{
l9_2464=in.varStereoViewID;
}
int l9_2465=l9_2464;
l9_2461=l9_2465;
}
int l9_2466=l9_2461;
int l9_2467=greyMaskIdLayout_tmp;
int l9_2468=l9_2466;
float2 l9_2469=l9_2459;
bool l9_2470=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_2471=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_2472=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_2473=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_2474=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_2475=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_2476=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_2477=0.0;
bool l9_2478=l9_2475&&(!l9_2473);
float l9_2479=1.0;
float l9_2480=l9_2469.x;
int l9_2481=l9_2472.x;
if (l9_2481==1)
{
l9_2480=fract(l9_2480);
}
else
{
if (l9_2481==2)
{
float l9_2482=fract(l9_2480);
float l9_2483=l9_2480-l9_2482;
float l9_2484=step(0.25,fract(l9_2483*0.5));
l9_2480=mix(l9_2482,1.0-l9_2482,fast::clamp(l9_2484,0.0,1.0));
}
}
l9_2469.x=l9_2480;
float l9_2485=l9_2469.y;
int l9_2486=l9_2472.y;
if (l9_2486==1)
{
l9_2485=fract(l9_2485);
}
else
{
if (l9_2486==2)
{
float l9_2487=fract(l9_2485);
float l9_2488=l9_2485-l9_2487;
float l9_2489=step(0.25,fract(l9_2488*0.5));
l9_2485=mix(l9_2487,1.0-l9_2487,fast::clamp(l9_2489,0.0,1.0));
}
}
l9_2469.y=l9_2485;
if (l9_2473)
{
bool l9_2490=l9_2475;
bool l9_2491;
if (l9_2490)
{
l9_2491=l9_2472.x==3;
}
else
{
l9_2491=l9_2490;
}
float l9_2492=l9_2469.x;
float l9_2493=l9_2474.x;
float l9_2494=l9_2474.z;
bool l9_2495=l9_2491;
float l9_2496=l9_2479;
float l9_2497=fast::clamp(l9_2492,l9_2493,l9_2494);
float l9_2498=step(abs(l9_2492-l9_2497),9.9999997e-06);
l9_2496*=(l9_2498+((1.0-float(l9_2495))*(1.0-l9_2498)));
l9_2492=l9_2497;
l9_2469.x=l9_2492;
l9_2479=l9_2496;
bool l9_2499=l9_2475;
bool l9_2500;
if (l9_2499)
{
l9_2500=l9_2472.y==3;
}
else
{
l9_2500=l9_2499;
}
float l9_2501=l9_2469.y;
float l9_2502=l9_2474.y;
float l9_2503=l9_2474.w;
bool l9_2504=l9_2500;
float l9_2505=l9_2479;
float l9_2506=fast::clamp(l9_2501,l9_2502,l9_2503);
float l9_2507=step(abs(l9_2501-l9_2506),9.9999997e-06);
l9_2505*=(l9_2507+((1.0-float(l9_2504))*(1.0-l9_2507)));
l9_2501=l9_2506;
l9_2469.y=l9_2501;
l9_2479=l9_2505;
}
float2 l9_2508=l9_2469;
bool l9_2509=l9_2470;
float3x3 l9_2510=l9_2471;
if (l9_2509)
{
l9_2508=float2((l9_2510*float3(l9_2508,1.0)).xy);
}
float2 l9_2511=l9_2508;
l9_2469=l9_2511;
float l9_2512=l9_2469.x;
int l9_2513=l9_2472.x;
bool l9_2514=l9_2478;
float l9_2515=l9_2479;
if ((l9_2513==0)||(l9_2513==3))
{
float l9_2516=l9_2512;
float l9_2517=0.0;
float l9_2518=1.0;
bool l9_2519=l9_2514;
float l9_2520=l9_2515;
float l9_2521=fast::clamp(l9_2516,l9_2517,l9_2518);
float l9_2522=step(abs(l9_2516-l9_2521),9.9999997e-06);
l9_2520*=(l9_2522+((1.0-float(l9_2519))*(1.0-l9_2522)));
l9_2516=l9_2521;
l9_2512=l9_2516;
l9_2515=l9_2520;
}
l9_2469.x=l9_2512;
l9_2479=l9_2515;
float l9_2523=l9_2469.y;
int l9_2524=l9_2472.y;
bool l9_2525=l9_2478;
float l9_2526=l9_2479;
if ((l9_2524==0)||(l9_2524==3))
{
float l9_2527=l9_2523;
float l9_2528=0.0;
float l9_2529=1.0;
bool l9_2530=l9_2525;
float l9_2531=l9_2526;
float l9_2532=fast::clamp(l9_2527,l9_2528,l9_2529);
float l9_2533=step(abs(l9_2527-l9_2532),9.9999997e-06);
l9_2531*=(l9_2533+((1.0-float(l9_2530))*(1.0-l9_2533)));
l9_2527=l9_2532;
l9_2523=l9_2527;
l9_2526=l9_2531;
}
l9_2469.y=l9_2523;
l9_2479=l9_2526;
float2 l9_2534=l9_2469;
int l9_2535=l9_2467;
int l9_2536=l9_2468;
float l9_2537=l9_2477;
float2 l9_2538=l9_2534;
int l9_2539=l9_2535;
int l9_2540=l9_2536;
float3 l9_2541=float3(0.0);
if (l9_2539==0)
{
l9_2541=float3(l9_2538,0.0);
}
else
{
if (l9_2539==1)
{
l9_2541=float3(l9_2538.x,(l9_2538.y*0.5)+(0.5-(float(l9_2540)*0.5)),0.0);
}
else
{
l9_2541=float3(l9_2538,float(l9_2540));
}
}
float3 l9_2542=l9_2541;
float3 l9_2543=l9_2542;
float4 l9_2544=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_2543.xy,bias(l9_2537));
float4 l9_2545=l9_2544;
if (l9_2475)
{
l9_2545=mix(l9_2476,l9_2545,float4(l9_2479));
}
float4 l9_2546=l9_2545;
l9_2460=l9_2546;
float l9_2547=0.0;
l9_2547=l9_2460.x;
float l9_2548=0.0;
l9_2548=step(l9_2547,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_2549=float4(0.0);
l9_2549=l9_2138*float4(l9_2548);
float4 l9_2550=float4(0.0);
float4 l9_2551=(*sc_set0.UserUniforms).colorId01;
l9_2550=l9_2551;
float4 l9_2552=float4(0.0);
l9_2552=l9_2550*float4(l9_2548);
float4 l9_2553=float4(0.0);
float4 l9_2554=l9_2549;
float4 l9_2555=l9_2552;
float4 l9_2556=l9_2554;
float4 l9_2557=l9_2555;
float3 l9_2558=l9_2556.xyz*l9_2556.w;
l9_2556=float4(l9_2558.x,l9_2558.y,l9_2558.z,l9_2556.w);
float4 l9_2559=l9_2556+(l9_2557*(1.0-l9_2556.w));
l9_2553=l9_2559;
float4 l9_2560=float4(0.0);
l9_2560=float4(l9_2132)*l9_2553;
float4 l9_2561=float4(0.0);
l9_2561=l9_2560+l9_2553;
l9_2122=l9_2561;
l9_2127=l9_2122;
}
else
{
float4 l9_2562=float4(0.0);
float l9_2563=0.0;
float4 l9_2564=float4(0.0);
float4 l9_2565=float4(0.0);
ssGlobals l9_2566=l9_2124;
float l9_2567=0.0;
float l9_2568=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_2567=l9_2568;
l9_2563=l9_2567;
float4 l9_2569;
if ((l9_2563*1.0)!=0.0)
{
float4 l9_2570=float4(0.0);
float4 l9_2571=(*sc_set0.UserUniforms).patternColorId01;
l9_2570=l9_2571;
float4 l9_2572=float4(0.0);
float l9_2573=0.0;
float4 l9_2574=float4(0.0);
float4 l9_2575=float4(0.0);
ssGlobals l9_2576=l9_2566;
float l9_2577=0.0;
float l9_2578=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_2577=l9_2578;
l9_2573=l9_2577;
float4 l9_2579;
if ((l9_2573*1.0)!=0.0)
{
float2 l9_2580=float2(0.0);
l9_2580=l9_2576.Surface_UVCoord0;
float2 l9_2581=float2(0.0);
float2 l9_2582=(*sc_set0.UserUniforms).patternScaleId01;
l9_2581=l9_2582;
float2 l9_2583=float2(0.0);
l9_2583=((l9_2580-(*sc_set0.UserUniforms).Port_Center_N122)*l9_2581)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_2584=float2(0.0);
float2 l9_2585=(*sc_set0.UserUniforms).patternOffsetId01;
l9_2584=l9_2585;
float2 l9_2586=float2(0.0);
l9_2586=l9_2583+l9_2584;
float l9_2587=0.0;
float l9_2588=(*sc_set0.UserUniforms).patternRotateId01;
l9_2587=l9_2588;
float2 l9_2589=float2(0.0);
float2 l9_2590=l9_2586;
float l9_2591=l9_2587;
float2 l9_2592=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_2593=sin(radians(l9_2591));
float l9_2594=cos(radians(l9_2591));
float2 l9_2595=l9_2590-l9_2592;
l9_2595=float2(dot(float2(l9_2594,l9_2593),l9_2595),dot(float2(-l9_2593,l9_2594),l9_2595))+l9_2592;
l9_2589=l9_2595;
float4 l9_2596=float4(0.0);
int l9_2597;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_2598=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2598=0;
}
else
{
l9_2598=in.varStereoViewID;
}
int l9_2599=l9_2598;
l9_2597=1-l9_2599;
}
else
{
int l9_2600=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2600=0;
}
else
{
l9_2600=in.varStereoViewID;
}
int l9_2601=l9_2600;
l9_2597=l9_2601;
}
int l9_2602=l9_2597;
int l9_2603=patternTextureId01Layout_tmp;
int l9_2604=l9_2602;
float2 l9_2605=l9_2589;
bool l9_2606=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_2607=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_2608=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_2609=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_2610=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_2611=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_2612=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_2613=0.0;
bool l9_2614=l9_2611&&(!l9_2609);
float l9_2615=1.0;
float l9_2616=l9_2605.x;
int l9_2617=l9_2608.x;
if (l9_2617==1)
{
l9_2616=fract(l9_2616);
}
else
{
if (l9_2617==2)
{
float l9_2618=fract(l9_2616);
float l9_2619=l9_2616-l9_2618;
float l9_2620=step(0.25,fract(l9_2619*0.5));
l9_2616=mix(l9_2618,1.0-l9_2618,fast::clamp(l9_2620,0.0,1.0));
}
}
l9_2605.x=l9_2616;
float l9_2621=l9_2605.y;
int l9_2622=l9_2608.y;
if (l9_2622==1)
{
l9_2621=fract(l9_2621);
}
else
{
if (l9_2622==2)
{
float l9_2623=fract(l9_2621);
float l9_2624=l9_2621-l9_2623;
float l9_2625=step(0.25,fract(l9_2624*0.5));
l9_2621=mix(l9_2623,1.0-l9_2623,fast::clamp(l9_2625,0.0,1.0));
}
}
l9_2605.y=l9_2621;
if (l9_2609)
{
bool l9_2626=l9_2611;
bool l9_2627;
if (l9_2626)
{
l9_2627=l9_2608.x==3;
}
else
{
l9_2627=l9_2626;
}
float l9_2628=l9_2605.x;
float l9_2629=l9_2610.x;
float l9_2630=l9_2610.z;
bool l9_2631=l9_2627;
float l9_2632=l9_2615;
float l9_2633=fast::clamp(l9_2628,l9_2629,l9_2630);
float l9_2634=step(abs(l9_2628-l9_2633),9.9999997e-06);
l9_2632*=(l9_2634+((1.0-float(l9_2631))*(1.0-l9_2634)));
l9_2628=l9_2633;
l9_2605.x=l9_2628;
l9_2615=l9_2632;
bool l9_2635=l9_2611;
bool l9_2636;
if (l9_2635)
{
l9_2636=l9_2608.y==3;
}
else
{
l9_2636=l9_2635;
}
float l9_2637=l9_2605.y;
float l9_2638=l9_2610.y;
float l9_2639=l9_2610.w;
bool l9_2640=l9_2636;
float l9_2641=l9_2615;
float l9_2642=fast::clamp(l9_2637,l9_2638,l9_2639);
float l9_2643=step(abs(l9_2637-l9_2642),9.9999997e-06);
l9_2641*=(l9_2643+((1.0-float(l9_2640))*(1.0-l9_2643)));
l9_2637=l9_2642;
l9_2605.y=l9_2637;
l9_2615=l9_2641;
}
float2 l9_2644=l9_2605;
bool l9_2645=l9_2606;
float3x3 l9_2646=l9_2607;
if (l9_2645)
{
l9_2644=float2((l9_2646*float3(l9_2644,1.0)).xy);
}
float2 l9_2647=l9_2644;
l9_2605=l9_2647;
float l9_2648=l9_2605.x;
int l9_2649=l9_2608.x;
bool l9_2650=l9_2614;
float l9_2651=l9_2615;
if ((l9_2649==0)||(l9_2649==3))
{
float l9_2652=l9_2648;
float l9_2653=0.0;
float l9_2654=1.0;
bool l9_2655=l9_2650;
float l9_2656=l9_2651;
float l9_2657=fast::clamp(l9_2652,l9_2653,l9_2654);
float l9_2658=step(abs(l9_2652-l9_2657),9.9999997e-06);
l9_2656*=(l9_2658+((1.0-float(l9_2655))*(1.0-l9_2658)));
l9_2652=l9_2657;
l9_2648=l9_2652;
l9_2651=l9_2656;
}
l9_2605.x=l9_2648;
l9_2615=l9_2651;
float l9_2659=l9_2605.y;
int l9_2660=l9_2608.y;
bool l9_2661=l9_2614;
float l9_2662=l9_2615;
if ((l9_2660==0)||(l9_2660==3))
{
float l9_2663=l9_2659;
float l9_2664=0.0;
float l9_2665=1.0;
bool l9_2666=l9_2661;
float l9_2667=l9_2662;
float l9_2668=fast::clamp(l9_2663,l9_2664,l9_2665);
float l9_2669=step(abs(l9_2663-l9_2668),9.9999997e-06);
l9_2667*=(l9_2669+((1.0-float(l9_2666))*(1.0-l9_2669)));
l9_2663=l9_2668;
l9_2659=l9_2663;
l9_2662=l9_2667;
}
l9_2605.y=l9_2659;
l9_2615=l9_2662;
float2 l9_2670=l9_2605;
int l9_2671=l9_2603;
int l9_2672=l9_2604;
float l9_2673=l9_2613;
float2 l9_2674=l9_2670;
int l9_2675=l9_2671;
int l9_2676=l9_2672;
float3 l9_2677=float3(0.0);
if (l9_2675==0)
{
l9_2677=float3(l9_2674,0.0);
}
else
{
if (l9_2675==1)
{
l9_2677=float3(l9_2674.x,(l9_2674.y*0.5)+(0.5-(float(l9_2676)*0.5)),0.0);
}
else
{
l9_2677=float3(l9_2674,float(l9_2676));
}
}
float3 l9_2678=l9_2677;
float3 l9_2679=l9_2678;
float4 l9_2680=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_2679.xy,bias(l9_2673));
float4 l9_2681=l9_2680;
if (l9_2611)
{
l9_2681=mix(l9_2612,l9_2681,float4(l9_2615));
}
float4 l9_2682=l9_2681;
l9_2596=l9_2682;
l9_2574=l9_2596;
l9_2579=l9_2574;
}
else
{
float2 l9_2683=float2(0.0);
l9_2683=l9_2576.Surface_UVCoord0;
float2 l9_2684=float2(0.0);
float2 l9_2685=(*sc_set0.UserUniforms).patternScaleId01;
l9_2684=l9_2685;
float2 l9_2686=float2(0.0);
l9_2686=((l9_2683-(*sc_set0.UserUniforms).Port_Center_N122)*l9_2684)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_2687=float2(0.0);
float2 l9_2688=(*sc_set0.UserUniforms).patternOffsetId01;
l9_2687=l9_2688;
float2 l9_2689=float2(0.0);
l9_2689=l9_2686+l9_2687;
float l9_2690=0.0;
float l9_2691=(*sc_set0.UserUniforms).patternRotateId01;
l9_2690=l9_2691;
float2 l9_2692=float2(0.0);
float2 l9_2693=l9_2689;
float l9_2694=l9_2690;
float2 l9_2695=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_2696=sin(radians(l9_2694));
float l9_2697=cos(radians(l9_2694));
float2 l9_2698=l9_2693-l9_2695;
l9_2698=float2(dot(float2(l9_2697,l9_2696),l9_2698),dot(float2(-l9_2696,l9_2697),l9_2698))+l9_2695;
l9_2692=l9_2698;
float4 l9_2699=float4(0.0);
int l9_2700;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_2701=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2701=0;
}
else
{
l9_2701=in.varStereoViewID;
}
int l9_2702=l9_2701;
l9_2700=1-l9_2702;
}
else
{
int l9_2703=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2703=0;
}
else
{
l9_2703=in.varStereoViewID;
}
int l9_2704=l9_2703;
l9_2700=l9_2704;
}
int l9_2705=l9_2700;
int l9_2706=patternTextureId01Layout_tmp;
int l9_2707=l9_2705;
float2 l9_2708=l9_2692;
bool l9_2709=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_2710=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_2711=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_2712=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_2713=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_2714=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_2715=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_2716=0.0;
bool l9_2717=l9_2714&&(!l9_2712);
float l9_2718=1.0;
float l9_2719=l9_2708.x;
int l9_2720=l9_2711.x;
if (l9_2720==1)
{
l9_2719=fract(l9_2719);
}
else
{
if (l9_2720==2)
{
float l9_2721=fract(l9_2719);
float l9_2722=l9_2719-l9_2721;
float l9_2723=step(0.25,fract(l9_2722*0.5));
l9_2719=mix(l9_2721,1.0-l9_2721,fast::clamp(l9_2723,0.0,1.0));
}
}
l9_2708.x=l9_2719;
float l9_2724=l9_2708.y;
int l9_2725=l9_2711.y;
if (l9_2725==1)
{
l9_2724=fract(l9_2724);
}
else
{
if (l9_2725==2)
{
float l9_2726=fract(l9_2724);
float l9_2727=l9_2724-l9_2726;
float l9_2728=step(0.25,fract(l9_2727*0.5));
l9_2724=mix(l9_2726,1.0-l9_2726,fast::clamp(l9_2728,0.0,1.0));
}
}
l9_2708.y=l9_2724;
if (l9_2712)
{
bool l9_2729=l9_2714;
bool l9_2730;
if (l9_2729)
{
l9_2730=l9_2711.x==3;
}
else
{
l9_2730=l9_2729;
}
float l9_2731=l9_2708.x;
float l9_2732=l9_2713.x;
float l9_2733=l9_2713.z;
bool l9_2734=l9_2730;
float l9_2735=l9_2718;
float l9_2736=fast::clamp(l9_2731,l9_2732,l9_2733);
float l9_2737=step(abs(l9_2731-l9_2736),9.9999997e-06);
l9_2735*=(l9_2737+((1.0-float(l9_2734))*(1.0-l9_2737)));
l9_2731=l9_2736;
l9_2708.x=l9_2731;
l9_2718=l9_2735;
bool l9_2738=l9_2714;
bool l9_2739;
if (l9_2738)
{
l9_2739=l9_2711.y==3;
}
else
{
l9_2739=l9_2738;
}
float l9_2740=l9_2708.y;
float l9_2741=l9_2713.y;
float l9_2742=l9_2713.w;
bool l9_2743=l9_2739;
float l9_2744=l9_2718;
float l9_2745=fast::clamp(l9_2740,l9_2741,l9_2742);
float l9_2746=step(abs(l9_2740-l9_2745),9.9999997e-06);
l9_2744*=(l9_2746+((1.0-float(l9_2743))*(1.0-l9_2746)));
l9_2740=l9_2745;
l9_2708.y=l9_2740;
l9_2718=l9_2744;
}
float2 l9_2747=l9_2708;
bool l9_2748=l9_2709;
float3x3 l9_2749=l9_2710;
if (l9_2748)
{
l9_2747=float2((l9_2749*float3(l9_2747,1.0)).xy);
}
float2 l9_2750=l9_2747;
l9_2708=l9_2750;
float l9_2751=l9_2708.x;
int l9_2752=l9_2711.x;
bool l9_2753=l9_2717;
float l9_2754=l9_2718;
if ((l9_2752==0)||(l9_2752==3))
{
float l9_2755=l9_2751;
float l9_2756=0.0;
float l9_2757=1.0;
bool l9_2758=l9_2753;
float l9_2759=l9_2754;
float l9_2760=fast::clamp(l9_2755,l9_2756,l9_2757);
float l9_2761=step(abs(l9_2755-l9_2760),9.9999997e-06);
l9_2759*=(l9_2761+((1.0-float(l9_2758))*(1.0-l9_2761)));
l9_2755=l9_2760;
l9_2751=l9_2755;
l9_2754=l9_2759;
}
l9_2708.x=l9_2751;
l9_2718=l9_2754;
float l9_2762=l9_2708.y;
int l9_2763=l9_2711.y;
bool l9_2764=l9_2717;
float l9_2765=l9_2718;
if ((l9_2763==0)||(l9_2763==3))
{
float l9_2766=l9_2762;
float l9_2767=0.0;
float l9_2768=1.0;
bool l9_2769=l9_2764;
float l9_2770=l9_2765;
float l9_2771=fast::clamp(l9_2766,l9_2767,l9_2768);
float l9_2772=step(abs(l9_2766-l9_2771),9.9999997e-06);
l9_2770*=(l9_2772+((1.0-float(l9_2769))*(1.0-l9_2772)));
l9_2766=l9_2771;
l9_2762=l9_2766;
l9_2765=l9_2770;
}
l9_2708.y=l9_2762;
l9_2718=l9_2765;
float2 l9_2773=l9_2708;
int l9_2774=l9_2706;
int l9_2775=l9_2707;
float l9_2776=l9_2716;
float2 l9_2777=l9_2773;
int l9_2778=l9_2774;
int l9_2779=l9_2775;
float3 l9_2780=float3(0.0);
if (l9_2778==0)
{
l9_2780=float3(l9_2777,0.0);
}
else
{
if (l9_2778==1)
{
l9_2780=float3(l9_2777.x,(l9_2777.y*0.5)+(0.5-(float(l9_2779)*0.5)),0.0);
}
else
{
l9_2780=float3(l9_2777,float(l9_2779));
}
}
float3 l9_2781=l9_2780;
float3 l9_2782=l9_2781;
float4 l9_2783=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_2782.xy,bias(l9_2776));
float4 l9_2784=l9_2783;
if (l9_2714)
{
l9_2784=mix(l9_2715,l9_2784,float4(l9_2718));
}
float4 l9_2785=l9_2784;
l9_2699=l9_2785;
float l9_2786=0.0;
float3 l9_2787=l9_2699.xyz;
float l9_2788=l9_2787.x;
l9_2786=l9_2788;
l9_2575=float4(l9_2786);
l9_2579=l9_2575;
}
l9_2572=l9_2579;
float4 l9_2789=float4(0.0);
l9_2789=l9_2570*l9_2572;
l9_2564=l9_2789;
l9_2569=l9_2564;
}
else
{
float4 l9_2790=float4(0.0);
float4 l9_2791=(*sc_set0.UserUniforms).colorId01;
l9_2790=l9_2791;
float2 l9_2792=float2(0.0);
l9_2792=l9_2566.Surface_UVCoord0;
float4 l9_2793=float4(0.0);
int l9_2794;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_2795=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2795=0;
}
else
{
l9_2795=in.varStereoViewID;
}
int l9_2796=l9_2795;
l9_2794=1-l9_2796;
}
else
{
int l9_2797=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2797=0;
}
else
{
l9_2797=in.varStereoViewID;
}
int l9_2798=l9_2797;
l9_2794=l9_2798;
}
int l9_2799=l9_2794;
int l9_2800=greyMaskIdLayout_tmp;
int l9_2801=l9_2799;
float2 l9_2802=l9_2792;
bool l9_2803=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_2804=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_2805=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_2806=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_2807=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_2808=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_2809=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_2810=0.0;
bool l9_2811=l9_2808&&(!l9_2806);
float l9_2812=1.0;
float l9_2813=l9_2802.x;
int l9_2814=l9_2805.x;
if (l9_2814==1)
{
l9_2813=fract(l9_2813);
}
else
{
if (l9_2814==2)
{
float l9_2815=fract(l9_2813);
float l9_2816=l9_2813-l9_2815;
float l9_2817=step(0.25,fract(l9_2816*0.5));
l9_2813=mix(l9_2815,1.0-l9_2815,fast::clamp(l9_2817,0.0,1.0));
}
}
l9_2802.x=l9_2813;
float l9_2818=l9_2802.y;
int l9_2819=l9_2805.y;
if (l9_2819==1)
{
l9_2818=fract(l9_2818);
}
else
{
if (l9_2819==2)
{
float l9_2820=fract(l9_2818);
float l9_2821=l9_2818-l9_2820;
float l9_2822=step(0.25,fract(l9_2821*0.5));
l9_2818=mix(l9_2820,1.0-l9_2820,fast::clamp(l9_2822,0.0,1.0));
}
}
l9_2802.y=l9_2818;
if (l9_2806)
{
bool l9_2823=l9_2808;
bool l9_2824;
if (l9_2823)
{
l9_2824=l9_2805.x==3;
}
else
{
l9_2824=l9_2823;
}
float l9_2825=l9_2802.x;
float l9_2826=l9_2807.x;
float l9_2827=l9_2807.z;
bool l9_2828=l9_2824;
float l9_2829=l9_2812;
float l9_2830=fast::clamp(l9_2825,l9_2826,l9_2827);
float l9_2831=step(abs(l9_2825-l9_2830),9.9999997e-06);
l9_2829*=(l9_2831+((1.0-float(l9_2828))*(1.0-l9_2831)));
l9_2825=l9_2830;
l9_2802.x=l9_2825;
l9_2812=l9_2829;
bool l9_2832=l9_2808;
bool l9_2833;
if (l9_2832)
{
l9_2833=l9_2805.y==3;
}
else
{
l9_2833=l9_2832;
}
float l9_2834=l9_2802.y;
float l9_2835=l9_2807.y;
float l9_2836=l9_2807.w;
bool l9_2837=l9_2833;
float l9_2838=l9_2812;
float l9_2839=fast::clamp(l9_2834,l9_2835,l9_2836);
float l9_2840=step(abs(l9_2834-l9_2839),9.9999997e-06);
l9_2838*=(l9_2840+((1.0-float(l9_2837))*(1.0-l9_2840)));
l9_2834=l9_2839;
l9_2802.y=l9_2834;
l9_2812=l9_2838;
}
float2 l9_2841=l9_2802;
bool l9_2842=l9_2803;
float3x3 l9_2843=l9_2804;
if (l9_2842)
{
l9_2841=float2((l9_2843*float3(l9_2841,1.0)).xy);
}
float2 l9_2844=l9_2841;
l9_2802=l9_2844;
float l9_2845=l9_2802.x;
int l9_2846=l9_2805.x;
bool l9_2847=l9_2811;
float l9_2848=l9_2812;
if ((l9_2846==0)||(l9_2846==3))
{
float l9_2849=l9_2845;
float l9_2850=0.0;
float l9_2851=1.0;
bool l9_2852=l9_2847;
float l9_2853=l9_2848;
float l9_2854=fast::clamp(l9_2849,l9_2850,l9_2851);
float l9_2855=step(abs(l9_2849-l9_2854),9.9999997e-06);
l9_2853*=(l9_2855+((1.0-float(l9_2852))*(1.0-l9_2855)));
l9_2849=l9_2854;
l9_2845=l9_2849;
l9_2848=l9_2853;
}
l9_2802.x=l9_2845;
l9_2812=l9_2848;
float l9_2856=l9_2802.y;
int l9_2857=l9_2805.y;
bool l9_2858=l9_2811;
float l9_2859=l9_2812;
if ((l9_2857==0)||(l9_2857==3))
{
float l9_2860=l9_2856;
float l9_2861=0.0;
float l9_2862=1.0;
bool l9_2863=l9_2858;
float l9_2864=l9_2859;
float l9_2865=fast::clamp(l9_2860,l9_2861,l9_2862);
float l9_2866=step(abs(l9_2860-l9_2865),9.9999997e-06);
l9_2864*=(l9_2866+((1.0-float(l9_2863))*(1.0-l9_2866)));
l9_2860=l9_2865;
l9_2856=l9_2860;
l9_2859=l9_2864;
}
l9_2802.y=l9_2856;
l9_2812=l9_2859;
float2 l9_2867=l9_2802;
int l9_2868=l9_2800;
int l9_2869=l9_2801;
float l9_2870=l9_2810;
float2 l9_2871=l9_2867;
int l9_2872=l9_2868;
int l9_2873=l9_2869;
float3 l9_2874=float3(0.0);
if (l9_2872==0)
{
l9_2874=float3(l9_2871,0.0);
}
else
{
if (l9_2872==1)
{
l9_2874=float3(l9_2871.x,(l9_2871.y*0.5)+(0.5-(float(l9_2873)*0.5)),0.0);
}
else
{
l9_2874=float3(l9_2871,float(l9_2873));
}
}
float3 l9_2875=l9_2874;
float3 l9_2876=l9_2875;
float4 l9_2877=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_2876.xy,bias(l9_2870));
float4 l9_2878=l9_2877;
if (l9_2808)
{
l9_2878=mix(l9_2809,l9_2878,float4(l9_2812));
}
float4 l9_2879=l9_2878;
l9_2793=l9_2879;
float l9_2880=0.0;
l9_2880=l9_2793.x;
float l9_2881=0.0;
l9_2881=step(l9_2880,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_2882=float4(0.0);
l9_2882=l9_2790*float4(l9_2881);
l9_2565=l9_2882;
l9_2569=l9_2565;
}
l9_2562=l9_2569;
float2 l9_2883=float2(0.0);
l9_2883=l9_2124.Surface_UVCoord0;
float4 l9_2884=float4(0.0);
int l9_2885;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_2886=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2886=0;
}
else
{
l9_2886=in.varStereoViewID;
}
int l9_2887=l9_2886;
l9_2885=1-l9_2887;
}
else
{
int l9_2888=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2888=0;
}
else
{
l9_2888=in.varStereoViewID;
}
int l9_2889=l9_2888;
l9_2885=l9_2889;
}
int l9_2890=l9_2885;
int l9_2891=greyMaskIdLayout_tmp;
int l9_2892=l9_2890;
float2 l9_2893=l9_2883;
bool l9_2894=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_2895=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_2896=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_2897=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_2898=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_2899=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_2900=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_2901=0.0;
bool l9_2902=l9_2899&&(!l9_2897);
float l9_2903=1.0;
float l9_2904=l9_2893.x;
int l9_2905=l9_2896.x;
if (l9_2905==1)
{
l9_2904=fract(l9_2904);
}
else
{
if (l9_2905==2)
{
float l9_2906=fract(l9_2904);
float l9_2907=l9_2904-l9_2906;
float l9_2908=step(0.25,fract(l9_2907*0.5));
l9_2904=mix(l9_2906,1.0-l9_2906,fast::clamp(l9_2908,0.0,1.0));
}
}
l9_2893.x=l9_2904;
float l9_2909=l9_2893.y;
int l9_2910=l9_2896.y;
if (l9_2910==1)
{
l9_2909=fract(l9_2909);
}
else
{
if (l9_2910==2)
{
float l9_2911=fract(l9_2909);
float l9_2912=l9_2909-l9_2911;
float l9_2913=step(0.25,fract(l9_2912*0.5));
l9_2909=mix(l9_2911,1.0-l9_2911,fast::clamp(l9_2913,0.0,1.0));
}
}
l9_2893.y=l9_2909;
if (l9_2897)
{
bool l9_2914=l9_2899;
bool l9_2915;
if (l9_2914)
{
l9_2915=l9_2896.x==3;
}
else
{
l9_2915=l9_2914;
}
float l9_2916=l9_2893.x;
float l9_2917=l9_2898.x;
float l9_2918=l9_2898.z;
bool l9_2919=l9_2915;
float l9_2920=l9_2903;
float l9_2921=fast::clamp(l9_2916,l9_2917,l9_2918);
float l9_2922=step(abs(l9_2916-l9_2921),9.9999997e-06);
l9_2920*=(l9_2922+((1.0-float(l9_2919))*(1.0-l9_2922)));
l9_2916=l9_2921;
l9_2893.x=l9_2916;
l9_2903=l9_2920;
bool l9_2923=l9_2899;
bool l9_2924;
if (l9_2923)
{
l9_2924=l9_2896.y==3;
}
else
{
l9_2924=l9_2923;
}
float l9_2925=l9_2893.y;
float l9_2926=l9_2898.y;
float l9_2927=l9_2898.w;
bool l9_2928=l9_2924;
float l9_2929=l9_2903;
float l9_2930=fast::clamp(l9_2925,l9_2926,l9_2927);
float l9_2931=step(abs(l9_2925-l9_2930),9.9999997e-06);
l9_2929*=(l9_2931+((1.0-float(l9_2928))*(1.0-l9_2931)));
l9_2925=l9_2930;
l9_2893.y=l9_2925;
l9_2903=l9_2929;
}
float2 l9_2932=l9_2893;
bool l9_2933=l9_2894;
float3x3 l9_2934=l9_2895;
if (l9_2933)
{
l9_2932=float2((l9_2934*float3(l9_2932,1.0)).xy);
}
float2 l9_2935=l9_2932;
l9_2893=l9_2935;
float l9_2936=l9_2893.x;
int l9_2937=l9_2896.x;
bool l9_2938=l9_2902;
float l9_2939=l9_2903;
if ((l9_2937==0)||(l9_2937==3))
{
float l9_2940=l9_2936;
float l9_2941=0.0;
float l9_2942=1.0;
bool l9_2943=l9_2938;
float l9_2944=l9_2939;
float l9_2945=fast::clamp(l9_2940,l9_2941,l9_2942);
float l9_2946=step(abs(l9_2940-l9_2945),9.9999997e-06);
l9_2944*=(l9_2946+((1.0-float(l9_2943))*(1.0-l9_2946)));
l9_2940=l9_2945;
l9_2936=l9_2940;
l9_2939=l9_2944;
}
l9_2893.x=l9_2936;
l9_2903=l9_2939;
float l9_2947=l9_2893.y;
int l9_2948=l9_2896.y;
bool l9_2949=l9_2902;
float l9_2950=l9_2903;
if ((l9_2948==0)||(l9_2948==3))
{
float l9_2951=l9_2947;
float l9_2952=0.0;
float l9_2953=1.0;
bool l9_2954=l9_2949;
float l9_2955=l9_2950;
float l9_2956=fast::clamp(l9_2951,l9_2952,l9_2953);
float l9_2957=step(abs(l9_2951-l9_2956),9.9999997e-06);
l9_2955*=(l9_2957+((1.0-float(l9_2954))*(1.0-l9_2957)));
l9_2951=l9_2956;
l9_2947=l9_2951;
l9_2950=l9_2955;
}
l9_2893.y=l9_2947;
l9_2903=l9_2950;
float2 l9_2958=l9_2893;
int l9_2959=l9_2891;
int l9_2960=l9_2892;
float l9_2961=l9_2901;
float2 l9_2962=l9_2958;
int l9_2963=l9_2959;
int l9_2964=l9_2960;
float3 l9_2965=float3(0.0);
if (l9_2963==0)
{
l9_2965=float3(l9_2962,0.0);
}
else
{
if (l9_2963==1)
{
l9_2965=float3(l9_2962.x,(l9_2962.y*0.5)+(0.5-(float(l9_2964)*0.5)),0.0);
}
else
{
l9_2965=float3(l9_2962,float(l9_2964));
}
}
float3 l9_2966=l9_2965;
float3 l9_2967=l9_2966;
float4 l9_2968=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_2967.xy,bias(l9_2961));
float4 l9_2969=l9_2968;
if (l9_2899)
{
l9_2969=mix(l9_2900,l9_2969,float4(l9_2903));
}
float4 l9_2970=l9_2969;
l9_2884=l9_2970;
float l9_2971=0.0;
l9_2971=l9_2884.x;
float l9_2972=0.0;
l9_2972=step(l9_2971,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_2973=float4(0.0);
l9_2973=l9_2562*float4(l9_2972);
float4 l9_2974=float4(0.0);
float4 l9_2975=(*sc_set0.UserUniforms).colorId01;
l9_2974=l9_2975;
float4 l9_2976=float4(0.0);
l9_2976=l9_2974*float4(l9_2972);
float4 l9_2977=float4(0.0);
float4 l9_2978=l9_2973;
float4 l9_2979=l9_2976;
float4 l9_2980=l9_2978;
float4 l9_2981=l9_2979;
float3 l9_2982=l9_2980.xyz*l9_2980.w;
l9_2980=float4(l9_2982.x,l9_2982.y,l9_2982.z,l9_2980.w);
float4 l9_2983=l9_2980+(l9_2981*(1.0-l9_2980.w));
l9_2977=l9_2983;
l9_2123=l9_2977;
l9_2127=l9_2123;
}
l9_2120=l9_2127;
float l9_2984=0.0;
float l9_2985=(*sc_set0.UserUniforms).metallicId01;
l9_2984=l9_2985;
float l9_2986=0.0;
float l9_2987=(*sc_set0.UserUniforms).rougnessId01;
l9_2986=l9_2987;
float4 l9_2988=float4(0.0);
float3 l9_2989=l9_2120.xyz;
float l9_2990=(*sc_set0.UserUniforms).Port_Opacity_N152;
float3 l9_2991=(*sc_set0.UserUniforms).Port_Emissive_N152;
float l9_2992=l9_2984;
float l9_2993=l9_2986;
float3 l9_2994=(*sc_set0.UserUniforms).Port_AO_N152;
float3 l9_2995=(*sc_set0.UserUniforms).Port_SpecularAO_N152;
ssGlobals l9_2996=l9_2116;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_2996.BumpedNormal=l9_2996.VertexNormal_WorldSpace;
}
float l9_2997=l9_2990;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_2997<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_2998=gl_FragCoord;
float2 l9_2999=floor(mod(l9_2998.xy,float2(4.0)));
float l9_3000=(mod(dot(l9_2999,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_2997<l9_3000)
{
discard_fragment();
}
}
l9_2989=fast::max(l9_2989,float3(0.0));
float4 l9_3001;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_3001=float4(l9_2989,l9_2990);
}
else
{
l9_2992=fast::clamp(l9_2992,0.0,1.0);
l9_2993=fast::clamp(l9_2993,0.0,1.0);
float3 l9_3002=l9_2989;
float l9_3003=l9_2990;
float3 l9_3004=l9_2996.BumpedNormal;
float3 l9_3005=l9_2996.PositionWS;
float3 l9_3006=l9_2996.ViewDirWS;
float3 l9_3007=l9_2991;
float l9_3008=l9_2992;
float l9_3009=l9_2993;
float3 l9_3010=l9_2994;
float3 l9_3011=l9_2995;
l9_3001=ngsCalculateLighting(l9_3002,l9_3003,l9_3004,l9_3005,l9_3006,l9_3007,l9_3008,l9_3009,l9_3010,l9_3011,in.varStereoViewID,sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_RayTracingReflections,sc_set0.sc_RayTracingReflectionsSmpSC,sc_set0.sc_RayTracingGlobalIllumination,sc_set0.sc_RayTracingGlobalIlluminationSmpSC,sc_set0.sc_RayTracingShadows,sc_set0.sc_RayTracingShadowsSmpSC,gl_FragCoord,(*sc_set0.UserUniforms),in.varShadowTex,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,out.sc_FragData0,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
l9_3001=fast::max(l9_3001,float4(0.0));
l9_2988=l9_3001;
l9_2114=l9_2988;
l9_2119=l9_2114;
}
else
{
float4 l9_3012=float4(0.0);
float l9_3013=0.0;
float4 l9_3014=float4(0.0);
float4 l9_3015=float4(0.0);
ssGlobals l9_3016=l9_2116;
float l9_3017=0.0;
float l9_3018=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_3017=l9_3018;
l9_3013=l9_3017;
float4 l9_3019;
if ((l9_3013*1.0)!=0.0)
{
float l9_3020=0.0;
float l9_3021=(*sc_set0.UserUniforms).rimExpId01;
l9_3020=l9_3021;
float l9_3022=0.0;
float l9_3023=(*sc_set0.UserUniforms).rimIntId01;
l9_3022=l9_3023;
float l9_3024=0.0;
float l9_3025=l9_3020;
float l9_3026=l9_3022;
ssGlobals l9_3027=l9_3016;
float l9_3028=abs(dot(-l9_3027.ViewDirWS,l9_3027.VertexNormal_WorldSpace));
float l9_3029=1.0-pow(1.0-l9_3028,l9_3025);
l9_3029=fast::max(l9_3029,0.0);
l9_3029*=l9_3026;
l9_3024=l9_3029;
float4 l9_3030=float4(0.0);
float l9_3031=0.0;
float4 l9_3032=float4(0.0);
float4 l9_3033=float4(0.0);
ssGlobals l9_3034=l9_3016;
float l9_3035=0.0;
float l9_3036=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_3035=l9_3036;
l9_3031=l9_3035;
float4 l9_3037;
if ((l9_3031*1.0)!=0.0)
{
float4 l9_3038=float4(0.0);
float4 l9_3039=(*sc_set0.UserUniforms).patternColorId01;
l9_3038=l9_3039;
float4 l9_3040=float4(0.0);
float l9_3041=0.0;
float4 l9_3042=float4(0.0);
float4 l9_3043=float4(0.0);
ssGlobals l9_3044=l9_3034;
float l9_3045=0.0;
float l9_3046=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_3045=l9_3046;
l9_3041=l9_3045;
float4 l9_3047;
if ((l9_3041*1.0)!=0.0)
{
float2 l9_3048=float2(0.0);
l9_3048=l9_3044.Surface_UVCoord0;
float2 l9_3049=float2(0.0);
float2 l9_3050=(*sc_set0.UserUniforms).patternScaleId01;
l9_3049=l9_3050;
float2 l9_3051=float2(0.0);
l9_3051=((l9_3048-(*sc_set0.UserUniforms).Port_Center_N122)*l9_3049)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_3052=float2(0.0);
float2 l9_3053=(*sc_set0.UserUniforms).patternOffsetId01;
l9_3052=l9_3053;
float2 l9_3054=float2(0.0);
l9_3054=l9_3051+l9_3052;
float l9_3055=0.0;
float l9_3056=(*sc_set0.UserUniforms).patternRotateId01;
l9_3055=l9_3056;
float2 l9_3057=float2(0.0);
float2 l9_3058=l9_3054;
float l9_3059=l9_3055;
float2 l9_3060=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_3061=sin(radians(l9_3059));
float l9_3062=cos(radians(l9_3059));
float2 l9_3063=l9_3058-l9_3060;
l9_3063=float2(dot(float2(l9_3062,l9_3061),l9_3063),dot(float2(-l9_3061,l9_3062),l9_3063))+l9_3060;
l9_3057=l9_3063;
float4 l9_3064=float4(0.0);
int l9_3065;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_3066=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3066=0;
}
else
{
l9_3066=in.varStereoViewID;
}
int l9_3067=l9_3066;
l9_3065=1-l9_3067;
}
else
{
int l9_3068=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3068=0;
}
else
{
l9_3068=in.varStereoViewID;
}
int l9_3069=l9_3068;
l9_3065=l9_3069;
}
int l9_3070=l9_3065;
int l9_3071=patternTextureId01Layout_tmp;
int l9_3072=l9_3070;
float2 l9_3073=l9_3057;
bool l9_3074=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_3075=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_3076=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_3077=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_3078=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_3079=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_3080=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_3081=0.0;
bool l9_3082=l9_3079&&(!l9_3077);
float l9_3083=1.0;
float l9_3084=l9_3073.x;
int l9_3085=l9_3076.x;
if (l9_3085==1)
{
l9_3084=fract(l9_3084);
}
else
{
if (l9_3085==2)
{
float l9_3086=fract(l9_3084);
float l9_3087=l9_3084-l9_3086;
float l9_3088=step(0.25,fract(l9_3087*0.5));
l9_3084=mix(l9_3086,1.0-l9_3086,fast::clamp(l9_3088,0.0,1.0));
}
}
l9_3073.x=l9_3084;
float l9_3089=l9_3073.y;
int l9_3090=l9_3076.y;
if (l9_3090==1)
{
l9_3089=fract(l9_3089);
}
else
{
if (l9_3090==2)
{
float l9_3091=fract(l9_3089);
float l9_3092=l9_3089-l9_3091;
float l9_3093=step(0.25,fract(l9_3092*0.5));
l9_3089=mix(l9_3091,1.0-l9_3091,fast::clamp(l9_3093,0.0,1.0));
}
}
l9_3073.y=l9_3089;
if (l9_3077)
{
bool l9_3094=l9_3079;
bool l9_3095;
if (l9_3094)
{
l9_3095=l9_3076.x==3;
}
else
{
l9_3095=l9_3094;
}
float l9_3096=l9_3073.x;
float l9_3097=l9_3078.x;
float l9_3098=l9_3078.z;
bool l9_3099=l9_3095;
float l9_3100=l9_3083;
float l9_3101=fast::clamp(l9_3096,l9_3097,l9_3098);
float l9_3102=step(abs(l9_3096-l9_3101),9.9999997e-06);
l9_3100*=(l9_3102+((1.0-float(l9_3099))*(1.0-l9_3102)));
l9_3096=l9_3101;
l9_3073.x=l9_3096;
l9_3083=l9_3100;
bool l9_3103=l9_3079;
bool l9_3104;
if (l9_3103)
{
l9_3104=l9_3076.y==3;
}
else
{
l9_3104=l9_3103;
}
float l9_3105=l9_3073.y;
float l9_3106=l9_3078.y;
float l9_3107=l9_3078.w;
bool l9_3108=l9_3104;
float l9_3109=l9_3083;
float l9_3110=fast::clamp(l9_3105,l9_3106,l9_3107);
float l9_3111=step(abs(l9_3105-l9_3110),9.9999997e-06);
l9_3109*=(l9_3111+((1.0-float(l9_3108))*(1.0-l9_3111)));
l9_3105=l9_3110;
l9_3073.y=l9_3105;
l9_3083=l9_3109;
}
float2 l9_3112=l9_3073;
bool l9_3113=l9_3074;
float3x3 l9_3114=l9_3075;
if (l9_3113)
{
l9_3112=float2((l9_3114*float3(l9_3112,1.0)).xy);
}
float2 l9_3115=l9_3112;
l9_3073=l9_3115;
float l9_3116=l9_3073.x;
int l9_3117=l9_3076.x;
bool l9_3118=l9_3082;
float l9_3119=l9_3083;
if ((l9_3117==0)||(l9_3117==3))
{
float l9_3120=l9_3116;
float l9_3121=0.0;
float l9_3122=1.0;
bool l9_3123=l9_3118;
float l9_3124=l9_3119;
float l9_3125=fast::clamp(l9_3120,l9_3121,l9_3122);
float l9_3126=step(abs(l9_3120-l9_3125),9.9999997e-06);
l9_3124*=(l9_3126+((1.0-float(l9_3123))*(1.0-l9_3126)));
l9_3120=l9_3125;
l9_3116=l9_3120;
l9_3119=l9_3124;
}
l9_3073.x=l9_3116;
l9_3083=l9_3119;
float l9_3127=l9_3073.y;
int l9_3128=l9_3076.y;
bool l9_3129=l9_3082;
float l9_3130=l9_3083;
if ((l9_3128==0)||(l9_3128==3))
{
float l9_3131=l9_3127;
float l9_3132=0.0;
float l9_3133=1.0;
bool l9_3134=l9_3129;
float l9_3135=l9_3130;
float l9_3136=fast::clamp(l9_3131,l9_3132,l9_3133);
float l9_3137=step(abs(l9_3131-l9_3136),9.9999997e-06);
l9_3135*=(l9_3137+((1.0-float(l9_3134))*(1.0-l9_3137)));
l9_3131=l9_3136;
l9_3127=l9_3131;
l9_3130=l9_3135;
}
l9_3073.y=l9_3127;
l9_3083=l9_3130;
float2 l9_3138=l9_3073;
int l9_3139=l9_3071;
int l9_3140=l9_3072;
float l9_3141=l9_3081;
float2 l9_3142=l9_3138;
int l9_3143=l9_3139;
int l9_3144=l9_3140;
float3 l9_3145=float3(0.0);
if (l9_3143==0)
{
l9_3145=float3(l9_3142,0.0);
}
else
{
if (l9_3143==1)
{
l9_3145=float3(l9_3142.x,(l9_3142.y*0.5)+(0.5-(float(l9_3144)*0.5)),0.0);
}
else
{
l9_3145=float3(l9_3142,float(l9_3144));
}
}
float3 l9_3146=l9_3145;
float3 l9_3147=l9_3146;
float4 l9_3148=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_3147.xy,bias(l9_3141));
float4 l9_3149=l9_3148;
if (l9_3079)
{
l9_3149=mix(l9_3080,l9_3149,float4(l9_3083));
}
float4 l9_3150=l9_3149;
l9_3064=l9_3150;
l9_3042=l9_3064;
l9_3047=l9_3042;
}
else
{
float2 l9_3151=float2(0.0);
l9_3151=l9_3044.Surface_UVCoord0;
float2 l9_3152=float2(0.0);
float2 l9_3153=(*sc_set0.UserUniforms).patternScaleId01;
l9_3152=l9_3153;
float2 l9_3154=float2(0.0);
l9_3154=((l9_3151-(*sc_set0.UserUniforms).Port_Center_N122)*l9_3152)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_3155=float2(0.0);
float2 l9_3156=(*sc_set0.UserUniforms).patternOffsetId01;
l9_3155=l9_3156;
float2 l9_3157=float2(0.0);
l9_3157=l9_3154+l9_3155;
float l9_3158=0.0;
float l9_3159=(*sc_set0.UserUniforms).patternRotateId01;
l9_3158=l9_3159;
float2 l9_3160=float2(0.0);
float2 l9_3161=l9_3157;
float l9_3162=l9_3158;
float2 l9_3163=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_3164=sin(radians(l9_3162));
float l9_3165=cos(radians(l9_3162));
float2 l9_3166=l9_3161-l9_3163;
l9_3166=float2(dot(float2(l9_3165,l9_3164),l9_3166),dot(float2(-l9_3164,l9_3165),l9_3166))+l9_3163;
l9_3160=l9_3166;
float4 l9_3167=float4(0.0);
int l9_3168;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_3169=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3169=0;
}
else
{
l9_3169=in.varStereoViewID;
}
int l9_3170=l9_3169;
l9_3168=1-l9_3170;
}
else
{
int l9_3171=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3171=0;
}
else
{
l9_3171=in.varStereoViewID;
}
int l9_3172=l9_3171;
l9_3168=l9_3172;
}
int l9_3173=l9_3168;
int l9_3174=patternTextureId01Layout_tmp;
int l9_3175=l9_3173;
float2 l9_3176=l9_3160;
bool l9_3177=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_3178=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_3179=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_3180=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_3181=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_3182=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_3183=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_3184=0.0;
bool l9_3185=l9_3182&&(!l9_3180);
float l9_3186=1.0;
float l9_3187=l9_3176.x;
int l9_3188=l9_3179.x;
if (l9_3188==1)
{
l9_3187=fract(l9_3187);
}
else
{
if (l9_3188==2)
{
float l9_3189=fract(l9_3187);
float l9_3190=l9_3187-l9_3189;
float l9_3191=step(0.25,fract(l9_3190*0.5));
l9_3187=mix(l9_3189,1.0-l9_3189,fast::clamp(l9_3191,0.0,1.0));
}
}
l9_3176.x=l9_3187;
float l9_3192=l9_3176.y;
int l9_3193=l9_3179.y;
if (l9_3193==1)
{
l9_3192=fract(l9_3192);
}
else
{
if (l9_3193==2)
{
float l9_3194=fract(l9_3192);
float l9_3195=l9_3192-l9_3194;
float l9_3196=step(0.25,fract(l9_3195*0.5));
l9_3192=mix(l9_3194,1.0-l9_3194,fast::clamp(l9_3196,0.0,1.0));
}
}
l9_3176.y=l9_3192;
if (l9_3180)
{
bool l9_3197=l9_3182;
bool l9_3198;
if (l9_3197)
{
l9_3198=l9_3179.x==3;
}
else
{
l9_3198=l9_3197;
}
float l9_3199=l9_3176.x;
float l9_3200=l9_3181.x;
float l9_3201=l9_3181.z;
bool l9_3202=l9_3198;
float l9_3203=l9_3186;
float l9_3204=fast::clamp(l9_3199,l9_3200,l9_3201);
float l9_3205=step(abs(l9_3199-l9_3204),9.9999997e-06);
l9_3203*=(l9_3205+((1.0-float(l9_3202))*(1.0-l9_3205)));
l9_3199=l9_3204;
l9_3176.x=l9_3199;
l9_3186=l9_3203;
bool l9_3206=l9_3182;
bool l9_3207;
if (l9_3206)
{
l9_3207=l9_3179.y==3;
}
else
{
l9_3207=l9_3206;
}
float l9_3208=l9_3176.y;
float l9_3209=l9_3181.y;
float l9_3210=l9_3181.w;
bool l9_3211=l9_3207;
float l9_3212=l9_3186;
float l9_3213=fast::clamp(l9_3208,l9_3209,l9_3210);
float l9_3214=step(abs(l9_3208-l9_3213),9.9999997e-06);
l9_3212*=(l9_3214+((1.0-float(l9_3211))*(1.0-l9_3214)));
l9_3208=l9_3213;
l9_3176.y=l9_3208;
l9_3186=l9_3212;
}
float2 l9_3215=l9_3176;
bool l9_3216=l9_3177;
float3x3 l9_3217=l9_3178;
if (l9_3216)
{
l9_3215=float2((l9_3217*float3(l9_3215,1.0)).xy);
}
float2 l9_3218=l9_3215;
l9_3176=l9_3218;
float l9_3219=l9_3176.x;
int l9_3220=l9_3179.x;
bool l9_3221=l9_3185;
float l9_3222=l9_3186;
if ((l9_3220==0)||(l9_3220==3))
{
float l9_3223=l9_3219;
float l9_3224=0.0;
float l9_3225=1.0;
bool l9_3226=l9_3221;
float l9_3227=l9_3222;
float l9_3228=fast::clamp(l9_3223,l9_3224,l9_3225);
float l9_3229=step(abs(l9_3223-l9_3228),9.9999997e-06);
l9_3227*=(l9_3229+((1.0-float(l9_3226))*(1.0-l9_3229)));
l9_3223=l9_3228;
l9_3219=l9_3223;
l9_3222=l9_3227;
}
l9_3176.x=l9_3219;
l9_3186=l9_3222;
float l9_3230=l9_3176.y;
int l9_3231=l9_3179.y;
bool l9_3232=l9_3185;
float l9_3233=l9_3186;
if ((l9_3231==0)||(l9_3231==3))
{
float l9_3234=l9_3230;
float l9_3235=0.0;
float l9_3236=1.0;
bool l9_3237=l9_3232;
float l9_3238=l9_3233;
float l9_3239=fast::clamp(l9_3234,l9_3235,l9_3236);
float l9_3240=step(abs(l9_3234-l9_3239),9.9999997e-06);
l9_3238*=(l9_3240+((1.0-float(l9_3237))*(1.0-l9_3240)));
l9_3234=l9_3239;
l9_3230=l9_3234;
l9_3233=l9_3238;
}
l9_3176.y=l9_3230;
l9_3186=l9_3233;
float2 l9_3241=l9_3176;
int l9_3242=l9_3174;
int l9_3243=l9_3175;
float l9_3244=l9_3184;
float2 l9_3245=l9_3241;
int l9_3246=l9_3242;
int l9_3247=l9_3243;
float3 l9_3248=float3(0.0);
if (l9_3246==0)
{
l9_3248=float3(l9_3245,0.0);
}
else
{
if (l9_3246==1)
{
l9_3248=float3(l9_3245.x,(l9_3245.y*0.5)+(0.5-(float(l9_3247)*0.5)),0.0);
}
else
{
l9_3248=float3(l9_3245,float(l9_3247));
}
}
float3 l9_3249=l9_3248;
float3 l9_3250=l9_3249;
float4 l9_3251=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_3250.xy,bias(l9_3244));
float4 l9_3252=l9_3251;
if (l9_3182)
{
l9_3252=mix(l9_3183,l9_3252,float4(l9_3186));
}
float4 l9_3253=l9_3252;
l9_3167=l9_3253;
float l9_3254=0.0;
float3 l9_3255=l9_3167.xyz;
float l9_3256=l9_3255.x;
l9_3254=l9_3256;
l9_3043=float4(l9_3254);
l9_3047=l9_3043;
}
l9_3040=l9_3047;
float4 l9_3257=float4(0.0);
l9_3257=l9_3038*l9_3040;
l9_3032=l9_3257;
l9_3037=l9_3032;
}
else
{
float4 l9_3258=float4(0.0);
float4 l9_3259=(*sc_set0.UserUniforms).colorId01;
l9_3258=l9_3259;
float2 l9_3260=float2(0.0);
l9_3260=l9_3034.Surface_UVCoord0;
float4 l9_3261=float4(0.0);
int l9_3262;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_3263=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3263=0;
}
else
{
l9_3263=in.varStereoViewID;
}
int l9_3264=l9_3263;
l9_3262=1-l9_3264;
}
else
{
int l9_3265=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3265=0;
}
else
{
l9_3265=in.varStereoViewID;
}
int l9_3266=l9_3265;
l9_3262=l9_3266;
}
int l9_3267=l9_3262;
int l9_3268=greyMaskIdLayout_tmp;
int l9_3269=l9_3267;
float2 l9_3270=l9_3260;
bool l9_3271=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_3272=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_3273=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_3274=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_3275=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_3276=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_3277=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_3278=0.0;
bool l9_3279=l9_3276&&(!l9_3274);
float l9_3280=1.0;
float l9_3281=l9_3270.x;
int l9_3282=l9_3273.x;
if (l9_3282==1)
{
l9_3281=fract(l9_3281);
}
else
{
if (l9_3282==2)
{
float l9_3283=fract(l9_3281);
float l9_3284=l9_3281-l9_3283;
float l9_3285=step(0.25,fract(l9_3284*0.5));
l9_3281=mix(l9_3283,1.0-l9_3283,fast::clamp(l9_3285,0.0,1.0));
}
}
l9_3270.x=l9_3281;
float l9_3286=l9_3270.y;
int l9_3287=l9_3273.y;
if (l9_3287==1)
{
l9_3286=fract(l9_3286);
}
else
{
if (l9_3287==2)
{
float l9_3288=fract(l9_3286);
float l9_3289=l9_3286-l9_3288;
float l9_3290=step(0.25,fract(l9_3289*0.5));
l9_3286=mix(l9_3288,1.0-l9_3288,fast::clamp(l9_3290,0.0,1.0));
}
}
l9_3270.y=l9_3286;
if (l9_3274)
{
bool l9_3291=l9_3276;
bool l9_3292;
if (l9_3291)
{
l9_3292=l9_3273.x==3;
}
else
{
l9_3292=l9_3291;
}
float l9_3293=l9_3270.x;
float l9_3294=l9_3275.x;
float l9_3295=l9_3275.z;
bool l9_3296=l9_3292;
float l9_3297=l9_3280;
float l9_3298=fast::clamp(l9_3293,l9_3294,l9_3295);
float l9_3299=step(abs(l9_3293-l9_3298),9.9999997e-06);
l9_3297*=(l9_3299+((1.0-float(l9_3296))*(1.0-l9_3299)));
l9_3293=l9_3298;
l9_3270.x=l9_3293;
l9_3280=l9_3297;
bool l9_3300=l9_3276;
bool l9_3301;
if (l9_3300)
{
l9_3301=l9_3273.y==3;
}
else
{
l9_3301=l9_3300;
}
float l9_3302=l9_3270.y;
float l9_3303=l9_3275.y;
float l9_3304=l9_3275.w;
bool l9_3305=l9_3301;
float l9_3306=l9_3280;
float l9_3307=fast::clamp(l9_3302,l9_3303,l9_3304);
float l9_3308=step(abs(l9_3302-l9_3307),9.9999997e-06);
l9_3306*=(l9_3308+((1.0-float(l9_3305))*(1.0-l9_3308)));
l9_3302=l9_3307;
l9_3270.y=l9_3302;
l9_3280=l9_3306;
}
float2 l9_3309=l9_3270;
bool l9_3310=l9_3271;
float3x3 l9_3311=l9_3272;
if (l9_3310)
{
l9_3309=float2((l9_3311*float3(l9_3309,1.0)).xy);
}
float2 l9_3312=l9_3309;
l9_3270=l9_3312;
float l9_3313=l9_3270.x;
int l9_3314=l9_3273.x;
bool l9_3315=l9_3279;
float l9_3316=l9_3280;
if ((l9_3314==0)||(l9_3314==3))
{
float l9_3317=l9_3313;
float l9_3318=0.0;
float l9_3319=1.0;
bool l9_3320=l9_3315;
float l9_3321=l9_3316;
float l9_3322=fast::clamp(l9_3317,l9_3318,l9_3319);
float l9_3323=step(abs(l9_3317-l9_3322),9.9999997e-06);
l9_3321*=(l9_3323+((1.0-float(l9_3320))*(1.0-l9_3323)));
l9_3317=l9_3322;
l9_3313=l9_3317;
l9_3316=l9_3321;
}
l9_3270.x=l9_3313;
l9_3280=l9_3316;
float l9_3324=l9_3270.y;
int l9_3325=l9_3273.y;
bool l9_3326=l9_3279;
float l9_3327=l9_3280;
if ((l9_3325==0)||(l9_3325==3))
{
float l9_3328=l9_3324;
float l9_3329=0.0;
float l9_3330=1.0;
bool l9_3331=l9_3326;
float l9_3332=l9_3327;
float l9_3333=fast::clamp(l9_3328,l9_3329,l9_3330);
float l9_3334=step(abs(l9_3328-l9_3333),9.9999997e-06);
l9_3332*=(l9_3334+((1.0-float(l9_3331))*(1.0-l9_3334)));
l9_3328=l9_3333;
l9_3324=l9_3328;
l9_3327=l9_3332;
}
l9_3270.y=l9_3324;
l9_3280=l9_3327;
float2 l9_3335=l9_3270;
int l9_3336=l9_3268;
int l9_3337=l9_3269;
float l9_3338=l9_3278;
float2 l9_3339=l9_3335;
int l9_3340=l9_3336;
int l9_3341=l9_3337;
float3 l9_3342=float3(0.0);
if (l9_3340==0)
{
l9_3342=float3(l9_3339,0.0);
}
else
{
if (l9_3340==1)
{
l9_3342=float3(l9_3339.x,(l9_3339.y*0.5)+(0.5-(float(l9_3341)*0.5)),0.0);
}
else
{
l9_3342=float3(l9_3339,float(l9_3341));
}
}
float3 l9_3343=l9_3342;
float3 l9_3344=l9_3343;
float4 l9_3345=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_3344.xy,bias(l9_3338));
float4 l9_3346=l9_3345;
if (l9_3276)
{
l9_3346=mix(l9_3277,l9_3346,float4(l9_3280));
}
float4 l9_3347=l9_3346;
l9_3261=l9_3347;
float l9_3348=0.0;
l9_3348=l9_3261.x;
float l9_3349=0.0;
l9_3349=step(l9_3348,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_3350=float4(0.0);
l9_3350=l9_3258*float4(l9_3349);
l9_3033=l9_3350;
l9_3037=l9_3033;
}
l9_3030=l9_3037;
float2 l9_3351=float2(0.0);
l9_3351=l9_3016.Surface_UVCoord0;
float4 l9_3352=float4(0.0);
int l9_3353;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_3354=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3354=0;
}
else
{
l9_3354=in.varStereoViewID;
}
int l9_3355=l9_3354;
l9_3353=1-l9_3355;
}
else
{
int l9_3356=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3356=0;
}
else
{
l9_3356=in.varStereoViewID;
}
int l9_3357=l9_3356;
l9_3353=l9_3357;
}
int l9_3358=l9_3353;
int l9_3359=greyMaskIdLayout_tmp;
int l9_3360=l9_3358;
float2 l9_3361=l9_3351;
bool l9_3362=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_3363=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_3364=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_3365=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_3366=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_3367=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_3368=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_3369=0.0;
bool l9_3370=l9_3367&&(!l9_3365);
float l9_3371=1.0;
float l9_3372=l9_3361.x;
int l9_3373=l9_3364.x;
if (l9_3373==1)
{
l9_3372=fract(l9_3372);
}
else
{
if (l9_3373==2)
{
float l9_3374=fract(l9_3372);
float l9_3375=l9_3372-l9_3374;
float l9_3376=step(0.25,fract(l9_3375*0.5));
l9_3372=mix(l9_3374,1.0-l9_3374,fast::clamp(l9_3376,0.0,1.0));
}
}
l9_3361.x=l9_3372;
float l9_3377=l9_3361.y;
int l9_3378=l9_3364.y;
if (l9_3378==1)
{
l9_3377=fract(l9_3377);
}
else
{
if (l9_3378==2)
{
float l9_3379=fract(l9_3377);
float l9_3380=l9_3377-l9_3379;
float l9_3381=step(0.25,fract(l9_3380*0.5));
l9_3377=mix(l9_3379,1.0-l9_3379,fast::clamp(l9_3381,0.0,1.0));
}
}
l9_3361.y=l9_3377;
if (l9_3365)
{
bool l9_3382=l9_3367;
bool l9_3383;
if (l9_3382)
{
l9_3383=l9_3364.x==3;
}
else
{
l9_3383=l9_3382;
}
float l9_3384=l9_3361.x;
float l9_3385=l9_3366.x;
float l9_3386=l9_3366.z;
bool l9_3387=l9_3383;
float l9_3388=l9_3371;
float l9_3389=fast::clamp(l9_3384,l9_3385,l9_3386);
float l9_3390=step(abs(l9_3384-l9_3389),9.9999997e-06);
l9_3388*=(l9_3390+((1.0-float(l9_3387))*(1.0-l9_3390)));
l9_3384=l9_3389;
l9_3361.x=l9_3384;
l9_3371=l9_3388;
bool l9_3391=l9_3367;
bool l9_3392;
if (l9_3391)
{
l9_3392=l9_3364.y==3;
}
else
{
l9_3392=l9_3391;
}
float l9_3393=l9_3361.y;
float l9_3394=l9_3366.y;
float l9_3395=l9_3366.w;
bool l9_3396=l9_3392;
float l9_3397=l9_3371;
float l9_3398=fast::clamp(l9_3393,l9_3394,l9_3395);
float l9_3399=step(abs(l9_3393-l9_3398),9.9999997e-06);
l9_3397*=(l9_3399+((1.0-float(l9_3396))*(1.0-l9_3399)));
l9_3393=l9_3398;
l9_3361.y=l9_3393;
l9_3371=l9_3397;
}
float2 l9_3400=l9_3361;
bool l9_3401=l9_3362;
float3x3 l9_3402=l9_3363;
if (l9_3401)
{
l9_3400=float2((l9_3402*float3(l9_3400,1.0)).xy);
}
float2 l9_3403=l9_3400;
l9_3361=l9_3403;
float l9_3404=l9_3361.x;
int l9_3405=l9_3364.x;
bool l9_3406=l9_3370;
float l9_3407=l9_3371;
if ((l9_3405==0)||(l9_3405==3))
{
float l9_3408=l9_3404;
float l9_3409=0.0;
float l9_3410=1.0;
bool l9_3411=l9_3406;
float l9_3412=l9_3407;
float l9_3413=fast::clamp(l9_3408,l9_3409,l9_3410);
float l9_3414=step(abs(l9_3408-l9_3413),9.9999997e-06);
l9_3412*=(l9_3414+((1.0-float(l9_3411))*(1.0-l9_3414)));
l9_3408=l9_3413;
l9_3404=l9_3408;
l9_3407=l9_3412;
}
l9_3361.x=l9_3404;
l9_3371=l9_3407;
float l9_3415=l9_3361.y;
int l9_3416=l9_3364.y;
bool l9_3417=l9_3370;
float l9_3418=l9_3371;
if ((l9_3416==0)||(l9_3416==3))
{
float l9_3419=l9_3415;
float l9_3420=0.0;
float l9_3421=1.0;
bool l9_3422=l9_3417;
float l9_3423=l9_3418;
float l9_3424=fast::clamp(l9_3419,l9_3420,l9_3421);
float l9_3425=step(abs(l9_3419-l9_3424),9.9999997e-06);
l9_3423*=(l9_3425+((1.0-float(l9_3422))*(1.0-l9_3425)));
l9_3419=l9_3424;
l9_3415=l9_3419;
l9_3418=l9_3423;
}
l9_3361.y=l9_3415;
l9_3371=l9_3418;
float2 l9_3426=l9_3361;
int l9_3427=l9_3359;
int l9_3428=l9_3360;
float l9_3429=l9_3369;
float2 l9_3430=l9_3426;
int l9_3431=l9_3427;
int l9_3432=l9_3428;
float3 l9_3433=float3(0.0);
if (l9_3431==0)
{
l9_3433=float3(l9_3430,0.0);
}
else
{
if (l9_3431==1)
{
l9_3433=float3(l9_3430.x,(l9_3430.y*0.5)+(0.5-(float(l9_3432)*0.5)),0.0);
}
else
{
l9_3433=float3(l9_3430,float(l9_3432));
}
}
float3 l9_3434=l9_3433;
float3 l9_3435=l9_3434;
float4 l9_3436=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_3435.xy,bias(l9_3429));
float4 l9_3437=l9_3436;
if (l9_3367)
{
l9_3437=mix(l9_3368,l9_3437,float4(l9_3371));
}
float4 l9_3438=l9_3437;
l9_3352=l9_3438;
float l9_3439=0.0;
l9_3439=l9_3352.x;
float l9_3440=0.0;
l9_3440=step(l9_3439,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_3441=float4(0.0);
l9_3441=l9_3030*float4(l9_3440);
float4 l9_3442=float4(0.0);
float4 l9_3443=(*sc_set0.UserUniforms).colorId01;
l9_3442=l9_3443;
float4 l9_3444=float4(0.0);
l9_3444=l9_3442*float4(l9_3440);
float4 l9_3445=float4(0.0);
float4 l9_3446=l9_3441;
float4 l9_3447=l9_3444;
float4 l9_3448=l9_3446;
float4 l9_3449=l9_3447;
float3 l9_3450=l9_3448.xyz*l9_3448.w;
l9_3448=float4(l9_3450.x,l9_3450.y,l9_3450.z,l9_3448.w);
float4 l9_3451=l9_3448+(l9_3449*(1.0-l9_3448.w));
l9_3445=l9_3451;
float4 l9_3452=float4(0.0);
l9_3452=float4(l9_3024)*l9_3445;
float4 l9_3453=float4(0.0);
l9_3453=l9_3452+l9_3445;
l9_3014=l9_3453;
l9_3019=l9_3014;
}
else
{
float4 l9_3454=float4(0.0);
float l9_3455=0.0;
float4 l9_3456=float4(0.0);
float4 l9_3457=float4(0.0);
ssGlobals l9_3458=l9_3016;
float l9_3459=0.0;
float l9_3460=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_3459=l9_3460;
l9_3455=l9_3459;
float4 l9_3461;
if ((l9_3455*1.0)!=0.0)
{
float4 l9_3462=float4(0.0);
float4 l9_3463=(*sc_set0.UserUniforms).patternColorId01;
l9_3462=l9_3463;
float4 l9_3464=float4(0.0);
float l9_3465=0.0;
float4 l9_3466=float4(0.0);
float4 l9_3467=float4(0.0);
ssGlobals l9_3468=l9_3458;
float l9_3469=0.0;
float l9_3470=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_3469=l9_3470;
l9_3465=l9_3469;
float4 l9_3471;
if ((l9_3465*1.0)!=0.0)
{
float2 l9_3472=float2(0.0);
l9_3472=l9_3468.Surface_UVCoord0;
float2 l9_3473=float2(0.0);
float2 l9_3474=(*sc_set0.UserUniforms).patternScaleId01;
l9_3473=l9_3474;
float2 l9_3475=float2(0.0);
l9_3475=((l9_3472-(*sc_set0.UserUniforms).Port_Center_N122)*l9_3473)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_3476=float2(0.0);
float2 l9_3477=(*sc_set0.UserUniforms).patternOffsetId01;
l9_3476=l9_3477;
float2 l9_3478=float2(0.0);
l9_3478=l9_3475+l9_3476;
float l9_3479=0.0;
float l9_3480=(*sc_set0.UserUniforms).patternRotateId01;
l9_3479=l9_3480;
float2 l9_3481=float2(0.0);
float2 l9_3482=l9_3478;
float l9_3483=l9_3479;
float2 l9_3484=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_3485=sin(radians(l9_3483));
float l9_3486=cos(radians(l9_3483));
float2 l9_3487=l9_3482-l9_3484;
l9_3487=float2(dot(float2(l9_3486,l9_3485),l9_3487),dot(float2(-l9_3485,l9_3486),l9_3487))+l9_3484;
l9_3481=l9_3487;
float4 l9_3488=float4(0.0);
int l9_3489;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_3490=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3490=0;
}
else
{
l9_3490=in.varStereoViewID;
}
int l9_3491=l9_3490;
l9_3489=1-l9_3491;
}
else
{
int l9_3492=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3492=0;
}
else
{
l9_3492=in.varStereoViewID;
}
int l9_3493=l9_3492;
l9_3489=l9_3493;
}
int l9_3494=l9_3489;
int l9_3495=patternTextureId01Layout_tmp;
int l9_3496=l9_3494;
float2 l9_3497=l9_3481;
bool l9_3498=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_3499=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_3500=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_3501=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_3502=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_3503=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_3504=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_3505=0.0;
bool l9_3506=l9_3503&&(!l9_3501);
float l9_3507=1.0;
float l9_3508=l9_3497.x;
int l9_3509=l9_3500.x;
if (l9_3509==1)
{
l9_3508=fract(l9_3508);
}
else
{
if (l9_3509==2)
{
float l9_3510=fract(l9_3508);
float l9_3511=l9_3508-l9_3510;
float l9_3512=step(0.25,fract(l9_3511*0.5));
l9_3508=mix(l9_3510,1.0-l9_3510,fast::clamp(l9_3512,0.0,1.0));
}
}
l9_3497.x=l9_3508;
float l9_3513=l9_3497.y;
int l9_3514=l9_3500.y;
if (l9_3514==1)
{
l9_3513=fract(l9_3513);
}
else
{
if (l9_3514==2)
{
float l9_3515=fract(l9_3513);
float l9_3516=l9_3513-l9_3515;
float l9_3517=step(0.25,fract(l9_3516*0.5));
l9_3513=mix(l9_3515,1.0-l9_3515,fast::clamp(l9_3517,0.0,1.0));
}
}
l9_3497.y=l9_3513;
if (l9_3501)
{
bool l9_3518=l9_3503;
bool l9_3519;
if (l9_3518)
{
l9_3519=l9_3500.x==3;
}
else
{
l9_3519=l9_3518;
}
float l9_3520=l9_3497.x;
float l9_3521=l9_3502.x;
float l9_3522=l9_3502.z;
bool l9_3523=l9_3519;
float l9_3524=l9_3507;
float l9_3525=fast::clamp(l9_3520,l9_3521,l9_3522);
float l9_3526=step(abs(l9_3520-l9_3525),9.9999997e-06);
l9_3524*=(l9_3526+((1.0-float(l9_3523))*(1.0-l9_3526)));
l9_3520=l9_3525;
l9_3497.x=l9_3520;
l9_3507=l9_3524;
bool l9_3527=l9_3503;
bool l9_3528;
if (l9_3527)
{
l9_3528=l9_3500.y==3;
}
else
{
l9_3528=l9_3527;
}
float l9_3529=l9_3497.y;
float l9_3530=l9_3502.y;
float l9_3531=l9_3502.w;
bool l9_3532=l9_3528;
float l9_3533=l9_3507;
float l9_3534=fast::clamp(l9_3529,l9_3530,l9_3531);
float l9_3535=step(abs(l9_3529-l9_3534),9.9999997e-06);
l9_3533*=(l9_3535+((1.0-float(l9_3532))*(1.0-l9_3535)));
l9_3529=l9_3534;
l9_3497.y=l9_3529;
l9_3507=l9_3533;
}
float2 l9_3536=l9_3497;
bool l9_3537=l9_3498;
float3x3 l9_3538=l9_3499;
if (l9_3537)
{
l9_3536=float2((l9_3538*float3(l9_3536,1.0)).xy);
}
float2 l9_3539=l9_3536;
l9_3497=l9_3539;
float l9_3540=l9_3497.x;
int l9_3541=l9_3500.x;
bool l9_3542=l9_3506;
float l9_3543=l9_3507;
if ((l9_3541==0)||(l9_3541==3))
{
float l9_3544=l9_3540;
float l9_3545=0.0;
float l9_3546=1.0;
bool l9_3547=l9_3542;
float l9_3548=l9_3543;
float l9_3549=fast::clamp(l9_3544,l9_3545,l9_3546);
float l9_3550=step(abs(l9_3544-l9_3549),9.9999997e-06);
l9_3548*=(l9_3550+((1.0-float(l9_3547))*(1.0-l9_3550)));
l9_3544=l9_3549;
l9_3540=l9_3544;
l9_3543=l9_3548;
}
l9_3497.x=l9_3540;
l9_3507=l9_3543;
float l9_3551=l9_3497.y;
int l9_3552=l9_3500.y;
bool l9_3553=l9_3506;
float l9_3554=l9_3507;
if ((l9_3552==0)||(l9_3552==3))
{
float l9_3555=l9_3551;
float l9_3556=0.0;
float l9_3557=1.0;
bool l9_3558=l9_3553;
float l9_3559=l9_3554;
float l9_3560=fast::clamp(l9_3555,l9_3556,l9_3557);
float l9_3561=step(abs(l9_3555-l9_3560),9.9999997e-06);
l9_3559*=(l9_3561+((1.0-float(l9_3558))*(1.0-l9_3561)));
l9_3555=l9_3560;
l9_3551=l9_3555;
l9_3554=l9_3559;
}
l9_3497.y=l9_3551;
l9_3507=l9_3554;
float2 l9_3562=l9_3497;
int l9_3563=l9_3495;
int l9_3564=l9_3496;
float l9_3565=l9_3505;
float2 l9_3566=l9_3562;
int l9_3567=l9_3563;
int l9_3568=l9_3564;
float3 l9_3569=float3(0.0);
if (l9_3567==0)
{
l9_3569=float3(l9_3566,0.0);
}
else
{
if (l9_3567==1)
{
l9_3569=float3(l9_3566.x,(l9_3566.y*0.5)+(0.5-(float(l9_3568)*0.5)),0.0);
}
else
{
l9_3569=float3(l9_3566,float(l9_3568));
}
}
float3 l9_3570=l9_3569;
float3 l9_3571=l9_3570;
float4 l9_3572=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_3571.xy,bias(l9_3565));
float4 l9_3573=l9_3572;
if (l9_3503)
{
l9_3573=mix(l9_3504,l9_3573,float4(l9_3507));
}
float4 l9_3574=l9_3573;
l9_3488=l9_3574;
l9_3466=l9_3488;
l9_3471=l9_3466;
}
else
{
float2 l9_3575=float2(0.0);
l9_3575=l9_3468.Surface_UVCoord0;
float2 l9_3576=float2(0.0);
float2 l9_3577=(*sc_set0.UserUniforms).patternScaleId01;
l9_3576=l9_3577;
float2 l9_3578=float2(0.0);
l9_3578=((l9_3575-(*sc_set0.UserUniforms).Port_Center_N122)*l9_3576)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_3579=float2(0.0);
float2 l9_3580=(*sc_set0.UserUniforms).patternOffsetId01;
l9_3579=l9_3580;
float2 l9_3581=float2(0.0);
l9_3581=l9_3578+l9_3579;
float l9_3582=0.0;
float l9_3583=(*sc_set0.UserUniforms).patternRotateId01;
l9_3582=l9_3583;
float2 l9_3584=float2(0.0);
float2 l9_3585=l9_3581;
float l9_3586=l9_3582;
float2 l9_3587=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_3588=sin(radians(l9_3586));
float l9_3589=cos(radians(l9_3586));
float2 l9_3590=l9_3585-l9_3587;
l9_3590=float2(dot(float2(l9_3589,l9_3588),l9_3590),dot(float2(-l9_3588,l9_3589),l9_3590))+l9_3587;
l9_3584=l9_3590;
float4 l9_3591=float4(0.0);
int l9_3592;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_3593=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3593=0;
}
else
{
l9_3593=in.varStereoViewID;
}
int l9_3594=l9_3593;
l9_3592=1-l9_3594;
}
else
{
int l9_3595=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3595=0;
}
else
{
l9_3595=in.varStereoViewID;
}
int l9_3596=l9_3595;
l9_3592=l9_3596;
}
int l9_3597=l9_3592;
int l9_3598=patternTextureId01Layout_tmp;
int l9_3599=l9_3597;
float2 l9_3600=l9_3584;
bool l9_3601=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_3602=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_3603=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_3604=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_3605=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_3606=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_3607=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_3608=0.0;
bool l9_3609=l9_3606&&(!l9_3604);
float l9_3610=1.0;
float l9_3611=l9_3600.x;
int l9_3612=l9_3603.x;
if (l9_3612==1)
{
l9_3611=fract(l9_3611);
}
else
{
if (l9_3612==2)
{
float l9_3613=fract(l9_3611);
float l9_3614=l9_3611-l9_3613;
float l9_3615=step(0.25,fract(l9_3614*0.5));
l9_3611=mix(l9_3613,1.0-l9_3613,fast::clamp(l9_3615,0.0,1.0));
}
}
l9_3600.x=l9_3611;
float l9_3616=l9_3600.y;
int l9_3617=l9_3603.y;
if (l9_3617==1)
{
l9_3616=fract(l9_3616);
}
else
{
if (l9_3617==2)
{
float l9_3618=fract(l9_3616);
float l9_3619=l9_3616-l9_3618;
float l9_3620=step(0.25,fract(l9_3619*0.5));
l9_3616=mix(l9_3618,1.0-l9_3618,fast::clamp(l9_3620,0.0,1.0));
}
}
l9_3600.y=l9_3616;
if (l9_3604)
{
bool l9_3621=l9_3606;
bool l9_3622;
if (l9_3621)
{
l9_3622=l9_3603.x==3;
}
else
{
l9_3622=l9_3621;
}
float l9_3623=l9_3600.x;
float l9_3624=l9_3605.x;
float l9_3625=l9_3605.z;
bool l9_3626=l9_3622;
float l9_3627=l9_3610;
float l9_3628=fast::clamp(l9_3623,l9_3624,l9_3625);
float l9_3629=step(abs(l9_3623-l9_3628),9.9999997e-06);
l9_3627*=(l9_3629+((1.0-float(l9_3626))*(1.0-l9_3629)));
l9_3623=l9_3628;
l9_3600.x=l9_3623;
l9_3610=l9_3627;
bool l9_3630=l9_3606;
bool l9_3631;
if (l9_3630)
{
l9_3631=l9_3603.y==3;
}
else
{
l9_3631=l9_3630;
}
float l9_3632=l9_3600.y;
float l9_3633=l9_3605.y;
float l9_3634=l9_3605.w;
bool l9_3635=l9_3631;
float l9_3636=l9_3610;
float l9_3637=fast::clamp(l9_3632,l9_3633,l9_3634);
float l9_3638=step(abs(l9_3632-l9_3637),9.9999997e-06);
l9_3636*=(l9_3638+((1.0-float(l9_3635))*(1.0-l9_3638)));
l9_3632=l9_3637;
l9_3600.y=l9_3632;
l9_3610=l9_3636;
}
float2 l9_3639=l9_3600;
bool l9_3640=l9_3601;
float3x3 l9_3641=l9_3602;
if (l9_3640)
{
l9_3639=float2((l9_3641*float3(l9_3639,1.0)).xy);
}
float2 l9_3642=l9_3639;
l9_3600=l9_3642;
float l9_3643=l9_3600.x;
int l9_3644=l9_3603.x;
bool l9_3645=l9_3609;
float l9_3646=l9_3610;
if ((l9_3644==0)||(l9_3644==3))
{
float l9_3647=l9_3643;
float l9_3648=0.0;
float l9_3649=1.0;
bool l9_3650=l9_3645;
float l9_3651=l9_3646;
float l9_3652=fast::clamp(l9_3647,l9_3648,l9_3649);
float l9_3653=step(abs(l9_3647-l9_3652),9.9999997e-06);
l9_3651*=(l9_3653+((1.0-float(l9_3650))*(1.0-l9_3653)));
l9_3647=l9_3652;
l9_3643=l9_3647;
l9_3646=l9_3651;
}
l9_3600.x=l9_3643;
l9_3610=l9_3646;
float l9_3654=l9_3600.y;
int l9_3655=l9_3603.y;
bool l9_3656=l9_3609;
float l9_3657=l9_3610;
if ((l9_3655==0)||(l9_3655==3))
{
float l9_3658=l9_3654;
float l9_3659=0.0;
float l9_3660=1.0;
bool l9_3661=l9_3656;
float l9_3662=l9_3657;
float l9_3663=fast::clamp(l9_3658,l9_3659,l9_3660);
float l9_3664=step(abs(l9_3658-l9_3663),9.9999997e-06);
l9_3662*=(l9_3664+((1.0-float(l9_3661))*(1.0-l9_3664)));
l9_3658=l9_3663;
l9_3654=l9_3658;
l9_3657=l9_3662;
}
l9_3600.y=l9_3654;
l9_3610=l9_3657;
float2 l9_3665=l9_3600;
int l9_3666=l9_3598;
int l9_3667=l9_3599;
float l9_3668=l9_3608;
float2 l9_3669=l9_3665;
int l9_3670=l9_3666;
int l9_3671=l9_3667;
float3 l9_3672=float3(0.0);
if (l9_3670==0)
{
l9_3672=float3(l9_3669,0.0);
}
else
{
if (l9_3670==1)
{
l9_3672=float3(l9_3669.x,(l9_3669.y*0.5)+(0.5-(float(l9_3671)*0.5)),0.0);
}
else
{
l9_3672=float3(l9_3669,float(l9_3671));
}
}
float3 l9_3673=l9_3672;
float3 l9_3674=l9_3673;
float4 l9_3675=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_3674.xy,bias(l9_3668));
float4 l9_3676=l9_3675;
if (l9_3606)
{
l9_3676=mix(l9_3607,l9_3676,float4(l9_3610));
}
float4 l9_3677=l9_3676;
l9_3591=l9_3677;
float l9_3678=0.0;
float3 l9_3679=l9_3591.xyz;
float l9_3680=l9_3679.x;
l9_3678=l9_3680;
l9_3467=float4(l9_3678);
l9_3471=l9_3467;
}
l9_3464=l9_3471;
float4 l9_3681=float4(0.0);
l9_3681=l9_3462*l9_3464;
l9_3456=l9_3681;
l9_3461=l9_3456;
}
else
{
float4 l9_3682=float4(0.0);
float4 l9_3683=(*sc_set0.UserUniforms).colorId01;
l9_3682=l9_3683;
float2 l9_3684=float2(0.0);
l9_3684=l9_3458.Surface_UVCoord0;
float4 l9_3685=float4(0.0);
int l9_3686;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_3687=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3687=0;
}
else
{
l9_3687=in.varStereoViewID;
}
int l9_3688=l9_3687;
l9_3686=1-l9_3688;
}
else
{
int l9_3689=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3689=0;
}
else
{
l9_3689=in.varStereoViewID;
}
int l9_3690=l9_3689;
l9_3686=l9_3690;
}
int l9_3691=l9_3686;
int l9_3692=greyMaskIdLayout_tmp;
int l9_3693=l9_3691;
float2 l9_3694=l9_3684;
bool l9_3695=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_3696=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_3697=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_3698=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_3699=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_3700=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_3701=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_3702=0.0;
bool l9_3703=l9_3700&&(!l9_3698);
float l9_3704=1.0;
float l9_3705=l9_3694.x;
int l9_3706=l9_3697.x;
if (l9_3706==1)
{
l9_3705=fract(l9_3705);
}
else
{
if (l9_3706==2)
{
float l9_3707=fract(l9_3705);
float l9_3708=l9_3705-l9_3707;
float l9_3709=step(0.25,fract(l9_3708*0.5));
l9_3705=mix(l9_3707,1.0-l9_3707,fast::clamp(l9_3709,0.0,1.0));
}
}
l9_3694.x=l9_3705;
float l9_3710=l9_3694.y;
int l9_3711=l9_3697.y;
if (l9_3711==1)
{
l9_3710=fract(l9_3710);
}
else
{
if (l9_3711==2)
{
float l9_3712=fract(l9_3710);
float l9_3713=l9_3710-l9_3712;
float l9_3714=step(0.25,fract(l9_3713*0.5));
l9_3710=mix(l9_3712,1.0-l9_3712,fast::clamp(l9_3714,0.0,1.0));
}
}
l9_3694.y=l9_3710;
if (l9_3698)
{
bool l9_3715=l9_3700;
bool l9_3716;
if (l9_3715)
{
l9_3716=l9_3697.x==3;
}
else
{
l9_3716=l9_3715;
}
float l9_3717=l9_3694.x;
float l9_3718=l9_3699.x;
float l9_3719=l9_3699.z;
bool l9_3720=l9_3716;
float l9_3721=l9_3704;
float l9_3722=fast::clamp(l9_3717,l9_3718,l9_3719);
float l9_3723=step(abs(l9_3717-l9_3722),9.9999997e-06);
l9_3721*=(l9_3723+((1.0-float(l9_3720))*(1.0-l9_3723)));
l9_3717=l9_3722;
l9_3694.x=l9_3717;
l9_3704=l9_3721;
bool l9_3724=l9_3700;
bool l9_3725;
if (l9_3724)
{
l9_3725=l9_3697.y==3;
}
else
{
l9_3725=l9_3724;
}
float l9_3726=l9_3694.y;
float l9_3727=l9_3699.y;
float l9_3728=l9_3699.w;
bool l9_3729=l9_3725;
float l9_3730=l9_3704;
float l9_3731=fast::clamp(l9_3726,l9_3727,l9_3728);
float l9_3732=step(abs(l9_3726-l9_3731),9.9999997e-06);
l9_3730*=(l9_3732+((1.0-float(l9_3729))*(1.0-l9_3732)));
l9_3726=l9_3731;
l9_3694.y=l9_3726;
l9_3704=l9_3730;
}
float2 l9_3733=l9_3694;
bool l9_3734=l9_3695;
float3x3 l9_3735=l9_3696;
if (l9_3734)
{
l9_3733=float2((l9_3735*float3(l9_3733,1.0)).xy);
}
float2 l9_3736=l9_3733;
l9_3694=l9_3736;
float l9_3737=l9_3694.x;
int l9_3738=l9_3697.x;
bool l9_3739=l9_3703;
float l9_3740=l9_3704;
if ((l9_3738==0)||(l9_3738==3))
{
float l9_3741=l9_3737;
float l9_3742=0.0;
float l9_3743=1.0;
bool l9_3744=l9_3739;
float l9_3745=l9_3740;
float l9_3746=fast::clamp(l9_3741,l9_3742,l9_3743);
float l9_3747=step(abs(l9_3741-l9_3746),9.9999997e-06);
l9_3745*=(l9_3747+((1.0-float(l9_3744))*(1.0-l9_3747)));
l9_3741=l9_3746;
l9_3737=l9_3741;
l9_3740=l9_3745;
}
l9_3694.x=l9_3737;
l9_3704=l9_3740;
float l9_3748=l9_3694.y;
int l9_3749=l9_3697.y;
bool l9_3750=l9_3703;
float l9_3751=l9_3704;
if ((l9_3749==0)||(l9_3749==3))
{
float l9_3752=l9_3748;
float l9_3753=0.0;
float l9_3754=1.0;
bool l9_3755=l9_3750;
float l9_3756=l9_3751;
float l9_3757=fast::clamp(l9_3752,l9_3753,l9_3754);
float l9_3758=step(abs(l9_3752-l9_3757),9.9999997e-06);
l9_3756*=(l9_3758+((1.0-float(l9_3755))*(1.0-l9_3758)));
l9_3752=l9_3757;
l9_3748=l9_3752;
l9_3751=l9_3756;
}
l9_3694.y=l9_3748;
l9_3704=l9_3751;
float2 l9_3759=l9_3694;
int l9_3760=l9_3692;
int l9_3761=l9_3693;
float l9_3762=l9_3702;
float2 l9_3763=l9_3759;
int l9_3764=l9_3760;
int l9_3765=l9_3761;
float3 l9_3766=float3(0.0);
if (l9_3764==0)
{
l9_3766=float3(l9_3763,0.0);
}
else
{
if (l9_3764==1)
{
l9_3766=float3(l9_3763.x,(l9_3763.y*0.5)+(0.5-(float(l9_3765)*0.5)),0.0);
}
else
{
l9_3766=float3(l9_3763,float(l9_3765));
}
}
float3 l9_3767=l9_3766;
float3 l9_3768=l9_3767;
float4 l9_3769=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_3768.xy,bias(l9_3762));
float4 l9_3770=l9_3769;
if (l9_3700)
{
l9_3770=mix(l9_3701,l9_3770,float4(l9_3704));
}
float4 l9_3771=l9_3770;
l9_3685=l9_3771;
float l9_3772=0.0;
l9_3772=l9_3685.x;
float l9_3773=0.0;
l9_3773=step(l9_3772,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_3774=float4(0.0);
l9_3774=l9_3682*float4(l9_3773);
l9_3457=l9_3774;
l9_3461=l9_3457;
}
l9_3454=l9_3461;
float2 l9_3775=float2(0.0);
l9_3775=l9_3016.Surface_UVCoord0;
float4 l9_3776=float4(0.0);
int l9_3777;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_3778=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3778=0;
}
else
{
l9_3778=in.varStereoViewID;
}
int l9_3779=l9_3778;
l9_3777=1-l9_3779;
}
else
{
int l9_3780=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3780=0;
}
else
{
l9_3780=in.varStereoViewID;
}
int l9_3781=l9_3780;
l9_3777=l9_3781;
}
int l9_3782=l9_3777;
int l9_3783=greyMaskIdLayout_tmp;
int l9_3784=l9_3782;
float2 l9_3785=l9_3775;
bool l9_3786=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_3787=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_3788=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_3789=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_3790=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_3791=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_3792=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_3793=0.0;
bool l9_3794=l9_3791&&(!l9_3789);
float l9_3795=1.0;
float l9_3796=l9_3785.x;
int l9_3797=l9_3788.x;
if (l9_3797==1)
{
l9_3796=fract(l9_3796);
}
else
{
if (l9_3797==2)
{
float l9_3798=fract(l9_3796);
float l9_3799=l9_3796-l9_3798;
float l9_3800=step(0.25,fract(l9_3799*0.5));
l9_3796=mix(l9_3798,1.0-l9_3798,fast::clamp(l9_3800,0.0,1.0));
}
}
l9_3785.x=l9_3796;
float l9_3801=l9_3785.y;
int l9_3802=l9_3788.y;
if (l9_3802==1)
{
l9_3801=fract(l9_3801);
}
else
{
if (l9_3802==2)
{
float l9_3803=fract(l9_3801);
float l9_3804=l9_3801-l9_3803;
float l9_3805=step(0.25,fract(l9_3804*0.5));
l9_3801=mix(l9_3803,1.0-l9_3803,fast::clamp(l9_3805,0.0,1.0));
}
}
l9_3785.y=l9_3801;
if (l9_3789)
{
bool l9_3806=l9_3791;
bool l9_3807;
if (l9_3806)
{
l9_3807=l9_3788.x==3;
}
else
{
l9_3807=l9_3806;
}
float l9_3808=l9_3785.x;
float l9_3809=l9_3790.x;
float l9_3810=l9_3790.z;
bool l9_3811=l9_3807;
float l9_3812=l9_3795;
float l9_3813=fast::clamp(l9_3808,l9_3809,l9_3810);
float l9_3814=step(abs(l9_3808-l9_3813),9.9999997e-06);
l9_3812*=(l9_3814+((1.0-float(l9_3811))*(1.0-l9_3814)));
l9_3808=l9_3813;
l9_3785.x=l9_3808;
l9_3795=l9_3812;
bool l9_3815=l9_3791;
bool l9_3816;
if (l9_3815)
{
l9_3816=l9_3788.y==3;
}
else
{
l9_3816=l9_3815;
}
float l9_3817=l9_3785.y;
float l9_3818=l9_3790.y;
float l9_3819=l9_3790.w;
bool l9_3820=l9_3816;
float l9_3821=l9_3795;
float l9_3822=fast::clamp(l9_3817,l9_3818,l9_3819);
float l9_3823=step(abs(l9_3817-l9_3822),9.9999997e-06);
l9_3821*=(l9_3823+((1.0-float(l9_3820))*(1.0-l9_3823)));
l9_3817=l9_3822;
l9_3785.y=l9_3817;
l9_3795=l9_3821;
}
float2 l9_3824=l9_3785;
bool l9_3825=l9_3786;
float3x3 l9_3826=l9_3787;
if (l9_3825)
{
l9_3824=float2((l9_3826*float3(l9_3824,1.0)).xy);
}
float2 l9_3827=l9_3824;
l9_3785=l9_3827;
float l9_3828=l9_3785.x;
int l9_3829=l9_3788.x;
bool l9_3830=l9_3794;
float l9_3831=l9_3795;
if ((l9_3829==0)||(l9_3829==3))
{
float l9_3832=l9_3828;
float l9_3833=0.0;
float l9_3834=1.0;
bool l9_3835=l9_3830;
float l9_3836=l9_3831;
float l9_3837=fast::clamp(l9_3832,l9_3833,l9_3834);
float l9_3838=step(abs(l9_3832-l9_3837),9.9999997e-06);
l9_3836*=(l9_3838+((1.0-float(l9_3835))*(1.0-l9_3838)));
l9_3832=l9_3837;
l9_3828=l9_3832;
l9_3831=l9_3836;
}
l9_3785.x=l9_3828;
l9_3795=l9_3831;
float l9_3839=l9_3785.y;
int l9_3840=l9_3788.y;
bool l9_3841=l9_3794;
float l9_3842=l9_3795;
if ((l9_3840==0)||(l9_3840==3))
{
float l9_3843=l9_3839;
float l9_3844=0.0;
float l9_3845=1.0;
bool l9_3846=l9_3841;
float l9_3847=l9_3842;
float l9_3848=fast::clamp(l9_3843,l9_3844,l9_3845);
float l9_3849=step(abs(l9_3843-l9_3848),9.9999997e-06);
l9_3847*=(l9_3849+((1.0-float(l9_3846))*(1.0-l9_3849)));
l9_3843=l9_3848;
l9_3839=l9_3843;
l9_3842=l9_3847;
}
l9_3785.y=l9_3839;
l9_3795=l9_3842;
float2 l9_3850=l9_3785;
int l9_3851=l9_3783;
int l9_3852=l9_3784;
float l9_3853=l9_3793;
float2 l9_3854=l9_3850;
int l9_3855=l9_3851;
int l9_3856=l9_3852;
float3 l9_3857=float3(0.0);
if (l9_3855==0)
{
l9_3857=float3(l9_3854,0.0);
}
else
{
if (l9_3855==1)
{
l9_3857=float3(l9_3854.x,(l9_3854.y*0.5)+(0.5-(float(l9_3856)*0.5)),0.0);
}
else
{
l9_3857=float3(l9_3854,float(l9_3856));
}
}
float3 l9_3858=l9_3857;
float3 l9_3859=l9_3858;
float4 l9_3860=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_3859.xy,bias(l9_3853));
float4 l9_3861=l9_3860;
if (l9_3791)
{
l9_3861=mix(l9_3792,l9_3861,float4(l9_3795));
}
float4 l9_3862=l9_3861;
l9_3776=l9_3862;
float l9_3863=0.0;
l9_3863=l9_3776.x;
float l9_3864=0.0;
l9_3864=step(l9_3863,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_3865=float4(0.0);
l9_3865=l9_3454*float4(l9_3864);
float4 l9_3866=float4(0.0);
float4 l9_3867=(*sc_set0.UserUniforms).colorId01;
l9_3866=l9_3867;
float4 l9_3868=float4(0.0);
l9_3868=l9_3866*float4(l9_3864);
float4 l9_3869=float4(0.0);
float4 l9_3870=l9_3865;
float4 l9_3871=l9_3868;
float4 l9_3872=l9_3870;
float4 l9_3873=l9_3871;
float3 l9_3874=l9_3872.xyz*l9_3872.w;
l9_3872=float4(l9_3874.x,l9_3874.y,l9_3874.z,l9_3872.w);
float4 l9_3875=l9_3872+(l9_3873*(1.0-l9_3872.w));
l9_3869=l9_3875;
l9_3015=l9_3869;
l9_3019=l9_3015;
}
l9_3012=l9_3019;
l9_2115=l9_3012;
l9_2119=l9_2115;
}
l9_2112=l9_2119;
float2 l9_3876=float2(0.0);
l9_3876=param_32.Surface_UVCoord0;
float4 l9_3877=float4(0.0);
int l9_3878;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_3879=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3879=0;
}
else
{
l9_3879=in.varStereoViewID;
}
int l9_3880=l9_3879;
l9_3878=1-l9_3880;
}
else
{
int l9_3881=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3881=0;
}
else
{
l9_3881=in.varStereoViewID;
}
int l9_3882=l9_3881;
l9_3878=l9_3882;
}
int l9_3883=l9_3878;
int l9_3884=greyMaskIdLayout_tmp;
int l9_3885=l9_3883;
float2 l9_3886=l9_3876;
bool l9_3887=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_3888=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_3889=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_3890=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_3891=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_3892=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_3893=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_3894=0.0;
bool l9_3895=l9_3892&&(!l9_3890);
float l9_3896=1.0;
float l9_3897=l9_3886.x;
int l9_3898=l9_3889.x;
if (l9_3898==1)
{
l9_3897=fract(l9_3897);
}
else
{
if (l9_3898==2)
{
float l9_3899=fract(l9_3897);
float l9_3900=l9_3897-l9_3899;
float l9_3901=step(0.25,fract(l9_3900*0.5));
l9_3897=mix(l9_3899,1.0-l9_3899,fast::clamp(l9_3901,0.0,1.0));
}
}
l9_3886.x=l9_3897;
float l9_3902=l9_3886.y;
int l9_3903=l9_3889.y;
if (l9_3903==1)
{
l9_3902=fract(l9_3902);
}
else
{
if (l9_3903==2)
{
float l9_3904=fract(l9_3902);
float l9_3905=l9_3902-l9_3904;
float l9_3906=step(0.25,fract(l9_3905*0.5));
l9_3902=mix(l9_3904,1.0-l9_3904,fast::clamp(l9_3906,0.0,1.0));
}
}
l9_3886.y=l9_3902;
if (l9_3890)
{
bool l9_3907=l9_3892;
bool l9_3908;
if (l9_3907)
{
l9_3908=l9_3889.x==3;
}
else
{
l9_3908=l9_3907;
}
float l9_3909=l9_3886.x;
float l9_3910=l9_3891.x;
float l9_3911=l9_3891.z;
bool l9_3912=l9_3908;
float l9_3913=l9_3896;
float l9_3914=fast::clamp(l9_3909,l9_3910,l9_3911);
float l9_3915=step(abs(l9_3909-l9_3914),9.9999997e-06);
l9_3913*=(l9_3915+((1.0-float(l9_3912))*(1.0-l9_3915)));
l9_3909=l9_3914;
l9_3886.x=l9_3909;
l9_3896=l9_3913;
bool l9_3916=l9_3892;
bool l9_3917;
if (l9_3916)
{
l9_3917=l9_3889.y==3;
}
else
{
l9_3917=l9_3916;
}
float l9_3918=l9_3886.y;
float l9_3919=l9_3891.y;
float l9_3920=l9_3891.w;
bool l9_3921=l9_3917;
float l9_3922=l9_3896;
float l9_3923=fast::clamp(l9_3918,l9_3919,l9_3920);
float l9_3924=step(abs(l9_3918-l9_3923),9.9999997e-06);
l9_3922*=(l9_3924+((1.0-float(l9_3921))*(1.0-l9_3924)));
l9_3918=l9_3923;
l9_3886.y=l9_3918;
l9_3896=l9_3922;
}
float2 l9_3925=l9_3886;
bool l9_3926=l9_3887;
float3x3 l9_3927=l9_3888;
if (l9_3926)
{
l9_3925=float2((l9_3927*float3(l9_3925,1.0)).xy);
}
float2 l9_3928=l9_3925;
l9_3886=l9_3928;
float l9_3929=l9_3886.x;
int l9_3930=l9_3889.x;
bool l9_3931=l9_3895;
float l9_3932=l9_3896;
if ((l9_3930==0)||(l9_3930==3))
{
float l9_3933=l9_3929;
float l9_3934=0.0;
float l9_3935=1.0;
bool l9_3936=l9_3931;
float l9_3937=l9_3932;
float l9_3938=fast::clamp(l9_3933,l9_3934,l9_3935);
float l9_3939=step(abs(l9_3933-l9_3938),9.9999997e-06);
l9_3937*=(l9_3939+((1.0-float(l9_3936))*(1.0-l9_3939)));
l9_3933=l9_3938;
l9_3929=l9_3933;
l9_3932=l9_3937;
}
l9_3886.x=l9_3929;
l9_3896=l9_3932;
float l9_3940=l9_3886.y;
int l9_3941=l9_3889.y;
bool l9_3942=l9_3895;
float l9_3943=l9_3896;
if ((l9_3941==0)||(l9_3941==3))
{
float l9_3944=l9_3940;
float l9_3945=0.0;
float l9_3946=1.0;
bool l9_3947=l9_3942;
float l9_3948=l9_3943;
float l9_3949=fast::clamp(l9_3944,l9_3945,l9_3946);
float l9_3950=step(abs(l9_3944-l9_3949),9.9999997e-06);
l9_3948*=(l9_3950+((1.0-float(l9_3947))*(1.0-l9_3950)));
l9_3944=l9_3949;
l9_3940=l9_3944;
l9_3943=l9_3948;
}
l9_3886.y=l9_3940;
l9_3896=l9_3943;
float2 l9_3951=l9_3886;
int l9_3952=l9_3884;
int l9_3953=l9_3885;
float l9_3954=l9_3894;
float2 l9_3955=l9_3951;
int l9_3956=l9_3952;
int l9_3957=l9_3953;
float3 l9_3958=float3(0.0);
if (l9_3956==0)
{
l9_3958=float3(l9_3955,0.0);
}
else
{
if (l9_3956==1)
{
l9_3958=float3(l9_3955.x,(l9_3955.y*0.5)+(0.5-(float(l9_3957)*0.5)),0.0);
}
else
{
l9_3958=float3(l9_3955,float(l9_3957));
}
}
float3 l9_3959=l9_3958;
float3 l9_3960=l9_3959;
float4 l9_3961=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_3960.xy,bias(l9_3954));
float4 l9_3962=l9_3961;
if (l9_3892)
{
l9_3962=mix(l9_3893,l9_3962,float4(l9_3896));
}
float4 l9_3963=l9_3962;
l9_3877=l9_3963;
float l9_3964=0.0;
l9_3964=l9_3877.x;
float l9_3965=0.0;
l9_3965=step(l9_3964,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_3966=float4(0.0);
l9_3966=l9_2112*float4(l9_3965);
float4 l9_3967=float4(0.0);
float4 l9_3968=l9_2111;
float4 l9_3969=l9_3966;
float4 l9_3970=l9_3968;
float4 l9_3971=l9_3969;
float3 l9_3972=l9_3970.xyz*l9_3970.w;
l9_3970=float4(l9_3972.x,l9_3972.y,l9_3972.z,l9_3970.w);
float4 l9_3973=l9_3970+(l9_3971*(1.0-l9_3970.w));
l9_3967=l9_3973;
param_29=l9_3967;
param_31=param_29;
}
else
{
float4 l9_3974=float4(0.0);
float l9_3975=0.0;
float4 l9_3976=float4(0.0);
float4 l9_3977=float4(0.0);
ssGlobals l9_3978=param_32;
float l9_3979=0.0;
float l9_3980=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
l9_3979=l9_3980;
l9_3975=l9_3979;
float4 l9_3981;
if ((l9_3975*1.0)!=0.0)
{
float4 l9_3982=float4(0.0);
float l9_3983=0.0;
float4 l9_3984=float4(0.0);
float4 l9_3985=float4(0.0);
ssGlobals l9_3986=l9_3978;
float l9_3987=0.0;
float l9_3988=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_3987=l9_3988;
l9_3983=l9_3987;
float4 l9_3989;
if ((l9_3983*1.0)!=0.0)
{
float l9_3990=0.0;
float l9_3991=(*sc_set0.UserUniforms).rimExpId01;
l9_3990=l9_3991;
float l9_3992=0.0;
float l9_3993=(*sc_set0.UserUniforms).rimIntId01;
l9_3992=l9_3993;
float l9_3994=0.0;
float l9_3995=l9_3990;
float l9_3996=l9_3992;
ssGlobals l9_3997=l9_3986;
float l9_3998=abs(dot(-l9_3997.ViewDirWS,l9_3997.VertexNormal_WorldSpace));
float l9_3999=1.0-pow(1.0-l9_3998,l9_3995);
l9_3999=fast::max(l9_3999,0.0);
l9_3999*=l9_3996;
l9_3994=l9_3999;
float4 l9_4000=float4(0.0);
float l9_4001=0.0;
float4 l9_4002=float4(0.0);
float4 l9_4003=float4(0.0);
ssGlobals l9_4004=l9_3986;
float l9_4005=0.0;
float l9_4006=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_4005=l9_4006;
l9_4001=l9_4005;
float4 l9_4007;
if ((l9_4001*1.0)!=0.0)
{
float4 l9_4008=float4(0.0);
float4 l9_4009=(*sc_set0.UserUniforms).patternColorId01;
l9_4008=l9_4009;
float4 l9_4010=float4(0.0);
float l9_4011=0.0;
float4 l9_4012=float4(0.0);
float4 l9_4013=float4(0.0);
ssGlobals l9_4014=l9_4004;
float l9_4015=0.0;
float l9_4016=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_4015=l9_4016;
l9_4011=l9_4015;
float4 l9_4017;
if ((l9_4011*1.0)!=0.0)
{
float2 l9_4018=float2(0.0);
l9_4018=l9_4014.Surface_UVCoord0;
float2 l9_4019=float2(0.0);
float2 l9_4020=(*sc_set0.UserUniforms).patternScaleId01;
l9_4019=l9_4020;
float2 l9_4021=float2(0.0);
l9_4021=((l9_4018-(*sc_set0.UserUniforms).Port_Center_N122)*l9_4019)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_4022=float2(0.0);
float2 l9_4023=(*sc_set0.UserUniforms).patternOffsetId01;
l9_4022=l9_4023;
float2 l9_4024=float2(0.0);
l9_4024=l9_4021+l9_4022;
float l9_4025=0.0;
float l9_4026=(*sc_set0.UserUniforms).patternRotateId01;
l9_4025=l9_4026;
float2 l9_4027=float2(0.0);
float2 l9_4028=l9_4024;
float l9_4029=l9_4025;
float2 l9_4030=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_4031=sin(radians(l9_4029));
float l9_4032=cos(radians(l9_4029));
float2 l9_4033=l9_4028-l9_4030;
l9_4033=float2(dot(float2(l9_4032,l9_4031),l9_4033),dot(float2(-l9_4031,l9_4032),l9_4033))+l9_4030;
l9_4027=l9_4033;
float4 l9_4034=float4(0.0);
int l9_4035;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_4036=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4036=0;
}
else
{
l9_4036=in.varStereoViewID;
}
int l9_4037=l9_4036;
l9_4035=1-l9_4037;
}
else
{
int l9_4038=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4038=0;
}
else
{
l9_4038=in.varStereoViewID;
}
int l9_4039=l9_4038;
l9_4035=l9_4039;
}
int l9_4040=l9_4035;
int l9_4041=patternTextureId01Layout_tmp;
int l9_4042=l9_4040;
float2 l9_4043=l9_4027;
bool l9_4044=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_4045=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_4046=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_4047=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_4048=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_4049=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_4050=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_4051=0.0;
bool l9_4052=l9_4049&&(!l9_4047);
float l9_4053=1.0;
float l9_4054=l9_4043.x;
int l9_4055=l9_4046.x;
if (l9_4055==1)
{
l9_4054=fract(l9_4054);
}
else
{
if (l9_4055==2)
{
float l9_4056=fract(l9_4054);
float l9_4057=l9_4054-l9_4056;
float l9_4058=step(0.25,fract(l9_4057*0.5));
l9_4054=mix(l9_4056,1.0-l9_4056,fast::clamp(l9_4058,0.0,1.0));
}
}
l9_4043.x=l9_4054;
float l9_4059=l9_4043.y;
int l9_4060=l9_4046.y;
if (l9_4060==1)
{
l9_4059=fract(l9_4059);
}
else
{
if (l9_4060==2)
{
float l9_4061=fract(l9_4059);
float l9_4062=l9_4059-l9_4061;
float l9_4063=step(0.25,fract(l9_4062*0.5));
l9_4059=mix(l9_4061,1.0-l9_4061,fast::clamp(l9_4063,0.0,1.0));
}
}
l9_4043.y=l9_4059;
if (l9_4047)
{
bool l9_4064=l9_4049;
bool l9_4065;
if (l9_4064)
{
l9_4065=l9_4046.x==3;
}
else
{
l9_4065=l9_4064;
}
float l9_4066=l9_4043.x;
float l9_4067=l9_4048.x;
float l9_4068=l9_4048.z;
bool l9_4069=l9_4065;
float l9_4070=l9_4053;
float l9_4071=fast::clamp(l9_4066,l9_4067,l9_4068);
float l9_4072=step(abs(l9_4066-l9_4071),9.9999997e-06);
l9_4070*=(l9_4072+((1.0-float(l9_4069))*(1.0-l9_4072)));
l9_4066=l9_4071;
l9_4043.x=l9_4066;
l9_4053=l9_4070;
bool l9_4073=l9_4049;
bool l9_4074;
if (l9_4073)
{
l9_4074=l9_4046.y==3;
}
else
{
l9_4074=l9_4073;
}
float l9_4075=l9_4043.y;
float l9_4076=l9_4048.y;
float l9_4077=l9_4048.w;
bool l9_4078=l9_4074;
float l9_4079=l9_4053;
float l9_4080=fast::clamp(l9_4075,l9_4076,l9_4077);
float l9_4081=step(abs(l9_4075-l9_4080),9.9999997e-06);
l9_4079*=(l9_4081+((1.0-float(l9_4078))*(1.0-l9_4081)));
l9_4075=l9_4080;
l9_4043.y=l9_4075;
l9_4053=l9_4079;
}
float2 l9_4082=l9_4043;
bool l9_4083=l9_4044;
float3x3 l9_4084=l9_4045;
if (l9_4083)
{
l9_4082=float2((l9_4084*float3(l9_4082,1.0)).xy);
}
float2 l9_4085=l9_4082;
l9_4043=l9_4085;
float l9_4086=l9_4043.x;
int l9_4087=l9_4046.x;
bool l9_4088=l9_4052;
float l9_4089=l9_4053;
if ((l9_4087==0)||(l9_4087==3))
{
float l9_4090=l9_4086;
float l9_4091=0.0;
float l9_4092=1.0;
bool l9_4093=l9_4088;
float l9_4094=l9_4089;
float l9_4095=fast::clamp(l9_4090,l9_4091,l9_4092);
float l9_4096=step(abs(l9_4090-l9_4095),9.9999997e-06);
l9_4094*=(l9_4096+((1.0-float(l9_4093))*(1.0-l9_4096)));
l9_4090=l9_4095;
l9_4086=l9_4090;
l9_4089=l9_4094;
}
l9_4043.x=l9_4086;
l9_4053=l9_4089;
float l9_4097=l9_4043.y;
int l9_4098=l9_4046.y;
bool l9_4099=l9_4052;
float l9_4100=l9_4053;
if ((l9_4098==0)||(l9_4098==3))
{
float l9_4101=l9_4097;
float l9_4102=0.0;
float l9_4103=1.0;
bool l9_4104=l9_4099;
float l9_4105=l9_4100;
float l9_4106=fast::clamp(l9_4101,l9_4102,l9_4103);
float l9_4107=step(abs(l9_4101-l9_4106),9.9999997e-06);
l9_4105*=(l9_4107+((1.0-float(l9_4104))*(1.0-l9_4107)));
l9_4101=l9_4106;
l9_4097=l9_4101;
l9_4100=l9_4105;
}
l9_4043.y=l9_4097;
l9_4053=l9_4100;
float2 l9_4108=l9_4043;
int l9_4109=l9_4041;
int l9_4110=l9_4042;
float l9_4111=l9_4051;
float2 l9_4112=l9_4108;
int l9_4113=l9_4109;
int l9_4114=l9_4110;
float3 l9_4115=float3(0.0);
if (l9_4113==0)
{
l9_4115=float3(l9_4112,0.0);
}
else
{
if (l9_4113==1)
{
l9_4115=float3(l9_4112.x,(l9_4112.y*0.5)+(0.5-(float(l9_4114)*0.5)),0.0);
}
else
{
l9_4115=float3(l9_4112,float(l9_4114));
}
}
float3 l9_4116=l9_4115;
float3 l9_4117=l9_4116;
float4 l9_4118=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_4117.xy,bias(l9_4111));
float4 l9_4119=l9_4118;
if (l9_4049)
{
l9_4119=mix(l9_4050,l9_4119,float4(l9_4053));
}
float4 l9_4120=l9_4119;
l9_4034=l9_4120;
l9_4012=l9_4034;
l9_4017=l9_4012;
}
else
{
float2 l9_4121=float2(0.0);
l9_4121=l9_4014.Surface_UVCoord0;
float2 l9_4122=float2(0.0);
float2 l9_4123=(*sc_set0.UserUniforms).patternScaleId01;
l9_4122=l9_4123;
float2 l9_4124=float2(0.0);
l9_4124=((l9_4121-(*sc_set0.UserUniforms).Port_Center_N122)*l9_4122)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_4125=float2(0.0);
float2 l9_4126=(*sc_set0.UserUniforms).patternOffsetId01;
l9_4125=l9_4126;
float2 l9_4127=float2(0.0);
l9_4127=l9_4124+l9_4125;
float l9_4128=0.0;
float l9_4129=(*sc_set0.UserUniforms).patternRotateId01;
l9_4128=l9_4129;
float2 l9_4130=float2(0.0);
float2 l9_4131=l9_4127;
float l9_4132=l9_4128;
float2 l9_4133=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_4134=sin(radians(l9_4132));
float l9_4135=cos(radians(l9_4132));
float2 l9_4136=l9_4131-l9_4133;
l9_4136=float2(dot(float2(l9_4135,l9_4134),l9_4136),dot(float2(-l9_4134,l9_4135),l9_4136))+l9_4133;
l9_4130=l9_4136;
float4 l9_4137=float4(0.0);
int l9_4138;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_4139=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4139=0;
}
else
{
l9_4139=in.varStereoViewID;
}
int l9_4140=l9_4139;
l9_4138=1-l9_4140;
}
else
{
int l9_4141=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4141=0;
}
else
{
l9_4141=in.varStereoViewID;
}
int l9_4142=l9_4141;
l9_4138=l9_4142;
}
int l9_4143=l9_4138;
int l9_4144=patternTextureId01Layout_tmp;
int l9_4145=l9_4143;
float2 l9_4146=l9_4130;
bool l9_4147=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_4148=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_4149=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_4150=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_4151=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_4152=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_4153=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_4154=0.0;
bool l9_4155=l9_4152&&(!l9_4150);
float l9_4156=1.0;
float l9_4157=l9_4146.x;
int l9_4158=l9_4149.x;
if (l9_4158==1)
{
l9_4157=fract(l9_4157);
}
else
{
if (l9_4158==2)
{
float l9_4159=fract(l9_4157);
float l9_4160=l9_4157-l9_4159;
float l9_4161=step(0.25,fract(l9_4160*0.5));
l9_4157=mix(l9_4159,1.0-l9_4159,fast::clamp(l9_4161,0.0,1.0));
}
}
l9_4146.x=l9_4157;
float l9_4162=l9_4146.y;
int l9_4163=l9_4149.y;
if (l9_4163==1)
{
l9_4162=fract(l9_4162);
}
else
{
if (l9_4163==2)
{
float l9_4164=fract(l9_4162);
float l9_4165=l9_4162-l9_4164;
float l9_4166=step(0.25,fract(l9_4165*0.5));
l9_4162=mix(l9_4164,1.0-l9_4164,fast::clamp(l9_4166,0.0,1.0));
}
}
l9_4146.y=l9_4162;
if (l9_4150)
{
bool l9_4167=l9_4152;
bool l9_4168;
if (l9_4167)
{
l9_4168=l9_4149.x==3;
}
else
{
l9_4168=l9_4167;
}
float l9_4169=l9_4146.x;
float l9_4170=l9_4151.x;
float l9_4171=l9_4151.z;
bool l9_4172=l9_4168;
float l9_4173=l9_4156;
float l9_4174=fast::clamp(l9_4169,l9_4170,l9_4171);
float l9_4175=step(abs(l9_4169-l9_4174),9.9999997e-06);
l9_4173*=(l9_4175+((1.0-float(l9_4172))*(1.0-l9_4175)));
l9_4169=l9_4174;
l9_4146.x=l9_4169;
l9_4156=l9_4173;
bool l9_4176=l9_4152;
bool l9_4177;
if (l9_4176)
{
l9_4177=l9_4149.y==3;
}
else
{
l9_4177=l9_4176;
}
float l9_4178=l9_4146.y;
float l9_4179=l9_4151.y;
float l9_4180=l9_4151.w;
bool l9_4181=l9_4177;
float l9_4182=l9_4156;
float l9_4183=fast::clamp(l9_4178,l9_4179,l9_4180);
float l9_4184=step(abs(l9_4178-l9_4183),9.9999997e-06);
l9_4182*=(l9_4184+((1.0-float(l9_4181))*(1.0-l9_4184)));
l9_4178=l9_4183;
l9_4146.y=l9_4178;
l9_4156=l9_4182;
}
float2 l9_4185=l9_4146;
bool l9_4186=l9_4147;
float3x3 l9_4187=l9_4148;
if (l9_4186)
{
l9_4185=float2((l9_4187*float3(l9_4185,1.0)).xy);
}
float2 l9_4188=l9_4185;
l9_4146=l9_4188;
float l9_4189=l9_4146.x;
int l9_4190=l9_4149.x;
bool l9_4191=l9_4155;
float l9_4192=l9_4156;
if ((l9_4190==0)||(l9_4190==3))
{
float l9_4193=l9_4189;
float l9_4194=0.0;
float l9_4195=1.0;
bool l9_4196=l9_4191;
float l9_4197=l9_4192;
float l9_4198=fast::clamp(l9_4193,l9_4194,l9_4195);
float l9_4199=step(abs(l9_4193-l9_4198),9.9999997e-06);
l9_4197*=(l9_4199+((1.0-float(l9_4196))*(1.0-l9_4199)));
l9_4193=l9_4198;
l9_4189=l9_4193;
l9_4192=l9_4197;
}
l9_4146.x=l9_4189;
l9_4156=l9_4192;
float l9_4200=l9_4146.y;
int l9_4201=l9_4149.y;
bool l9_4202=l9_4155;
float l9_4203=l9_4156;
if ((l9_4201==0)||(l9_4201==3))
{
float l9_4204=l9_4200;
float l9_4205=0.0;
float l9_4206=1.0;
bool l9_4207=l9_4202;
float l9_4208=l9_4203;
float l9_4209=fast::clamp(l9_4204,l9_4205,l9_4206);
float l9_4210=step(abs(l9_4204-l9_4209),9.9999997e-06);
l9_4208*=(l9_4210+((1.0-float(l9_4207))*(1.0-l9_4210)));
l9_4204=l9_4209;
l9_4200=l9_4204;
l9_4203=l9_4208;
}
l9_4146.y=l9_4200;
l9_4156=l9_4203;
float2 l9_4211=l9_4146;
int l9_4212=l9_4144;
int l9_4213=l9_4145;
float l9_4214=l9_4154;
float2 l9_4215=l9_4211;
int l9_4216=l9_4212;
int l9_4217=l9_4213;
float3 l9_4218=float3(0.0);
if (l9_4216==0)
{
l9_4218=float3(l9_4215,0.0);
}
else
{
if (l9_4216==1)
{
l9_4218=float3(l9_4215.x,(l9_4215.y*0.5)+(0.5-(float(l9_4217)*0.5)),0.0);
}
else
{
l9_4218=float3(l9_4215,float(l9_4217));
}
}
float3 l9_4219=l9_4218;
float3 l9_4220=l9_4219;
float4 l9_4221=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_4220.xy,bias(l9_4214));
float4 l9_4222=l9_4221;
if (l9_4152)
{
l9_4222=mix(l9_4153,l9_4222,float4(l9_4156));
}
float4 l9_4223=l9_4222;
l9_4137=l9_4223;
float l9_4224=0.0;
float3 l9_4225=l9_4137.xyz;
float l9_4226=l9_4225.x;
l9_4224=l9_4226;
l9_4013=float4(l9_4224);
l9_4017=l9_4013;
}
l9_4010=l9_4017;
float4 l9_4227=float4(0.0);
l9_4227=l9_4008*l9_4010;
l9_4002=l9_4227;
l9_4007=l9_4002;
}
else
{
float4 l9_4228=float4(0.0);
float4 l9_4229=(*sc_set0.UserUniforms).colorId01;
l9_4228=l9_4229;
float2 l9_4230=float2(0.0);
l9_4230=l9_4004.Surface_UVCoord0;
float4 l9_4231=float4(0.0);
int l9_4232;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_4233=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4233=0;
}
else
{
l9_4233=in.varStereoViewID;
}
int l9_4234=l9_4233;
l9_4232=1-l9_4234;
}
else
{
int l9_4235=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4235=0;
}
else
{
l9_4235=in.varStereoViewID;
}
int l9_4236=l9_4235;
l9_4232=l9_4236;
}
int l9_4237=l9_4232;
int l9_4238=greyMaskIdLayout_tmp;
int l9_4239=l9_4237;
float2 l9_4240=l9_4230;
bool l9_4241=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_4242=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_4243=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_4244=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_4245=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_4246=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_4247=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_4248=0.0;
bool l9_4249=l9_4246&&(!l9_4244);
float l9_4250=1.0;
float l9_4251=l9_4240.x;
int l9_4252=l9_4243.x;
if (l9_4252==1)
{
l9_4251=fract(l9_4251);
}
else
{
if (l9_4252==2)
{
float l9_4253=fract(l9_4251);
float l9_4254=l9_4251-l9_4253;
float l9_4255=step(0.25,fract(l9_4254*0.5));
l9_4251=mix(l9_4253,1.0-l9_4253,fast::clamp(l9_4255,0.0,1.0));
}
}
l9_4240.x=l9_4251;
float l9_4256=l9_4240.y;
int l9_4257=l9_4243.y;
if (l9_4257==1)
{
l9_4256=fract(l9_4256);
}
else
{
if (l9_4257==2)
{
float l9_4258=fract(l9_4256);
float l9_4259=l9_4256-l9_4258;
float l9_4260=step(0.25,fract(l9_4259*0.5));
l9_4256=mix(l9_4258,1.0-l9_4258,fast::clamp(l9_4260,0.0,1.0));
}
}
l9_4240.y=l9_4256;
if (l9_4244)
{
bool l9_4261=l9_4246;
bool l9_4262;
if (l9_4261)
{
l9_4262=l9_4243.x==3;
}
else
{
l9_4262=l9_4261;
}
float l9_4263=l9_4240.x;
float l9_4264=l9_4245.x;
float l9_4265=l9_4245.z;
bool l9_4266=l9_4262;
float l9_4267=l9_4250;
float l9_4268=fast::clamp(l9_4263,l9_4264,l9_4265);
float l9_4269=step(abs(l9_4263-l9_4268),9.9999997e-06);
l9_4267*=(l9_4269+((1.0-float(l9_4266))*(1.0-l9_4269)));
l9_4263=l9_4268;
l9_4240.x=l9_4263;
l9_4250=l9_4267;
bool l9_4270=l9_4246;
bool l9_4271;
if (l9_4270)
{
l9_4271=l9_4243.y==3;
}
else
{
l9_4271=l9_4270;
}
float l9_4272=l9_4240.y;
float l9_4273=l9_4245.y;
float l9_4274=l9_4245.w;
bool l9_4275=l9_4271;
float l9_4276=l9_4250;
float l9_4277=fast::clamp(l9_4272,l9_4273,l9_4274);
float l9_4278=step(abs(l9_4272-l9_4277),9.9999997e-06);
l9_4276*=(l9_4278+((1.0-float(l9_4275))*(1.0-l9_4278)));
l9_4272=l9_4277;
l9_4240.y=l9_4272;
l9_4250=l9_4276;
}
float2 l9_4279=l9_4240;
bool l9_4280=l9_4241;
float3x3 l9_4281=l9_4242;
if (l9_4280)
{
l9_4279=float2((l9_4281*float3(l9_4279,1.0)).xy);
}
float2 l9_4282=l9_4279;
l9_4240=l9_4282;
float l9_4283=l9_4240.x;
int l9_4284=l9_4243.x;
bool l9_4285=l9_4249;
float l9_4286=l9_4250;
if ((l9_4284==0)||(l9_4284==3))
{
float l9_4287=l9_4283;
float l9_4288=0.0;
float l9_4289=1.0;
bool l9_4290=l9_4285;
float l9_4291=l9_4286;
float l9_4292=fast::clamp(l9_4287,l9_4288,l9_4289);
float l9_4293=step(abs(l9_4287-l9_4292),9.9999997e-06);
l9_4291*=(l9_4293+((1.0-float(l9_4290))*(1.0-l9_4293)));
l9_4287=l9_4292;
l9_4283=l9_4287;
l9_4286=l9_4291;
}
l9_4240.x=l9_4283;
l9_4250=l9_4286;
float l9_4294=l9_4240.y;
int l9_4295=l9_4243.y;
bool l9_4296=l9_4249;
float l9_4297=l9_4250;
if ((l9_4295==0)||(l9_4295==3))
{
float l9_4298=l9_4294;
float l9_4299=0.0;
float l9_4300=1.0;
bool l9_4301=l9_4296;
float l9_4302=l9_4297;
float l9_4303=fast::clamp(l9_4298,l9_4299,l9_4300);
float l9_4304=step(abs(l9_4298-l9_4303),9.9999997e-06);
l9_4302*=(l9_4304+((1.0-float(l9_4301))*(1.0-l9_4304)));
l9_4298=l9_4303;
l9_4294=l9_4298;
l9_4297=l9_4302;
}
l9_4240.y=l9_4294;
l9_4250=l9_4297;
float2 l9_4305=l9_4240;
int l9_4306=l9_4238;
int l9_4307=l9_4239;
float l9_4308=l9_4248;
float2 l9_4309=l9_4305;
int l9_4310=l9_4306;
int l9_4311=l9_4307;
float3 l9_4312=float3(0.0);
if (l9_4310==0)
{
l9_4312=float3(l9_4309,0.0);
}
else
{
if (l9_4310==1)
{
l9_4312=float3(l9_4309.x,(l9_4309.y*0.5)+(0.5-(float(l9_4311)*0.5)),0.0);
}
else
{
l9_4312=float3(l9_4309,float(l9_4311));
}
}
float3 l9_4313=l9_4312;
float3 l9_4314=l9_4313;
float4 l9_4315=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_4314.xy,bias(l9_4308));
float4 l9_4316=l9_4315;
if (l9_4246)
{
l9_4316=mix(l9_4247,l9_4316,float4(l9_4250));
}
float4 l9_4317=l9_4316;
l9_4231=l9_4317;
float l9_4318=0.0;
l9_4318=l9_4231.x;
float l9_4319=0.0;
l9_4319=step(l9_4318,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_4320=float4(0.0);
l9_4320=l9_4228*float4(l9_4319);
l9_4003=l9_4320;
l9_4007=l9_4003;
}
l9_4000=l9_4007;
float2 l9_4321=float2(0.0);
l9_4321=l9_3986.Surface_UVCoord0;
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
l9_4411=l9_4000*float4(l9_4410);
float4 l9_4412=float4(0.0);
float4 l9_4413=(*sc_set0.UserUniforms).colorId01;
l9_4412=l9_4413;
float4 l9_4414=float4(0.0);
l9_4414=l9_4412*float4(l9_4410);
float4 l9_4415=float4(0.0);
float4 l9_4416=l9_4411;
float4 l9_4417=l9_4414;
float4 l9_4418=l9_4416;
float4 l9_4419=l9_4417;
float3 l9_4420=l9_4418.xyz*l9_4418.w;
l9_4418=float4(l9_4420.x,l9_4420.y,l9_4420.z,l9_4418.w);
float4 l9_4421=l9_4418+(l9_4419*(1.0-l9_4418.w));
l9_4415=l9_4421;
float4 l9_4422=float4(0.0);
l9_4422=float4(l9_3994)*l9_4415;
float4 l9_4423=float4(0.0);
l9_4423=l9_4422+l9_4415;
l9_3984=l9_4423;
l9_3989=l9_3984;
}
else
{
float4 l9_4424=float4(0.0);
float l9_4425=0.0;
float4 l9_4426=float4(0.0);
float4 l9_4427=float4(0.0);
ssGlobals l9_4428=l9_3986;
float l9_4429=0.0;
float l9_4430=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_4429=l9_4430;
l9_4425=l9_4429;
float4 l9_4431;
if ((l9_4425*1.0)!=0.0)
{
float4 l9_4432=float4(0.0);
float4 l9_4433=(*sc_set0.UserUniforms).patternColorId01;
l9_4432=l9_4433;
float4 l9_4434=float4(0.0);
float l9_4435=0.0;
float4 l9_4436=float4(0.0);
float4 l9_4437=float4(0.0);
ssGlobals l9_4438=l9_4428;
float l9_4439=0.0;
float l9_4440=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_4439=l9_4440;
l9_4435=l9_4439;
float4 l9_4441;
if ((l9_4435*1.0)!=0.0)
{
float2 l9_4442=float2(0.0);
l9_4442=l9_4438.Surface_UVCoord0;
float2 l9_4443=float2(0.0);
float2 l9_4444=(*sc_set0.UserUniforms).patternScaleId01;
l9_4443=l9_4444;
float2 l9_4445=float2(0.0);
l9_4445=((l9_4442-(*sc_set0.UserUniforms).Port_Center_N122)*l9_4443)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_4446=float2(0.0);
float2 l9_4447=(*sc_set0.UserUniforms).patternOffsetId01;
l9_4446=l9_4447;
float2 l9_4448=float2(0.0);
l9_4448=l9_4445+l9_4446;
float l9_4449=0.0;
float l9_4450=(*sc_set0.UserUniforms).patternRotateId01;
l9_4449=l9_4450;
float2 l9_4451=float2(0.0);
float2 l9_4452=l9_4448;
float l9_4453=l9_4449;
float2 l9_4454=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_4455=sin(radians(l9_4453));
float l9_4456=cos(radians(l9_4453));
float2 l9_4457=l9_4452-l9_4454;
l9_4457=float2(dot(float2(l9_4456,l9_4455),l9_4457),dot(float2(-l9_4455,l9_4456),l9_4457))+l9_4454;
l9_4451=l9_4457;
float4 l9_4458=float4(0.0);
int l9_4459;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_4460=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4460=0;
}
else
{
l9_4460=in.varStereoViewID;
}
int l9_4461=l9_4460;
l9_4459=1-l9_4461;
}
else
{
int l9_4462=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4462=0;
}
else
{
l9_4462=in.varStereoViewID;
}
int l9_4463=l9_4462;
l9_4459=l9_4463;
}
int l9_4464=l9_4459;
int l9_4465=patternTextureId01Layout_tmp;
int l9_4466=l9_4464;
float2 l9_4467=l9_4451;
bool l9_4468=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_4469=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_4470=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_4471=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_4472=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_4473=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_4474=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_4475=0.0;
bool l9_4476=l9_4473&&(!l9_4471);
float l9_4477=1.0;
float l9_4478=l9_4467.x;
int l9_4479=l9_4470.x;
if (l9_4479==1)
{
l9_4478=fract(l9_4478);
}
else
{
if (l9_4479==2)
{
float l9_4480=fract(l9_4478);
float l9_4481=l9_4478-l9_4480;
float l9_4482=step(0.25,fract(l9_4481*0.5));
l9_4478=mix(l9_4480,1.0-l9_4480,fast::clamp(l9_4482,0.0,1.0));
}
}
l9_4467.x=l9_4478;
float l9_4483=l9_4467.y;
int l9_4484=l9_4470.y;
if (l9_4484==1)
{
l9_4483=fract(l9_4483);
}
else
{
if (l9_4484==2)
{
float l9_4485=fract(l9_4483);
float l9_4486=l9_4483-l9_4485;
float l9_4487=step(0.25,fract(l9_4486*0.5));
l9_4483=mix(l9_4485,1.0-l9_4485,fast::clamp(l9_4487,0.0,1.0));
}
}
l9_4467.y=l9_4483;
if (l9_4471)
{
bool l9_4488=l9_4473;
bool l9_4489;
if (l9_4488)
{
l9_4489=l9_4470.x==3;
}
else
{
l9_4489=l9_4488;
}
float l9_4490=l9_4467.x;
float l9_4491=l9_4472.x;
float l9_4492=l9_4472.z;
bool l9_4493=l9_4489;
float l9_4494=l9_4477;
float l9_4495=fast::clamp(l9_4490,l9_4491,l9_4492);
float l9_4496=step(abs(l9_4490-l9_4495),9.9999997e-06);
l9_4494*=(l9_4496+((1.0-float(l9_4493))*(1.0-l9_4496)));
l9_4490=l9_4495;
l9_4467.x=l9_4490;
l9_4477=l9_4494;
bool l9_4497=l9_4473;
bool l9_4498;
if (l9_4497)
{
l9_4498=l9_4470.y==3;
}
else
{
l9_4498=l9_4497;
}
float l9_4499=l9_4467.y;
float l9_4500=l9_4472.y;
float l9_4501=l9_4472.w;
bool l9_4502=l9_4498;
float l9_4503=l9_4477;
float l9_4504=fast::clamp(l9_4499,l9_4500,l9_4501);
float l9_4505=step(abs(l9_4499-l9_4504),9.9999997e-06);
l9_4503*=(l9_4505+((1.0-float(l9_4502))*(1.0-l9_4505)));
l9_4499=l9_4504;
l9_4467.y=l9_4499;
l9_4477=l9_4503;
}
float2 l9_4506=l9_4467;
bool l9_4507=l9_4468;
float3x3 l9_4508=l9_4469;
if (l9_4507)
{
l9_4506=float2((l9_4508*float3(l9_4506,1.0)).xy);
}
float2 l9_4509=l9_4506;
l9_4467=l9_4509;
float l9_4510=l9_4467.x;
int l9_4511=l9_4470.x;
bool l9_4512=l9_4476;
float l9_4513=l9_4477;
if ((l9_4511==0)||(l9_4511==3))
{
float l9_4514=l9_4510;
float l9_4515=0.0;
float l9_4516=1.0;
bool l9_4517=l9_4512;
float l9_4518=l9_4513;
float l9_4519=fast::clamp(l9_4514,l9_4515,l9_4516);
float l9_4520=step(abs(l9_4514-l9_4519),9.9999997e-06);
l9_4518*=(l9_4520+((1.0-float(l9_4517))*(1.0-l9_4520)));
l9_4514=l9_4519;
l9_4510=l9_4514;
l9_4513=l9_4518;
}
l9_4467.x=l9_4510;
l9_4477=l9_4513;
float l9_4521=l9_4467.y;
int l9_4522=l9_4470.y;
bool l9_4523=l9_4476;
float l9_4524=l9_4477;
if ((l9_4522==0)||(l9_4522==3))
{
float l9_4525=l9_4521;
float l9_4526=0.0;
float l9_4527=1.0;
bool l9_4528=l9_4523;
float l9_4529=l9_4524;
float l9_4530=fast::clamp(l9_4525,l9_4526,l9_4527);
float l9_4531=step(abs(l9_4525-l9_4530),9.9999997e-06);
l9_4529*=(l9_4531+((1.0-float(l9_4528))*(1.0-l9_4531)));
l9_4525=l9_4530;
l9_4521=l9_4525;
l9_4524=l9_4529;
}
l9_4467.y=l9_4521;
l9_4477=l9_4524;
float2 l9_4532=l9_4467;
int l9_4533=l9_4465;
int l9_4534=l9_4466;
float l9_4535=l9_4475;
float2 l9_4536=l9_4532;
int l9_4537=l9_4533;
int l9_4538=l9_4534;
float3 l9_4539=float3(0.0);
if (l9_4537==0)
{
l9_4539=float3(l9_4536,0.0);
}
else
{
if (l9_4537==1)
{
l9_4539=float3(l9_4536.x,(l9_4536.y*0.5)+(0.5-(float(l9_4538)*0.5)),0.0);
}
else
{
l9_4539=float3(l9_4536,float(l9_4538));
}
}
float3 l9_4540=l9_4539;
float3 l9_4541=l9_4540;
float4 l9_4542=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_4541.xy,bias(l9_4535));
float4 l9_4543=l9_4542;
if (l9_4473)
{
l9_4543=mix(l9_4474,l9_4543,float4(l9_4477));
}
float4 l9_4544=l9_4543;
l9_4458=l9_4544;
l9_4436=l9_4458;
l9_4441=l9_4436;
}
else
{
float2 l9_4545=float2(0.0);
l9_4545=l9_4438.Surface_UVCoord0;
float2 l9_4546=float2(0.0);
float2 l9_4547=(*sc_set0.UserUniforms).patternScaleId01;
l9_4546=l9_4547;
float2 l9_4548=float2(0.0);
l9_4548=((l9_4545-(*sc_set0.UserUniforms).Port_Center_N122)*l9_4546)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_4549=float2(0.0);
float2 l9_4550=(*sc_set0.UserUniforms).patternOffsetId01;
l9_4549=l9_4550;
float2 l9_4551=float2(0.0);
l9_4551=l9_4548+l9_4549;
float l9_4552=0.0;
float l9_4553=(*sc_set0.UserUniforms).patternRotateId01;
l9_4552=l9_4553;
float2 l9_4554=float2(0.0);
float2 l9_4555=l9_4551;
float l9_4556=l9_4552;
float2 l9_4557=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_4558=sin(radians(l9_4556));
float l9_4559=cos(radians(l9_4556));
float2 l9_4560=l9_4555-l9_4557;
l9_4560=float2(dot(float2(l9_4559,l9_4558),l9_4560),dot(float2(-l9_4558,l9_4559),l9_4560))+l9_4557;
l9_4554=l9_4560;
float4 l9_4561=float4(0.0);
int l9_4562;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_4563=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4563=0;
}
else
{
l9_4563=in.varStereoViewID;
}
int l9_4564=l9_4563;
l9_4562=1-l9_4564;
}
else
{
int l9_4565=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4565=0;
}
else
{
l9_4565=in.varStereoViewID;
}
int l9_4566=l9_4565;
l9_4562=l9_4566;
}
int l9_4567=l9_4562;
int l9_4568=patternTextureId01Layout_tmp;
int l9_4569=l9_4567;
float2 l9_4570=l9_4554;
bool l9_4571=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_4572=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_4573=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_4574=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_4575=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_4576=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_4577=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_4578=0.0;
bool l9_4579=l9_4576&&(!l9_4574);
float l9_4580=1.0;
float l9_4581=l9_4570.x;
int l9_4582=l9_4573.x;
if (l9_4582==1)
{
l9_4581=fract(l9_4581);
}
else
{
if (l9_4582==2)
{
float l9_4583=fract(l9_4581);
float l9_4584=l9_4581-l9_4583;
float l9_4585=step(0.25,fract(l9_4584*0.5));
l9_4581=mix(l9_4583,1.0-l9_4583,fast::clamp(l9_4585,0.0,1.0));
}
}
l9_4570.x=l9_4581;
float l9_4586=l9_4570.y;
int l9_4587=l9_4573.y;
if (l9_4587==1)
{
l9_4586=fract(l9_4586);
}
else
{
if (l9_4587==2)
{
float l9_4588=fract(l9_4586);
float l9_4589=l9_4586-l9_4588;
float l9_4590=step(0.25,fract(l9_4589*0.5));
l9_4586=mix(l9_4588,1.0-l9_4588,fast::clamp(l9_4590,0.0,1.0));
}
}
l9_4570.y=l9_4586;
if (l9_4574)
{
bool l9_4591=l9_4576;
bool l9_4592;
if (l9_4591)
{
l9_4592=l9_4573.x==3;
}
else
{
l9_4592=l9_4591;
}
float l9_4593=l9_4570.x;
float l9_4594=l9_4575.x;
float l9_4595=l9_4575.z;
bool l9_4596=l9_4592;
float l9_4597=l9_4580;
float l9_4598=fast::clamp(l9_4593,l9_4594,l9_4595);
float l9_4599=step(abs(l9_4593-l9_4598),9.9999997e-06);
l9_4597*=(l9_4599+((1.0-float(l9_4596))*(1.0-l9_4599)));
l9_4593=l9_4598;
l9_4570.x=l9_4593;
l9_4580=l9_4597;
bool l9_4600=l9_4576;
bool l9_4601;
if (l9_4600)
{
l9_4601=l9_4573.y==3;
}
else
{
l9_4601=l9_4600;
}
float l9_4602=l9_4570.y;
float l9_4603=l9_4575.y;
float l9_4604=l9_4575.w;
bool l9_4605=l9_4601;
float l9_4606=l9_4580;
float l9_4607=fast::clamp(l9_4602,l9_4603,l9_4604);
float l9_4608=step(abs(l9_4602-l9_4607),9.9999997e-06);
l9_4606*=(l9_4608+((1.0-float(l9_4605))*(1.0-l9_4608)));
l9_4602=l9_4607;
l9_4570.y=l9_4602;
l9_4580=l9_4606;
}
float2 l9_4609=l9_4570;
bool l9_4610=l9_4571;
float3x3 l9_4611=l9_4572;
if (l9_4610)
{
l9_4609=float2((l9_4611*float3(l9_4609,1.0)).xy);
}
float2 l9_4612=l9_4609;
l9_4570=l9_4612;
float l9_4613=l9_4570.x;
int l9_4614=l9_4573.x;
bool l9_4615=l9_4579;
float l9_4616=l9_4580;
if ((l9_4614==0)||(l9_4614==3))
{
float l9_4617=l9_4613;
float l9_4618=0.0;
float l9_4619=1.0;
bool l9_4620=l9_4615;
float l9_4621=l9_4616;
float l9_4622=fast::clamp(l9_4617,l9_4618,l9_4619);
float l9_4623=step(abs(l9_4617-l9_4622),9.9999997e-06);
l9_4621*=(l9_4623+((1.0-float(l9_4620))*(1.0-l9_4623)));
l9_4617=l9_4622;
l9_4613=l9_4617;
l9_4616=l9_4621;
}
l9_4570.x=l9_4613;
l9_4580=l9_4616;
float l9_4624=l9_4570.y;
int l9_4625=l9_4573.y;
bool l9_4626=l9_4579;
float l9_4627=l9_4580;
if ((l9_4625==0)||(l9_4625==3))
{
float l9_4628=l9_4624;
float l9_4629=0.0;
float l9_4630=1.0;
bool l9_4631=l9_4626;
float l9_4632=l9_4627;
float l9_4633=fast::clamp(l9_4628,l9_4629,l9_4630);
float l9_4634=step(abs(l9_4628-l9_4633),9.9999997e-06);
l9_4632*=(l9_4634+((1.0-float(l9_4631))*(1.0-l9_4634)));
l9_4628=l9_4633;
l9_4624=l9_4628;
l9_4627=l9_4632;
}
l9_4570.y=l9_4624;
l9_4580=l9_4627;
float2 l9_4635=l9_4570;
int l9_4636=l9_4568;
int l9_4637=l9_4569;
float l9_4638=l9_4578;
float2 l9_4639=l9_4635;
int l9_4640=l9_4636;
int l9_4641=l9_4637;
float3 l9_4642=float3(0.0);
if (l9_4640==0)
{
l9_4642=float3(l9_4639,0.0);
}
else
{
if (l9_4640==1)
{
l9_4642=float3(l9_4639.x,(l9_4639.y*0.5)+(0.5-(float(l9_4641)*0.5)),0.0);
}
else
{
l9_4642=float3(l9_4639,float(l9_4641));
}
}
float3 l9_4643=l9_4642;
float3 l9_4644=l9_4643;
float4 l9_4645=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_4644.xy,bias(l9_4638));
float4 l9_4646=l9_4645;
if (l9_4576)
{
l9_4646=mix(l9_4577,l9_4646,float4(l9_4580));
}
float4 l9_4647=l9_4646;
l9_4561=l9_4647;
float l9_4648=0.0;
float3 l9_4649=l9_4561.xyz;
float l9_4650=l9_4649.x;
l9_4648=l9_4650;
l9_4437=float4(l9_4648);
l9_4441=l9_4437;
}
l9_4434=l9_4441;
float4 l9_4651=float4(0.0);
l9_4651=l9_4432*l9_4434;
l9_4426=l9_4651;
l9_4431=l9_4426;
}
else
{
float4 l9_4652=float4(0.0);
float4 l9_4653=(*sc_set0.UserUniforms).colorId01;
l9_4652=l9_4653;
float2 l9_4654=float2(0.0);
l9_4654=l9_4428.Surface_UVCoord0;
float4 l9_4655=float4(0.0);
int l9_4656;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_4657=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4657=0;
}
else
{
l9_4657=in.varStereoViewID;
}
int l9_4658=l9_4657;
l9_4656=1-l9_4658;
}
else
{
int l9_4659=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4659=0;
}
else
{
l9_4659=in.varStereoViewID;
}
int l9_4660=l9_4659;
l9_4656=l9_4660;
}
int l9_4661=l9_4656;
int l9_4662=greyMaskIdLayout_tmp;
int l9_4663=l9_4661;
float2 l9_4664=l9_4654;
bool l9_4665=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_4666=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_4667=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_4668=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_4669=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_4670=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_4671=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_4672=0.0;
bool l9_4673=l9_4670&&(!l9_4668);
float l9_4674=1.0;
float l9_4675=l9_4664.x;
int l9_4676=l9_4667.x;
if (l9_4676==1)
{
l9_4675=fract(l9_4675);
}
else
{
if (l9_4676==2)
{
float l9_4677=fract(l9_4675);
float l9_4678=l9_4675-l9_4677;
float l9_4679=step(0.25,fract(l9_4678*0.5));
l9_4675=mix(l9_4677,1.0-l9_4677,fast::clamp(l9_4679,0.0,1.0));
}
}
l9_4664.x=l9_4675;
float l9_4680=l9_4664.y;
int l9_4681=l9_4667.y;
if (l9_4681==1)
{
l9_4680=fract(l9_4680);
}
else
{
if (l9_4681==2)
{
float l9_4682=fract(l9_4680);
float l9_4683=l9_4680-l9_4682;
float l9_4684=step(0.25,fract(l9_4683*0.5));
l9_4680=mix(l9_4682,1.0-l9_4682,fast::clamp(l9_4684,0.0,1.0));
}
}
l9_4664.y=l9_4680;
if (l9_4668)
{
bool l9_4685=l9_4670;
bool l9_4686;
if (l9_4685)
{
l9_4686=l9_4667.x==3;
}
else
{
l9_4686=l9_4685;
}
float l9_4687=l9_4664.x;
float l9_4688=l9_4669.x;
float l9_4689=l9_4669.z;
bool l9_4690=l9_4686;
float l9_4691=l9_4674;
float l9_4692=fast::clamp(l9_4687,l9_4688,l9_4689);
float l9_4693=step(abs(l9_4687-l9_4692),9.9999997e-06);
l9_4691*=(l9_4693+((1.0-float(l9_4690))*(1.0-l9_4693)));
l9_4687=l9_4692;
l9_4664.x=l9_4687;
l9_4674=l9_4691;
bool l9_4694=l9_4670;
bool l9_4695;
if (l9_4694)
{
l9_4695=l9_4667.y==3;
}
else
{
l9_4695=l9_4694;
}
float l9_4696=l9_4664.y;
float l9_4697=l9_4669.y;
float l9_4698=l9_4669.w;
bool l9_4699=l9_4695;
float l9_4700=l9_4674;
float l9_4701=fast::clamp(l9_4696,l9_4697,l9_4698);
float l9_4702=step(abs(l9_4696-l9_4701),9.9999997e-06);
l9_4700*=(l9_4702+((1.0-float(l9_4699))*(1.0-l9_4702)));
l9_4696=l9_4701;
l9_4664.y=l9_4696;
l9_4674=l9_4700;
}
float2 l9_4703=l9_4664;
bool l9_4704=l9_4665;
float3x3 l9_4705=l9_4666;
if (l9_4704)
{
l9_4703=float2((l9_4705*float3(l9_4703,1.0)).xy);
}
float2 l9_4706=l9_4703;
l9_4664=l9_4706;
float l9_4707=l9_4664.x;
int l9_4708=l9_4667.x;
bool l9_4709=l9_4673;
float l9_4710=l9_4674;
if ((l9_4708==0)||(l9_4708==3))
{
float l9_4711=l9_4707;
float l9_4712=0.0;
float l9_4713=1.0;
bool l9_4714=l9_4709;
float l9_4715=l9_4710;
float l9_4716=fast::clamp(l9_4711,l9_4712,l9_4713);
float l9_4717=step(abs(l9_4711-l9_4716),9.9999997e-06);
l9_4715*=(l9_4717+((1.0-float(l9_4714))*(1.0-l9_4717)));
l9_4711=l9_4716;
l9_4707=l9_4711;
l9_4710=l9_4715;
}
l9_4664.x=l9_4707;
l9_4674=l9_4710;
float l9_4718=l9_4664.y;
int l9_4719=l9_4667.y;
bool l9_4720=l9_4673;
float l9_4721=l9_4674;
if ((l9_4719==0)||(l9_4719==3))
{
float l9_4722=l9_4718;
float l9_4723=0.0;
float l9_4724=1.0;
bool l9_4725=l9_4720;
float l9_4726=l9_4721;
float l9_4727=fast::clamp(l9_4722,l9_4723,l9_4724);
float l9_4728=step(abs(l9_4722-l9_4727),9.9999997e-06);
l9_4726*=(l9_4728+((1.0-float(l9_4725))*(1.0-l9_4728)));
l9_4722=l9_4727;
l9_4718=l9_4722;
l9_4721=l9_4726;
}
l9_4664.y=l9_4718;
l9_4674=l9_4721;
float2 l9_4729=l9_4664;
int l9_4730=l9_4662;
int l9_4731=l9_4663;
float l9_4732=l9_4672;
float2 l9_4733=l9_4729;
int l9_4734=l9_4730;
int l9_4735=l9_4731;
float3 l9_4736=float3(0.0);
if (l9_4734==0)
{
l9_4736=float3(l9_4733,0.0);
}
else
{
if (l9_4734==1)
{
l9_4736=float3(l9_4733.x,(l9_4733.y*0.5)+(0.5-(float(l9_4735)*0.5)),0.0);
}
else
{
l9_4736=float3(l9_4733,float(l9_4735));
}
}
float3 l9_4737=l9_4736;
float3 l9_4738=l9_4737;
float4 l9_4739=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_4738.xy,bias(l9_4732));
float4 l9_4740=l9_4739;
if (l9_4670)
{
l9_4740=mix(l9_4671,l9_4740,float4(l9_4674));
}
float4 l9_4741=l9_4740;
l9_4655=l9_4741;
float l9_4742=0.0;
l9_4742=l9_4655.x;
float l9_4743=0.0;
l9_4743=step(l9_4742,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_4744=float4(0.0);
l9_4744=l9_4652*float4(l9_4743);
l9_4427=l9_4744;
l9_4431=l9_4427;
}
l9_4424=l9_4431;
float2 l9_4745=float2(0.0);
l9_4745=l9_3986.Surface_UVCoord0;
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
l9_4835=l9_4424*float4(l9_4834);
float4 l9_4836=float4(0.0);
float4 l9_4837=(*sc_set0.UserUniforms).colorId01;
l9_4836=l9_4837;
float4 l9_4838=float4(0.0);
l9_4838=l9_4836*float4(l9_4834);
float4 l9_4839=float4(0.0);
float4 l9_4840=l9_4835;
float4 l9_4841=l9_4838;
float4 l9_4842=l9_4840;
float4 l9_4843=l9_4841;
float3 l9_4844=l9_4842.xyz*l9_4842.w;
l9_4842=float4(l9_4844.x,l9_4844.y,l9_4844.z,l9_4842.w);
float4 l9_4845=l9_4842+(l9_4843*(1.0-l9_4842.w));
l9_4839=l9_4845;
l9_3985=l9_4839;
l9_3989=l9_3985;
}
l9_3982=l9_3989;
float l9_4846=0.0;
float l9_4847=(*sc_set0.UserUniforms).metallicId01;
l9_4846=l9_4847;
float l9_4848=0.0;
float l9_4849=(*sc_set0.UserUniforms).rougnessId01;
l9_4848=l9_4849;
float4 l9_4850=float4(0.0);
float3 l9_4851=l9_3982.xyz;
float l9_4852=(*sc_set0.UserUniforms).Port_Opacity_N152;
float3 l9_4853=(*sc_set0.UserUniforms).Port_Emissive_N152;
float l9_4854=l9_4846;
float l9_4855=l9_4848;
float3 l9_4856=(*sc_set0.UserUniforms).Port_AO_N152;
float3 l9_4857=(*sc_set0.UserUniforms).Port_SpecularAO_N152;
ssGlobals l9_4858=l9_3978;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_4858.BumpedNormal=l9_4858.VertexNormal_WorldSpace;
}
float l9_4859=l9_4852;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_4859<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_4860=gl_FragCoord;
float2 l9_4861=floor(mod(l9_4860.xy,float2(4.0)));
float l9_4862=(mod(dot(l9_4861,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_4859<l9_4862)
{
discard_fragment();
}
}
l9_4851=fast::max(l9_4851,float3(0.0));
float4 l9_4863;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_4863=float4(l9_4851,l9_4852);
}
else
{
l9_4854=fast::clamp(l9_4854,0.0,1.0);
l9_4855=fast::clamp(l9_4855,0.0,1.0);
float3 l9_4864=l9_4851;
float l9_4865=l9_4852;
float3 l9_4866=l9_4858.BumpedNormal;
float3 l9_4867=l9_4858.PositionWS;
float3 l9_4868=l9_4858.ViewDirWS;
float3 l9_4869=l9_4853;
float l9_4870=l9_4854;
float l9_4871=l9_4855;
float3 l9_4872=l9_4856;
float3 l9_4873=l9_4857;
l9_4863=ngsCalculateLighting(l9_4864,l9_4865,l9_4866,l9_4867,l9_4868,l9_4869,l9_4870,l9_4871,l9_4872,l9_4873,in.varStereoViewID,sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_RayTracingReflections,sc_set0.sc_RayTracingReflectionsSmpSC,sc_set0.sc_RayTracingGlobalIllumination,sc_set0.sc_RayTracingGlobalIlluminationSmpSC,sc_set0.sc_RayTracingShadows,sc_set0.sc_RayTracingShadowsSmpSC,gl_FragCoord,(*sc_set0.UserUniforms),in.varShadowTex,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,out.sc_FragData0,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
l9_4863=fast::max(l9_4863,float4(0.0));
l9_4850=l9_4863;
l9_3976=l9_4850;
l9_3981=l9_3976;
}
else
{
float4 l9_4874=float4(0.0);
float l9_4875=0.0;
float4 l9_4876=float4(0.0);
float4 l9_4877=float4(0.0);
ssGlobals l9_4878=l9_3978;
float l9_4879=0.0;
float l9_4880=float((*sc_set0.UserUniforms).rimOnOffId01!=0);
l9_4879=l9_4880;
l9_4875=l9_4879;
float4 l9_4881;
if ((l9_4875*1.0)!=0.0)
{
float l9_4882=0.0;
float l9_4883=(*sc_set0.UserUniforms).rimExpId01;
l9_4882=l9_4883;
float l9_4884=0.0;
float l9_4885=(*sc_set0.UserUniforms).rimIntId01;
l9_4884=l9_4885;
float l9_4886=0.0;
float l9_4887=l9_4882;
float l9_4888=l9_4884;
ssGlobals l9_4889=l9_4878;
float l9_4890=abs(dot(-l9_4889.ViewDirWS,l9_4889.VertexNormal_WorldSpace));
float l9_4891=1.0-pow(1.0-l9_4890,l9_4887);
l9_4891=fast::max(l9_4891,0.0);
l9_4891*=l9_4888;
l9_4886=l9_4891;
float4 l9_4892=float4(0.0);
float l9_4893=0.0;
float4 l9_4894=float4(0.0);
float4 l9_4895=float4(0.0);
ssGlobals l9_4896=l9_4878;
float l9_4897=0.0;
float l9_4898=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_4897=l9_4898;
l9_4893=l9_4897;
float4 l9_4899;
if ((l9_4893*1.0)!=0.0)
{
float4 l9_4900=float4(0.0);
float4 l9_4901=(*sc_set0.UserUniforms).patternColorId01;
l9_4900=l9_4901;
float4 l9_4902=float4(0.0);
float l9_4903=0.0;
float4 l9_4904=float4(0.0);
float4 l9_4905=float4(0.0);
ssGlobals l9_4906=l9_4896;
float l9_4907=0.0;
float l9_4908=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_4907=l9_4908;
l9_4903=l9_4907;
float4 l9_4909;
if ((l9_4903*1.0)!=0.0)
{
float2 l9_4910=float2(0.0);
l9_4910=l9_4906.Surface_UVCoord0;
float2 l9_4911=float2(0.0);
float2 l9_4912=(*sc_set0.UserUniforms).patternScaleId01;
l9_4911=l9_4912;
float2 l9_4913=float2(0.0);
l9_4913=((l9_4910-(*sc_set0.UserUniforms).Port_Center_N122)*l9_4911)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_4914=float2(0.0);
float2 l9_4915=(*sc_set0.UserUniforms).patternOffsetId01;
l9_4914=l9_4915;
float2 l9_4916=float2(0.0);
l9_4916=l9_4913+l9_4914;
float l9_4917=0.0;
float l9_4918=(*sc_set0.UserUniforms).patternRotateId01;
l9_4917=l9_4918;
float2 l9_4919=float2(0.0);
float2 l9_4920=l9_4916;
float l9_4921=l9_4917;
float2 l9_4922=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_4923=sin(radians(l9_4921));
float l9_4924=cos(radians(l9_4921));
float2 l9_4925=l9_4920-l9_4922;
l9_4925=float2(dot(float2(l9_4924,l9_4923),l9_4925),dot(float2(-l9_4923,l9_4924),l9_4925))+l9_4922;
l9_4919=l9_4925;
float4 l9_4926=float4(0.0);
int l9_4927;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_4928=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4928=0;
}
else
{
l9_4928=in.varStereoViewID;
}
int l9_4929=l9_4928;
l9_4927=1-l9_4929;
}
else
{
int l9_4930=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4930=0;
}
else
{
l9_4930=in.varStereoViewID;
}
int l9_4931=l9_4930;
l9_4927=l9_4931;
}
int l9_4932=l9_4927;
int l9_4933=patternTextureId01Layout_tmp;
int l9_4934=l9_4932;
float2 l9_4935=l9_4919;
bool l9_4936=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_4937=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_4938=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_4939=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_4940=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_4941=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_4942=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_4943=0.0;
bool l9_4944=l9_4941&&(!l9_4939);
float l9_4945=1.0;
float l9_4946=l9_4935.x;
int l9_4947=l9_4938.x;
if (l9_4947==1)
{
l9_4946=fract(l9_4946);
}
else
{
if (l9_4947==2)
{
float l9_4948=fract(l9_4946);
float l9_4949=l9_4946-l9_4948;
float l9_4950=step(0.25,fract(l9_4949*0.5));
l9_4946=mix(l9_4948,1.0-l9_4948,fast::clamp(l9_4950,0.0,1.0));
}
}
l9_4935.x=l9_4946;
float l9_4951=l9_4935.y;
int l9_4952=l9_4938.y;
if (l9_4952==1)
{
l9_4951=fract(l9_4951);
}
else
{
if (l9_4952==2)
{
float l9_4953=fract(l9_4951);
float l9_4954=l9_4951-l9_4953;
float l9_4955=step(0.25,fract(l9_4954*0.5));
l9_4951=mix(l9_4953,1.0-l9_4953,fast::clamp(l9_4955,0.0,1.0));
}
}
l9_4935.y=l9_4951;
if (l9_4939)
{
bool l9_4956=l9_4941;
bool l9_4957;
if (l9_4956)
{
l9_4957=l9_4938.x==3;
}
else
{
l9_4957=l9_4956;
}
float l9_4958=l9_4935.x;
float l9_4959=l9_4940.x;
float l9_4960=l9_4940.z;
bool l9_4961=l9_4957;
float l9_4962=l9_4945;
float l9_4963=fast::clamp(l9_4958,l9_4959,l9_4960);
float l9_4964=step(abs(l9_4958-l9_4963),9.9999997e-06);
l9_4962*=(l9_4964+((1.0-float(l9_4961))*(1.0-l9_4964)));
l9_4958=l9_4963;
l9_4935.x=l9_4958;
l9_4945=l9_4962;
bool l9_4965=l9_4941;
bool l9_4966;
if (l9_4965)
{
l9_4966=l9_4938.y==3;
}
else
{
l9_4966=l9_4965;
}
float l9_4967=l9_4935.y;
float l9_4968=l9_4940.y;
float l9_4969=l9_4940.w;
bool l9_4970=l9_4966;
float l9_4971=l9_4945;
float l9_4972=fast::clamp(l9_4967,l9_4968,l9_4969);
float l9_4973=step(abs(l9_4967-l9_4972),9.9999997e-06);
l9_4971*=(l9_4973+((1.0-float(l9_4970))*(1.0-l9_4973)));
l9_4967=l9_4972;
l9_4935.y=l9_4967;
l9_4945=l9_4971;
}
float2 l9_4974=l9_4935;
bool l9_4975=l9_4936;
float3x3 l9_4976=l9_4937;
if (l9_4975)
{
l9_4974=float2((l9_4976*float3(l9_4974,1.0)).xy);
}
float2 l9_4977=l9_4974;
l9_4935=l9_4977;
float l9_4978=l9_4935.x;
int l9_4979=l9_4938.x;
bool l9_4980=l9_4944;
float l9_4981=l9_4945;
if ((l9_4979==0)||(l9_4979==3))
{
float l9_4982=l9_4978;
float l9_4983=0.0;
float l9_4984=1.0;
bool l9_4985=l9_4980;
float l9_4986=l9_4981;
float l9_4987=fast::clamp(l9_4982,l9_4983,l9_4984);
float l9_4988=step(abs(l9_4982-l9_4987),9.9999997e-06);
l9_4986*=(l9_4988+((1.0-float(l9_4985))*(1.0-l9_4988)));
l9_4982=l9_4987;
l9_4978=l9_4982;
l9_4981=l9_4986;
}
l9_4935.x=l9_4978;
l9_4945=l9_4981;
float l9_4989=l9_4935.y;
int l9_4990=l9_4938.y;
bool l9_4991=l9_4944;
float l9_4992=l9_4945;
if ((l9_4990==0)||(l9_4990==3))
{
float l9_4993=l9_4989;
float l9_4994=0.0;
float l9_4995=1.0;
bool l9_4996=l9_4991;
float l9_4997=l9_4992;
float l9_4998=fast::clamp(l9_4993,l9_4994,l9_4995);
float l9_4999=step(abs(l9_4993-l9_4998),9.9999997e-06);
l9_4997*=(l9_4999+((1.0-float(l9_4996))*(1.0-l9_4999)));
l9_4993=l9_4998;
l9_4989=l9_4993;
l9_4992=l9_4997;
}
l9_4935.y=l9_4989;
l9_4945=l9_4992;
float2 l9_5000=l9_4935;
int l9_5001=l9_4933;
int l9_5002=l9_4934;
float l9_5003=l9_4943;
float2 l9_5004=l9_5000;
int l9_5005=l9_5001;
int l9_5006=l9_5002;
float3 l9_5007=float3(0.0);
if (l9_5005==0)
{
l9_5007=float3(l9_5004,0.0);
}
else
{
if (l9_5005==1)
{
l9_5007=float3(l9_5004.x,(l9_5004.y*0.5)+(0.5-(float(l9_5006)*0.5)),0.0);
}
else
{
l9_5007=float3(l9_5004,float(l9_5006));
}
}
float3 l9_5008=l9_5007;
float3 l9_5009=l9_5008;
float4 l9_5010=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_5009.xy,bias(l9_5003));
float4 l9_5011=l9_5010;
if (l9_4941)
{
l9_5011=mix(l9_4942,l9_5011,float4(l9_4945));
}
float4 l9_5012=l9_5011;
l9_4926=l9_5012;
l9_4904=l9_4926;
l9_4909=l9_4904;
}
else
{
float2 l9_5013=float2(0.0);
l9_5013=l9_4906.Surface_UVCoord0;
float2 l9_5014=float2(0.0);
float2 l9_5015=(*sc_set0.UserUniforms).patternScaleId01;
l9_5014=l9_5015;
float2 l9_5016=float2(0.0);
l9_5016=((l9_5013-(*sc_set0.UserUniforms).Port_Center_N122)*l9_5014)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_5017=float2(0.0);
float2 l9_5018=(*sc_set0.UserUniforms).patternOffsetId01;
l9_5017=l9_5018;
float2 l9_5019=float2(0.0);
l9_5019=l9_5016+l9_5017;
float l9_5020=0.0;
float l9_5021=(*sc_set0.UserUniforms).patternRotateId01;
l9_5020=l9_5021;
float2 l9_5022=float2(0.0);
float2 l9_5023=l9_5019;
float l9_5024=l9_5020;
float2 l9_5025=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_5026=sin(radians(l9_5024));
float l9_5027=cos(radians(l9_5024));
float2 l9_5028=l9_5023-l9_5025;
l9_5028=float2(dot(float2(l9_5027,l9_5026),l9_5028),dot(float2(-l9_5026,l9_5027),l9_5028))+l9_5025;
l9_5022=l9_5028;
float4 l9_5029=float4(0.0);
int l9_5030;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_5031=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5031=0;
}
else
{
l9_5031=in.varStereoViewID;
}
int l9_5032=l9_5031;
l9_5030=1-l9_5032;
}
else
{
int l9_5033=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5033=0;
}
else
{
l9_5033=in.varStereoViewID;
}
int l9_5034=l9_5033;
l9_5030=l9_5034;
}
int l9_5035=l9_5030;
int l9_5036=patternTextureId01Layout_tmp;
int l9_5037=l9_5035;
float2 l9_5038=l9_5022;
bool l9_5039=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_5040=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_5041=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_5042=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_5043=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_5044=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_5045=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_5046=0.0;
bool l9_5047=l9_5044&&(!l9_5042);
float l9_5048=1.0;
float l9_5049=l9_5038.x;
int l9_5050=l9_5041.x;
if (l9_5050==1)
{
l9_5049=fract(l9_5049);
}
else
{
if (l9_5050==2)
{
float l9_5051=fract(l9_5049);
float l9_5052=l9_5049-l9_5051;
float l9_5053=step(0.25,fract(l9_5052*0.5));
l9_5049=mix(l9_5051,1.0-l9_5051,fast::clamp(l9_5053,0.0,1.0));
}
}
l9_5038.x=l9_5049;
float l9_5054=l9_5038.y;
int l9_5055=l9_5041.y;
if (l9_5055==1)
{
l9_5054=fract(l9_5054);
}
else
{
if (l9_5055==2)
{
float l9_5056=fract(l9_5054);
float l9_5057=l9_5054-l9_5056;
float l9_5058=step(0.25,fract(l9_5057*0.5));
l9_5054=mix(l9_5056,1.0-l9_5056,fast::clamp(l9_5058,0.0,1.0));
}
}
l9_5038.y=l9_5054;
if (l9_5042)
{
bool l9_5059=l9_5044;
bool l9_5060;
if (l9_5059)
{
l9_5060=l9_5041.x==3;
}
else
{
l9_5060=l9_5059;
}
float l9_5061=l9_5038.x;
float l9_5062=l9_5043.x;
float l9_5063=l9_5043.z;
bool l9_5064=l9_5060;
float l9_5065=l9_5048;
float l9_5066=fast::clamp(l9_5061,l9_5062,l9_5063);
float l9_5067=step(abs(l9_5061-l9_5066),9.9999997e-06);
l9_5065*=(l9_5067+((1.0-float(l9_5064))*(1.0-l9_5067)));
l9_5061=l9_5066;
l9_5038.x=l9_5061;
l9_5048=l9_5065;
bool l9_5068=l9_5044;
bool l9_5069;
if (l9_5068)
{
l9_5069=l9_5041.y==3;
}
else
{
l9_5069=l9_5068;
}
float l9_5070=l9_5038.y;
float l9_5071=l9_5043.y;
float l9_5072=l9_5043.w;
bool l9_5073=l9_5069;
float l9_5074=l9_5048;
float l9_5075=fast::clamp(l9_5070,l9_5071,l9_5072);
float l9_5076=step(abs(l9_5070-l9_5075),9.9999997e-06);
l9_5074*=(l9_5076+((1.0-float(l9_5073))*(1.0-l9_5076)));
l9_5070=l9_5075;
l9_5038.y=l9_5070;
l9_5048=l9_5074;
}
float2 l9_5077=l9_5038;
bool l9_5078=l9_5039;
float3x3 l9_5079=l9_5040;
if (l9_5078)
{
l9_5077=float2((l9_5079*float3(l9_5077,1.0)).xy);
}
float2 l9_5080=l9_5077;
l9_5038=l9_5080;
float l9_5081=l9_5038.x;
int l9_5082=l9_5041.x;
bool l9_5083=l9_5047;
float l9_5084=l9_5048;
if ((l9_5082==0)||(l9_5082==3))
{
float l9_5085=l9_5081;
float l9_5086=0.0;
float l9_5087=1.0;
bool l9_5088=l9_5083;
float l9_5089=l9_5084;
float l9_5090=fast::clamp(l9_5085,l9_5086,l9_5087);
float l9_5091=step(abs(l9_5085-l9_5090),9.9999997e-06);
l9_5089*=(l9_5091+((1.0-float(l9_5088))*(1.0-l9_5091)));
l9_5085=l9_5090;
l9_5081=l9_5085;
l9_5084=l9_5089;
}
l9_5038.x=l9_5081;
l9_5048=l9_5084;
float l9_5092=l9_5038.y;
int l9_5093=l9_5041.y;
bool l9_5094=l9_5047;
float l9_5095=l9_5048;
if ((l9_5093==0)||(l9_5093==3))
{
float l9_5096=l9_5092;
float l9_5097=0.0;
float l9_5098=1.0;
bool l9_5099=l9_5094;
float l9_5100=l9_5095;
float l9_5101=fast::clamp(l9_5096,l9_5097,l9_5098);
float l9_5102=step(abs(l9_5096-l9_5101),9.9999997e-06);
l9_5100*=(l9_5102+((1.0-float(l9_5099))*(1.0-l9_5102)));
l9_5096=l9_5101;
l9_5092=l9_5096;
l9_5095=l9_5100;
}
l9_5038.y=l9_5092;
l9_5048=l9_5095;
float2 l9_5103=l9_5038;
int l9_5104=l9_5036;
int l9_5105=l9_5037;
float l9_5106=l9_5046;
float2 l9_5107=l9_5103;
int l9_5108=l9_5104;
int l9_5109=l9_5105;
float3 l9_5110=float3(0.0);
if (l9_5108==0)
{
l9_5110=float3(l9_5107,0.0);
}
else
{
if (l9_5108==1)
{
l9_5110=float3(l9_5107.x,(l9_5107.y*0.5)+(0.5-(float(l9_5109)*0.5)),0.0);
}
else
{
l9_5110=float3(l9_5107,float(l9_5109));
}
}
float3 l9_5111=l9_5110;
float3 l9_5112=l9_5111;
float4 l9_5113=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_5112.xy,bias(l9_5106));
float4 l9_5114=l9_5113;
if (l9_5044)
{
l9_5114=mix(l9_5045,l9_5114,float4(l9_5048));
}
float4 l9_5115=l9_5114;
l9_5029=l9_5115;
float l9_5116=0.0;
float3 l9_5117=l9_5029.xyz;
float l9_5118=l9_5117.x;
l9_5116=l9_5118;
l9_4905=float4(l9_5116);
l9_4909=l9_4905;
}
l9_4902=l9_4909;
float4 l9_5119=float4(0.0);
l9_5119=l9_4900*l9_4902;
l9_4894=l9_5119;
l9_4899=l9_4894;
}
else
{
float4 l9_5120=float4(0.0);
float4 l9_5121=(*sc_set0.UserUniforms).colorId01;
l9_5120=l9_5121;
float2 l9_5122=float2(0.0);
l9_5122=l9_4896.Surface_UVCoord0;
float4 l9_5123=float4(0.0);
int l9_5124;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_5125=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5125=0;
}
else
{
l9_5125=in.varStereoViewID;
}
int l9_5126=l9_5125;
l9_5124=1-l9_5126;
}
else
{
int l9_5127=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5127=0;
}
else
{
l9_5127=in.varStereoViewID;
}
int l9_5128=l9_5127;
l9_5124=l9_5128;
}
int l9_5129=l9_5124;
int l9_5130=greyMaskIdLayout_tmp;
int l9_5131=l9_5129;
float2 l9_5132=l9_5122;
bool l9_5133=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_5134=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_5135=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_5136=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_5137=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_5138=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_5139=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_5140=0.0;
bool l9_5141=l9_5138&&(!l9_5136);
float l9_5142=1.0;
float l9_5143=l9_5132.x;
int l9_5144=l9_5135.x;
if (l9_5144==1)
{
l9_5143=fract(l9_5143);
}
else
{
if (l9_5144==2)
{
float l9_5145=fract(l9_5143);
float l9_5146=l9_5143-l9_5145;
float l9_5147=step(0.25,fract(l9_5146*0.5));
l9_5143=mix(l9_5145,1.0-l9_5145,fast::clamp(l9_5147,0.0,1.0));
}
}
l9_5132.x=l9_5143;
float l9_5148=l9_5132.y;
int l9_5149=l9_5135.y;
if (l9_5149==1)
{
l9_5148=fract(l9_5148);
}
else
{
if (l9_5149==2)
{
float l9_5150=fract(l9_5148);
float l9_5151=l9_5148-l9_5150;
float l9_5152=step(0.25,fract(l9_5151*0.5));
l9_5148=mix(l9_5150,1.0-l9_5150,fast::clamp(l9_5152,0.0,1.0));
}
}
l9_5132.y=l9_5148;
if (l9_5136)
{
bool l9_5153=l9_5138;
bool l9_5154;
if (l9_5153)
{
l9_5154=l9_5135.x==3;
}
else
{
l9_5154=l9_5153;
}
float l9_5155=l9_5132.x;
float l9_5156=l9_5137.x;
float l9_5157=l9_5137.z;
bool l9_5158=l9_5154;
float l9_5159=l9_5142;
float l9_5160=fast::clamp(l9_5155,l9_5156,l9_5157);
float l9_5161=step(abs(l9_5155-l9_5160),9.9999997e-06);
l9_5159*=(l9_5161+((1.0-float(l9_5158))*(1.0-l9_5161)));
l9_5155=l9_5160;
l9_5132.x=l9_5155;
l9_5142=l9_5159;
bool l9_5162=l9_5138;
bool l9_5163;
if (l9_5162)
{
l9_5163=l9_5135.y==3;
}
else
{
l9_5163=l9_5162;
}
float l9_5164=l9_5132.y;
float l9_5165=l9_5137.y;
float l9_5166=l9_5137.w;
bool l9_5167=l9_5163;
float l9_5168=l9_5142;
float l9_5169=fast::clamp(l9_5164,l9_5165,l9_5166);
float l9_5170=step(abs(l9_5164-l9_5169),9.9999997e-06);
l9_5168*=(l9_5170+((1.0-float(l9_5167))*(1.0-l9_5170)));
l9_5164=l9_5169;
l9_5132.y=l9_5164;
l9_5142=l9_5168;
}
float2 l9_5171=l9_5132;
bool l9_5172=l9_5133;
float3x3 l9_5173=l9_5134;
if (l9_5172)
{
l9_5171=float2((l9_5173*float3(l9_5171,1.0)).xy);
}
float2 l9_5174=l9_5171;
l9_5132=l9_5174;
float l9_5175=l9_5132.x;
int l9_5176=l9_5135.x;
bool l9_5177=l9_5141;
float l9_5178=l9_5142;
if ((l9_5176==0)||(l9_5176==3))
{
float l9_5179=l9_5175;
float l9_5180=0.0;
float l9_5181=1.0;
bool l9_5182=l9_5177;
float l9_5183=l9_5178;
float l9_5184=fast::clamp(l9_5179,l9_5180,l9_5181);
float l9_5185=step(abs(l9_5179-l9_5184),9.9999997e-06);
l9_5183*=(l9_5185+((1.0-float(l9_5182))*(1.0-l9_5185)));
l9_5179=l9_5184;
l9_5175=l9_5179;
l9_5178=l9_5183;
}
l9_5132.x=l9_5175;
l9_5142=l9_5178;
float l9_5186=l9_5132.y;
int l9_5187=l9_5135.y;
bool l9_5188=l9_5141;
float l9_5189=l9_5142;
if ((l9_5187==0)||(l9_5187==3))
{
float l9_5190=l9_5186;
float l9_5191=0.0;
float l9_5192=1.0;
bool l9_5193=l9_5188;
float l9_5194=l9_5189;
float l9_5195=fast::clamp(l9_5190,l9_5191,l9_5192);
float l9_5196=step(abs(l9_5190-l9_5195),9.9999997e-06);
l9_5194*=(l9_5196+((1.0-float(l9_5193))*(1.0-l9_5196)));
l9_5190=l9_5195;
l9_5186=l9_5190;
l9_5189=l9_5194;
}
l9_5132.y=l9_5186;
l9_5142=l9_5189;
float2 l9_5197=l9_5132;
int l9_5198=l9_5130;
int l9_5199=l9_5131;
float l9_5200=l9_5140;
float2 l9_5201=l9_5197;
int l9_5202=l9_5198;
int l9_5203=l9_5199;
float3 l9_5204=float3(0.0);
if (l9_5202==0)
{
l9_5204=float3(l9_5201,0.0);
}
else
{
if (l9_5202==1)
{
l9_5204=float3(l9_5201.x,(l9_5201.y*0.5)+(0.5-(float(l9_5203)*0.5)),0.0);
}
else
{
l9_5204=float3(l9_5201,float(l9_5203));
}
}
float3 l9_5205=l9_5204;
float3 l9_5206=l9_5205;
float4 l9_5207=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_5206.xy,bias(l9_5200));
float4 l9_5208=l9_5207;
if (l9_5138)
{
l9_5208=mix(l9_5139,l9_5208,float4(l9_5142));
}
float4 l9_5209=l9_5208;
l9_5123=l9_5209;
float l9_5210=0.0;
l9_5210=l9_5123.x;
float l9_5211=0.0;
l9_5211=step(l9_5210,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_5212=float4(0.0);
l9_5212=l9_5120*float4(l9_5211);
l9_4895=l9_5212;
l9_4899=l9_4895;
}
l9_4892=l9_4899;
float2 l9_5213=float2(0.0);
l9_5213=l9_4878.Surface_UVCoord0;
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
l9_5303=l9_4892*float4(l9_5302);
float4 l9_5304=float4(0.0);
float4 l9_5305=(*sc_set0.UserUniforms).colorId01;
l9_5304=l9_5305;
float4 l9_5306=float4(0.0);
l9_5306=l9_5304*float4(l9_5302);
float4 l9_5307=float4(0.0);
float4 l9_5308=l9_5303;
float4 l9_5309=l9_5306;
float4 l9_5310=l9_5308;
float4 l9_5311=l9_5309;
float3 l9_5312=l9_5310.xyz*l9_5310.w;
l9_5310=float4(l9_5312.x,l9_5312.y,l9_5312.z,l9_5310.w);
float4 l9_5313=l9_5310+(l9_5311*(1.0-l9_5310.w));
l9_5307=l9_5313;
float4 l9_5314=float4(0.0);
l9_5314=float4(l9_4886)*l9_5307;
float4 l9_5315=float4(0.0);
l9_5315=l9_5314+l9_5307;
l9_4876=l9_5315;
l9_4881=l9_4876;
}
else
{
float4 l9_5316=float4(0.0);
float l9_5317=0.0;
float4 l9_5318=float4(0.0);
float4 l9_5319=float4(0.0);
ssGlobals l9_5320=l9_4878;
float l9_5321=0.0;
float l9_5322=float((*sc_set0.UserUniforms).patternOnOffId01!=0);
l9_5321=l9_5322;
l9_5317=l9_5321;
float4 l9_5323;
if ((l9_5317*1.0)!=0.0)
{
float4 l9_5324=float4(0.0);
float4 l9_5325=(*sc_set0.UserUniforms).patternColorId01;
l9_5324=l9_5325;
float4 l9_5326=float4(0.0);
float l9_5327=0.0;
float4 l9_5328=float4(0.0);
float4 l9_5329=float4(0.0);
ssGlobals l9_5330=l9_5320;
float l9_5331=0.0;
float l9_5332=float((*sc_set0.UserUniforms).pngPatternId01!=0);
l9_5331=l9_5332;
l9_5327=l9_5331;
float4 l9_5333;
if ((l9_5327*1.0)!=0.0)
{
float2 l9_5334=float2(0.0);
l9_5334=l9_5330.Surface_UVCoord0;
float2 l9_5335=float2(0.0);
float2 l9_5336=(*sc_set0.UserUniforms).patternScaleId01;
l9_5335=l9_5336;
float2 l9_5337=float2(0.0);
l9_5337=((l9_5334-(*sc_set0.UserUniforms).Port_Center_N122)*l9_5335)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_5338=float2(0.0);
float2 l9_5339=(*sc_set0.UserUniforms).patternOffsetId01;
l9_5338=l9_5339;
float2 l9_5340=float2(0.0);
l9_5340=l9_5337+l9_5338;
float l9_5341=0.0;
float l9_5342=(*sc_set0.UserUniforms).patternRotateId01;
l9_5341=l9_5342;
float2 l9_5343=float2(0.0);
float2 l9_5344=l9_5340;
float l9_5345=l9_5341;
float2 l9_5346=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_5347=sin(radians(l9_5345));
float l9_5348=cos(radians(l9_5345));
float2 l9_5349=l9_5344-l9_5346;
l9_5349=float2(dot(float2(l9_5348,l9_5347),l9_5349),dot(float2(-l9_5347,l9_5348),l9_5349))+l9_5346;
l9_5343=l9_5349;
float4 l9_5350=float4(0.0);
int l9_5351;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_5352=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5352=0;
}
else
{
l9_5352=in.varStereoViewID;
}
int l9_5353=l9_5352;
l9_5351=1-l9_5353;
}
else
{
int l9_5354=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5354=0;
}
else
{
l9_5354=in.varStereoViewID;
}
int l9_5355=l9_5354;
l9_5351=l9_5355;
}
int l9_5356=l9_5351;
int l9_5357=patternTextureId01Layout_tmp;
int l9_5358=l9_5356;
float2 l9_5359=l9_5343;
bool l9_5360=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_5361=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_5362=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_5363=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_5364=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_5365=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_5366=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_5367=0.0;
bool l9_5368=l9_5365&&(!l9_5363);
float l9_5369=1.0;
float l9_5370=l9_5359.x;
int l9_5371=l9_5362.x;
if (l9_5371==1)
{
l9_5370=fract(l9_5370);
}
else
{
if (l9_5371==2)
{
float l9_5372=fract(l9_5370);
float l9_5373=l9_5370-l9_5372;
float l9_5374=step(0.25,fract(l9_5373*0.5));
l9_5370=mix(l9_5372,1.0-l9_5372,fast::clamp(l9_5374,0.0,1.0));
}
}
l9_5359.x=l9_5370;
float l9_5375=l9_5359.y;
int l9_5376=l9_5362.y;
if (l9_5376==1)
{
l9_5375=fract(l9_5375);
}
else
{
if (l9_5376==2)
{
float l9_5377=fract(l9_5375);
float l9_5378=l9_5375-l9_5377;
float l9_5379=step(0.25,fract(l9_5378*0.5));
l9_5375=mix(l9_5377,1.0-l9_5377,fast::clamp(l9_5379,0.0,1.0));
}
}
l9_5359.y=l9_5375;
if (l9_5363)
{
bool l9_5380=l9_5365;
bool l9_5381;
if (l9_5380)
{
l9_5381=l9_5362.x==3;
}
else
{
l9_5381=l9_5380;
}
float l9_5382=l9_5359.x;
float l9_5383=l9_5364.x;
float l9_5384=l9_5364.z;
bool l9_5385=l9_5381;
float l9_5386=l9_5369;
float l9_5387=fast::clamp(l9_5382,l9_5383,l9_5384);
float l9_5388=step(abs(l9_5382-l9_5387),9.9999997e-06);
l9_5386*=(l9_5388+((1.0-float(l9_5385))*(1.0-l9_5388)));
l9_5382=l9_5387;
l9_5359.x=l9_5382;
l9_5369=l9_5386;
bool l9_5389=l9_5365;
bool l9_5390;
if (l9_5389)
{
l9_5390=l9_5362.y==3;
}
else
{
l9_5390=l9_5389;
}
float l9_5391=l9_5359.y;
float l9_5392=l9_5364.y;
float l9_5393=l9_5364.w;
bool l9_5394=l9_5390;
float l9_5395=l9_5369;
float l9_5396=fast::clamp(l9_5391,l9_5392,l9_5393);
float l9_5397=step(abs(l9_5391-l9_5396),9.9999997e-06);
l9_5395*=(l9_5397+((1.0-float(l9_5394))*(1.0-l9_5397)));
l9_5391=l9_5396;
l9_5359.y=l9_5391;
l9_5369=l9_5395;
}
float2 l9_5398=l9_5359;
bool l9_5399=l9_5360;
float3x3 l9_5400=l9_5361;
if (l9_5399)
{
l9_5398=float2((l9_5400*float3(l9_5398,1.0)).xy);
}
float2 l9_5401=l9_5398;
l9_5359=l9_5401;
float l9_5402=l9_5359.x;
int l9_5403=l9_5362.x;
bool l9_5404=l9_5368;
float l9_5405=l9_5369;
if ((l9_5403==0)||(l9_5403==3))
{
float l9_5406=l9_5402;
float l9_5407=0.0;
float l9_5408=1.0;
bool l9_5409=l9_5404;
float l9_5410=l9_5405;
float l9_5411=fast::clamp(l9_5406,l9_5407,l9_5408);
float l9_5412=step(abs(l9_5406-l9_5411),9.9999997e-06);
l9_5410*=(l9_5412+((1.0-float(l9_5409))*(1.0-l9_5412)));
l9_5406=l9_5411;
l9_5402=l9_5406;
l9_5405=l9_5410;
}
l9_5359.x=l9_5402;
l9_5369=l9_5405;
float l9_5413=l9_5359.y;
int l9_5414=l9_5362.y;
bool l9_5415=l9_5368;
float l9_5416=l9_5369;
if ((l9_5414==0)||(l9_5414==3))
{
float l9_5417=l9_5413;
float l9_5418=0.0;
float l9_5419=1.0;
bool l9_5420=l9_5415;
float l9_5421=l9_5416;
float l9_5422=fast::clamp(l9_5417,l9_5418,l9_5419);
float l9_5423=step(abs(l9_5417-l9_5422),9.9999997e-06);
l9_5421*=(l9_5423+((1.0-float(l9_5420))*(1.0-l9_5423)));
l9_5417=l9_5422;
l9_5413=l9_5417;
l9_5416=l9_5421;
}
l9_5359.y=l9_5413;
l9_5369=l9_5416;
float2 l9_5424=l9_5359;
int l9_5425=l9_5357;
int l9_5426=l9_5358;
float l9_5427=l9_5367;
float2 l9_5428=l9_5424;
int l9_5429=l9_5425;
int l9_5430=l9_5426;
float3 l9_5431=float3(0.0);
if (l9_5429==0)
{
l9_5431=float3(l9_5428,0.0);
}
else
{
if (l9_5429==1)
{
l9_5431=float3(l9_5428.x,(l9_5428.y*0.5)+(0.5-(float(l9_5430)*0.5)),0.0);
}
else
{
l9_5431=float3(l9_5428,float(l9_5430));
}
}
float3 l9_5432=l9_5431;
float3 l9_5433=l9_5432;
float4 l9_5434=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_5433.xy,bias(l9_5427));
float4 l9_5435=l9_5434;
if (l9_5365)
{
l9_5435=mix(l9_5366,l9_5435,float4(l9_5369));
}
float4 l9_5436=l9_5435;
l9_5350=l9_5436;
l9_5328=l9_5350;
l9_5333=l9_5328;
}
else
{
float2 l9_5437=float2(0.0);
l9_5437=l9_5330.Surface_UVCoord0;
float2 l9_5438=float2(0.0);
float2 l9_5439=(*sc_set0.UserUniforms).patternScaleId01;
l9_5438=l9_5439;
float2 l9_5440=float2(0.0);
l9_5440=((l9_5437-(*sc_set0.UserUniforms).Port_Center_N122)*l9_5438)+(*sc_set0.UserUniforms).Port_Center_N122;
float2 l9_5441=float2(0.0);
float2 l9_5442=(*sc_set0.UserUniforms).patternOffsetId01;
l9_5441=l9_5442;
float2 l9_5443=float2(0.0);
l9_5443=l9_5440+l9_5441;
float l9_5444=0.0;
float l9_5445=(*sc_set0.UserUniforms).patternRotateId01;
l9_5444=l9_5445;
float2 l9_5446=float2(0.0);
float2 l9_5447=l9_5443;
float l9_5448=l9_5444;
float2 l9_5449=(*sc_set0.UserUniforms).Port_Center_N126;
float l9_5450=sin(radians(l9_5448));
float l9_5451=cos(radians(l9_5448));
float2 l9_5452=l9_5447-l9_5449;
l9_5452=float2(dot(float2(l9_5451,l9_5450),l9_5452),dot(float2(-l9_5450,l9_5451),l9_5452))+l9_5449;
l9_5446=l9_5452;
float4 l9_5453=float4(0.0);
int l9_5454;
if ((int(patternTextureId01HasSwappedViews_tmp)!=0))
{
int l9_5455=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5455=0;
}
else
{
l9_5455=in.varStereoViewID;
}
int l9_5456=l9_5455;
l9_5454=1-l9_5456;
}
else
{
int l9_5457=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5457=0;
}
else
{
l9_5457=in.varStereoViewID;
}
int l9_5458=l9_5457;
l9_5454=l9_5458;
}
int l9_5459=l9_5454;
int l9_5460=patternTextureId01Layout_tmp;
int l9_5461=l9_5459;
float2 l9_5462=l9_5446;
bool l9_5463=(int(SC_USE_UV_TRANSFORM_patternTextureId01_tmp)!=0);
float3x3 l9_5464=(*sc_set0.UserUniforms).patternTextureId01Transform;
int2 l9_5465=int2(SC_SOFTWARE_WRAP_MODE_U_patternTextureId01_tmp,SC_SOFTWARE_WRAP_MODE_V_patternTextureId01_tmp);
bool l9_5466=(int(SC_USE_UV_MIN_MAX_patternTextureId01_tmp)!=0);
float4 l9_5467=(*sc_set0.UserUniforms).patternTextureId01UvMinMax;
bool l9_5468=(int(SC_USE_CLAMP_TO_BORDER_patternTextureId01_tmp)!=0);
float4 l9_5469=(*sc_set0.UserUniforms).patternTextureId01BorderColor;
float l9_5470=0.0;
bool l9_5471=l9_5468&&(!l9_5466);
float l9_5472=1.0;
float l9_5473=l9_5462.x;
int l9_5474=l9_5465.x;
if (l9_5474==1)
{
l9_5473=fract(l9_5473);
}
else
{
if (l9_5474==2)
{
float l9_5475=fract(l9_5473);
float l9_5476=l9_5473-l9_5475;
float l9_5477=step(0.25,fract(l9_5476*0.5));
l9_5473=mix(l9_5475,1.0-l9_5475,fast::clamp(l9_5477,0.0,1.0));
}
}
l9_5462.x=l9_5473;
float l9_5478=l9_5462.y;
int l9_5479=l9_5465.y;
if (l9_5479==1)
{
l9_5478=fract(l9_5478);
}
else
{
if (l9_5479==2)
{
float l9_5480=fract(l9_5478);
float l9_5481=l9_5478-l9_5480;
float l9_5482=step(0.25,fract(l9_5481*0.5));
l9_5478=mix(l9_5480,1.0-l9_5480,fast::clamp(l9_5482,0.0,1.0));
}
}
l9_5462.y=l9_5478;
if (l9_5466)
{
bool l9_5483=l9_5468;
bool l9_5484;
if (l9_5483)
{
l9_5484=l9_5465.x==3;
}
else
{
l9_5484=l9_5483;
}
float l9_5485=l9_5462.x;
float l9_5486=l9_5467.x;
float l9_5487=l9_5467.z;
bool l9_5488=l9_5484;
float l9_5489=l9_5472;
float l9_5490=fast::clamp(l9_5485,l9_5486,l9_5487);
float l9_5491=step(abs(l9_5485-l9_5490),9.9999997e-06);
l9_5489*=(l9_5491+((1.0-float(l9_5488))*(1.0-l9_5491)));
l9_5485=l9_5490;
l9_5462.x=l9_5485;
l9_5472=l9_5489;
bool l9_5492=l9_5468;
bool l9_5493;
if (l9_5492)
{
l9_5493=l9_5465.y==3;
}
else
{
l9_5493=l9_5492;
}
float l9_5494=l9_5462.y;
float l9_5495=l9_5467.y;
float l9_5496=l9_5467.w;
bool l9_5497=l9_5493;
float l9_5498=l9_5472;
float l9_5499=fast::clamp(l9_5494,l9_5495,l9_5496);
float l9_5500=step(abs(l9_5494-l9_5499),9.9999997e-06);
l9_5498*=(l9_5500+((1.0-float(l9_5497))*(1.0-l9_5500)));
l9_5494=l9_5499;
l9_5462.y=l9_5494;
l9_5472=l9_5498;
}
float2 l9_5501=l9_5462;
bool l9_5502=l9_5463;
float3x3 l9_5503=l9_5464;
if (l9_5502)
{
l9_5501=float2((l9_5503*float3(l9_5501,1.0)).xy);
}
float2 l9_5504=l9_5501;
l9_5462=l9_5504;
float l9_5505=l9_5462.x;
int l9_5506=l9_5465.x;
bool l9_5507=l9_5471;
float l9_5508=l9_5472;
if ((l9_5506==0)||(l9_5506==3))
{
float l9_5509=l9_5505;
float l9_5510=0.0;
float l9_5511=1.0;
bool l9_5512=l9_5507;
float l9_5513=l9_5508;
float l9_5514=fast::clamp(l9_5509,l9_5510,l9_5511);
float l9_5515=step(abs(l9_5509-l9_5514),9.9999997e-06);
l9_5513*=(l9_5515+((1.0-float(l9_5512))*(1.0-l9_5515)));
l9_5509=l9_5514;
l9_5505=l9_5509;
l9_5508=l9_5513;
}
l9_5462.x=l9_5505;
l9_5472=l9_5508;
float l9_5516=l9_5462.y;
int l9_5517=l9_5465.y;
bool l9_5518=l9_5471;
float l9_5519=l9_5472;
if ((l9_5517==0)||(l9_5517==3))
{
float l9_5520=l9_5516;
float l9_5521=0.0;
float l9_5522=1.0;
bool l9_5523=l9_5518;
float l9_5524=l9_5519;
float l9_5525=fast::clamp(l9_5520,l9_5521,l9_5522);
float l9_5526=step(abs(l9_5520-l9_5525),9.9999997e-06);
l9_5524*=(l9_5526+((1.0-float(l9_5523))*(1.0-l9_5526)));
l9_5520=l9_5525;
l9_5516=l9_5520;
l9_5519=l9_5524;
}
l9_5462.y=l9_5516;
l9_5472=l9_5519;
float2 l9_5527=l9_5462;
int l9_5528=l9_5460;
int l9_5529=l9_5461;
float l9_5530=l9_5470;
float2 l9_5531=l9_5527;
int l9_5532=l9_5528;
int l9_5533=l9_5529;
float3 l9_5534=float3(0.0);
if (l9_5532==0)
{
l9_5534=float3(l9_5531,0.0);
}
else
{
if (l9_5532==1)
{
l9_5534=float3(l9_5531.x,(l9_5531.y*0.5)+(0.5-(float(l9_5533)*0.5)),0.0);
}
else
{
l9_5534=float3(l9_5531,float(l9_5533));
}
}
float3 l9_5535=l9_5534;
float3 l9_5536=l9_5535;
float4 l9_5537=sc_set0.patternTextureId01.sample(sc_set0.patternTextureId01SmpSC,l9_5536.xy,bias(l9_5530));
float4 l9_5538=l9_5537;
if (l9_5468)
{
l9_5538=mix(l9_5469,l9_5538,float4(l9_5472));
}
float4 l9_5539=l9_5538;
l9_5453=l9_5539;
float l9_5540=0.0;
float3 l9_5541=l9_5453.xyz;
float l9_5542=l9_5541.x;
l9_5540=l9_5542;
l9_5329=float4(l9_5540);
l9_5333=l9_5329;
}
l9_5326=l9_5333;
float4 l9_5543=float4(0.0);
l9_5543=l9_5324*l9_5326;
l9_5318=l9_5543;
l9_5323=l9_5318;
}
else
{
float4 l9_5544=float4(0.0);
float4 l9_5545=(*sc_set0.UserUniforms).colorId01;
l9_5544=l9_5545;
float2 l9_5546=float2(0.0);
l9_5546=l9_5320.Surface_UVCoord0;
float4 l9_5547=float4(0.0);
int l9_5548;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_5549=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5549=0;
}
else
{
l9_5549=in.varStereoViewID;
}
int l9_5550=l9_5549;
l9_5548=1-l9_5550;
}
else
{
int l9_5551=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5551=0;
}
else
{
l9_5551=in.varStereoViewID;
}
int l9_5552=l9_5551;
l9_5548=l9_5552;
}
int l9_5553=l9_5548;
int l9_5554=greyMaskIdLayout_tmp;
int l9_5555=l9_5553;
float2 l9_5556=l9_5546;
bool l9_5557=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_5558=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_5559=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_5560=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_5561=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_5562=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_5563=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_5564=0.0;
bool l9_5565=l9_5562&&(!l9_5560);
float l9_5566=1.0;
float l9_5567=l9_5556.x;
int l9_5568=l9_5559.x;
if (l9_5568==1)
{
l9_5567=fract(l9_5567);
}
else
{
if (l9_5568==2)
{
float l9_5569=fract(l9_5567);
float l9_5570=l9_5567-l9_5569;
float l9_5571=step(0.25,fract(l9_5570*0.5));
l9_5567=mix(l9_5569,1.0-l9_5569,fast::clamp(l9_5571,0.0,1.0));
}
}
l9_5556.x=l9_5567;
float l9_5572=l9_5556.y;
int l9_5573=l9_5559.y;
if (l9_5573==1)
{
l9_5572=fract(l9_5572);
}
else
{
if (l9_5573==2)
{
float l9_5574=fract(l9_5572);
float l9_5575=l9_5572-l9_5574;
float l9_5576=step(0.25,fract(l9_5575*0.5));
l9_5572=mix(l9_5574,1.0-l9_5574,fast::clamp(l9_5576,0.0,1.0));
}
}
l9_5556.y=l9_5572;
if (l9_5560)
{
bool l9_5577=l9_5562;
bool l9_5578;
if (l9_5577)
{
l9_5578=l9_5559.x==3;
}
else
{
l9_5578=l9_5577;
}
float l9_5579=l9_5556.x;
float l9_5580=l9_5561.x;
float l9_5581=l9_5561.z;
bool l9_5582=l9_5578;
float l9_5583=l9_5566;
float l9_5584=fast::clamp(l9_5579,l9_5580,l9_5581);
float l9_5585=step(abs(l9_5579-l9_5584),9.9999997e-06);
l9_5583*=(l9_5585+((1.0-float(l9_5582))*(1.0-l9_5585)));
l9_5579=l9_5584;
l9_5556.x=l9_5579;
l9_5566=l9_5583;
bool l9_5586=l9_5562;
bool l9_5587;
if (l9_5586)
{
l9_5587=l9_5559.y==3;
}
else
{
l9_5587=l9_5586;
}
float l9_5588=l9_5556.y;
float l9_5589=l9_5561.y;
float l9_5590=l9_5561.w;
bool l9_5591=l9_5587;
float l9_5592=l9_5566;
float l9_5593=fast::clamp(l9_5588,l9_5589,l9_5590);
float l9_5594=step(abs(l9_5588-l9_5593),9.9999997e-06);
l9_5592*=(l9_5594+((1.0-float(l9_5591))*(1.0-l9_5594)));
l9_5588=l9_5593;
l9_5556.y=l9_5588;
l9_5566=l9_5592;
}
float2 l9_5595=l9_5556;
bool l9_5596=l9_5557;
float3x3 l9_5597=l9_5558;
if (l9_5596)
{
l9_5595=float2((l9_5597*float3(l9_5595,1.0)).xy);
}
float2 l9_5598=l9_5595;
l9_5556=l9_5598;
float l9_5599=l9_5556.x;
int l9_5600=l9_5559.x;
bool l9_5601=l9_5565;
float l9_5602=l9_5566;
if ((l9_5600==0)||(l9_5600==3))
{
float l9_5603=l9_5599;
float l9_5604=0.0;
float l9_5605=1.0;
bool l9_5606=l9_5601;
float l9_5607=l9_5602;
float l9_5608=fast::clamp(l9_5603,l9_5604,l9_5605);
float l9_5609=step(abs(l9_5603-l9_5608),9.9999997e-06);
l9_5607*=(l9_5609+((1.0-float(l9_5606))*(1.0-l9_5609)));
l9_5603=l9_5608;
l9_5599=l9_5603;
l9_5602=l9_5607;
}
l9_5556.x=l9_5599;
l9_5566=l9_5602;
float l9_5610=l9_5556.y;
int l9_5611=l9_5559.y;
bool l9_5612=l9_5565;
float l9_5613=l9_5566;
if ((l9_5611==0)||(l9_5611==3))
{
float l9_5614=l9_5610;
float l9_5615=0.0;
float l9_5616=1.0;
bool l9_5617=l9_5612;
float l9_5618=l9_5613;
float l9_5619=fast::clamp(l9_5614,l9_5615,l9_5616);
float l9_5620=step(abs(l9_5614-l9_5619),9.9999997e-06);
l9_5618*=(l9_5620+((1.0-float(l9_5617))*(1.0-l9_5620)));
l9_5614=l9_5619;
l9_5610=l9_5614;
l9_5613=l9_5618;
}
l9_5556.y=l9_5610;
l9_5566=l9_5613;
float2 l9_5621=l9_5556;
int l9_5622=l9_5554;
int l9_5623=l9_5555;
float l9_5624=l9_5564;
float2 l9_5625=l9_5621;
int l9_5626=l9_5622;
int l9_5627=l9_5623;
float3 l9_5628=float3(0.0);
if (l9_5626==0)
{
l9_5628=float3(l9_5625,0.0);
}
else
{
if (l9_5626==1)
{
l9_5628=float3(l9_5625.x,(l9_5625.y*0.5)+(0.5-(float(l9_5627)*0.5)),0.0);
}
else
{
l9_5628=float3(l9_5625,float(l9_5627));
}
}
float3 l9_5629=l9_5628;
float3 l9_5630=l9_5629;
float4 l9_5631=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_5630.xy,bias(l9_5624));
float4 l9_5632=l9_5631;
if (l9_5562)
{
l9_5632=mix(l9_5563,l9_5632,float4(l9_5566));
}
float4 l9_5633=l9_5632;
l9_5547=l9_5633;
float l9_5634=0.0;
l9_5634=l9_5547.x;
float l9_5635=0.0;
l9_5635=step(l9_5634,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_5636=float4(0.0);
l9_5636=l9_5544*float4(l9_5635);
l9_5319=l9_5636;
l9_5323=l9_5319;
}
l9_5316=l9_5323;
float2 l9_5637=float2(0.0);
l9_5637=l9_4878.Surface_UVCoord0;
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
l9_5727=l9_5316*float4(l9_5726);
float4 l9_5728=float4(0.0);
float4 l9_5729=(*sc_set0.UserUniforms).colorId01;
l9_5728=l9_5729;
float4 l9_5730=float4(0.0);
l9_5730=l9_5728*float4(l9_5726);
float4 l9_5731=float4(0.0);
float4 l9_5732=l9_5727;
float4 l9_5733=l9_5730;
float4 l9_5734=l9_5732;
float4 l9_5735=l9_5733;
float3 l9_5736=l9_5734.xyz*l9_5734.w;
l9_5734=float4(l9_5736.x,l9_5736.y,l9_5736.z,l9_5734.w);
float4 l9_5737=l9_5734+(l9_5735*(1.0-l9_5734.w));
l9_5731=l9_5737;
l9_4877=l9_5731;
l9_4881=l9_4877;
}
l9_4874=l9_4881;
l9_3977=l9_4874;
l9_3981=l9_3977;
}
l9_3974=l9_3981;
float2 l9_5738=float2(0.0);
l9_5738=param_32.Surface_UVCoord0;
float4 l9_5739=float4(0.0);
int l9_5740;
if ((int(greyMaskIdHasSwappedViews_tmp)!=0))
{
int l9_5741=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5741=0;
}
else
{
l9_5741=in.varStereoViewID;
}
int l9_5742=l9_5741;
l9_5740=1-l9_5742;
}
else
{
int l9_5743=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5743=0;
}
else
{
l9_5743=in.varStereoViewID;
}
int l9_5744=l9_5743;
l9_5740=l9_5744;
}
int l9_5745=l9_5740;
int l9_5746=greyMaskIdLayout_tmp;
int l9_5747=l9_5745;
float2 l9_5748=l9_5738;
bool l9_5749=(int(SC_USE_UV_TRANSFORM_greyMaskId_tmp)!=0);
float3x3 l9_5750=(*sc_set0.UserUniforms).greyMaskIdTransform;
int2 l9_5751=int2(SC_SOFTWARE_WRAP_MODE_U_greyMaskId_tmp,SC_SOFTWARE_WRAP_MODE_V_greyMaskId_tmp);
bool l9_5752=(int(SC_USE_UV_MIN_MAX_greyMaskId_tmp)!=0);
float4 l9_5753=(*sc_set0.UserUniforms).greyMaskIdUvMinMax;
bool l9_5754=(int(SC_USE_CLAMP_TO_BORDER_greyMaskId_tmp)!=0);
float4 l9_5755=(*sc_set0.UserUniforms).greyMaskIdBorderColor;
float l9_5756=0.0;
bool l9_5757=l9_5754&&(!l9_5752);
float l9_5758=1.0;
float l9_5759=l9_5748.x;
int l9_5760=l9_5751.x;
if (l9_5760==1)
{
l9_5759=fract(l9_5759);
}
else
{
if (l9_5760==2)
{
float l9_5761=fract(l9_5759);
float l9_5762=l9_5759-l9_5761;
float l9_5763=step(0.25,fract(l9_5762*0.5));
l9_5759=mix(l9_5761,1.0-l9_5761,fast::clamp(l9_5763,0.0,1.0));
}
}
l9_5748.x=l9_5759;
float l9_5764=l9_5748.y;
int l9_5765=l9_5751.y;
if (l9_5765==1)
{
l9_5764=fract(l9_5764);
}
else
{
if (l9_5765==2)
{
float l9_5766=fract(l9_5764);
float l9_5767=l9_5764-l9_5766;
float l9_5768=step(0.25,fract(l9_5767*0.5));
l9_5764=mix(l9_5766,1.0-l9_5766,fast::clamp(l9_5768,0.0,1.0));
}
}
l9_5748.y=l9_5764;
if (l9_5752)
{
bool l9_5769=l9_5754;
bool l9_5770;
if (l9_5769)
{
l9_5770=l9_5751.x==3;
}
else
{
l9_5770=l9_5769;
}
float l9_5771=l9_5748.x;
float l9_5772=l9_5753.x;
float l9_5773=l9_5753.z;
bool l9_5774=l9_5770;
float l9_5775=l9_5758;
float l9_5776=fast::clamp(l9_5771,l9_5772,l9_5773);
float l9_5777=step(abs(l9_5771-l9_5776),9.9999997e-06);
l9_5775*=(l9_5777+((1.0-float(l9_5774))*(1.0-l9_5777)));
l9_5771=l9_5776;
l9_5748.x=l9_5771;
l9_5758=l9_5775;
bool l9_5778=l9_5754;
bool l9_5779;
if (l9_5778)
{
l9_5779=l9_5751.y==3;
}
else
{
l9_5779=l9_5778;
}
float l9_5780=l9_5748.y;
float l9_5781=l9_5753.y;
float l9_5782=l9_5753.w;
bool l9_5783=l9_5779;
float l9_5784=l9_5758;
float l9_5785=fast::clamp(l9_5780,l9_5781,l9_5782);
float l9_5786=step(abs(l9_5780-l9_5785),9.9999997e-06);
l9_5784*=(l9_5786+((1.0-float(l9_5783))*(1.0-l9_5786)));
l9_5780=l9_5785;
l9_5748.y=l9_5780;
l9_5758=l9_5784;
}
float2 l9_5787=l9_5748;
bool l9_5788=l9_5749;
float3x3 l9_5789=l9_5750;
if (l9_5788)
{
l9_5787=float2((l9_5789*float3(l9_5787,1.0)).xy);
}
float2 l9_5790=l9_5787;
l9_5748=l9_5790;
float l9_5791=l9_5748.x;
int l9_5792=l9_5751.x;
bool l9_5793=l9_5757;
float l9_5794=l9_5758;
if ((l9_5792==0)||(l9_5792==3))
{
float l9_5795=l9_5791;
float l9_5796=0.0;
float l9_5797=1.0;
bool l9_5798=l9_5793;
float l9_5799=l9_5794;
float l9_5800=fast::clamp(l9_5795,l9_5796,l9_5797);
float l9_5801=step(abs(l9_5795-l9_5800),9.9999997e-06);
l9_5799*=(l9_5801+((1.0-float(l9_5798))*(1.0-l9_5801)));
l9_5795=l9_5800;
l9_5791=l9_5795;
l9_5794=l9_5799;
}
l9_5748.x=l9_5791;
l9_5758=l9_5794;
float l9_5802=l9_5748.y;
int l9_5803=l9_5751.y;
bool l9_5804=l9_5757;
float l9_5805=l9_5758;
if ((l9_5803==0)||(l9_5803==3))
{
float l9_5806=l9_5802;
float l9_5807=0.0;
float l9_5808=1.0;
bool l9_5809=l9_5804;
float l9_5810=l9_5805;
float l9_5811=fast::clamp(l9_5806,l9_5807,l9_5808);
float l9_5812=step(abs(l9_5806-l9_5811),9.9999997e-06);
l9_5810*=(l9_5812+((1.0-float(l9_5809))*(1.0-l9_5812)));
l9_5806=l9_5811;
l9_5802=l9_5806;
l9_5805=l9_5810;
}
l9_5748.y=l9_5802;
l9_5758=l9_5805;
float2 l9_5813=l9_5748;
int l9_5814=l9_5746;
int l9_5815=l9_5747;
float l9_5816=l9_5756;
float2 l9_5817=l9_5813;
int l9_5818=l9_5814;
int l9_5819=l9_5815;
float3 l9_5820=float3(0.0);
if (l9_5818==0)
{
l9_5820=float3(l9_5817,0.0);
}
else
{
if (l9_5818==1)
{
l9_5820=float3(l9_5817.x,(l9_5817.y*0.5)+(0.5-(float(l9_5819)*0.5)),0.0);
}
else
{
l9_5820=float3(l9_5817,float(l9_5819));
}
}
float3 l9_5821=l9_5820;
float3 l9_5822=l9_5821;
float4 l9_5823=sc_set0.greyMaskId.sample(sc_set0.greyMaskIdSmpSC,l9_5822.xy,bias(l9_5816));
float4 l9_5824=l9_5823;
if (l9_5754)
{
l9_5824=mix(l9_5755,l9_5824,float4(l9_5758));
}
float4 l9_5825=l9_5824;
l9_5739=l9_5825;
float l9_5826=0.0;
l9_5826=l9_5739.x;
float l9_5827=0.0;
l9_5827=step(l9_5826,(*sc_set0.UserUniforms).Port_Input1_N034);
float4 l9_5828=float4(0.0);
l9_5828=l9_3974*float4(l9_5827);
param_30=l9_5828;
param_31=param_30;
}
Result_N184=param_31;
float4 Output_N5=float4(0.0);
Output_N5=Output_N15+Result_N184;
float4 Output_N50=float4(0.0);
Output_N50=((Output_N5*Output_N5)*Output_N5)*Output_N5;
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
Output_N67=mix(Output_N5,Output_N51,Export_N64);
float Output_N68=0.0;
float param_33=(*sc_set0.UserUniforms).Tweak_N47;
Output_N68=param_33;
float4 Output_N69=float4(0.0);
float4 param_34=Output_N67;
float param_35=Output_N68;
float l9_5829=dot(param_34.xyz,float3(0.29899999,0.58700001,0.114));
float4 param_36=float4(mix(float3(l9_5829),param_34.xyz,float3(param_35)),param_34.w);
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
float4 l9_5830=fast::max(param_37,float4(0.0));
float4 param_38=l9_5830;
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
float4 l9_5831=param_39;
float4 l9_5832=l9_5831;
float l9_5833=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_5833=l9_5832.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_5833=fast::clamp(l9_5832.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_5833=fast::clamp(dot(l9_5832.xyz,float3(l9_5832.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_5833=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_5833=(1.0-dot(l9_5832.xyz,float3(0.33333001)))*l9_5832.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_5833=(1.0-fast::clamp(dot(l9_5832.xyz,float3(1.0)),0.0,1.0))*l9_5832.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_5833=fast::clamp(dot(l9_5832.xyz,float3(1.0)),0.0,1.0)*l9_5832.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_5833=fast::clamp(dot(l9_5832.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_5833=fast::clamp(dot(l9_5832.xyz,float3(1.0)),0.0,1.0)*l9_5832.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_5833=dot(l9_5832.xyz,float3(0.33333001))*l9_5832.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_5833=1.0-fast::clamp(dot(l9_5832.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_5833=fast::clamp(dot(l9_5832.xyz,float3(1.0)),0.0,1.0);
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
float l9_5834=l9_5833;
float l9_5835=l9_5834;
float l9_5836=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_5835;
float3 l9_5837=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_5831.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_5838=float4(l9_5837.x,l9_5837.y,l9_5837.z,l9_5836);
param_39=l9_5838;
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
float4 l9_5839=param_39;
float4 l9_5840=float4(0.0);
float4 l9_5841=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_5842=out.sc_FragData0;
l9_5841=l9_5842;
}
else
{
float4 l9_5843=gl_FragCoord;
float2 l9_5844=l9_5843.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_5845=l9_5844;
float2 l9_5846=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_5847=1;
int l9_5848=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5848=0;
}
else
{
l9_5848=in.varStereoViewID;
}
int l9_5849=l9_5848;
int l9_5850=l9_5849;
float3 l9_5851=float3(l9_5845,0.0);
int l9_5852=l9_5847;
int l9_5853=l9_5850;
if (l9_5852==1)
{
l9_5851.y=((2.0*l9_5851.y)+float(l9_5853))-1.0;
}
float2 l9_5854=l9_5851.xy;
l9_5846=l9_5854;
}
else
{
l9_5846=l9_5845;
}
float2 l9_5855=l9_5846;
float2 l9_5856=l9_5855;
float2 l9_5857=l9_5856;
float2 l9_5858=l9_5857;
float l9_5859=0.0;
int l9_5860;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_5861=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5861=0;
}
else
{
l9_5861=in.varStereoViewID;
}
int l9_5862=l9_5861;
l9_5860=1-l9_5862;
}
else
{
int l9_5863=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5863=0;
}
else
{
l9_5863=in.varStereoViewID;
}
int l9_5864=l9_5863;
l9_5860=l9_5864;
}
int l9_5865=l9_5860;
float2 l9_5866=l9_5858;
int l9_5867=sc_ScreenTextureLayout_tmp;
int l9_5868=l9_5865;
float l9_5869=l9_5859;
float2 l9_5870=l9_5866;
int l9_5871=l9_5867;
int l9_5872=l9_5868;
float3 l9_5873=float3(0.0);
if (l9_5871==0)
{
l9_5873=float3(l9_5870,0.0);
}
else
{
if (l9_5871==1)
{
l9_5873=float3(l9_5870.x,(l9_5870.y*0.5)+(0.5-(float(l9_5872)*0.5)),0.0);
}
else
{
l9_5873=float3(l9_5870,float(l9_5872));
}
}
float3 l9_5874=l9_5873;
float3 l9_5875=l9_5874;
float4 l9_5876=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_5875.xy,bias(l9_5869));
float4 l9_5877=l9_5876;
float4 l9_5878=l9_5877;
l9_5841=l9_5878;
}
float4 l9_5879=l9_5841;
float3 l9_5880=l9_5879.xyz;
float3 l9_5881=l9_5880;
float3 l9_5882=l9_5839.xyz;
float3 l9_5883=definedBlend(l9_5881,l9_5882,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_5840=float4(l9_5883.x,l9_5883.y,l9_5883.z,l9_5840.w);
float3 l9_5884=mix(l9_5880,l9_5840.xyz,float3(l9_5839.w));
l9_5840=float4(l9_5884.x,l9_5884.y,l9_5884.z,l9_5840.w);
l9_5840.w=1.0;
float4 l9_5885=l9_5840;
param_39=l9_5885;
}
else
{
if ((int(sc_Voxelization_tmp)!=0))
{
float4 l9_5886=float4(in.varScreenPos.xyz,1.0);
param_39=l9_5886;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
float4 l9_5887=gl_FragCoord;
float l9_5888=fast::clamp(abs(l9_5887.z),0.0,1.0);
float4 l9_5889=float4(l9_5888,1.0-l9_5888,1.0,1.0);
param_39=l9_5889;
}
else
{
float4 l9_5890=param_39;
float4 l9_5891=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_5891=float4(mix(float3(1.0),l9_5890.xyz,float3(l9_5890.w)),l9_5890.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_5892=l9_5890.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_5892=fast::clamp(l9_5892,0.0,1.0);
}
l9_5891=float4(l9_5890.xyz*l9_5892,l9_5892);
}
else
{
l9_5891=l9_5890;
}
}
float4 l9_5893=l9_5891;
param_39=l9_5893;
}
}
}
}
}
float4 l9_5894=param_39;
FinalColor=l9_5894;
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
float4 l9_5895=float4(0.0);
l9_5895=float4(0.0);
float4 l9_5896=l9_5895;
float4 Cost=l9_5896;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_40=FinalColor;
FinalColor=sc_OutputMotionVectorIfNeeded(param_40,in.varPosAndMotion,in.varNormalAndMotion);
float4 param_41=FinalColor;
float4 l9_5897=param_41;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_5897.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.sc_FragData0=l9_5897;
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
float4 greyMaskIdSize;
float4 greyMaskIdDims;
float4 greyMaskIdView;
float3x3 greyMaskIdTransform;
float4 greyMaskIdUvMinMax;
float4 greyMaskIdBorderColor;
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
float Port_Import_N007;
float3 Port_Import_N009;
float4 Port_Input2_N015;
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
texture2d<float> sc_EnvmapDiffuse [[id(10)]];
texture2d<float> sc_EnvmapSpecular [[id(11)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(20)]];
texture2d<uint> sc_RayTracingHitCasterIdAndBarycentric [[id(21)]];
texture2d<float> sc_RayTracingRayDirection [[id(22)]];
texture2d<float> sc_RayTracingReflections [[id(23)]];
texture2d<float> sc_RayTracingShadows [[id(24)]];
texture2d<float> sc_SSAOTexture [[id(25)]];
texture2d<float> sc_ScreenTexture [[id(26)]];
texture2d<float> sc_ShadowTexture [[id(27)]];
sampler Tweak_N25SmpSC [[id(29)]];
sampler Tweak_N27SmpSC [[id(30)]];
sampler greyMaskIdSmpSC [[id(31)]];
sampler intensityTextureSmpSC [[id(32)]];
sampler patternTextureId01SmpSC [[id(33)]];
sampler patternTextureId02SmpSC [[id(34)]];
sampler sc_EnvmapDiffuseSmpSC [[id(35)]];
sampler sc_EnvmapSpecularSmpSC [[id(36)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(38)]];
sampler sc_RayTracingHitCasterIdAndBarycentricSmpSC [[id(39)]];
sampler sc_RayTracingRayDirectionSmpSC [[id(40)]];
sampler sc_RayTracingReflectionsSmpSC [[id(41)]];
sampler sc_RayTracingShadowsSmpSC [[id(42)]];
sampler sc_SSAOTextureSmpSC [[id(43)]];
sampler sc_ScreenTextureSmpSC [[id(44)]];
sampler sc_ShadowTextureSmpSC [[id(45)]];
constant userUniformsObj* UserUniforms [[id(47)]];
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
float l9_1=float((*sc_set0.UserUniforms).ColorOnOffid02!=0);
l9_0=l9_1;
param=l9_0;
if ((param*1.0)!=0.0)
{
float l9_2=0.0;
ssGlobals l9_3=param_1;
float l9_4=0.0;
float l9_5=float((*sc_set0.UserUniforms).pbrOnOffId02!=0);
l9_4=l9_5;
l9_2=l9_4;
if ((l9_2*1.0)!=0.0)
{
float l9_6=0.0;
float l9_7=(*sc_set0.UserUniforms).rougnessId02;
l9_6=l9_7;
float l9_8=(*sc_set0.UserUniforms).Port_Opacity_N313;
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
float l9_33=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
l9_32=l9_33;
l9_30=l9_32;
if ((l9_30*1.0)!=0.0)
{
float l9_34=0.0;
float l9_35=(*sc_set0.UserUniforms).rougnessId01;
l9_34=l9_35;
float l9_36=(*sc_set0.UserUniforms).Port_Opacity_N152;
float l9_37=l9_34;
ssGlobals l9_38=l9_31;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_38.BumpedNormal=l9_38.VertexNormal_WorldSpace;
}
float l9_39=l9_36;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_39<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_40=gl_FragCoord;
float2 l9_41=floor(mod(l9_40.xy,float2(4.0)));
float l9_42=(mod(dot(l9_41,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_39<l9_42)
{
discard_fragment();
}
}
float3 l9_43=l9_38.PositionWS;
float3 l9_44=l9_38.BumpedNormal;
float l9_45=l9_37;
float3 l9_46=l9_43;
float3 l9_47=l9_44;
float l9_48=l9_45;
uint l9_49=0u;
uint3 l9_50=uint3(round((l9_46-(*sc_set0.UserUniforms).sc_RayTracingOriginOffset)*(*sc_set0.UserUniforms).sc_RayTracingOriginScale));
out.sc_RayTracingPositionAndMask=uint4(l9_50.x,l9_50.y,l9_50.z,out.sc_RayTracingPositionAndMask.w);
out.sc_RayTracingPositionAndMask.w=(*sc_set0.UserUniforms).sc_RayTracingReceiverMask;
float3 l9_51=l9_47;
float l9_52=dot(abs(l9_51),float3(1.0));
l9_51/=float3(l9_52);
float2 l9_53=float2(fast::clamp(-l9_51.z,0.0,1.0));
float2 l9_54=l9_51.xy+mix(-l9_53,l9_53,step(float2(0.0),l9_51.xy));
uint l9_55=as_type<uint>(half2(l9_54));
uint2 l9_56=uint2(l9_55&65535u,l9_55>>16u);
out.sc_RayTracingNormalAndMore=uint4(l9_56.x,l9_56.y,out.sc_RayTracingNormalAndMore.z,out.sc_RayTracingNormalAndMore.w);
out.sc_RayTracingNormalAndMore.z=l9_49;
uint l9_57=uint(fast::clamp(l9_48,0.0,1.0)*1000.0);
l9_57 |= (((*sc_set0.UserUniforms).sc_RayTracingReceiverId%32u)<<10u);
out.sc_RayTracingNormalAndMore.w=l9_57;
}
else
{
}
}
else
{
float l9_58=0.0;
ssGlobals l9_59=param_1;
float l9_60=0.0;
float l9_61=float((*sc_set0.UserUniforms).pbrOnOffId01!=0);
l9_60=l9_61;
l9_58=l9_60;
if ((l9_58*1.0)!=0.0)
{
float l9_62=0.0;
float l9_63=(*sc_set0.UserUniforms).rougnessId01;
l9_62=l9_63;
float l9_64=(*sc_set0.UserUniforms).Port_Opacity_N152;
float l9_65=l9_62;
ssGlobals l9_66=l9_59;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_66.BumpedNormal=l9_66.VertexNormal_WorldSpace;
}
float l9_67=l9_64;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_67<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_68=gl_FragCoord;
float2 l9_69=floor(mod(l9_68.xy,float2(4.0)));
float l9_70=(mod(dot(l9_69,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_67<l9_70)
{
discard_fragment();
}
}
float3 l9_71=l9_66.PositionWS;
float3 l9_72=l9_66.BumpedNormal;
float l9_73=l9_65;
float3 l9_74=l9_71;
float3 l9_75=l9_72;
float l9_76=l9_73;
uint l9_77=0u;
uint3 l9_78=uint3(round((l9_74-(*sc_set0.UserUniforms).sc_RayTracingOriginOffset)*(*sc_set0.UserUniforms).sc_RayTracingOriginScale));
out.sc_RayTracingPositionAndMask=uint4(l9_78.x,l9_78.y,l9_78.z,out.sc_RayTracingPositionAndMask.w);
out.sc_RayTracingPositionAndMask.w=(*sc_set0.UserUniforms).sc_RayTracingReceiverMask;
float3 l9_79=l9_75;
float l9_80=dot(abs(l9_79),float3(1.0));
l9_79/=float3(l9_80);
float2 l9_81=float2(fast::clamp(-l9_79.z,0.0,1.0));
float2 l9_82=l9_79.xy+mix(-l9_81,l9_81,step(float2(0.0),l9_79.xy));
uint l9_83=as_type<uint>(half2(l9_82));
uint2 l9_84=uint2(l9_83&65535u,l9_83>>16u);
out.sc_RayTracingNormalAndMore=uint4(l9_84.x,l9_84.y,out.sc_RayTracingNormalAndMore.z,out.sc_RayTracingNormalAndMore.w);
out.sc_RayTracingNormalAndMore.z=l9_77;
uint l9_85=uint(fast::clamp(l9_76,0.0,1.0)*1000.0);
l9_85 |= (((*sc_set0.UserUniforms).sc_RayTracingReceiverId%32u)<<10u);
out.sc_RayTracingNormalAndMore.w=l9_85;
}
else
{
}
}
return out;
}
} // RECEIVER MODE SHADER

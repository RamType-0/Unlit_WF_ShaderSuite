﻿/*
 *  The MIT License
 *
 *  Copyright 2018-2019 whiteflare.
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
 *  to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 *  and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 *  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 *  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
Shader "UnlitWF/UnToon_PowerCap/WF_UnToon_PowerCap_Texture" {

    /*
     * authors:
     *      ver:2019/09/14 whiteflare,
     */

    Properties {
        // 基本
        [WFHeader(Base)]
            _MainTex        ("Main Texture", 2D) = "white" {}
        [HDR]
            _Color          ("Color", Color) = (1, 1, 1, 1)
        [Enum(OFF,0,FRONT,1,BACK,2)]
            _CullMode       ("Cull Mode", int) = 2

        // Lit
        [WFHeader(Lit)]
        [Enum(OFF,0,BRIGHT,80,DARK,97,BLACK,100)]
            _GL_Level       ("Anti-Glare", Float) = 97
            _GL_BrendPower  ("Blend Light Color", Range(0, 1)) = 0.8
        [Toggle(_)]
            _GL_CastShadow  ("Cast Shadows", Range(0, 1)) = 1

        // 法線マップ
        [WFHeaderToggle(NormalMap)]
            _NM_Enable      ("[NM] Enable", Float) = 0
        [NoScaleOffset]
            _BumpMap        ("[NM] NormalMap Texture", 2D) = "bump" {}
            _BumpScale      ("[NM] Bump Scale", Range(0, 2)) = 1.0
            _NM_Power       ("[NM] Shadow Power", Range(0, 1)) = 0.25
        [Toggle(_)]
            _NM_FlipTangent ("[NM] Flip Tangent", Float) = 0

        [Header(NormalMap Secondary)]
        [Enum(OFF,0,BLEND,1,SWITCH,2)]
            _NM_2ndType     ("[NM] 2nd Normal Blend", Float) = 0
            _DetailNormalMap        ("[NM] 2nd NormalMap Texture", 2D) = "bump" {}
            _DetailNormalMapScale   ("[NM] 2nd Bump Scale", Range(0, 2)) = 0.4
        [NoScaleOffset]
            _NM_2ndMaskTex  ("[NM] 2nd NormalMap Mask Texture", 2D) = "white" {}
        [Toggle(_)]
            _NM_InvMaskVal  ("[NM] Invert Mask Value", Range(0, 1)) = 0

        // Matcapハイライト

        [WFHeaderToggle(Light Matcap 1)]
            _HL_Enable_1        ("[HA] Enable", Float) = 0
        [Enum(MEDIAN_CAP,0,LIGHT_CAP,1)]
            _HL_CapType_1       ("[HA] Matcap Type", Float) = 0
        [NoScaleOffset]
            _HL_MatcapTex_1     ("[HA] Matcap Sampler", 2D) = "gray" {}
            _HL_MatcapColor_1   ("[HA] Matcap Color", Color) = (0.5, 0.5, 0.5, 1)
            _HL_Power_1         ("[HA] Power", Range(0, 2)) = 1
            _HL_BlendNormal_1   ("[HA] Blend Normal", Range(0, 1)) = 0.1
        [NoScaleOffset]
            _HL_MaskTex_1       ("[HA] Mask Texture", 2D) = "white" {}
        [Toggle(_)]
            _HL_InvMaskVal_1    ("[HA] Invert Mask Value", Range(0, 1)) = 0

        [WFHeaderToggle(Light Matcap 2)]
            _HL_Enable_2        ("[HB] Enable", Float) = 0
        [Enum(MEDIAN_CAP,0,LIGHT_CAP,1)]
            _HL_CapType_2       ("[HB] Matcap Type", Float) = 0
        [NoScaleOffset]
            _HL_MatcapTex_2     ("[HB] Matcap Sampler", 2D) = "gray" {}
            _HL_MatcapColor_2   ("[HB] Matcap Color", Color) = (0.5, 0.5, 0.5, 1)
            _HL_Power_2         ("[HB] Power", Range(0, 2)) = 1
            _HL_BlendNormal_2   ("[HB] Blend Normal", Range(0, 1)) = 0.1
        [NoScaleOffset]
            _HL_MaskTex_2       ("[HB] Mask Texture", 2D) = "white" {}
        [Toggle(_)]
            _HL_InvMaskVal_2    ("[HB] Invert Mask Value", Range(0, 1)) = 0

        [WFHeaderToggle(Light Matcap 3)]
            _HL_Enable_3        ("[HC] Enable", Float) = 0
        [Enum(MEDIAN_CAP,0,LIGHT_CAP,1)]
            _HL_CapType_3       ("[HC] Matcap Type", Float) = 0
        [NoScaleOffset]
            _HL_MatcapTex_3     ("[HC] Matcap Sampler", 2D) = "gray" {}
            _HL_MatcapColor_3   ("[HC] Matcap Color", Color) = (0.5, 0.5, 0.5, 1)
            _HL_Power_3         ("[HC] Power", Range(0, 2)) = 1
            _HL_BlendNormal_3   ("[HC] Blend Normal", Range(0, 1)) = 0.1
        [NoScaleOffset]
            _HL_MaskTex_3       ("[HC] Mask Texture", 2D) = "white" {}
        [Toggle(_)]
            _HL_InvMaskVal_3    ("[HC] Invert Mask Value", Range(0, 1)) = 0

        [WFHeaderToggle(Light Matcap 4)]
            _HL_Enable_4        ("[HD] Enable", Float) = 0
        [Enum(MEDIAN_CAP,0,LIGHT_CAP,1)]
            _HL_CapType_4       ("[HD] Matcap Type", Float) = 0
        [NoScaleOffset]
            _HL_MatcapTex_4     ("[HD] Matcap Sampler", 2D) = "gray" {}
            _HL_MatcapColor_4   ("[HD] Matcap Color", Color) = (0.5, 0.5, 0.5, 1)
            _HL_Power_4         ("[HD] Power", Range(0, 2)) = 1
            _HL_BlendNormal_4   ("[HD] Blend Normal", Range(0, 1)) = 0.1
        [NoScaleOffset]
            _HL_MaskTex_4       ("[HD] Mask Texture", 2D) = "white" {}
        [Toggle(_)]
            _HL_InvMaskVal_4    ("[HD] Invert Mask Value", Range(0, 1)) = 0

        [WFHeaderToggle(Light Matcap 5)]
            _HL_Enable_5        ("[HE] Enable", Float) = 0
        [Enum(MEDIAN_CAP,0,LIGHT_CAP,1)]
            _HL_CapType_5       ("[HE] Matcap Type", Float) = 0
        [NoScaleOffset]
            _HL_MatcapTex_5     ("[HE] Matcap Sampler", 2D) = "gray" {}
            _HL_MatcapColor_5   ("[HE] Matcap Color", Color) = (0.5, 0.5, 0.5, 1)
            _HL_Power_5         ("[HE] Power", Range(0, 2)) = 1
            _HL_BlendNormal_5   ("[HE] Blend Normal", Range(0, 1)) = 0.1
        [NoScaleOffset]
            _HL_MaskTex_5       ("[HE] Mask Texture", 2D) = "white" {}
        [Toggle(_)]
            _HL_InvMaskVal_5    ("[HE] Invert Mask Value", Range(0, 1)) = 0

        [WFHeaderToggle(Light Matcap 6)]
            _HL_Enable_6        ("[HF] Enable", Float) = 0
        [Enum(MEDIAN_CAP,0,LIGHT_CAP,1)]
            _HL_CapType_6       ("[HF] Matcap Type", Float) = 0
        [NoScaleOffset]
            _HL_MatcapTex_6     ("[HF] Matcap Sampler", 2D) = "gray" {}
            _HL_MatcapColor_6   ("[HF] Matcap Color", Color) = (0.5, 0.5, 0.5, 1)
            _HL_Power_6         ("[HF] Power", Range(0, 2)) = 1
            _HL_BlendNormal_6   ("[HF] Blend Normal", Range(0, 1)) = 0.1
        [NoScaleOffset]
            _HL_MaskTex_6       ("[HF] Mask Texture", 2D) = "white" {}
        [Toggle(_)]
            _HL_InvMaskVal_6    ("[HF] Invert Mask Value", Range(0, 1)) = 0

        [WFHeaderToggle(Light Matcap 7)]
            _HL_Enable_7        ("[HG] Enable", Float) = 0
        [Enum(MEDIAN_CAP,0,LIGHT_CAP,1)]
            _HL_CapType_7       ("[HG] Matcap Type", Float) = 0
        [NoScaleOffset]
            _HL_MatcapTex_7     ("[HG] Matcap Sampler", 2D) = "gray" {}
            _HL_MatcapColor_7   ("[HG] Matcap Color", Color) = (0.5, 0.5, 0.5, 1)
            _HL_Power_7         ("[HG] Power", Range(0, 2)) = 1
            _HL_BlendNormal_7   ("[HG] Blend Normal", Range(0, 1)) = 0.1
        [NoScaleOffset]
            _HL_MaskTex_7       ("[HG] Mask Texture", 2D) = "white" {}
        [Toggle(_)]
            _HL_InvMaskVal_7    ("[HG] Invert Mask Value", Range(0, 1)) = 0

        [WFHeaderToggle(Light Matcap 8)]
            _HL_Enable_8        ("[HH] Enable", Float) = 0
        [Enum(MEDIAN_CAP,0,LIGHT_CAP,1)]
            _HL_CapType_8       ("[HH] Matcap Type", Float) = 0
        [NoScaleOffset]
            _HL_MatcapTex_8     ("[HH] Matcap Sampler", 2D) = "gray" {}
            _HL_MatcapColor_8   ("[HH] Matcap Color", Color) = (0.5, 0.5, 0.5, 1)
            _HL_Power_8         ("[HH] Power", Range(0, 2)) = 1
            _HL_BlendNormal_8   ("[HH] Blend Normal", Range(0, 1)) = 0.1
        [NoScaleOffset]
            _HL_MaskTex_8       ("[HH] Mask Texture", 2D) = "white" {}
        [Toggle(_)]
            _HL_InvMaskVal_8    ("[HH] Invert Mask Value", Range(0, 1)) = 0

        // 階調影
        [WFHeaderToggle(ToonShade)]
            _TS_Enable      ("[SH] Enable", Float) = 0
            _TS_BaseColor   ("[SH] Base Color", Color) = (1, 1, 1, 1)
        [NoScaleOffset]
            _TS_BaseTex     ("[SH] Base Shade Texture", 2D) = "white" {}
            _TS_1stColor    ("[SH] 1st Shade Color", Color) = (0.7, 0.7, 0.9, 1)
        [NoScaleOffset]
            _TS_1stTex      ("[SH] 1st Shade Texture", 2D) = "white" {}
            _TS_2ndColor    ("[SH] 2nd Shade Color", Color) = (0.5, 0.5, 0.8, 1)
        [NoScaleOffset]
            _TS_2ndTex      ("[SH] 2nd Shade Texture", 2D) = "white" {}
            _TS_Power       ("[SH] Shade Power", Range(0, 2)) = 1
            _TS_1stBorder   ("[SH] 1st Border", Range(0, 1)) = 0.4
            _TS_2ndBorder   ("[SH] 2nd Border", Range(0, 1)) = 0.2
            _TS_Feather     ("[SH] Feather", Range(0, 0.2)) = 0.05
            _TS_BlendNormal ("[SH] Blend Normal", Range(0, 1)) = 0.1
        [NoScaleOffset]
            _TS_MaskTex     ("[SH] BoostLight Mask Texture", 2D) = "black" {}
        [Toggle(_)]
            _TS_InvMaskVal  ("[SH] Invert Mask Value", Range(0, 1)) = 0

        // リムライト
        [WFHeaderToggle(RimLight)]
            _TR_Enable      ("[RM] Enable", Float) = 0
        [HDR]
            _TR_Color       ("[RM] Rim Color", Color) = (0.8, 0.8, 0.8, 1)
        [Enum(ADD,0,ALPHA,1)]
            _TR_BlendType   ("[RM] Blend Type", Float) = 0
            _TR_PowerTop    ("[RM] Power Top", Range(0, 0.5)) = 0.1
            _TR_PowerSide   ("[RM] Power Side", Range(0, 0.5)) = 0.1
            _TR_PowerBottom ("[RM] Power Bottom", Range(0, 0.5)) = 0.1
        [NoScaleOffset]
            _TR_MaskTex     ("[RM] RimLight Mask Texture", 2D) = "white" {}
        [Toggle(_)]
            _TR_InvMaskVal  ("[RM] Invert Mask Value", Range(0, 1)) = 0

        [WFHeader(Lit Advance)]
        [Enum(AUTO,0,ONLY_DIRECTIONAL_LIT,1,ONLY_POINT_LIT,2,CUSTOM_WORLDSPACE,3,CUSTOM_LOCALSPACE,4)]
            _GL_LightMode       ("Sun Source", Float) = 0
            _GL_CustomAzimuth   ("Custom Sun Azimuth", Range(0, 360)) = 0
            _GL_CustomAltitude  ("Custom Sun Altitude", Range(-90, 90)) = 45
        [Toggle(_)]
            _GL_DisableBackLit  ("Disable BackLit", Range(0, 1)) = 0

        [WFHeader(DebugMode)]
        [KeywordEnum(NONE,MAGENTA,CLIP,POSITION,NORMAL,TANGENT,BUMPED_NORMAL,LIGHT_COLOR,LIGHT_MAP)]
            _WF_DebugView       ("Debug View", Float) = 0
    }

    SubShader {
        Tags {
            "RenderType" = "Opaque"
            "Queue" = "Geometry"
            "DisableBatching" = "True"
        }

        Pass {
            Name "MAIN"
            Tags { "LightMode" = "ForwardBase" }

            Cull [_CullMode]

            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag_powercap

            #pragma target 3.0

            #define _NM_ENABLE
            #define _TR_ENABLE
            #define _TS_ENABLE
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma multi_compile_instancing

            #pragma shader_feature _WF_DEBUGVIEW_NONE _WF_DEBUGVIEW_MAGENTA _WF_DEBUGVIEW_CLIP _WF_DEBUGVIEW_POSITION _WF_DEBUGVIEW_NORMAL _WF_DEBUGVIEW_TANGENT _WF_DEBUGVIEW_BUMPED_NORMAL _WF_DEBUGVIEW_LIGHT_COLOR _WF_DEBUGVIEW_LIGHT_MAP

            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "WF_UnToon_PowerCap.cginc"

            ENDCG
        }

        UsePass "UnlitWF/WF_UnToon_Texture/SHADOWCASTER"
    }

    CustomEditor "UnlitWF.ShaderCustomEditor"
}

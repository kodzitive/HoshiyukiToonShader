﻿/** アウトライン付きのトゥーンシェード.
 *
 * @date	2017/12/7
 */
Shader "HoshiyukiToon/LitOutline"
{
	Properties
	{
		// Lit
		_Color		("Color", Color) = (1,1,1,1)
		_MainTex	("Albedo (RGB)", 2D) = "white" {}
		_Cutoff		("Clip Threshold", Range(0,1))=0.1
		_ToonTex	("Ramp Texture", 2D) = "white"{}
		_ToonFactor	("Ramp Factor", Range( 0,1 ) ) = 1
		
		// Lit Options
		[ToggleOff]								_UseStandardGI("Use Standard GI", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)]	_Cull("Cull Mode", Float ) = 2
		[HideInInspector]						_Blend( "Mode", Float ) = 0

		// Outline
		_OutlineColor( "Outline Color", Color ) = (.5,.5,.5,1)
		_OutlineSize( "Outline Width", Range( .001,.03 ) ) = .003
	}
	SubShader
	{
		Tags{"RenderType" = "Opaque"}
		UsePass "HoshiyukiToon/Lit/FORWARD"
		UsePass "HoshiyukiToon/Outline/OUTLINE"
	}
	Fallback "Diffuse"
	CustomEditor "NowhereUnityEditor.Rendering.HoshiyukiToonEditor"
}
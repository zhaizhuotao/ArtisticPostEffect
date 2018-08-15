Shader "ZhaiZhuoTao/ArtisticPostEffect/PencilSketchShader"
{
	Properties
	{
        _MainTex ("Texture", 2D) = "white" {}
		_Hatch0 ("Hatch0", 2D) = "white" {}
        _Hatch1 ("Hatch1", 2D) = "white" {}
        _Hatch2 ("Hatch2", 2D) = "white" {}
        _Hatch3 ("Hatch3", 2D) = "white" {}
        _Hatch4 ("Hatch4", 2D) = "white" {}
        _Hatch5 ("Hatch5", 2D) = "white" {}
        _Scale  ("Scale",Range(0,1)) = 0.5
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}
			sampler2D _MainTex;
			sampler2D _Hatch0;
            sampler2D _Hatch1;
            sampler2D _Hatch2;
            sampler2D _Hatch3;
            sampler2D _Hatch4;
            sampler2D _Hatch5;
            float _Scale;
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = tex2D(_MainTex, i.uv);
				// just invert the colors
                half luminance = LinearRgbToLuminance(col.rgb);
                if(luminance < 0.2 * _Scale)
                {
                    col = tex2D(_Hatch5,i.uv);
                }
                if(luminance < 0.4 * _Scale && luminance >=0.2 * _Scale)
                {
                    col = tex2D(_Hatch4,i.uv);
                }
                if(luminance < 0.6 * _Scale && luminance >= 0.4 * _Scale)
                {
                    col = tex2D(_Hatch3,i.uv);
                }
                if(luminance < 0.8 * _Scale && luminance >= 0.6 * _Scale)
                {
                    col = tex2D(_Hatch2,i.uv);
                }
                if(luminance <  _Scale && luminance >= 0.8 * _Scale)
                {
                    col = tex2D(_Hatch1,i.uv);
                }
                if(luminance <=1 && luminance >= _Scale)
                {
                    col = tex2D(_Hatch0,i.uv);
                }
				return col;
			}
			ENDCG
		}
	}
}

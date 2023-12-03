Shader "Custom/planetosphere"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                
            };

            struct v2f
            {
                
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                
                float PI = 3.14159265;
                float TWOPI = 6.28318531;
                float baseRadius = 1.0; 
                //o.vertex.x = baseRadius * cos( v.vertex.y*TWOPI ) * sin( v.vertex.x*PI );
	            o.vertex.y = v.vertex.y*v.vertex.z;
	                //baseRadius * sin( v.vertex.y*TWOPI ) * sin( v.vertex.x*PI );
	            //o.vertex.z = baseRadius * cos( v.vertex.x*PI );
                
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float3 color = {0,1,0};
                return fixed4(color, 1);
            }
            ENDCG
        }
    }
}

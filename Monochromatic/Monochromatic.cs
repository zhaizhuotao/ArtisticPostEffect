using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Monochromatic : MonoBehaviour {
    public Shader MonochromaticShader;
    private Material _monochromaticMat;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (_monochromaticMat == null)
        {
            _monochromaticMat = new Material(MonochromaticShader);
        }
        Graphics.Blit(source,destination,_monochromaticMat);
    }
}

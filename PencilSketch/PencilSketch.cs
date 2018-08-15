using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PencilSketch : MonoBehaviour {
    public Shader PencilSketchShader;
    public Material _pencilSketchMat;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (_pencilSketchMat == null)
        {
            _pencilSketchMat = new Material(PencilSketchShader);
        }
        Graphics.Blit(source, destination, _pencilSketchMat);
    }
}

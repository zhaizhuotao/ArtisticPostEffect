using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VideoCapturePlane : MonoBehaviour {
    public int CaptureWidth = 640;
    public int CaptureHeight = 480;
    public WebCamTexture m_webcamTexture = null;
    public Material VideoCapturePlaneMat;
    private string deviceName;
	// Use this for initialization
	void Start () {
        for (int cameraIndex = 0; cameraIndex < WebCamTexture.devices.Length; cameraIndex++)
        {
            // We want the back camera
            if (!WebCamTexture.devices[cameraIndex].isFrontFacing)
            {
                deviceName = WebCamTexture.devices[cameraIndex].name;
                m_webcamTexture = new WebCamTexture(deviceName, CaptureWidth, CaptureHeight, 30);
                break;
            }
            else if (WebCamTexture.devices[cameraIndex].isFrontFacing)
            {
                deviceName = WebCamTexture.devices[cameraIndex].name;
                m_webcamTexture = new WebCamTexture(deviceName, CaptureWidth, CaptureHeight, 30);
                break;
            }
        }
        VideoCapturePlaneMat.mainTexture = m_webcamTexture;
        m_webcamTexture.Play();
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}

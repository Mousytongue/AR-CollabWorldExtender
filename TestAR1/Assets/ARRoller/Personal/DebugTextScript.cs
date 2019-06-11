using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using GoogleARCore.Examples.Common;
using GoogleARCore;

public class DebugTextScript : MonoBehaviour
{
    public Text mPlaneInfo;


    string mPlaneText = "";


    private Button ToggleDebugButton;
    private bool isTextOn = true;

    private List<Vector3> m_MeshVertices = new List<Vector3>();


    // Use this for initialization
    void Start()
    {
        ToggleDebugButton = GameObject.Find("ToggleTextButton").GetComponent<Button>();
        ToggleDebugButton.onClick.AddListener(delegate { TurnOffText(); });
    }

    void TurnOffText()
    {
        if (isTextOn == true)
        {
            mPlaneInfo.gameObject.SetActive(false);
            isTextOn = false;            
        }
        else
        {
            mPlaneInfo.gameObject.SetActive(true);
            isTextOn = true;
        }
    }

    // Update is called once per frame
    void Update()
    {
        UpdateDebugText();
    }


    void UpdateDebugText()
    {
        DetectedPlane m_DetectedPlane;
        GameObject[] mMeshes = GameObject.FindGameObjectsWithTag("Mesh");
        mPlaneText = "";
        int planeCount = 0;

        if (mMeshes == null)
            return;

        foreach (GameObject child in mMeshes)
        {
            planeCount++;
            m_DetectedPlane = child.GetComponent<DetectedPlaneVisualizer>().GetDetectedPlane();
            m_DetectedPlane.GetBoundaryPolygon(m_MeshVertices);

            if (m_DetectedPlane == null)
                return;
            mPlaneText = mPlaneText + planeCount + ": Extend.X: " + m_DetectedPlane.ExtentX + " Extend.Y: " +
                m_DetectedPlane.ExtentZ + " CenterPos: " + m_DetectedPlane.CenterPose.position + " CenterRot: " + m_DetectedPlane.CenterPose.rotation + "\n";
                foreach (Vector3 point in m_MeshVertices) {
                mPlaneText = mPlaneText + point + " ";
                }
            mPlaneText = mPlaneText + "\n\n";
        }
        mPlaneInfo.text = mPlaneText;
    }
}
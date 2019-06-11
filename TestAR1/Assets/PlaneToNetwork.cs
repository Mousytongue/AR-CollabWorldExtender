using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;
using GoogleARCore.Examples.CloudAnchors;
using GoogleARCore.Examples.Common;
using GoogleARCore;

#pragma warning disable 618
public class PlaneToNetwork : MonoBehaviour
{
    RaycastHit hit;
    GameObject hitObj;
    DetectedPlane m_DetectedPlane;

    private NetworkManagerUIController SnackBarUI;


    // Start is called before the first frame update
    void Start()
    {
        SnackBarUI = GameObject.Find("Network Manager").GetComponent<NetworkManagerUIController>();
    }

    // Update is called once per frame
    void Update()
    {
        //GetRayCast();
       // GetTrackableRayCast();
    }

    void GetRayCast()
    {
        //If player hasnt touched the screen, return
        if (Input.touchCount < 1 || Input.GetTouch(0).phase != TouchPhase.Began)
        {
            return;
        }

        Ray ray = Camera.main.ScreenPointToRay(Input.GetTouch(0).position);
        if (Physics.Raycast(ray, out hit, Mathf.Infinity))
        {
            hitObj = hit.transform.gameObject;
            m_DetectedPlane = hitObj.GetComponent<DetectedPlaneVisualizer>().GetDetectedPlane();

            string msg = "Hit: " + hitObj + " Extend.X: " + m_DetectedPlane.ExtentX + " Extend.Y: " +
                m_DetectedPlane.ExtentZ + " CenterPos: " + m_DetectedPlane.CenterPose.position +
                " CenterRot: " + m_DetectedPlane.CenterPose.rotation;

            SnackBarUI.ShowErrorMessage(msg);
        }
        else
        {
            SnackBarUI.ShowErrorMessage("Raycast failed");
        }
    }

    void GetTrackableRayCast()
    {
        TrackableHit hit;
        TrackableHitFlags raycastFilter = TrackableHitFlags.PlaneWithinPolygon |
            TrackableHitFlags.FeaturePointWithSurfaceNormal;

        if (Frame.Raycast(Input.GetTouch(0).position.x, Input.GetTouch(0).position.y, raycastFilter, out hit))
        {
            List<Anchor> mAnchors = new List<Anchor>();
            hit.Trackable.GetAllAnchors(mAnchors);

            SnackBarUI.ShowErrorMessage(mAnchors.Count + " Anchored objects found at raycast" );
        }
    }
}

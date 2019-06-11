using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using GoogleARCore.Examples.Common;
using GoogleARCore;
using GoogleARCore.Examples.CloudAnchors;

public class SpawnPlanesScript : MonoBehaviour
{
    public Button SpawnButton;
    public Button ToggleArButton;

    private NetworkManagerUIController SnackBarUI;
    public ARCoreWorldOriginHelper ARCHelper;
    List<Vector3> detectedPolygon = new List<Vector3>();

    private bool isAR = true;
    public GameObject PointCloud;

    // Start is called before the first frame update
    void Start()
    {
        //ARCHelper = GameObject.Find("ARCore World Origin Helper").GetComponent<ARCoreWorldOriginHelper>();
        SnackBarUI = GameObject.Find("Network Manager").GetComponent<NetworkManagerUIController>();

        ToggleArButton.onClick.AddListener(delegate { ToggleARPlane(); });
        SpawnButton.onClick.AddListener(delegate { SpawnPlanes(); });
    }

    void ToggleARPlane()
    {
        if (isAR)
            isAR = false;
        else
            isAR = true;

        ARCHelper.SetNoPlanes(!isAR);
        //Pointcloud
        PointCloud.SetActive(isAR);
        GameObject[] meshes = GameObject.FindGameObjectsWithTag("Mesh");
        foreach (GameObject m in meshes)
        {
            m.SetActive(isAR);
        }
    }

    void SpawnPlanes()
    {
        GameObject[] tileObjs = GameObject.FindGameObjectsWithTag("Tile");
        if (tileObjs != null)
        {
            foreach (GameObject tile in tileObjs)
            {
                GameObject.Find("LocalPlayer").GetComponent<LocalPlayerController>().CmdDestroy(tile);

            }
        }

        Pose worldPose = ARCHelper._WorldToAnchorPose(Pose.identity);

        DetectedPlane m_DetectedPlane;
        GameObject[] mMeshes = GameObject.FindGameObjectsWithTag("Mesh");
        foreach(GameObject child in mMeshes)
        {
            m_DetectedPlane = child.GetComponent<DetectedPlaneVisualizer>().GetDetectedPlane();
            //Vector3 pos = m_DetectedPlane.CenterPose.position;
            //Quaternion rot = m_DetectedPlane.CenterPose.rotation;
            //float xLen = m_DetectedPlane.ExtentX;
            //float zLen = m_DetectedPlane.ExtentZ;
            m_DetectedPlane.GetBoundaryPolygon(detectedPolygon);

            //conver vector list into vector array to pass to UNET server spawn
            Vector3[] vecArr = new Vector3[detectedPolygon.Count];
            for (int i = 0; i<detectedPolygon.Count; i++)
            {
                vecArr[i] = detectedPolygon[i];
            }

            GameObject.Find("LocalPlayer").GetComponent<LocalPlayerController>().
                CmdSpawnAllPlanes(worldPose.position, worldPose.rotation, m_DetectedPlane.CenterPose.position, m_DetectedPlane.CenterPose.rotation, vecArr);
            SnackBarUI.ShowErrorMessage("Device Pose: " + m_DetectedPlane.CenterPose + " World Pose: " + worldPose);
        }


    }


}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using GoogleARCore;

public class PlaneVisualizer : MonoBehaviour
{

    //private Vector3[] m_DetectedPlane;

    //Plane Details
    private List<Vector3> m_MeshVertices = new List<Vector3>();
    private Vector3 m_PlaneCenter;
    private Vector3 m_PlaneNormal;

    //Mesh
    private Mesh m_Mesh;
    private MeshRenderer m_MeshRenderer;

    //Color and indicies?
    private List<Color> m_MeshColors = new List<Color>();
    private List<int> m_MeshIndices = new List<int>();


    // Start is called before the first frame update
    public void Awake()
    {
        m_Mesh = GetComponent<MeshFilter>().mesh;
        m_MeshRenderer = GetComponent<MeshRenderer>();
    }

    public void Initialize(Vector3[] vecArr, Vector3 posePos, Quaternion poseRot)
    {
       //return the array to list format
       foreach (Vector3 vec in vecArr)
        {
            m_MeshVertices.Add(vec);
        }

        //Set the plane center and plane normal
        m_PlaneCenter = posePos;
        m_PlaneNormal = poseRot * Vector3.up;

        //Set Mesh normal
       // m_MeshRenderer.material.SetVector("_PlaneNormal", m_PlaneNormal);

        
        //Good luck..
        int planePolygonCount = m_MeshVertices.Count;

        for (int i = 0; i <planePolygonCount; ++i)
        {
            m_MeshColors.Add(Color.clear);
        }

        // Feather distance 0.2 meters.
        const float featherLength = 0.2f;

        // Feather scale over the distance between plane center and vertices.
        const float featherScale = 0.2f;

        // Add vertex 4 to 7.
        for (int i = 0; i < planePolygonCount; ++i)
        {
            Vector3 v = m_MeshVertices[i];

            // Vector from plane center to current point
            Vector3 d = v - m_PlaneCenter;

            float scale = 1.0f - Mathf.Min(featherLength / d.magnitude, featherScale);
            m_MeshVertices.Add((scale * d) + m_PlaneCenter);

            m_MeshColors.Add(Color.white);
        }

        m_MeshIndices.Clear();
        int firstOuterVertex = 0;
        int firstInnerVertex = planePolygonCount;

        // Generate triangle (4, 5, 6) and (4, 6, 7).
        for (int i = 0; i < planePolygonCount - 2; ++i)
        {
            m_MeshIndices.Add(firstInnerVertex);
            m_MeshIndices.Add(firstInnerVertex + i + 1);
            m_MeshIndices.Add(firstInnerVertex + i + 2);
        }

        // Generate triangle (0, 1, 4), (4, 1, 5), (5, 1, 2), (5, 2, 6), (6, 2, 3), (6, 3, 7)
        // (7, 3, 0), (7, 0, 4)
        for (int i = 0; i < planePolygonCount; ++i)
        {
            int outerVertex1 = firstOuterVertex + i;
            int outerVertex2 = firstOuterVertex + ((i + 1) % planePolygonCount);
            int innerVertex1 = firstInnerVertex + i;
            int innerVertex2 = firstInnerVertex + ((i + 1) % planePolygonCount);

            m_MeshIndices.Add(outerVertex1);
            m_MeshIndices.Add(outerVertex2);
            m_MeshIndices.Add(innerVertex1);

            m_MeshIndices.Add(innerVertex1);
            m_MeshIndices.Add(outerVertex2);
            m_MeshIndices.Add(innerVertex2);
        }

        m_Mesh.Clear();
        m_Mesh.SetVertices(m_MeshVertices);
        m_Mesh.SetTriangles(m_MeshIndices, 0);
        m_Mesh.SetColors(m_MeshColors);
    }

}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using GoogleARCore.Examples.CloudAnchors;

public class MoveObjectScript : MonoBehaviour
{
    public NetworkManagerUIController UIController;
    public Slider mSlider;
    private GameObject mCube;

    // Start is called before the first frame update
    void Start()
    {
        mSlider.onValueChanged.AddListener(delegate { ValueChanged(); });
    }

    // Update is called once per frame
    void Update()
    {

            FindCube();
    }


    private void ValueChanged()
    {
        Vector3 curr = mCube.transform.position;
        curr.y = mSlider.value / 20;
        //UIController.ShowErrorMessage(curr);
    }

    private void FindCube()
    {
        if (GameObject.Find("Cube") == null)
            return;
        mCube = GameObject.Find("Cube");
        //UIController.ShowErrorMessage("Cube Found");
    }
}

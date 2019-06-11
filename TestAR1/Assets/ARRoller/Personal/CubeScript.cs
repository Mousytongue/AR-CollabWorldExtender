using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CubeScript : MonoBehaviour
{
    private Slider mSlider;

    // Start is called before the first frame update
    void Start()
    {
        mSlider = GameObject.Find("MoveObjectSlider").GetComponent<Slider>();

    }

    // Update is called once per frame
    void Update()
    {
        Vector3 temp = transform.position;
        temp.y = mSlider.value / 20;
        transform.position = temp;
    }
}

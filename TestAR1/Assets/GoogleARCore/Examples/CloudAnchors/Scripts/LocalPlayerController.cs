//-----------------------------------------------------------------------
// <copyright file="LocalPlayerController.cs" company="Google">
//
// Copyright 2018 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// </copyright>
//-----------------------------------------------------------------------

namespace GoogleARCore.Examples.CloudAnchors
{
    using System.Collections.Generic;
    using UnityEngine;
    using UnityEngine.Networking;
    using UnityEngine.UI;
    using GoogleARCore;
    using GoogleARCore.Examples.Common;

    /// <summary>
    /// Local player controller. Handles the spawning of the networked Game Objects.
    /// </summary>
#pragma warning disable 618
    public class LocalPlayerController : NetworkBehaviour
        {

        public GameObject FloorTile;
        public GameObject AnchorPrefab;
        public GameObject CubePrefab;

        public override void OnStartLocalPlayer()
        {
            base.OnStartLocalPlayer();
            gameObject.name = "LocalPlayer";
        }

        public void SpawnAnchor(Vector3 position, Quaternion rotation, Component anchor)
        {
            var anchorObject = Instantiate(AnchorPrefab, position, rotation);

            anchorObject.GetComponent<AnchorController>().HostLastPlacedAnchor(anchor);

            NetworkServer.Spawn(anchorObject);
        }

        [Command]
        public void CmdSpawnStar(Vector3 position, Quaternion rotation)
        {
            // Instantiate Star model at the hit pose.
            var starObject = Instantiate(FloorTile, position, rotation);

            // Spawn the object in all clients.
            NetworkServer.Spawn(starObject);
        }


        public void CmdSpawnAnchor(Vector3 position, Quaternion rotation, Component anchor)
        {
            var anchorObject = Instantiate(AnchorPrefab, position, rotation);
            anchorObject.GetComponent<AnchorController>().HostLastPlacedAnchor(anchor);
            NetworkServer.Spawn(anchorObject);
        }

        [Command]
        public void CmdSpawnAllPlanes(Vector3 posePos, Quaternion poseRot, Vector3 devPos, Quaternion devRot, Vector3[] polyList)
        {
            
            GameObject obj = Instantiate(FloorTile, posePos, poseRot);
            NetworkServer.Spawn(obj);
            RpcFixPlanes(obj, devPos, devRot, polyList);
            
        }

        [ClientRpc]
        public void RpcFixPlanes(GameObject obj, Vector3 devPos, Quaternion devRot, Vector3[] polyList)
        {
            //Standard scale.
            //obj.transform.localScale = new Vector3(x, 0.001f, z);

            //Poly creation? place on the object itself.
            PlaneVisualizer PV = obj.GetComponent<PlaneVisualizer>();
            PV.Initialize(polyList, devPos, devRot);
        }

        [Command]
        public void CmdDestroy(GameObject obj)
        {
            NetworkServer.Destroy(obj);
        }
    }
}

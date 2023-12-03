using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Sin : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        float PI = 3.14159265f;
        float TWOPI = 6.28318531f;
        float baseRadius = 1.0f;
    }

    // Update is called once per frame
    void Update()
    {
        Mesh mesh = GetComponent<MeshFilter>().mesh;
        Vector3[] vertices = mesh.vertices;
        float PI = 3.14159265f;
        float TWOPI = 6.28318531f;
        float baseRadius = 1.0f;

        for (int i = 0; i < vertices.Length; i++)
        {
            
            vertices[i].y = Mathf.Sin(Time.time);
        }

        mesh.vertices = vertices;
        mesh.RecalculateBounds();
    }
}

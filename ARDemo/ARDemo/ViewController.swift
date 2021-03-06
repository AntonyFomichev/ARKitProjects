//
//  ViewController.swift
//  ARDemo
//
//  Created by Антон on 13.02.2020.
//  Copyright © 2020 Tony Blaire. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {
  
  @IBOutlet var sceneView: ARSCNView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    sceneView.showsStatistics = true
    
    let scene = SCNScene()
    let boxGeometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
    let material = SCNMaterial()
    material.diffuse.contents = UIColor.purple
    
    let boxNode = SCNNode(geometry: boxGeometry)
    boxNode.geometry?.materials = [material]
    boxNode.position = SCNVector3(0, 0, -1.0)
    
    scene.rootNode.addChildNode(boxNode)
    
    let textGeometry = SCNText(string: "This is the cube", extrusionDepth: 2.0)
    textGeometry.firstMaterial?.diffuse.contents = UIColor.red
    
    let textNode = SCNNode(geometry: textGeometry)
    textNode.scale = SCNVector3(0.005, 0.005, 0.005)
    textNode.position = SCNVector3(0, 0.2, -1)
    
    scene.rootNode.addChildNode(textNode)
    
    sceneView.scene = scene
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let configuration = ARWorldTrackingConfiguration()
    sceneView.session.run(configuration)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    sceneView.session.pause()
  }
}

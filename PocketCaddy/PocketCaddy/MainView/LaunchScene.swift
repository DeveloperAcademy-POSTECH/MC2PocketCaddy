//
//  LaunchScene.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/11.
//
import SpriteKit
import Foundation
class GameScene: SKScene, SKPhysicsContactDelegate {
    static func createFlag() {
        
        guard let action = SKEmitterNode(fileNamed: "action") else { return }
        action.position = CGPoint(x: 0, y: 0)
//        action.advanceSimulationTime(30)
//        addChild(action)
    }
}

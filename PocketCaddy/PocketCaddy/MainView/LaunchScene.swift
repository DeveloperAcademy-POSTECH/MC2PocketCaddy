import SpriteKit

final class LaunchScene: SKScene, SKPhysicsContactDelegate {

    var background = SKSpriteNode() // 백그라운드 노드
    var flag = SKSpriteNode()    // 새 노드
    // MARK: - Sprites Alignment
    override func didMove(to view: SKView) {
       
        
        let color1: CGColor = UIColor(red: 44/255, green: 133/255, blue: 45/255, alpha: 1).cgColor
        let color2: CGColor = UIColor(red: 123/255, green: 183/255, blue: 35/255, alpha: 1).cgColor
        let startPoint = CGPoint(x: 0, y: 0)
    let endPoint = CGPoint(x: 1, y: 1)
        guard let image = UIImage.gradientImage(withBounds: self.frame, startPoint: startPoint, endPoint: endPoint, colors: [color1, color2]) else {
            return
        }
        let gradientTexture = SKTexture(image: image)
        let gradientNode = SKSpriteNode(texture: gradientTexture)
        gradientNode.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(gradientNode)
        createFlag()
        
//         if let or guard let
    }
    func createFlag() {
        flag = SKSpriteNode(imageNamed: "flag-1")
        flag.size = CGSize(width: self.size.width / 8, height:self.size.width / 8)//사이즈
        flag.position = CGPoint(x: self.size.width / 2, y: self.size.height * 3 / 5)
        flag.physicsBody?.affectedByGravity = false
        flag.physicsBody?.isDynamic = false
        addChild(flag)
        guard let flags = SKAction(named: "flying") else { return  }
        flag.run(flags)
    }
    
}

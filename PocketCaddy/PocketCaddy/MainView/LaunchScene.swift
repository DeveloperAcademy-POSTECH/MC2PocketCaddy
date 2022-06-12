
import SpriteKit
import GameKit
extension UIImage {
    static func gradientImage(withBounds: CGRect, startPoint: CGPoint, endPoint: CGPoint , colors: [CGColor]) -> UIImage {
        
        // Configure the gradient layer based on input
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = withBounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        // Render the image using the gradient layer
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var background = SKSpriteNode() // 백그라운드 노드
    var flag = SKSpriteNode()    // 새 노드
    // MARK: - Sprites Alignment
    override func didMove(to view: SKView) {
        let color1: CGColor = UIColor(red: 44/255, green: 133/255, blue: 45/255, alpha: 1).cgColor
        let color2: CGColor = UIColor(red: 123/255, green: 183/255, blue: 35/255, alpha: 1).cgColor
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: 1, y: 1)
        let image: UIImage = UIImage.gradientImage(withBounds: self.frame, startPoint: startPoint, endPoint: endPoint, colors: [color1, color2])
        let gradientTexture = SKTexture(image: image)
        let gradientNode = SKSpriteNode(texture: gradientTexture)
        gradientNode.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(gradientNode)
        createFlag()
    }
    func createFlag() {
        flag = SKSpriteNode(imageNamed: "flag-1")
        flag.size = CGSize(width: self.size.width / 8, height:self.size.width / 8)//사이즈
        flag.position = CGPoint(x: self.size.width / 2, y: self.size.height * 3 / 5)
        flag.physicsBody?.affectedByGravity = false
        flag.physicsBody?.isDynamic = false
        addChild(flag)
        guard let flyingBySKS = SKAction(named: "flying") else {return  }
        flag.run(flyingBySKS)
    }
    
}

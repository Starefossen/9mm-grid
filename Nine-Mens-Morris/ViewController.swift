import UIKit

class ViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var location = CGPoint(x: 0, y: 0)
    var imageView = UIImageView()
    var pointView = UIImageView()
    var points = [(UIImageView, Int)]()
    var game = Game()
    var state_init = true
    var player1 = true
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Grid
        let imageSize = CGSize(width: 300, height: 300)
        imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 10, y: 35), size: imageSize))
        imageView.userInteractionEnabled = true
        self.view.addSubview(imageView)
        imageView.image = drawCustomImage(imageSize)
        
        // Point
        
        var grid = [
            [(1, 0, 0), (2, 0, 150), (3, 0, 300)],
            [(9, 50, 50), (10, 50, 150), (11, 50, 250)],
            [(17, 100, 100), (18, 100, 150), (19, 100, 200)],
            [(8, 150, 0), (16, 150, 50), (24, 150, 100), (20, 150, 200), (12, 150, 250), (4, 150, 300)],
            [(23, 200, 100), (22, 200, 150), (21, 200, 200)],
            [(15, 250, 50), (14, 250, 150), (13, 250, 250)],
            [(7, 300, 0), (6, 300, 150), (5, 300, 300)]
        ]
        
        var pointSize = CGSize(width: 20, height: 20)
        for row in grid {
            for cel in row {
                // cell.0 id
                // cell.1 x
                // coll.2 y
                
                pointView = UIImageView(frame: CGRect(origin: CGPoint(x: cel.1, y: cel.2+25), size: pointSize))
                pointView.userInteractionEnabled = true
                self.view.addSubview(pointView)
                pointView.image = drawPointImage(pointSize)
                //pointView.image.description = cel.0 as String!
                
                points.append((pointView, cel.0))
            }
        }
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        let touch:UITouch  = touches.anyObject() as UITouch
        location = touch.locationInView(self.view)
        
        print(location)
        
        for point in points {
            if (touch.view == point.0) {
                println("Whoho \(point.1)");
                
                if (state_init) {
                    if (player1) {
                        //point.0.image = drawPointImage(
                    }
                }
            }
        }
    }
}

func drawPointImage(size: CGSize, colorOfImage color: CGColor = UIColor.whiteColor().CGColor) -> UIImage {
    // Setup our context
    let bounds = CGRect(origin: CGPoint.zeroPoint, size: size)
    let opaque = false
    let scale: CGFloat = 0
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
    let context = UIGraphicsGetCurrentContext()
    
    // Setup complete, do drawing here
    CGContextSetFillColorWithColor(context, color)
    CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
    CGContextSetLineWidth(context, 2.0)
    
    // Outer rectangle
    CGContextFillRect(context, bounds)
    CGContextStrokeRect(context, bounds)

    // Drawing complete, retrieve the finished image and cleanup
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
}

func drawCustomImage(size: CGSize) -> UIImage {
    // Setup our context
    let bounds = CGRect(origin: CGPoint.zeroPoint, size: size)
    let opaque = false
    let scale: CGFloat = 0
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
    let context = UIGraphicsGetCurrentContext()
    
    // Setup complete, do drawing here
    CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
    CGContextSetLineWidth(context, 2.0)
    
    // Outer rectangle
    CGContextStrokeRect(context, bounds)
    
    // Middle rectangle
    var middleOrigin = CGPoint(x: CGPoint.zeroPoint.x + 50, y: CGPoint.zeroPoint.y + 50)
    var middleSize = CGSize(width: size.width - 100, height: size.width - 100)
    var middleBounds = CGRect(origin: middleOrigin, size: middleSize)
    CGContextStrokeRect(context, middleBounds)
    
    // Inner rectangle
    var innerOrigin = CGPoint(x: CGPoint.zeroPoint.x + 100, y: CGPoint.zeroPoint.y + 100)
    var innereSize = CGSize(width: size.width - 200, height: size.width - 200)
    var innereBounds = CGRect(origin: innerOrigin, size: innereSize)
    CGContextStrokeRect(context, innereBounds)
    
    // Start line
    CGContextBeginPath(context)
    
    // Topp line
    CGContextMoveToPoint(context, 150, 0)
    CGContextAddLineToPoint(context, 150, 100)
    
    // Left line
    CGContextMoveToPoint(context, 0, 150)
    CGContextAddLineToPoint(context, 100, 150)
    
    // Right line
    CGContextMoveToPoint(context, 150, 300)
    CGContextAddLineToPoint(context, 150, 200)
    
    // Bottom line
    CGContextMoveToPoint(context, 300, 150)
    CGContextAddLineToPoint(context, 200, 150)
    
    // End line
    CGContextStrokePath(context)
    
    // Drawing complete, retrieve the finished image and cleanup
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
}
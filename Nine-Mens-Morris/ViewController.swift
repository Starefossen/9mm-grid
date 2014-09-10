import UIKit

class ViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var location = CGPoint(x: 0, y: 0)
    var imageView = UIImageView()
    var pointView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Grid
        let imageSize = CGSize(width: 300, height: 300)
        imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 10, y: 35), size: imageSize))
        imageView.userInteractionEnabled = true
        self.view.addSubview(imageView)
        imageView.image = drawCustomImage(imageSize)
        
        // Point
        var pointSize = CGSize(width: 20, height: 20)
        pointView = UIImageView(frame: CGRect(origin: CGPoint(x: 2*50+10-10, y: 3*50+35-10), size: pointSize))
        pointView.userInteractionEnabled = true
        self.view.addSubview(pointView)
        pointView.image = drawPointImage(pointSize)
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        let touch:UITouch  = touches.anyObject() as UITouch
        location = touch.locationInView(self.view)
        
        if (touch.view == imageView) {
            print("Grid was touched\n")
        } else if (touch.view == pointView) {
            print("Point was touched\n")
        } else {
            print("Nothing was touched\n")
        }
    }
}

func drawPointImage(size: CGSize) -> UIImage {
    // Setup our context
    let bounds = CGRect(origin: CGPoint.zeroPoint, size: size)
    let opaque = false
    let scale: CGFloat = 0
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
    let context = UIGraphicsGetCurrentContext()
    
    // Setup complete, do drawing here
    CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
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
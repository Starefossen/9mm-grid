import UIKit

class ViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var location = CGPoint(x: 0, y: 0)
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Size
        let imageSize = CGSize(width: 300, height: 300)
        
        // Grid
        imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 10, y: 35), size: imageSize))
        imageView.userInteractionEnabled = true
        
        self.view.addSubview(imageView)
        
        let image = drawCustomImage(imageSize)
        
        imageView.image = image
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        let touch:UITouch  = touches.anyObject() as UITouch
        location = touch.locationInView(self.view)
        
        print(touch.view == imageView)
        //print(touch.locationInView(self.view))
        //print(event.touchesForView(self.view.subviews[0] as UIView))
    }
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
FMBMParallaxView
================

Complete UIImageView subclass with parallax scrolling created during the first world [SwiftCrunch](http://swiftcrunch.com/) hackaton!

![Gif with results](https://raw.githubusercontent.com/JakubMazur/FMBMParallaxView/master/assets/results.gif)

**FMBMImageView example usage**

```swift
class ExampleViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var imageView: FMBMImageView
    @IBOutlet var scrollView: UIScrollView

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.clipsToBounds = true
        scrollView.contentSize = CGSizeMake(400, 400)
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        let deltaX = scrollView.contentSize.width - scrollView.frame.width
        let deltaY = scrollView.contentSize.height - scrollView.frame.height
        
        imageView.horizontalOffset = scrollView.contentOffset.y / deltaX
        imageView.verticalOffset = scrollView.contentOffset.x / deltaY
    }

}
```
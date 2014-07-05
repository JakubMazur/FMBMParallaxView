FMBMParallaxView
================

**FMBMImageView usage**

```
func scrollViewDidScroll(scrollView: UIScrollView!) {
    let deltaX = scrollView.contentSize.width - imageView.frame.width
    let deltaY = scrollView.contentSize.height - imageView.frame.height
    
    imageView.horizontalOffset = scrollView.contentOffset.y / deltaX
    imageView.verticalOffset = scrollView.contentOffset.x / deltaY
}
```
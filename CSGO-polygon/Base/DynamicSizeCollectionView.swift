import Foundation
import UIKit

class DynamicSizeCollectionView: UICollectionView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
           super.init(frame: frame, collectionViewLayout: layout)
           commonInit()
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }

       private func commonInit() {
           isScrollEnabled = false
       }

       override var contentSize: CGSize {
           didSet {
               invalidateIntrinsicContentSize()
           }
       }

       override func reloadData() {
           super.reloadData()
           self.invalidateIntrinsicContentSize()
       }
    
}

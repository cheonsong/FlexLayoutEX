//
//  flexView.swift
//  FlexLayoutEX
//
//  Created by cheonsong on 2023/02/13.
//

import Foundation
import UIKit
import FlexLayout

class FlexView: UIView {
    
    let flexContainer = UIView()
    lazy var label1: UILabel = {
        let label = UILabel()
        label.text = "111111111"
        return label
    }()
    
    lazy var label2: UILabel = {
        let label = UILabel()
        label.text = "222222222"
        return label
    }()
    
    lazy var label3: UILabel = {
        let label = UILabel()
        label.text = "333333333"
        return label
    }()
    
    lazy var label4: UILabel = {
        let label = UILabel()
        label.text = "444444444"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(flexContainer)
        
        flexContainer.flex.direction(.column).define { flex in
            flex.addItem().backgroundColor(.blue).direction(.column).define { flex in
                flex.addItem(label1)
                flex.addItem(label2)
            }
            
            flex.addItem().backgroundColor(.gray).direction(.row).define { flex in
                flex.addItem(label3)
                flex.addItem(label4)
            }
            
            flex.addItem().width(100).height(100).backgroundColor(.red)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        flexContainer.pin.top(100).left(30).right(30).bottom(100)
        
        flexContainer.flex.layout()
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct FlexViewPreview: PreviewProvider {

    static var previews: some View {
        UIViewPreview {
            let view = FlexView()
            return view
        }
        .previewLayout(.sizeThatFits)
    }
}
#endif

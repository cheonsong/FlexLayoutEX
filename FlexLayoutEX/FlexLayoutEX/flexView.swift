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
        flexContainer.backgroundColor = .brown
        
        flexContainer.flex.direction(.column).define { flex in
            flex.addItem().backgroundColor(.blue).direction(.column).define { flex in
                //
                flex.addItem(label1).alignSelf(.center)
                flex.addItem(label2)
            }
            
            flex.addItem().backgroundColor(.gray).direction(.row).define { flex in
                flex.addItem(label3)
                flex.addItem(label4)
            }
            
            // margin은 바깥쪽
            // padding은 안쪽
            // border를 기준으로 나뉨
            flex.addItem().size(100).backgroundColor(.red).define { flex in
                flex.addItem().backgroundColor(.green).width(10).height(10)
            }
            
            // justifyContent -> 수직 정렬을 제어
            // alignItems -> 수평 정렬을 제어
            flex.addItem().size(100).backgroundColor(.yellow).alignItems(.center).justifyContent(.center).define { flex in
                flex.addItem().backgroundColor(.green).width(10).height(10)
                flex.addItem().backgroundColor(.black).width(10).height(10)
            }
            
            // noWrap -> 감싸지 않는다
            // wrap -> 컨테이너에 감싼다
            // wrapReverse -> 컨테이너에 감싸는데 순서를 역전시킨다.
            flex.addItem().backgroundColor(.black).direction(.row).wrap(.wrap).define { flex in
                flex.addItem().backgroundColor(.red).width(200).height(20)
                flex.addItem().backgroundColor(.blue).width(200).height(20)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        flexContainer.pin.top(100).left(30).right(30).bottom(100)
        
        flexContainer.flex.layout(mode: .adjustHeight)
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

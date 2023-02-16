//
//  ViewController.swift
//  FlexLayoutEX
//
//  Created by cheonsong on 2023/02/13.
//

import UIKit
import FlexLayout
import PinLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct VCPreview: PreviewProvider {
        // Device 배열로 여러 개의 디바이스에 적용된 모습을 같이 확인할 수 있습니다.
        // 저는 지금 3가지의 Device를 사용하고 있죠.
    static var devices = ["iPhone 14 Pro"]

    static var previews: some View {
        ForEach(devices, id: \.self) { deviceName in
            ViewController()
                .toPreview()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif

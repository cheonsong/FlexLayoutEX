//
//  BaseViewController.swift
//  FlexLayoutEX
//
//  Created by cheonsong on 2023/02/13.
//

import Foundation
import UIKit

#if DEBUG
import SwiftUI

@available(iOS 13, *)
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        // this variable is used for injecting the current view controller
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func toPreview() -> some View {
        // inject self (the current view controller) for the preview
        Preview(viewController: self)
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
    import SwiftUI

    public struct UIViewPreview<View: UIView>: UIViewRepresentable {
        public let view: View
        public init(_ builder: @escaping () -> View) {
            view = builder()
        }
        // MARK: - UIViewRepresentable
        public func makeUIView(context: Context) -> UIView {
            return view
        }
        public func updateUIView(_ view: UIView, context: Context) {
            view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
    }

    public struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
        public let viewController: ViewController

        public init(_ builder: @escaping () -> ViewController) {
            viewController = builder()
        }

        // MARK: - UIViewControllerRepresentable
        public func makeUIViewController(context: Context) -> ViewController {
            viewController
        }

        @available(iOS 13.0, tvOS 13.0, *)
        @available(OSX, unavailable)
        @available(watchOS, unavailable)
        public func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>) {
            return
        }
    }
#endif

//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Alexander Korchak on 30.11.2023.
//

import UIKit

class EqualSquaresViewController: UIViewController {
    @Autolayout var squaresView = SquaresView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(squaresView)
        squaresView.frame = .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        squaresView.setupSquares()

        gestureRecognizer()
    }

    private func gestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeSquareSize))

        squaresView.addGestureRecognizer(tap)
    }

    @objc
    private func changeSquareSize() {
        squaresView.changeSize()
    }
}

#Preview {
    EqualSquaresViewController()
}

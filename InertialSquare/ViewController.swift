//
//  ViewController.swift
//  InertialSquare
//
//  Created by Kirill Milekhin on 18/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var squareView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var dynamicAnimator = UIDynamicAnimator(referenceView: view)
    private var snap: UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnView)))
        configureUI()
    }
    
    @objc private func didTapOnView(_ tapGesture: UITapGestureRecognizer) {
        if let snap {
            dynamicAnimator.removeBehavior(snap)
        }

        let snap = UISnapBehavior(item: squareView, snapTo: tapGesture.location(in: view))
        snap.damping = 0.7
        dynamicAnimator.addBehavior(snap)
        
        self.snap = snap
    }
    
    private func configureUI() {
        view.addSubview(squareView)
        squareView.center = view.center
    }
}


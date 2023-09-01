//
//  StartViewController.swift
//  MyVideoSDKApp
//
//

import UIKit
// (0)

class StartViewController: UIViewController {
    
    var enterSessionButton: UIButton!
    
    // MARK: VSDK setup
    private func setupSDK() {
        // (1)
    }

    override func loadView() {
        super.loadView()
        
        enterSessionButton = UIButton(type: .system)
        enterSessionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enterSessionButton)
        
        NSLayoutConstraint.activate([
            enterSessionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterSessionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .gray
        
        enterSessionButton.backgroundColor = .white
        enterSessionButton.layer.cornerRadius = 8
        enterSessionButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        enterSessionButton.setTitle("Enter Session", for: .normal)
        enterSessionButton.addTarget(self, action: #selector(enterButtonTapped(_:)), for: .touchUpInside)

        setupSDK()
    }
    
    @IBAction func enterButtonTapped(_ sender: UIButton) {
        enterSessionButton.isEnabled = false
        let sessionViewController = SessionViewController()
        sessionViewController.modalPresentationStyle = .fullScreen
        present(sessionViewController, animated: false)
        enterSessionButton.isEnabled = true
    }
}


//
//  SessionViewController.swift
//  MyVideoSDKApp
//
//

import UIKit
// (0)

enum ControlOption: Int {
    case toggleVideo = 0, toggleAudio, shareScreen, endSession
}

class SessionViewController: UIViewController, UITabBarDelegate { // (3)
    
    var loadingLabel: UILabel!
    var canvasView: UIView!
    var placeholderView: UIView!
    var tabBar: UITabBar!
    var toggleVideoBarItem: UITabBarItem!
    var toggleAudioBarItem: UITabBarItem!
    
    // MARK: Session Information
    // TODO: Ensure that you do not hard code JWT or any other confidential credentials in your production app.
    // (2)
    let token = ""
    let sessionName = ""      // NOTE: Must match "tpc" field in JWT
    let userName = ""
    
    // MARK: UI setup
    
    override func loadView() {
        super.loadView()
        
        loadingLabel = UILabel(frame: .zero)
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingLabel)

        canvasView = UIView(frame: .zero)
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(canvasView)
        
        placeholderView = UIView(frame: .zero)
        placeholderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeholderView)
        
        tabBar = UITabBar(frame: .zero)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBar)

        NSLayoutConstraint.activate([
            loadingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            
            canvasView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            canvasView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            canvasView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            placeholderView.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor),
            placeholderView.centerYAnchor.constraint(equalTo: canvasView.centerYAnchor),
            placeholderView.heightAnchor.constraint(equalToConstant: 120),
            
            tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tabBar.topAnchor.constraint(equalTo: canvasView.bottomAnchor)

        ])
    }
    
    override func viewDidLoad() {
        // (3)
        loadingLabel.text = "Loading Session..."

        tabBar.delegate = self
        toggleVideoBarItem = UITabBarItem(title: "Stop Video", image: UIImage(systemName: "video.slash"), tag: ControlOption.toggleVideo.rawValue)
        toggleAudioBarItem = UITabBarItem(title: "Mute", image: UIImage(systemName: "mic.slash"), tag: ControlOption.toggleAudio.rawValue)
        let shareScreenBarItem = UITabBarItem(title: "Share Screen", image: UIImage(systemName: "square.and.arrow.up.circle"), tag: ControlOption.shareScreen.rawValue)
        let endSessionBarItem = UITabBarItem(title: "End Session", image: UIImage(systemName: "phone.down"), tag: ControlOption.endSession.rawValue)
        tabBar.items = [toggleVideoBarItem, toggleAudioBarItem, shareScreenBarItem, endSessionBarItem]
        tabBar.isHidden = true
        
        let placeholderImageView = UIImageView(image: UIImage(systemName: "person.fill"))
        placeholderImageView.translatesAutoresizingMaskIntoConstraints = false
        placeholderImageView.contentMode = .scaleAspectFill
        let placeholderLabel = UILabel(frame: .zero)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.text = userName
        placeholderView.addSubview(placeholderImageView)
        placeholderView.addSubview(placeholderLabel)
        placeholderView.isHidden = true
        
        NSLayoutConstraint.activate([
            placeholderImageView.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor),
            placeholderImageView.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor),
            placeholderImageView.topAnchor.constraint(equalTo: placeholderView.topAnchor),
            
            placeholderLabel.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor),
            placeholderLabel.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor),
            placeholderLabel.topAnchor.constraint(equalTo: placeholderImageView.bottomAnchor),
            placeholderLabel.bottomAnchor.constraint(equalTo: placeholderView.bottomAnchor)
        ])
        
        joinSession()
    }
    
    private func joinSession() {
        // (2)
    }
    
    // MARK: Delegate Callbacks

    func onSessionJoin() {
        // (4)
    }
    
    /*
    func onUserShareStatusChanged(_ helper: ZoomVideoSDKShareHelper?, user: ZoomVideoSDKUser?, status: ZoomVideoSDKReceiveSharingStatus) {
        // (8)
    }
    */

    func onSessionLeave() {
        // (10)
        presentingViewController?.dismiss(animated: true)
    }

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        tabBar.selectedItem = nil
        switch item.tag {
        case ControlOption.toggleVideo.rawValue:
            tabBar.items![ControlOption.toggleVideo.rawValue].isEnabled = false
            // (5)
            return
        case ControlOption.toggleAudio.rawValue:
            tabBar.items![ControlOption.toggleAudio.rawValue].isEnabled = false
            // (6)
            return
        case ControlOption.shareScreen.rawValue:
            tabBar.items![ControlOption.shareScreen.rawValue].isEnabled = false
            // (7)
            return
        case ControlOption.endSession.rawValue:
            tabBar.isUserInteractionEnabled = false
            // (9)
            return
        default:
            return
        }
    }
}

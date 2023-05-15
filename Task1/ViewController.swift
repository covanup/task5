import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    lazy var button: UIButton = {
        let _button = UIButton(type: .system)
        _button.setTitle("Present", for: .normal)
        _button.tintColor = .systemBlue
        _button.addTarget(self, action: #selector(showPopover(sender: )), for: .touchUpInside)
        return _button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Task 5"

        self.view.backgroundColor = .white
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc
    func showPopover(sender: UIButton) {
        let popupVC = DynamicVC()
        popupVC.preferredContentSize = CGSize(width: 300, height: 280)
        popupVC.modalPresentationStyle = .popover
        popupVC.popoverPresentationController?.sourceView = button
        popupVC.popoverPresentationController?.sourceRect = CGRect(x: button.frame.width / 2, y: button.frame.height, width: 0, height: 0)
        popupVC.popoverPresentationController?.delegate = self
        present(popupVC, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
       return .none
    }
}

class DynamicVC: UIViewController {
    
    lazy var segmentControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["280pt", "150pt"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(segmentedControlDidChange(sender:)), for: .valueChanged)
        return control
    }()
    
    lazy var closeButton: UIButton = {
         var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = .gray
        configuration.baseForegroundColor = UIColor.white
        configuration.image = UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 12, weight: .semibold))
        configuration.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        return UIButton(configuration: configuration, primaryAction: .init(handler: { action in
            self.dismiss(animated: true)
        }))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray.withAlphaComponent(0.5)
        self.view.addSubview(segmentControl)
        self.view.addSubview(closeButton)

        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 12),
            closeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -12)
        ])
    }
    
    @objc func segmentedControlDidChange(sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            UIView.animate(withDuration: 0.3) {
                self.preferredContentSize.height = 280
            }
        case 1:
            UIView.animate(withDuration: 0.3) {
                self.preferredContentSize.height = 150
            }
        default:
            break
        }
    }
}

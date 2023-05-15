import UIKit

final class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    lazy var button: UIButton = {
        let button = UIButton(primaryAction: .init() { [weak self] _ in self?.presentPopover() })
        button.setTitle("Present", for: .normal)
        return button
    }()
    
    func presentPopover() {
        let vc = PopoverViewController()
        vc.modalPresentationStyle = .popover
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = button
        vc.popoverPresentationController?.sourceRect = button.bounds
        vc.popoverPresentationController?.permittedArrowDirections = .any
        
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button
            .addToView(view)
            .addConstraintsWithSafeArea(top: 40)
            .center(x: 0)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

final class PopoverViewController: UIViewController {
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["280pt", "150pt"])
        segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged),
            for: .valueChanged
        )
        segmentedControl.selectedSegmentIndex = .zero
        
        return segmentedControl
    }()
    
    lazy var navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.backgroundColor = .clear
        
        let close = UIBarButtonItem(systemItem: .close, primaryAction: .init() { [weak self] _ in self?.dismiss(animated: true) })
        let navigationItem = UINavigationItem()
        navigationItem.titleView = segmentedControl
        navigationItem.rightBarButtonItem = close
        navigationBar.items = [navigationItem]
        return navigationBar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(navigationBar)
        
        navigationBar
            .addToView(view)
            .addConstraintsWithMargins(top: 0)
            .addConstraints(leading: 0, trailing: 0)
        
        segmentedControlValueChanged()
    }
    
    @objc func segmentedControlValueChanged() {
        preferredContentSize.height = segmentedControl.selectedSegmentIndex == .zero ? 280 : 150
    }
}


//
//  Created by Vladimir Khramtsov on 15.05.23
//

import UIKit

extension UIView {
    @discardableResult
    func addToView(_ view: UIView) -> UIView {
        view.addSubview(self)
        return self
    }
    
    @discardableResult
    func addConstraints(top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        let constaints: [NSLayoutConstraint?] = [
            top.flatMap { topAnchor.constraint(equalTo: superview!.topAnchor, constant: $0) },
            leading.flatMap { leadingAnchor.constraint(equalTo: superview!.leadingAnchor, constant: $0) },
            bottom.flatMap { bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: $0) },
            trailing.flatMap { trailingAnchor.constraint(equalTo: superview!.trailingAnchor, constant: $0) },
        ]
        NSLayoutConstraint.activate(constaints.compactMap { $0 })
        return self
    }
    
    @discardableResult
    func addConstraintsWithMargins(top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        let constaints: [NSLayoutConstraint?] = [
            top.flatMap { topAnchor.constraint(equalTo: superview!.layoutMarginsGuide.topAnchor, constant: $0) },
            leading.flatMap { leadingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.leadingAnchor, constant: $0) },
            bottom.flatMap { bottomAnchor.constraint(equalTo: superview!.layoutMarginsGuide.bottomAnchor, constant: $0) },
            trailing.flatMap { trailingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.trailingAnchor, constant: $0) },
        ]
        NSLayoutConstraint.activate(constaints.compactMap { $0 })
        return self
    }
    
    @discardableResult
    func addConstraintsWithSafeArea(top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        let constaints: [NSLayoutConstraint?] = [
            top.flatMap { topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor, constant: $0) },
            leading.flatMap { leadingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.leadingAnchor, constant: $0) },
            bottom.flatMap { bottomAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.bottomAnchor, constant: $0) },
            trailing.flatMap { trailingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.trailingAnchor, constant: $0) },
        ]
        NSLayoutConstraint.activate(constaints.compactMap { $0 })
        return self
    }
    
    @discardableResult
    func center(x: CGFloat? = nil, y: CGFloat? = nil) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constaints: [NSLayoutConstraint?] = [
            x.flatMap { centerXAnchor.constraint(equalTo: superview!.centerXAnchor, constant: $0) },
            y.flatMap { centerYAnchor.constraint(equalTo: superview!.centerYAnchor, constant: $0) },
        ]
        NSLayoutConstraint.activate(constaints.compactMap { $0 })
        return self
    }
}


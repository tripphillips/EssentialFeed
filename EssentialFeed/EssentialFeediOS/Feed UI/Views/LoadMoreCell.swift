//
//  LoadMoreCell.swift
//  EssentialFeediOS
//
//  Created by Trip Phillips on 1/27/23.
//

import UIKit

public class LoadMoreCell: UITableViewCell {
    private lazy var spinner: UIActivityIndicatorView = {
        contentView.addSubview($0)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            $0.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            $0.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentView.heightAnchor.constraint(lessThanOrEqualToConstant: 40)
        ])
        
        return $0
    }(UIActivityIndicatorView(style: .medium))
    
    public var isLoading: Bool {
        get { spinner.isAnimating }
        set {
            if newValue {
                spinner.startAnimating()
            } else {
                spinner.stopAnimating()
            }
        }
    }
}

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
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        ])
        
        return $0
    }(UIActivityIndicatorView(style: .medium))
    
    private lazy var messageLabel: UILabel = {
        $0.textColor = .tertiaryLabel
        $0.font = .preferredFont(forTextStyle: .footnote)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.adjustsFontForContentSizeCategory = true
        contentView.addSubview($0)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            contentView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: 8),
            $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 8)
        ])
        
        return $0
    }(UILabel(frame: .zero))
    
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
    
    public var message: String? {
        get { messageLabel.text }
        set { messageLabel.text = newValue }
    }
}

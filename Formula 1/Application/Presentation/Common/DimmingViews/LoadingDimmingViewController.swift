//
//  LoadingDimmingViewController.swift
//  Formula 1
//
//  Created by Olya Boyko on 18.07.2024.
//

import UIKit

final class LoadingDimmingViewController: DimmingViewController {    
    // MARK: Private properties
    
    private var spinner = UIActivityIndicatorView(style: .large)
    
    // MARK: Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .greyColor.withAlphaComponent(0.4)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

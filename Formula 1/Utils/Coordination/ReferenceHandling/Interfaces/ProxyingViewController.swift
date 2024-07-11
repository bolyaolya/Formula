//
//  ProxyingViewController.swift
//  Formula 1
//
//  Created by Olya Boyko on 11.07.2024.
//

import UIKit

public protocol ProxyingViewController: UIViewController {
    func switchCurrent(to newViewController: UIViewController, withOptions options: UIView.AnimationOptions?)
}

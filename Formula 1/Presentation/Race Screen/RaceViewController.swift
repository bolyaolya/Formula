//
//  RaceViewController.swift
//  Formula 1
//
//  Created by Olya B on 14.05.2024.
//

import UIKit
import SnapKit

final class RaceViewController: UIViewController {
    
    //MARK: Properties
    
    private lazy var raceView = RaceView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func loadView() {
        super.loadView()
        view = raceView
    }

    private func setupUI() {
        view.backgroundColor = .darkColor
    }
}

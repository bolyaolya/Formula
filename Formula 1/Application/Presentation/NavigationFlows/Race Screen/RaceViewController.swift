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
    
    private var viewModel: RaceViewModel
    private lazy var raceView = RaceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupUI()
        
        self.navigationItem.title = "Следующий этап"
    }
    
    override func loadView() {
        super.loadView()
        view = raceView
        
        raceView.setupRaceInfo(race: viewModel.race)
    }
    
    init(viewModel: RaceViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.backgroundColor = .darkColor
    }
}

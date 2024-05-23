//
//  RaceView.swift
//  Formula 1
//
//  Created by Olya B on 17.05.2024.
//

import UIKit
import SnapKit

final class RaceView: UIView {
    
    //MARK: Properties
    
    private lazy var viewLabel: UILabel = {
        $0.text = "Следующий этап"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return $0
    }(UILabel())
    
    private lazy var dateLabel: UILabel = {
        $0.text = "17 июля - 19 июля"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 18)
        return $0
    }(UILabel())
    
    private lazy var flagImage: UIImageView = {
        $0.image = UIImage.italy
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private lazy var gpLabel: UILabel = {
        $0.text = "ГРАН ПРИ"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 18)
        return $0
    }(UILabel())
    
    private lazy var trackLabel: UILabel = {
        $0.text = "ЭМИЛИИ-РОМАНЬИ"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 18)
        return $0
    }(UILabel())
    
    private lazy var raceNameStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 8
        $0.alignment = .center
        return $0
    }(UIStackView(arrangedSubviews: [gpLabel, trackLabel]))
    
    private lazy var startLabel: UILabel = {
        $0.text = "До старта гонки:"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return $0
    }(UILabel())
    
    private lazy var countdownView = CountdownView()
    private lazy var practiceTimeView = PracticeTimetable()
    private lazy var raceTimeView = RaceTimetable()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
        
    private func setupUI() {
        addSubview(viewLabel)
        addSubview(dateLabel)
        addSubview(flagImage)
        addSubview(raceNameStackView)
        addSubview(startLabel)
        addSubview(countdownView)
        addSubview(practiceTimeView)
        addSubview(raceTimeView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        viewLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(24)
            make.leading.equalToSuperview().inset(27)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(viewLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        flagImage.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(17)
            make.leading.equalToSuperview().inset(39)
            make.width.equalTo(98)
            make.height.equalTo(65)
        }
        
        raceNameStackView.snp.makeConstraints { make in
            make.centerY.equalTo(flagImage.snp.centerY)
            make.trailing.equalToSuperview().inset(10)
            make.leading.equalTo(flagImage.snp.trailing).offset(12)
        }
        
        startLabel.snp.makeConstraints { make in
            make.top.equalTo(flagImage.snp.bottom).offset(17)
            make.centerX.equalToSuperview()
        }
        
        countdownView.snp.makeConstraints { make in
            make.top.equalTo(startLabel.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(85)
        }
        
        practiceTimeView.snp.makeConstraints { make in
            make.top.equalTo(countdownView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(145)
        }
        
        raceTimeView.snp.makeConstraints { make in
            make.top.equalTo(practiceTimeView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }
    }
}

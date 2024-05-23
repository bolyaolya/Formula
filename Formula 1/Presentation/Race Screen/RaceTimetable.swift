//
//  RaceTimetable.swift
//  Formula 1
//
//  Created by Olya B on 23.05.2024.
//

import UIKit
import SnapKit

final class RaceTimetable: UIView {
    
    //MARK: Properties
    
    private lazy var raceBackgroundView: UIView = {
        $0.backgroundColor = .bubbleBackground
        $0.layer.cornerRadius = 16
        return $0
    }(UIView())
    
    private lazy var raceStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 15
        $0.alignment = .fill
        $0.distribution = .fillEqually
        return $0
    }(UIStackView(arrangedSubviews: [qualiView, raceView]))
    
    private lazy var qualiView: UIView = {
        return $0
    }(UIView())
    
    private lazy var qualiLabel: UILabel = {
        $0.text = "Квалификация"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        return $0
    }(UILabel())
    
    private lazy var qualiDayLabel: UILabel = {
        $0.text = "Сб"
        $0.textColor = .white.withAlphaComponent(0.8)
        $0.font = .systemFont(ofSize: 17, weight: .light)
        return $0
    }(UILabel())
    
    private lazy var qualiTimeLabel: PaddedLabel = {
        $0.text = "16:00 - 17:00"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.padding = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        $0.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.2)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        return $0
    }(PaddedLabel())
    
    private lazy var raceView: UIView = {
        return $0
    }(UIView())
    
    private lazy var raceLabel: UILabel = {
        $0.text = "Гонка"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        return $0
    }(UILabel())
    
    private lazy var raceDayLabel: UILabel = {
        $0.text = "Вс"
        $0.textColor = .white.withAlphaComponent(0.8)
        $0.font = .systemFont(ofSize: 17, weight: .light)
        return $0
    }(UILabel())
    
    private lazy var raceTimeLabel: PaddedLabel = {
        $0.text = "15:00"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.padding = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        $0.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.2)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        return $0
    }(PaddedLabel())
    
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
        addSubview(raceBackgroundView)
        addSubview(raceStackView)
        
        qualiView.addSubview(qualiLabel)
        qualiView.addSubview(qualiDayLabel)
        qualiView.addSubview(qualiTimeLabel)
        
        raceView.addSubview(raceLabel)
        raceView.addSubview(raceDayLabel)
        raceView.addSubview(raceTimeLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        raceBackgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(25)
            make.leading.equalToSuperview().offset(25)
            make.height.equalTo(100)
        }
        
        raceStackView.snp.makeConstraints { make in
            make.top.equalTo(raceBackgroundView).offset(15)
            make.leading.equalTo(raceBackgroundView).offset(10)
            make.trailing.equalTo(raceBackgroundView).inset(10)
            make.bottom.equalTo(raceBackgroundView).inset(10)
        }
        
        qualiLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        qualiDayLabel.snp.makeConstraints { make in
            make.centerY.equalTo(qualiLabel)
            make.leading.equalTo(qualiLabel.snp.trailing).offset(10)
            make.trailing.lessThanOrEqualTo(qualiTimeLabel.snp.leading).inset(10)
        }
        
        qualiTimeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(qualiLabel)
            make.trailing.equalToSuperview().inset(10)
        }
        
        raceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        raceDayLabel.snp.makeConstraints { make in
            make.centerY.equalTo(raceLabel)
            make.leading.equalTo(raceLabel.snp.trailing).offset(80)
            make.trailing.lessThanOrEqualTo(raceTimeLabel.snp.leading).inset(80)
        }
        
        raceTimeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(raceLabel)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}


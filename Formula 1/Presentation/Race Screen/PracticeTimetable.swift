//
//  PracticeTimetable.swift
//  Formula 1
//
//  Created by Olya B on 23.05.2024.
//

import UIKit
import SnapKit

final class PracticeTimetable: UIView {
    
    //MARK: Properties
    
    private lazy var practiceBackgroundView: UIView = {
        $0.backgroundColor = .bubbleBackground
        $0.layer.cornerRadius = 16
        return $0
    }(UIView())
    
    private lazy var practiceStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 15
        $0.alignment = .fill
        $0.distribution = .fillEqually
        return $0
    }(UIStackView(arrangedSubviews: [practice1View, practice2View, practice3View]))
    
    private lazy var practice1View: UIView = {
        return $0
    }(UIView())
    
    private lazy var practice1Label: UILabel = {
        $0.text = "1-я практика"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        return $0
    }(UILabel())
    
    private lazy var practice1DayLabel: UILabel = {
        $0.text = "Пт"
        $0.textColor = .white.withAlphaComponent(0.8)
        $0.font = .systemFont(ofSize: 17, weight: .light)
        return $0
    }(UILabel())
    
    private lazy var practice1TimeLabel: PaddedLabel = {
        $0.text = "13:30 - 14:30"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.padding = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        $0.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.2)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        return $0
    }(PaddedLabel())
    
    private lazy var practice2View: UIView = {
        return $0
    }(UIView())
    
    private lazy var practice2Label: UILabel = {
        $0.text = "2-я практика"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        return $0
    }(UILabel())
    
    private lazy var practice2DayLabel: UILabel = {
        $0.text = "Пт"
        $0.textColor = .white.withAlphaComponent(0.8)
        $0.font = .systemFont(ofSize: 17, weight: .light)
        return $0
    }(UILabel())
    
    private lazy var practice2TimeLabel: PaddedLabel = {
        $0.text = "17:00 - 18:00"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.padding = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        $0.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.2)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        return $0
    }(PaddedLabel())
    
    private lazy var practice3View: UIView = {
        return $0
    }(UIView())
    
    private lazy var practice3Label: UILabel = {
        $0.text = "3-я практика"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        return $0
    }(UILabel())
    
    private lazy var practice3DayLabel: UILabel = {
        $0.text = "Сб"
        $0.textColor = .white.withAlphaComponent(0.8)
        $0.font = .systemFont(ofSize: 17, weight: .light)
        return $0
    }(UILabel())
    
    private lazy var practice3TimeLabel: PaddedLabel = {
        $0.text = "12:30 - 13:30"
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
        addSubview(practiceBackgroundView)
        addSubview(practiceStackView)
        
        practice1View.addSubview(practice1Label)
        practice1View.addSubview(practice1DayLabel)
        practice1View.addSubview(practice1TimeLabel)
        
        practice2View.addSubview(practice2Label)
        practice2View.addSubview(practice2DayLabel)
        practice2View.addSubview(practice2TimeLabel)
        
        practice3View.addSubview(practice3Label)
        practice3View.addSubview(practice3DayLabel)
        practice3View.addSubview(practice3TimeLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        practiceBackgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(25)
            make.leading.equalToSuperview().offset(25)
            make.height.equalTo(145)
        }
        
        practiceStackView.snp.makeConstraints { make in
            make.top.equalTo(practiceBackgroundView).offset(15)
            make.leading.equalTo(practiceBackgroundView).offset(10)
            make.trailing.equalTo(practiceBackgroundView).inset(10)
            make.bottom.equalTo(practiceBackgroundView).inset(10)
        }
        
        practice1Label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        practice1DayLabel.snp.makeConstraints { make in
            make.centerY.equalTo(practice1Label)
            make.leading.equalTo(practice1Label.snp.trailing).offset(20)
            make.trailing.lessThanOrEqualTo(practice1TimeLabel.snp.leading).inset(20)
        }
        
        practice1TimeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(practice1Label)
            make.trailing.equalToSuperview().inset(10)
        }
        
        practice2Label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        practice2DayLabel.snp.makeConstraints { make in
            make.centerY.equalTo(practice2Label)
            make.leading.equalTo(practice2Label.snp.trailing).offset(20)
            make.trailing.lessThanOrEqualTo(practice2TimeLabel.snp.leading).inset(20)
        }
        
        practice2TimeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(practice2Label)
            make.trailing.equalToSuperview().inset(10)
        }
        
        practice3Label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        practice3DayLabel.snp.makeConstraints { make in
            make.centerY.equalTo(practice3Label)
            make.leading.equalTo(practice1Label.snp.trailing).offset(20)
            make.trailing.lessThanOrEqualTo(practice1TimeLabel.snp.leading).inset(20)
        }
        
        practice3TimeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(practice3Label)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}


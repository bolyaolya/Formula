//
//  CountdownView.swift
//  Formula 1
//
//  Created by Olya B on 23.05.2024.
//

import UIKit
import SnapKit

final class CountdownView: UIView {
    
    //MARK: Properties
    
    private lazy var timeStackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 30
        $0.alignment = .center
        $0.distribution = .fillEqually
        return $0
    }(UIStackView(arrangedSubviews: [daysView, hoursView, minutesView]))
    
    private lazy var daysView: UIView = {
        return $0
    }(UIView())
    
    private lazy var daysBoxImage: UIImageView = {
        $0.image = .timeSquare
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var daysCountLabel: UILabel = {
        $0.text = "00"
        $0.font = .systemFont(ofSize: 30, weight: .bold)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var daysLabel: UILabel = {
        $0.text = "дней"
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var hoursView: UIView = {
        return $0
    }(UIView())
    
    private lazy var hoursBoxImage: UIImageView = {
        $0.image = .timeSquare
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var hoursCountLabel: UILabel = {
        $0.text = "00"
        $0.font = .systemFont(ofSize: 30, weight: .bold)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var hoursLabel: UILabel = {
        $0.text = "часов"
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var minutesView: UIView = {
        return $0
    }(UIView())
    
    private lazy var minutesBoxImage: UIImageView = {
        $0.image = .timeSquare
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var minutesCountLabel: UILabel = {
        $0.text = "00"
        $0.font = .systemFont(ofSize: 30, weight: .bold)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var minutesLabel: UILabel = {
        $0.text = "минут"
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.textColor = .white
        return $0
    }(UILabel())
    
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
        addSubview(timeStackView)
        
        daysView.addSubview(daysBoxImage)
        daysView.addSubview(daysCountLabel)
        daysView.addSubview(daysLabel)
        
        hoursView.addSubview(hoursBoxImage)
        hoursView.addSubview(hoursCountLabel)
        hoursView.addSubview(hoursLabel)
        
        minutesView.addSubview(minutesBoxImage)
        minutesView.addSubview(minutesCountLabel)
        minutesView.addSubview(minutesLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        timeStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(71)
            make.leading.equalToSuperview().offset(66)
            make.height.equalTo(90)
        }
        
        daysBoxImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(65)
            make.width.equalTo(65)
            make.leading.equalToSuperview()
        }
        
        daysCountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(daysBoxImage)
            make.centerY.equalTo(daysBoxImage)
        }
        
        daysLabel.snp.makeConstraints { make in
            make.top.equalTo(daysBoxImage.snp.bottom).offset(4)
            make.centerX.equalTo(daysBoxImage)
        }
        
        hoursBoxImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(65)
            make.width.equalTo(65)
            make.centerX.equalToSuperview()
        }
        
        hoursCountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(hoursBoxImage)
            make.centerY.equalTo(hoursBoxImage)
        }
        
        hoursLabel.snp.makeConstraints { make in
            make.top.equalTo(hoursBoxImage.snp.bottom).offset(4)
            make.centerX.equalTo(hoursBoxImage)
        }
        
        minutesBoxImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(65)
            make.width.equalTo(65)
            make.trailing.equalToSuperview()
        }
        
        minutesCountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(minutesBoxImage)
            make.centerY.equalTo(minutesBoxImage)
        }
        
        minutesLabel.snp.makeConstraints { make in
            make.top.equalTo(minutesBoxImage.snp.bottom).offset(4)
            make.centerX.equalTo(minutesBoxImage)
        }
    }
}

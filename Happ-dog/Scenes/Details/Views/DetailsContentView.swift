//
//  DetailsContentView.swift
//  Happ-dog
//
//  Created by Alex Xavier on 17/09/21.
//  Copyright © 2021 Alex Xavier. All rights reserved.
//

import Foundation
import UIKit

final class DetailsContentView: UIView {
    
    // MARK: - Properties
    
    private lazy var dogImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = .textLabel(
        text: "", size: 24,
        weight: .semibold,
        textColor: UIColor(named: "label-title") ?? .black,
        textAlignment: .left,
        sizeToFit: true,
        adjustToFit: true
    )
    
    private lazy var temperamentLabel: UILabel = .textLabel(
        text: "",
        size: 16,
        weight: .regular,
        textColor: UIColor(named: "label-info") ?? .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
    private lazy var BoxInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.4
        view.layer.borderColor = UIColor(named: "label-info")?.cgColor
        return view
    }()
    
    private lazy var weightTitleLabel: UILabel = .textLabel(
        text: "Weight:",
        size: 16,
        weight: .regular,
        textColor: UIColor(named: "label-title") ?? .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
    private lazy var weightLabel: UILabel = .textLabel(
        text: "",
        size: 16,
        weight: .regular,
        textColor: UIColor(named: "label-info") ?? .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
    private lazy var heightTitleLabel: UILabel = .textLabel(
        text: "Height:",
        size: 16,
        weight: .regular,
        textColor: UIColor(named: "label-title") ?? .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
    private lazy var HeightLabel: UILabel = .textLabel(
        text: "",
        size: 16,
        weight: .regular,
        textColor: UIColor(named: "label-info") ?? .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
    private lazy var lifeSpanTitleLabel: UILabel = .textLabel(
        text: "Life span:",
        size: 16,
        weight: .regular,
        textColor: UIColor(named: "label-title") ?? .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
    private lazy var lifeSpanLabel: UILabel = .textLabel(
        text: "",
        size: 16,
        weight: .regular,
        textColor: UIColor(named: "label-info") ?? .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
    
    private lazy var bredForTitleLabel: UILabel = .textLabel(
        text: "Bred for:",
        size: 16,
        weight: .regular,
        textColor: UIColor(named: "label-title") ?? .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
    private lazy var bredForLabel: UILabel = .textLabel(
        text: "",
        size: 16,
        weight: .regular,
        textColor: UIColor(named: "label-info") ?? .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
    private lazy var breedGroupTitleLabel: UILabel = .textLabel(
        text: "Breed group:",
        size: 16,
        weight: .regular,
        textColor: UIColor(named: "label-title") ?? .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
    private lazy var breedGroupLabel: UILabel = .textLabel(
        text: "",
        size: 16,
        weight: .regular,
        textColor: UIColor(named: "label-info") ?? .black,
        textAlignment: .left,
        sizeToFit: false,
        adjustToFit: false
    )
    
    // MARK: - Constraints
    
    func configureDogImageViewConstraints() {
        NSLayoutConstraint.activate([
            dogImageView.topAnchor.constraint(equalTo: topAnchor),
            dogImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dogImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: dogImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func configureTemperamentLabelConstraints() {
        NSLayoutConstraint.activate([
            temperamentLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            temperamentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            temperamentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func configureBoxInfoViewConstraints() {
        NSLayoutConstraint.activate([
            BoxInfoView.topAnchor.constraint(equalTo: temperamentLabel.bottomAnchor, constant: 24),
            BoxInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            BoxInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func configureWeightTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            weightTitleLabel.topAnchor.constraint(equalTo: BoxInfoView.topAnchor, constant: 32),
            weightTitleLabel.leadingAnchor.constraint(equalTo: BoxInfoView.leadingAnchor, constant: 16),
        ])
    }
    
    func configureWeightLabelConstraints() {
        NSLayoutConstraint.activate([
            weightLabel.topAnchor.constraint(equalTo: BoxInfoView.topAnchor, constant: 32),
            weightLabel.leadingAnchor.constraint(equalTo: weightTitleLabel.trailingAnchor, constant: 8),
        ])
    }
    
    func configureHeightTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            heightTitleLabel.topAnchor.constraint(equalTo: weightTitleLabel.bottomAnchor, constant: 16),
            heightTitleLabel.leadingAnchor.constraint(equalTo: BoxInfoView.leadingAnchor, constant: 16),
        ])
    }
    
    func configureHeightLabelConstraints() {
        NSLayoutConstraint.activate([
            HeightLabel.topAnchor.constraint(equalTo: weightTitleLabel.bottomAnchor, constant: 16),
            HeightLabel.leadingAnchor.constraint(equalTo:  heightTitleLabel.trailingAnchor, constant: 8),
            HeightLabel.bottomAnchor.constraint(equalTo: BoxInfoView.bottomAnchor, constant: -32)
        ])
    }
    
    func configureLifeSpanTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            lifeSpanTitleLabel.topAnchor.constraint(equalTo: BoxInfoView.topAnchor, constant: 32),
            lifeSpanTitleLabel.leadingAnchor.constraint(equalTo: weightLabel.trailingAnchor, constant: 24),
        ])
    }
    
    func configureLifeSpanLabelConstraints() {
        NSLayoutConstraint.activate([
            lifeSpanLabel.topAnchor.constraint(equalTo: BoxInfoView.topAnchor, constant: 32),
            lifeSpanLabel.leadingAnchor.constraint(equalTo: lifeSpanTitleLabel.trailingAnchor, constant: 8),
        ])
    }
    
    func configureBredForTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            bredForTitleLabel.topAnchor.constraint(equalTo: BoxInfoView.bottomAnchor, constant: 16),
            bredForTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }
    
    func configureBredForlabelConstraints() {
        NSLayoutConstraint.activate([
            bredForLabel.topAnchor.constraint(equalTo: BoxInfoView.bottomAnchor, constant: 16),
            bredForLabel.leadingAnchor.constraint(equalTo: bredForTitleLabel.trailingAnchor, constant: 8),
            bredForLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    func configureBreedGroupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            breedGroupTitleLabel.topAnchor.constraint(equalTo: bredForLabel.bottomAnchor, constant: 16),
            breedGroupTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            breedGroupTitleLabel.widthAnchor.constraint(equalToConstant: 96)
        ])
    }
    
    func configureBreedGrouplabelConstraints() {
        NSLayoutConstraint.activate([
            breedGroupLabel.topAnchor.constraint(equalTo: bredForLabel.bottomAnchor, constant: 16),
            breedGroupLabel.leadingAnchor.constraint(equalTo: breedGroupTitleLabel.trailingAnchor, constant: 8),
            breedGroupLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            breedGroupLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func loadDetailsContent(dog: Dog) {
        if let url = URL(string: dog.image.url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let dataImage = data, let image = UIImage(data: dataImage) else {
                    return
                }
                DispatchQueue.main.async {
                    let size = self.getRatioSize(image: image)
                    let scaleImage = self.resizeImage(image: image, targetSize: size)
                    
                    self.dogImageView.image = scaleImage
                    
                    NSLayoutConstraint.activate([
                        self.dogImageView.heightAnchor.constraint(equalToConstant: size.height),
                        self.dogImageView.widthAnchor.constraint(equalToConstant: size.width)
                    ])
                }
            }.resume()
        }
        nameLabel.text = dog.name
        temperamentLabel.text = dog.temperament != nil ? dog.temperament : "Uninformed"
        weightLabel.text = dog.weight?.metric != nil ? dog.weight?.metric : "NaN"
        HeightLabel.text = dog.height?.metric != nil ? dog.height?.metric : "NaN"
        lifeSpanLabel.text = dog.lifeSpan != nil ? dog.lifeSpan : "NaN"
        bredForLabel.text = dog.bredFor != nil ? dog.bredFor : "Uninformed"
        breedGroupLabel.text = dog.breedGroup != nil ? dog.breedGroup : "Uninformed"
    }
    
    func getRatioSize(image: UIImage) -> CGSize {
        let myImageWidth = image.size.width
        let myImageHeight = image.size.height
        let myViewWidth = frame.size.width
        
        let ratio = myViewWidth / myImageWidth
        let scaledHeight = myImageHeight * ratio
        
        return CGSize(width: myViewWidth, height: scaledHeight)
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

// MARK: - ViewLayout

extension DetailsContentView: ViewLayout {
    func configureView() {
        
    }
    
    func configureHierarchy() {
        addSubview(dogImageView)
        addSubview(nameLabel)
        //addSubview(TemperamentTitleLabel)
        addSubview(temperamentLabel)
        
        addSubview(BoxInfoView)
        BoxInfoView.addSubview(weightTitleLabel)
        BoxInfoView.addSubview(weightLabel)
        BoxInfoView.addSubview(heightTitleLabel)
        BoxInfoView.addSubview(HeightLabel)
        BoxInfoView.addSubview(lifeSpanTitleLabel)
        BoxInfoView.addSubview(lifeSpanLabel)
        
        addSubview(bredForTitleLabel)
        addSubview(bredForLabel)
        addSubview(breedGroupTitleLabel)
        addSubview(breedGroupLabel)
    }
    
    func configureConstraints() {
        configureDogImageViewConstraints()
        configureNameLabelConstraints()
        //configureTemperamentTitleLabelConstraints()
        configureTemperamentLabelConstraints()
        configureBoxInfoViewConstraints()
        configureWeightTitleLabelConstraints()
        configureWeightLabelConstraints()
        configureHeightTitleLabelConstraints()
        configureHeightLabelConstraints()
        configureLifeSpanTitleLabelConstraints()
        configureLifeSpanLabelConstraints()
        configureBredForTitleLabelConstraints()
        configureBredForlabelConstraints()
        configureBreedGroupTitleLabelConstraints()
        configureBreedGrouplabelConstraints()
    }
}

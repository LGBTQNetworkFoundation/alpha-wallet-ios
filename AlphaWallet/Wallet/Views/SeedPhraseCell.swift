// Copyright © 2019 Stormbird PTE. LTD.

import Foundation
import UIKit

class SeedPhraseCell: UICollectionViewCell {
    static let identifier = "SeedPhraseCell"

    private let sequenceLabel = UILabel()
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        sequenceLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sequenceLabel)

        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)

        let horizontalMargin = CGFloat(20)
        let verticalMargin = CGFloat(10)
        NSLayoutConstraint.activate([
            sequenceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            sequenceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),

            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalMargin),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalMargin),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalMargin),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalMargin),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(viewModel: SeedPhraseCellViewModel) {
        cornerRadius = 7

        if let sequence = viewModel.sequence {
            sequenceLabel.font = viewModel.sequenceFont
            sequenceLabel.textColor = viewModel.sequenceColor
            sequenceLabel.text = viewModel.sequence
        } else {
            sequenceLabel.text = ""
        }

        label.textAlignment = .center
        label.font = viewModel.font
        label.text = viewModel.word

        if viewModel.isSelected {
            contentView.backgroundColor = viewModel.selectedBackgroundColor
            backgroundColor = viewModel.selectedBackgroundColor
            label.textColor = viewModel.selectedTextColor
        } else {
            contentView.backgroundColor = viewModel.backgroundColor
            backgroundColor = viewModel.backgroundColor
            label.textColor = viewModel.textColor
        }
    }
}
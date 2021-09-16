//
//  ProductCell.swift
//  Pazar
//
//  Created by tsamodol on 02.09.2021..
//

import Kingfisher
import Foundation
import RxSwift
import UIKit

class ProductCell: DisposableTableViewCell, ClassIdentifiable {

    var viewModel: ProductCellViewModel!

    private (set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "textIcons")
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 13)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private (set) lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "textIcons")
        label.font = .systemFont(ofSize: 13)
        return label
    }()

    private (set) lazy var imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private (set) lazy var uninstallButton: UIButton = {
        let button = UIButton()
        button.configure(type: .secondaryActionButton)
        button.setTitle("Dodatne informacije", for: .normal)
        button.setTitleColor(UIColor(named: "textIcons"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupVews()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupVews() {
        selectionStyle = .none

        contentView.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.left.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
        }

        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(180)
            make.left.equalTo(imgView.snp.right).offset(10)
            make.top.equalToSuperview().offset(30)
        }

        contentView.addSubview(sizeLabel)
        sizeLabel.snp.makeConstraints { make in
            make.left.equalTo(imgView.snp.right).offset(10)
            make.bottom.equalToSuperview().offset(-30)
        }

        contentView.addSubview(uninstallButton)
        uninstallButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(32)
            make.width.equalTo(120)
        }
    }
}

extension ProductCell: BindableType {
    func bindViewModel() {
        viewModel.output.name
            .drive(nameLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.output.price
            .drive(sizeLabel.rx.text)
            .disposed(by: disposeBag)

        uninstallButton.rx.tap
            .bind(to: viewModel.input.detailsTrigger)
            .disposed(by: disposeBag)
        
        viewModel.output.image
            .map { $0 }
            .drive(imgView.kf.rx.image(options: [.cacheSerializer(FormatIndicatedCacheSerializer.png),
                                                 .processor(RoundCornerImageProcessor(cornerRadius: 20)),
                                                 .transition(.none),
                                                 .keepCurrentImageWhileLoading,
                                                 .forceTransition]))
            .disposed(by: disposeBag)

    }
}

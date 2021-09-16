//
//  HomeView.swift
//  Pazar
//
//  Created by tsamodol on 02.09.2021..
//

import Foundation
import RxCocoa
import RxSwift
import SnapKit
import UIKit

class HomeView: UIView {

    private var disposeBag = DisposeBag()
    
    private(set) lazy var navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.backgroundColor = UIColor(named: "darkPrimary")
        return navigationBar
    }()

    private(set) lazy var logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        return image
    }()

    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = UIColor(named: "lightPrimary")
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(90)
            }
        setupNavigationBar()

        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(navigationBar.snp.bottom)
            }
        }
    private func setupNavigationBar() {
        navigationBar.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.centerY.equalTo(self.navigationBar)
            make.centerX.equalTo(self.navigationBar)
            make.height.equalTo(85)
            make.width.equalTo(90)
            }
    }
}

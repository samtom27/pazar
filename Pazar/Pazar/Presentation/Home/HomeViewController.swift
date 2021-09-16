//
//  HomeViewController.swift
//  Pazar
//
//  Created by tsamodol on 02.09.2021..
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit
import FirebaseAuth
import RxDataSources
import Alamofire



class HomeViewController: DisposableViewController, HasCustomView {
    typealias CustomView = HomeView

    var viewModel: HomeViewModel!
    var dataSource: RxTableViewSectionedReloadDataSource<ProductSectionModel>!

    override func loadView() {
        view = HomeView()
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        setupDataSource()
        registerTableCellsAndViews()
    }


    private func registerTableCellsAndViews() {

        mainView.tableView.tableFooterView = UIView()

        mainView.tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)

        mainView.tableView.register(cellType: ProductCell.self)
    }

    private func setupDataSource() {
        dataSource = RxTableViewSectionedReloadDataSource<ProductSectionModel>(
            configureCell: { (_, tableView, indexPath, viewModel) -> UITableViewCell in
                let cell: ProductCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
                cell.bind(to: viewModel)
                return cell
            })
    }
}
extension HomeViewController: BindableType {
    func bindViewModel() {

        viewModel.output.items
            .bind(to: mainView.tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt _: IndexPath) {
        cell.contentView.backgroundColor = UIColor(named: "accentColor")
        cell.selectionStyle = .none
    }

    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}




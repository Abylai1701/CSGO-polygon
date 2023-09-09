import Foundation
import UIKit
import SnapKit

class NewsViewController: BaseController {
    
//    private let viewModel: MainPageViewModelLogic = MainPageViewModel()
//    private var players: [Players] = []
//
    private lazy var  mainLabel : UILabel = {
        let label = UILabel()
        label.text = "Новости"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.showsVerticalScrollIndicator = false
        table.register(RakCell.self,
                       forCellReuseIdentifier: RakCell.cellId)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
//        bind()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        viewModel.fetchPlayers()
//    }
//
//    private func bind(){
//        viewModel.players.observe(on: self) { players in
//            self.players = players
//            self.tableView.reloadData()
//        }
//    }
    private func setupViews(){
        view.backgroundColor = .backgroundColor
        view.addSubviews(mainLabel,
                         tableView)
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(72)
            make.left.equalToSuperview().offset(24)
            make.right.lessThanOrEqualToSuperview().offset(-24)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
}

extension NewsViewController:UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RakCell.cellId, for: indexPath) as! RakCell
        return cell
    }
}

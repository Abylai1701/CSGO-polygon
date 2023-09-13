import Foundation
import UIKit
import SnapKit

class NewsViewController: BaseController {
    
    private let viewModel: NewsViewModelLogic = NewsViewModel()
    private var news: [News] = []

    private lazy var  mainLabel : UILabel = {
        let label = UILabel()
        label.text = "News"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private lazy var coverImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "example_image")
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.showsVerticalScrollIndicator = false
        table.register(NewsCell.self,
                       forCellReuseIdentifier: NewsCell.cellId)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchNews()
    }

    private func bind(){
        viewModel.news.observe(on: self) { news in
            self.news = news
            self.tableView.reloadData()
        }
    }
    private func setupViews(){
        view.backgroundColor = .backgroundColor
        view.addSubviews(mainLabel,
                         coverImageView,
                         tableView)
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(72)
            make.left.equalToSuperview().offset(24)
            make.right.lessThanOrEqualToSuperview().offset(-24)
        }
        coverImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}

extension NewsViewController:UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.cellId, for: indexPath) as! NewsCell
        cell.configure(model: news[indexPath.section])
        return cell
    }
}

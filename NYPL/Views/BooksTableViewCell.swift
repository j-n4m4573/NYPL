//
//  BooksTableViewCell.swift
//  NYPL
//
//  Created by Jamar Gibbs on 3/28/22.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(red: 0.12, green: 0.31, blue: 0.62, alpha: 1.00)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let publishDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupImageView()
        setupTitleLabel()
        setupAuthorLabel()
        setupPublishDateLabel()
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        contentView.addSubview(bookImageView)
        
        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -2),
            bookImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            bookImageView.heightAnchor.constraint(equalToConstant: 60),
            bookImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 2),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupAuthorLabel() {
        contentView.addSubview(authorLabel)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 2),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupPublishDateLabel() {
        contentView.addSubview(publishDateLabel)
        
        NSLayoutConstraint.activate([
            publishDateLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            publishDateLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 2),
            publishDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

}

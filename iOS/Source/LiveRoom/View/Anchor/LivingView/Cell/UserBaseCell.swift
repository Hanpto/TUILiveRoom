//
//  UserBaseCell.swift
//  TUILiveKit
//
//  Created by WesleyLei on 2023/10/27.
//

import Foundation

class UserBaseCell: UITableViewCell {
    
    let action: Observable<LinkControlAction> = Observable(.default)
    var userInfo: UserInfo? {
        didSet {
            guard let userInfo = userInfo else {
                return
            }
            if let url = URL(string: userInfo.avatarUrl.value) {
                avatarImageView.kf.setImage(with: url,placeholder: UIImage.placeholderImage)
            } else {
                avatarImageView.image = .placeholderImage
            }
            nameLabel.text = userInfo.name.value
        }
    }
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.cornerRadius = 40.scale375() * 0.5
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .customFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .g3.withAlphaComponent(0.3)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

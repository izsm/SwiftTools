//
//  TYSConnectionAnalystCollectionCell.swift
//  SwiftTools
//
//  Created by 张书孟 on 2018/4/3.
//  Copyright © 2018年 ZSM. All rights reserved.
//

import UIKit

class TYSConnectionAnalystCollectionCell: UICollectionViewCell {

    var userImgView: UIImageView?
    var nameLabel: UILabel?
    var orgLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(model: TYSInterestedPeopleModel) {
        guard let iconURL = URL(string: model.head_img ?? "") else { return }
        userImgView?.kf.setImage(with: iconURL, placeholder:UIImage(named: "defaut_avatar"))
        nameLabel?.text = model.name ?? "暂无数据"
        orgLabel?.text = model.company_profile ?? "暂无数据"
    }

}

extension TYSConnectionAnalystCollectionCell {
    
    private func addSubViews() {
        userImgView = UIImageView()
        userImgView?.layer.cornerRadius = 54/2
        userImgView?.layer.masksToBounds = true
        userImgView?.image = UIImage(named: "defaut_avatar")
        contentView.addSubview(userImgView!)
        userImgView?.snp.makeConstraints({ (make) in
            make.top.equalTo(contentView)
            make.centerX.equalTo(contentView)
            make.size.equalTo(CGSize(width: 54, height: 54))
        })
        
        nameLabel = UILabel()
        nameLabel?.textAlignment = .center
        nameLabel?.textColor = tys_middleDarkColor
        nameLabel?.font = SystemFont(fontSize: 12)
        nameLabel?.text = "投研社"
        contentView.addSubview(nameLabel!)
        nameLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo((userImgView?.snp.centerX)!)
            make.left.equalTo((userImgView?.snp.left)!)
            make.top.equalTo((userImgView?.snp.bottom)!).offset(AdaptH(h: 8))
        })
        
        orgLabel = UILabel()
        orgLabel?.textAlignment = .center
        orgLabel?.textColor = tys_titleColor
        orgLabel?.font = SystemFont(fontSize: 12)
        orgLabel?.text = "投研社"
        contentView.addSubview(orgLabel!)
        orgLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo((userImgView?.snp.centerX)!)
            make.left.equalTo((userImgView?.snp.left)!)
            make.top.equalTo((nameLabel?.snp.bottom)!).offset(AdaptH(h: 8))
        })
        
    }
}

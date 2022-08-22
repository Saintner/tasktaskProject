//
//  TTPTasksSubtitleTableViewCell.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import UIKit

class TTPTasksSubtitleTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError(TTPConstants.fatalError)
    }
}

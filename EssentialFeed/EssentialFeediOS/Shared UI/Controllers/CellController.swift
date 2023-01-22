//
//  CellController.swift
//  EssentialFeediOS
//
//  Created by Trip Phillips on 1/9/23.
//

import UIKit

public struct CellController {
    let id: AnyHashable
    let dataSource: UITableViewDataSource
    let delegate: UITableViewDelegate?
    let dataSourcePrefetching: UITableViewDataSourcePrefetching?
    
    public init(_ id: AnyHashable, dataSource: UITableViewDataSource & UITableViewDelegate & UITableViewDataSourcePrefetching) {
        self.id = id
        self.dataSource = dataSource
        self.delegate = dataSource
        self.dataSourcePrefetching = dataSource
    }
    
    public init(_ id: AnyHashable, dataSource: UITableViewDataSource) {
        self.id = id
        self.dataSource = dataSource
        self.delegate = nil
        self.dataSourcePrefetching = nil
    }
}

extension CellController: Equatable {
    public static func == (lhs: CellController, rhs: CellController) -> Bool {
        return lhs.id == rhs.id
    }
}
extension CellController: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

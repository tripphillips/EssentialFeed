//
//  CellController.swift
//  EssentialFeediOS
//
//  Created by Trip Phillips on 1/9/23.
//

import UIKit

public struct CellController {
    let dataSource: UITableViewDataSource
    let delegate: UITableViewDelegate?
    let dataSourcePrefetching: UITableViewDataSourcePrefetching?
    
    public init(_ dataSource: UITableViewDataSource & UITableViewDelegate & UITableViewDataSourcePrefetching) {
        self.dataSource = dataSource
        self.delegate = dataSource
        self.dataSourcePrefetching = dataSource
    }
    
    public init(_ datasSource: UITableViewDataSource) {
        self.dataSource = datasSource
        self.delegate = nil
        self.dataSourcePrefetching = nil
    }
}

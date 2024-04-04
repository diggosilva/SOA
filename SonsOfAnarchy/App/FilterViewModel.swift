//
//  FilterViewModel.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 04/04/24.
//

import Foundation

class FilterViewModel {
    var filters: [Filter]
    
    init(filters: [Filter]) {
        self.filters = filters
    }
    
    func numberOfRows() -> Int {
        filters.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Filter {
        filters[indexPath.row]
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        filters[indexPath.row].isSelected.toggle()
    }
}

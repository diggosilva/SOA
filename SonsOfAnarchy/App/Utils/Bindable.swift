//
//  Bindable.swift
//  SonsOfAnarchy
//
//  Created by Diggo Silva on 25/03/24.
//

import Foundation

class Bindable<T> {
    
    init(value: T) {
        self.value = value
    }
    
    var value: T {
        didSet {
            observers.forEach { observe in
                observe(value)
            }
        }
    }
    
    fileprivate var observers: [((T) -> ())] = []
    
    func bind(observer: @escaping(T) ->()) {
        self.observers.append(observer)
    }
}

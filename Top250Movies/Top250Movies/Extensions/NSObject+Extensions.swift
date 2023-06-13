//
//  NSObject+Extensions.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 14.06.2023.
//

import Foundation

public extension NSObject {

    var className: String {
        return type(of: self).className
    }

    static var className: String {
        return stringFromClass(aClass: self)
    }
}

public func stringFromClass(aClass: AnyClass) -> String {
    return NSStringFromClass(aClass).components(separatedBy: ".").last!
}


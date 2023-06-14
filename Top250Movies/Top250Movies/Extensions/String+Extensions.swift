//
//  String+Extensions.swift
//  Top250Movies
//
//  Created by Orhun Dündar on 14.06.2023.
//

import Foundation

extension String {
    /// Fetches a localized String
    ///
    /// - Returns: return value(String) for key
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }


    /// Fetches a localised String Arguments
    ///
    /// - Parameter arguments: parameters to be added in a string
    /// - Returns: localized string
    public func localized(with arguments: [CVarArg]) -> String {
        return String(format: self.localized, locale: nil, arguments: arguments)
    }
}

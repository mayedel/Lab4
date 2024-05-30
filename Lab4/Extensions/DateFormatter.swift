//
//  DateFormatter.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import Foundation

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}

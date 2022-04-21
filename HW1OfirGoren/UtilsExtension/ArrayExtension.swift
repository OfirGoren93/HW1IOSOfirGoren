//
//  ArrayExtension.swift
//  HW1OfirGoren
//
//  Created by Ofir Goren on 18/04/2022.
//

import Foundation



extension Array {
    func splitInSubArrays(into size: Int) -> [[Element]] {
        return (0..<size).map {
            stride(from: $0, to: count, by: size).map { self[$0] }
        }
    }
}

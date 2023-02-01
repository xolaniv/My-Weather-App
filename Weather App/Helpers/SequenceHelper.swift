//
//  SequenceHelper.swift
//  Weather App
//
//  Created by Xolani Vilalakazi on 2023/01/31.
//

import Foundation

public extension Sequence {
  /// The elements of the sequences, with "duplicates" removed
  /// based on a closure.
  func firstUniqueElements<Hashable: Swift.Hashable>(
    _ getHashable: (Element) -> Hashable
  ) -> [Element] {
    var set: Set<Hashable> = []
    return filter { set.insert(getHashable($0)).inserted }
  }
  /// The elements of the sequence, with "duplicates" removed,
  /// based on a closure.
  func firstUniqueElements<Equatable: Swift.Equatable>(
    _ getEquatable: (Element) -> Equatable
  ) -> [Element] {
    reduce(into: []) { uniqueElements, element in
      if zip(
        uniqueElements.lazy.map(getEquatable),
        AnyIterator { [equatable = getEquatable(element)] in equatable }
      ).allSatisfy(!=) {
        uniqueElements.append(element)
      }
    }
  }
}

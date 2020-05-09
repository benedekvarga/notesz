//
//  RootView.swift
//  Notesz
//
//  Created by Benedek Varga on 2020. 04. 13..
//

import Combine

protocol RootViewProtocol {
    var subscriptions: Set<AnyCancellable> { get }
}

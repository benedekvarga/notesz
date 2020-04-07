//
//  RootViewModel.swift
//
//  Created by Benedek Varga on 2020. 04. 07..
//

public class RootViewModel: RootViewModelProtocol {
    // MARK: - Properties

    // MARK: - Initialization

    public init(inputView: RootInputModelProtocol) {
        initializeViewModel()
    }

    public init() {
        initializeViewModel()
    }

    // MARK: - RootViewModelProtocol functions

    func initializeViewModel() { }

    func loadData() { }
}

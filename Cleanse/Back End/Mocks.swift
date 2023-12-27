//
//  Mocks.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-12-26.
//

import Foundation

struct Mocks {
    static var cleanses: [Cleanse] = [
        Cleanse(id: UUID(uuidString: "962c3c24-e980-4c67-a642-1e534ecc6772")!, name: "Cleanse1", start_date: Date.now, end_date: Date.now, penalty: "get fucked"),
        Cleanse(id: UUID(uuidString: "1c44656c-3307-4b3f-a195-33103f218455")!, name: "Cleanse2", start_date: Date.now, end_date: Date.now, penalty: "run sprints"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6084")!, name: "Cleanse3", start_date: Date.now, end_date: Date.now, penalty: "u a bitch")
    ]
}

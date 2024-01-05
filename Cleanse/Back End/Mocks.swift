//
//  Mocks.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-12-26.
//

import Foundation

struct Mocks {
    static var start = Calendar.current.date(from: DateComponents(calendar: Calendar.current, year: 2024, month: 1, day: 1))
    static var end = Calendar.current.date(from: DateComponents(calendar: Calendar.current, year: 2024, month: 12, day: 31))
    
    static var cleanses: [Cleanse] = [
        Cleanse(id: UUID(uuidString: "962c3c24-e980-4c67-a642-1e534ecc6772")!, name: "Cleanse1 skjdfh sdjkfhsdjkfhsdf", start_date: start!, end_date: end!, penalty: "get fucked"),
        Cleanse(id: UUID(uuidString: "1c44656c-3307-4b3f-a195-33103f218455")!, name: "Cleanse2", start_date: start!, end_date: end!, penalty: "run sprints"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6084")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6083")!, name: "Cleanse3 safhal sjdhfasldfkjsdhf", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6082")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6081")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6080")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6029")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6039")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6049")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6059")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6069")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6079")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6289")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch"),
        Cleanse(id: UUID(uuidString: "5cc961e0-9743-4dce-a16f-ac71ad3b6189")!, name: "Cleanse3", start_date: start!, end_date: end!, penalty: "u a bitch")
    ]
}

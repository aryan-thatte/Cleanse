//
//  ScreenTime.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-25.
//

import Foundation
import FamilyControls
import DeviceActivity


struct ScreenTime {
    private let ac = AuthorizationCenter.shared
    
    func requestPermission() {
        Task {
            do {
                try await ac.requestAuthorization(for: .individual)
            } catch {
                print("Failed to fetch screen time permission with this error: \(error)")
            }
        }
    }
    
    func getActivity() {
        let schedule = DeviceActivitySchedule(
            intervalStart: DateComponents(hour: 0, minute: 0, second: 0),
            intervalEnd: DateComponents(hour: 23, minute: 59, second: 59),
            repeats: true
        )
//        let activity = DeviceActivityData.ActivitySegment
        let act = DeviceActivityData.ActivitySegment.self
        print(act)
    }
}

//
//  ScreenTime.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-11-25.
//

import Foundation
import DeviceActivity
import FamilyControls


struct ScreenTime {
    // https://crunchybagel.com/monitoring-app-usage-using-the-screen-time-api/
    let allDaySchedule: DeviceActivitySchedule
    let center: DeviceActivityCenter
    let AC: AuthorizationCenter
    let FAS: FamilyActivitySelection
    
    init() {
        allDaySchedule = DeviceActivitySchedule(intervalStart: DateComponents(hour: 0, minute: 0, second: 0), intervalEnd: DateComponents(hour: 23, minute: 59, second: 59), repeats: true)
        center = DeviceActivityCenter()
        AC = AuthorizationCenter.shared
        FAS = FamilyActivitySelection()
        
    }
    
    func authenticate() {
        Task {
            do {
                try await AC.requestAuthorization(for: .individual)
            } catch (let error) {
                print("\(error)")
            }
        }
        Task {
            do {
                
            }
        }
    }
    
    
    func getActivity() {
        // DeviceActivityName("allDayMonitoring")
//        do {
//            try center.startMonitoring(name, during: allDaySchedule)
//        } catch(let error) {
//            print("\(error)")
//        }
        print(center.activities.count)
    }
}

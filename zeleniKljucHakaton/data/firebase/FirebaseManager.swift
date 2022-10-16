//
//  FirebaseManager.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import Foundation
import FirebaseDatabase

final class FirebaseManager: ManagerProtocol {
    static let shared = FirebaseManager()
    private let databaseRef = Database.database().reference()
    
    func getAllCategories() {
        databaseRef.child("Categories").observe(.value, with: { snapshot in
            guard let data = try? JSONSerialization.data(withJSONObject: snapshot.value as Any, options: []) else { return }
            let categories = try? JSONDecoder().decode([CategoryModel].self, from: data)
            NotificationCenter.default.post(name: Notification.Name.categories, object: categories)
        })
    }
    
    func createProblemReport(problem: ProblemReportModel) {
        do {
            let data = try JSONEncoder().encode(problem)
            let jsonData = try JSONSerialization.jsonObject(with: data)
            databaseRef.child("Problems").child(UUID().uuidString).setValue(jsonData) { (error, ref) in
                print(ref)
            }
        } catch {
            print(error)
        }
    }
    
    func getAllNews() {
        databaseRef.child("News").observe(.value, with: { snapshot in
            guard let data = try? JSONSerialization.data(withJSONObject: snapshot.value as Any, options: []) else { return }
            let news = try? JSONDecoder().decode([News].self, from: data)
            NotificationCenter.default.post(name: Notification.Name.news, object: news)
        })
    }
    
    
    func getPartnerDetails() {
        databaseRef.child("Partners").observe(.value, with: { snapshot in
            guard let data = try? JSONSerialization.data(withJSONObject: snapshot.value as Any, options: []) else { return }
            let partners = try? JSONDecoder().decode(PartnersScreenModel.self, from: data)
            NotificationCenter.default.post(name: Notification.Name.partners, object: partners)
        })
    }
    
    func getDonationsData() {
        databaseRef.child("Donations").observe(.value, with: { snapshot in
            guard let data = try? JSONSerialization.data(withJSONObject: snapshot.value as Any, options: []) else { return }
            let donationsInfo = try? JSONDecoder().decode(DonationsScreenModel.self, from: data)
            NotificationCenter.default.post(name: Notification.Name.donations, object: donationsInfo)
        })
    }
    
    func getContactInformations() {
        databaseRef.child("Contact").observe(.value, with: { snapshot in
            guard let data = try? JSONSerialization.data(withJSONObject: snapshot.value as Any, options: []) else { return }
            let contactInfo = try? JSONDecoder().decode(ContactScreenModel.self, from: data)
            NotificationCenter.default.post(name: Notification.Name.contact, object: contactInfo)
        })
    }
    
    func getWaisteDisposalInformations() {
        databaseRef.child("Waste Disposal").observe(.value, with: { snapshot in
            guard let data = try? JSONSerialization.data(withJSONObject: snapshot.value as Any, options: []) else { return }
            let wasteDisposalInfo = try? JSONDecoder().decode(WasteDisposal.self, from: data)
            NotificationCenter.default.post(name: Notification.Name.waisteDisposal, object: wasteDisposalInfo)
        })
    }
}

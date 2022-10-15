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
    var categories = [CategoryModel]()
    var allNews = [News]()
    
    func getAllCategories() {
        databaseRef.child("Categories").observeSingleEvent(of: .value, with: { snapshot in
            if snapshot.childrenCount > 0 {
                self.categories.removeAll()
                for category in snapshot.children.allObjects as! [DataSnapshot] {
                    let categoryObject = category.value as? [String: AnyObject]
                    let id  = categoryObject?["id"]
                    let desc = categoryObject?["description"]
                    let name  = categoryObject?["name"]
                    let image = categoryObject?["image"]
                    let sub = categoryObject?["subcategories"]
                    print(sub)
                    
                    let category = CategoryModel(id: id as? String,
                                                 name: name as? String,
                                                 image: image as? String,
                                                 description: desc as? String,
                                                 subcategories: [])
                    self.categories.append(category)
                }
            }
            
//            NotificationCenter.default.post(name: Notification.Name.categories, object: self.categories)
        })
    }
    
    func createProblemReport(problem: ProblemReportModel) {
        //
    }
    
    func getAllNews() {
        databaseRef.child("news").observeSingleEvent(of: .value, with: { snapshot in
            if snapshot.childrenCount > 0 {
                self.allNews.removeAll()
                for news in snapshot.children.allObjects as! [DataSnapshot] {
                    let newsObject = news.value as? [String: AnyObject]
                    let date  = newsObject?["date"]
                    let desc = newsObject?["description"]
                    let image  = newsObject?["image"]
                    let id = newsObject?["id"]
                    let title = newsObject?["title"]
                    
                    
                    let news = News(id: id as? String ,
                                    title: title as? String,
                                    date: date as? String,
                                    description: desc as? String,
                                    image: image as? String)
                    self.allNews.append(news)
                }
            }
//            NotificationCenter.default.post(name: Notification.Name.news, object: self.allNews)
        })
    }
    
    
    func getPartnerDetails() {
        databaseRef.child("partners").observeSingleEvent(of: .value, with: { snapshot in
            //            print(snapshot.value)
        })
    }
    
    func getDonationsData() {
        databaseRef.child("donations").observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            let cardNumber = value?["cardNumber"] as? String ?? ""
            let description = value?["description"] as? String ?? ""
        
            let donationsInfo = DonationsScreenModel(cardNumber: cardNumber, description: description)
//            NotificationCenter.default.post(name: Notification.Name.donations, object: donationsInfo)
        })
    }
    
    func getContactInformations() {
        databaseRef.child("contact").observeSingleEvent(of: .value, with: { snapshot in
            let contactObject = snapshot.value as? NSDictionary
            let desc = contactObject?["description"] as? String ?? ""
            let email  = contactObject?["email"] as? String ?? ""
            let facebookProfile = contactObject?["facebookProfile"] as? String ?? ""
            let instagramProfile  = contactObject?["instagramProfile"] as? String ?? ""
            let phoneNumber  = contactObject?["phoneNumber"] as? String ?? ""
            let webAdress  = contactObject?["webAdress"] as? String ?? ""
        
            let contactInfo = ContactScreenModel(description: desc,
                                                 phoneNumber: phoneNumber,
                                                 email: email,
                                                 webAdress: webAdress,
                                                 instagramProfile: instagramProfile,
                                                 facebookProfile: facebookProfile)
//            NotificationCenter.default.post(name: Notification.Name.contact, object: contactInfo)
        })
    }
}

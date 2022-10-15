//
//  RepositoryModule.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//
import Foundation

class RepositoryModule: RepositoryModuleProtocol {
    private var manager: ManagerProtocol
    
    init(manager: ManagerProtocol) {
        self.manager = manager
    }
    
    func getAllCategories() {
        manager.getAllCategories()
    }
    
    func createProblemReport(problem: ProblemReportModel) {
        manager.createProblemReport(problem: problem)
    }
    
    func getAllNews() {
        manager.getAllNews()
    }
    
    func getPartnerDetails() {
        manager.getPartnerDetails()
    }
    
    func getDonationsData() {
        manager.getDonationsData()
    }
    
    func getContactInformations() {
        manager.getContactInformations()
    }
}


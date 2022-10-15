//
//  ManagerProtocol.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import Foundation

protocol ManagerProtocol {
    func getAllCategories()
    func createProblemReport(problem: ProblemReportModel)
    func getPartnerDetails()
    func getAllNews()
    func getDonationsData()
    func getContactInformations()
}

//
//  RepositoryModuleProtocol.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/15/22.
//

import Foundation

protocol RepositoryModuleProtocol: CategoriesProtocol,
                                    ProblemReportProtocol,
                                    NewsProtocol,
                                    PartnerDetailsProtocol,
                                    ContactDataProtocol,
                                    DonationsDataProtocol {
    func getAllCategories()
    func createProblemReport(problem: ProblemReportModel)
    func getAllNews()
    func getPartnerDetails()
    func getDonationsData()
    func getContactInformations()
}

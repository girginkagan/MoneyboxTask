//
//  IServiceHandler.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Alamofire

protocol IServiceHandler {
    func postLogin(email: String, password: String, successCompletion: @escaping(LoginResponseModel) -> Void, errorCompletion: @escaping(BaseErrorModel) -> Void)
    func getProducts(successCompletion: @escaping(ProductsResponseModel) -> Void, errorCompletion: @escaping(BaseErrorModel) -> Void)
    func postOneOffPayments(amount: Int, investorProductId: Int, successCompletion: @escaping(OneOffPaymentsResponseModel) -> Void, errorCompletion: @escaping(BaseErrorModel) -> Void)
}

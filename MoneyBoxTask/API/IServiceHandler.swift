//
//  IServiceHandler.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Alamofire

protocol IServiceHandler {
    func postLogin(email: String, password: String, successCompletion: @escaping(LoginResponseModel) -> Void, errorCompletion: @escaping(BaseErrorModel) -> Void)
}

//
//  RestClient.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Alamofire

public class RestClient: IServiceHandler {
    static let sharedInstance = RestClient()
    
    private func sendRequest<T: Codable>(_ request: BaseRequest, _ type: T.Type, successCompletion: @escaping(T) -> Void, errorCompletion:  @escaping(BaseErrorModel) -> Void) {
        AF.request(request.request()).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
                case .success(let json):
                if response.response!.statusCode == APIStatusCodes.success.rawValue {
                    successCompletion(json)
                } else {
                    print(response.result)
                    errorCompletion(BaseErrorModel(errorCode: response.response!.statusCode, message: (json as? BaseResponseModel)?.error ?? .local(.unknownError), errors: nil))
                }
                case .failure(let error):
                    errorCompletion(BaseErrorModel(errorCode: nil, message: nil, errors: [ErrorData(field: APIErrors.alamofire.rawValue, message: error.localizedDescription)]))
                    print(error.localizedDescription)
            }
        }
    }
    
    func postLogin(email: String, password: String, successCompletion: @escaping (LoginResponseModel) -> Void, errorCompletion: @escaping (BaseErrorModel) -> Void) {
        let request = PostLoginApiRequest(email: email, password: password)
        sendRequest(request, LoginResponseModel.self, successCompletion: successCompletion, errorCompletion: errorCompletion)
    }
    
    func getProducts(successCompletion: @escaping (ProductsResponseModel) -> Void, errorCompletion: @escaping (BaseErrorModel) -> Void) {
        let request = GetProductsApiRequest()
        sendRequest(request, ProductsResponseModel.self, successCompletion: successCompletion, errorCompletion: errorCompletion)
    }
    
    func postOneOffPayments(amount: Int, investorProductId: Int, successCompletion: @escaping (OneOffPaymentsResponseModel) -> Void, errorCompletion: @escaping (BaseErrorModel) -> Void) {
        let request = PostOneOffPaymentsApiRequest(amount: amount, inverstorProductId: investorProductId)
        sendRequest(request, OneOffPaymentsResponseModel.self, successCompletion: successCompletion, errorCompletion: errorCompletion)
    }
}

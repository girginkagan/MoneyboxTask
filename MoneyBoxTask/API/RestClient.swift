//
//  RestClient.swift
//  MoneyboxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Alamofire

public class RestClient: IServiceHandler {
    
    static let sharedInstance = RestClient()
    private let jwtUtil = JWTUtil()
    
    private func sendRequest<T: Codable>(_ request: BaseRequest, _ type: T.Type, successCompletion: @escaping(T) -> Void, errorCompletion:  @escaping(BaseErrorModel) -> Void) {
        AF.request(request.request()).responseDecodable { (response: AFDataResponse<BaseResponseModel<T>>) in
            switch response.result {
                case .success(let json):
                if let data = json.data, response.response!.statusCode == APIStatusCodes.success.rawValue {
                    successCompletion(data)
                } else {
                    print(response.result)
                    errorCompletion(BaseErrorModel(errorCode: response.response!.statusCode, message: json.message ?? .local(.unknownError), errors: nil))
                }
                case .failure(let error):
                    errorCompletion(BaseErrorModel(errorCode: nil, message: nil, errors: [ErrorData(field: APIErrors.alamofire.rawValue, message: error.localizedDescription)]))
                    print(error.localizedDescription)
            }
        }
    }
}

//
//  JWTUtil.swift
//  MoneyBoxTask
//
//  Created by Kagan Girgin on 7/29/22.
//

import Foundation
import JWTDecode

final class JWTUtil {
    private var retryCount = 0
    
    private func checkIfJWTIsExpired(token: String) -> Bool {
        do {
            let jwt = try decode(jwt: token.replacingOccurrences(of: "Bearer ", with: ""))
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
            
            let dateTimeStamp = jwt.expiresAt!
            let now = Date()
            if now.timeIntervalSince(dateTimeStamp) > 0 {
                return true
            }
            return false
        } catch {
            return true
        }
    }

    private func refreshToken(successCompletion: @escaping ((_ ret: Bool, _ newToken: String?) -> Void)) {
        
    }

    func refreshTokenHandler(successCompletion: @escaping (() -> Void), errorCompletion: @escaping (() -> Void)) {
        /*if !checkIfJWTIsExpired(token: DataProvider.shared.getSelectedUser()?.token ?? "") {
            successCompletion()
        } else {
            tryRefreshToken {
                successCompletion()
            } errorCompletion: {
                errorCompletion()
            }
        }*/
    }
    
    private func tryRefreshToken(successCompletion: @escaping (() -> Void), errorCompletion: @escaping (() -> Void)) {
        if retryCount < 3 {
            retryCount+=1
            refreshToken(successCompletion: { [weak self] (success, newAccessToken) in
                if success {
                    self?.setNewToken(token: newAccessToken ?? "")
                    successCompletion()
                } else {
                    self?.tryRefreshToken(successCompletion: successCompletion, errorCompletion: errorCompletion)
                }
            })
        } else {
            retryCount = 0
            errorCompletion()
        }
    }
    
    private func setNewToken(token: String) {
        
    }
}

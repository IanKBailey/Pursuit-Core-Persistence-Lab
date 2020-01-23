//
//  ImageAPIClient.swift
//  PersistanceLab
//
//  Created by Ian Bailey on 1/21/20.
//  Copyright © 2020 Ian Bailey. All rights reserved.
//

import Foundation
import NetworkHelper

struct ImageAPI {
    static func fetchImagesData(completion: @escaping (Result <[ImageInfo], AppError>)->()) {
        
        let endpointURL = "https://pixabay.com/api/?key=\(SecretKey.apiKey)&q="
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .success(let data) :
                do {
                    let result = try JSONDecoder().decode([ImageInfo].self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            }
        }
    }
    
    
    
    
}

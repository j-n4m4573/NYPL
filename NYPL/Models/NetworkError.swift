//
//  NetworkError.swift
//  NYPL
//
//  Created by Jamar Gibbs on 3/28/22.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "invalid url, please check url"
    case decodingError = "decoding error, please check decoder"
    case invalidResponse = "invalid response, please check request"
    case requestError = "invalid request, please try again"
}


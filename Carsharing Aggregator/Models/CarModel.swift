//
//  CarModel.swift
//  Carsharing Aggregator
//
//  Created by Greg on 29.11.2023.
//

import UIKit

struct GetCarsResponse: Codable {
    let count: Int
    let results: [Car]
}

struct Car: Codable {
    let image: String?
    let id: Int
    var isAvailable: Bool
    var company: CarsharingCompany
    let brand: String
    let model: String
    let typeEngine: EngineType
    let typeCar: CarType
    var rating: Double
    var coordinates: Coordinates
    let childSeat: Bool
    let stateNumber: String
}

struct Coordinates: Codable {
    let latitude: Float
    let longitude: Float
}

enum CarsharingCompany: String, Codable, CaseIterable {
    case YandexDrive
    case CityDrive
    case Delimobil
    case BelkaCar
    
    var color: UIColor {
        switch self {
        case .YandexDrive:
            return UIColor.carsharing.lightBlue
        case .CityDrive:
            return UIColor.carsharing.purple
        case .Delimobil:
            return UIColor.carsharing.lightGreen
        case .BelkaCar:
            return UIColor.carsharing.mediumGreen
        }
    }
    
    var iconImage: UIImage {
        switch self {
        case .YandexDrive:
            UIImage.pointLightBlue ?? UIImage()
        case .CityDrive:
            UIImage.pointPurple ?? UIImage()
        case .Delimobil:
            UIImage.pointLightGreen ?? UIImage()
        case .BelkaCar:
            UIImage.pointMediumGreen ?? UIImage()
        }
    }
    
    var bigIcon: UIImage {
        switch self {
        case .YandexDrive:
            UIImage.drive ?? UIImage()
        case .CityDrive:
            UIImage.city ?? UIImage()
        case .Delimobil:
            UIImage.deli ?? UIImage()
        case .BelkaCar:
            UIImage.drive ?? UIImage()
        }
    }
    
    var name: String {
        switch self {
        case .YandexDrive:
            "Яндекс.Драйв"
        case .CityDrive:
            "СитиДрайв"
        case .Delimobil:
            "Делимобиль"
        case .BelkaCar:
            "Rentmee"
        }
    }
}

enum EngineType: String, Codable {
    case diesel
    case electro
    case benzine
}

enum CarType: String, Codable {
    case sedan
    case hatchback
    case minivan
    case coupe
    case universal
    case other
    
    var name: String {
        switch self {
        case .sedan:
            "Седан"
        case .hatchback:
            "Хэтчбек"
        case .minivan:
            "Минивен"
        case .coupe:
            "Купе"
        case .universal:
            "Универсал"
        case .other:
            "Другое"
        }
    }
}

struct Cars: Codable {
//    let id: Int
//    let coordinates: Coordinates
//    let isAvailable: Bool
//    let company, brand, model, typeCar: String
//    let stateNumber, typeEngine: String
//    let childSeat: Bool
//    let powerReserve: Int
//    let rating: String
    let image: String?
    let id: Int
    var isAvailable: Bool
    var company: String
    let brand: String
    let model: String
    let typeEngine: String
    let typeCar: String
    var rating: String
    var coordinates: Coordinates
    let childSeat: Bool
}

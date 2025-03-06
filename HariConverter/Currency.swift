import SwiftUI

enum Currency : Double, CaseIterable, Identifiable {
    
    var id: Currency {self}
    
    case copperPenny = 6400
    case silverPiece = 64
    case silverPenny = 16
    case goldPiece = 4
    case goldPenny = 1
    
    
    var image: ImageResource {
        switch self {

        case .copperPenny:
                .copperpenny
        case .silverPiece:
                .silverpiece
        case .silverPenny:
                .silverpenny
        case .goldPiece:
                .goldpiece
        case .goldPenny:
                .goldpenny
        }
    }
    
    var name: String {
        switch self {
            
        case .copperPenny:
                "Copper Penny"
        case .silverPiece:
                "Silver Piece"
        case .silverPenny:
                "Silver Penny"
        case .goldPiece:
                "Gold Piece"
        case .goldPenny:
                "Gold Penny"
        }
    }

}

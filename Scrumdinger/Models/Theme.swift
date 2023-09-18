
import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable{
   
    
    case bubblegumS
    case buttercupS
    case indigoS
    case lavenderS
    case magentaS
    case navyS
    case orangeS
    case oxbloodS
    case periwinkleS
    case poppyS
    case purpleS
    case seafoamS
    case skyS
    case tanS
    case tealS
    case yellowS
    
    var accentColor: Color {
        switch self {
        case .bubblegumS, .buttercupS, .lavenderS, .orangeS, .periwinkleS, .poppyS, .seafoamS, .skyS, .tanS, .tealS, .yellowS:
            return .black
        case .indigoS, .magentaS, .navyS, .oxbloodS, .purpleS:
            return .white
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
       String(rawValue.capitalized.dropLast())
    }
    
    var id: String {
        name
    }
}

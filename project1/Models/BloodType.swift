enum BloodType: String, CaseIterable {
    case APlus = "A+"
    case AMinus = "A-"
    case BPlus = "B+"
    case BMinus = "B-"
    case OPlus = "O+"
    case OMinus = "O-"
    case ABPlus = "AB+"
    case ABMinus = "AB-"
    
    // BloodType compatibility matching
    func compatibleDonors() -> [BloodType] {
        switch self {
        case .OMinus: return [.OMinus]
        case .OPlus: return [.OMinus, .OPlus]
        case .AMinus: return [.OMinus, .AMinus]
        case .APlus: return [.OMinus, .OPlus, .AMinus, .APlus]
        case .BMinus: return [.OMinus, .BMinus]
        case .BPlus: return [.OMinus, .OPlus, .BMinus, .BPlus]
        case .ABMinus: return [.OMinus, .AMinus, .BMinus, .ABMinus]
        case .ABPlus: return BloodType.allCases
        }
    }
}

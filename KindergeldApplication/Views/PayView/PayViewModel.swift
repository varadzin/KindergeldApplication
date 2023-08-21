import SwiftUI
import Combine

enum KGError: String, CaseIterable {
    case KGnotCorrect = "Kindergeld Nummer ist nicht richtig"
    case KGisShort = "Kindergeld ist zu kurz"
    case KGisLong = "Kindergeld soll maximal 11 Zeichen haben"
    case KGLetters = "Kindergeld soll nach 3 Nummer 2 Buchstaben haben"
}

class PayViewModel: ObservableObject {
    @Published var kindergeldNumber: String = ""
    @Published var kgIsNotCorrect: Bool = false
    @Published var kgHasMoreThan11Char: Bool = false
    @Published var showAlert: Bool = false
    @Published var buttonEnabled: Bool = false
    @Published var alertText: String = ""
    @Published var payTermsForYou: String = ""
    @Published var showSheet: Bool = false
    @Published var kgError: KGError = .KGisShort
    @AppStorage("lastCharacterOfKG") var lastCharacterOfKG: String = ""
    @AppStorage("KGnumber") var KGnumber: String = ""
    var lastCharacter: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $kindergeldNumber.sink { _ in
            self.readLastNumber(insertedString: self.kindergeldNumber)
            self.checkFKInString(insertedString: self.kindergeldNumber)
            self.kgHas11Char(insertedString: self.kindergeldNumber)
            self.showAlert = self.kgIsNotCorrect || self.kgHasMoreThan11Char
            self.buttonEnabled = !self.kgIsNotCorrect && !self.kgHasMoreThan11Char && self.kindergeldNumber.count == 11
            self.KGnumber = self.kindergeldNumber
            print("kindergeld z initu: \(self.kindergeldNumber)")
        }
        .store(in: &cancellables)
    }
    func readLastNumber(insertedString: String) {
        if self.kindergeldNumber.count == 11 {
            let char = self.kindergeldNumber[self.kindergeldNumber.index(self.kindergeldNumber.startIndex, offsetBy: 10)]
            lastCharacter = "\(char)"
            lastCharacterOfKG = "\(char)"
            setEndNumber(lastChar: lastCharacter)
            print("last character z readLastNumber: \(self.lastCharacterOfKG)")
        }
    }
    
    func checkFKInString(insertedString: String) {
        if kindergeldNumber.count == 5 {
            let char4 = self.kindergeldNumber[self.kindergeldNumber.index(self.kindergeldNumber.startIndex, offsetBy: 3)]
            let char5 = self.kindergeldNumber[self.kindergeldNumber.index(self.kindergeldNumber.startIndex, offsetBy: 4)]
            let kgIsCorrect = char4 == "F" || char4 == "f" && char5 == "K" || char5 == "k"
            if kgIsCorrect { kgIsNotCorrect = false
            } else {
                kgIsNotCorrect = true
                alertText = "PayView_alertFK"
                kgError = .KGLetters
            }
        }
    }
    
    func kgHas11Char(insertedString: String) {
        if kindergeldNumber.count > 11 {
            kgHasMoreThan11Char = true
            alertText = "PayView_alert_count"
            kgError = .KGisLong
        } else {
            kgHasMoreThan11Char = false
        }
    }
    func setEndNumber(lastChar: String) {
        switch lastChar {
        case "0":
            payTermsForYou = PayTermsData.endNumber0
        case "1":
            payTermsForYou = PayTermsData.endNumber1
        case "2":
            payTermsForYou = PayTermsData.endNumber2
        case "3":
            payTermsForYou = PayTermsData.endNumber3
        case "4":
            payTermsForYou = PayTermsData.endNumber4
        case "5":
            payTermsForYou = PayTermsData.endNumber5
        case "6":
            payTermsForYou = PayTermsData.endNumber6
        case "7":
            payTermsForYou = PayTermsData.endNumber7
        case "8":
            payTermsForYou = PayTermsData.endNumber8
        case "9":
            payTermsForYou = PayTermsData.endNumber9
        default:
            payTermsForYou = "Excuse me, I have no data for you"
        }
    }
}

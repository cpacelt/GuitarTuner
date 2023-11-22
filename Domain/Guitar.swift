//
//  Guitar.swift
//  GuitarTuner
//
//  Created by _name_ on 22.11.2023.
//

struct Sound {
    let frequency: Float = .zero
    
    static func -(lhs: Sound, rhs: Sound) -> SoundDifference {
        return SoundDifference(lhs: lhs, rhs: rhs)
    }
}

struct SoundDifference {
    init(lhs: Sound, rhs: Sound) {}
    
    static var zero: SoundDifference {
        // TODO: zeroSound
        SoundDifference(lhs: Sound(), rhs: Sound())
    }
}

struct GuitarString {
    let soundForFretNumberMap: [Sound]
    func sound(forFretNumber fretNumber: Int) -> Sound {
        return soundForFretNumberMap[fretNumber]
    }
}

protocol SomeGuitar {
    var strings: [GuitarString] { get }
    func sound(forStringNumber stringNumber: Int, fretNumber: Int) -> Sound
}

final class SixStringsGuitar: SomeGuitar {
    let strings: [GuitarString]
    
    init(strings: [GuitarString]) {
        self.strings = strings
    }
    
    func sound(forStringNumber stringNumber: Int, fretNumber: Int) -> Sound {
        return strings[stringNumber].sound(forFretNumber: fretNumber)
    }
}

final class Balalayka: SomeGuitar {
    let strings: [GuitarString]
    
    init(strings: [GuitarString]) {
        self.strings = strings
    }
    
    func sound(forStringNumber stringNumber: Int, fretNumber: Int) -> Sound {
        return strings[stringNumber].sound(forFretNumber: fretNumber)
    }
}

final class SomeGuitarFactory {
    func sixStringsGuitar() -> SixStringsGuitar {
        let soundForFretNumber = [Sound()]
        
        let strings = [
            GuitarString(soundForFretNumberMap: soundForFretNumber),
            GuitarString(soundForFretNumberMap: soundForFretNumber),
            GuitarString(soundForFretNumberMap: soundForFretNumber),
            GuitarString(soundForFretNumberMap: soundForFretNumber),
            GuitarString(soundForFretNumberMap: soundForFretNumber),
        ]
        
        let guitar = SixStringsGuitar(strings: strings)
        return guitar
    }
    
    func balalayka() -> SixStringsGuitar {
        let soundForFretNumber = [
            Sound()
        ]
        
        let strings = [
            GuitarString(soundForFretNumberMap: soundForFretNumber),
            GuitarString(soundForFretNumberMap: soundForFretNumber),
            GuitarString(soundForFretNumberMap: soundForFretNumber),
        ]
        
        let guitar = SixStringsGuitar(strings: strings)
        return guitar
    }
}

// TODO: Generalize (Musical instrument)
final class GuitarsСomparison {
    let oneGuitar: SomeGuitar
    let otherGuitar: SomeGuitar
    
    init(standardGuitar: SomeGuitar, otherGuitar: SomeGuitar) {
        self.oneGuitar = standardGuitar
        self.otherGuitar = otherGuitar
    }
}

final class GuitarTunning {
    let guitarsComparision: GuitarsСomparison
    
    init(guitarsComparision: GuitarsСomparison) {
        self.guitarsComparision = guitarsComparision
    }
}

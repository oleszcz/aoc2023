import Algorithms
import Foundation

struct Day05: AdventDay {
    struct Almanac {
        struct Mapping {
            let source: Range<Int>
            let destination: Range<Int>
            
            func converted(_ input: Int) -> Int {
                return input + destination.lowerBound - source.lowerBound
            }
        }
        
        let seeds: [Int]
        let seedToSoil: [Mapping]
        let soilToFertilizer: [Mapping]
        let fertilizerToWater: [Mapping]
        let waterToLight: [Mapping]
        let lightToTemperature: [Mapping]
        let temperatureToHumidity: [Mapping]
        let humidityToLocation: [Mapping]
        
        var soils: [Int] {
            seeds.map {
                use(mappings: seedToSoil, toConvert: $0)
            }
        }
        
        var fertilizers: [Int] {
            soils.map {
                use(mappings: soilToFertilizer, toConvert: $0)
            }
        }
        
        var waters: [Int] {
            fertilizers.map {
                use(mappings: fertilizerToWater, toConvert: $0)
            }
        }
        
        var ligths: [Int] {
            waters.map {
                use(mappings: waterToLight, toConvert: $0)
            }
        }
        
        var temperatures: [Int] {
            ligths.map {
                use(mappings: lightToTemperature, toConvert: $0)
            }
        }
        
        var humidities: [Int] {
            temperatures.map {
                use(mappings: temperatureToHumidity, toConvert: $0)
            }
        }
        
        var locations: [Int] {
            humidities.map {
                use(mappings: humidityToLocation, toConvert: $0)
            }
        }
        
        func use(mappings: [Mapping], toConvert: Int) -> Int {
            var converted = toConvert
            for mapping in mappings {
                if mapping.source.contains(toConvert) {
                    converted = mapping.converted(toConvert)
                }
            }
            return converted
        }
    }
    
    init(data: String) {
        self.data = data
        entities = data
            .split(separator: "\n\n")
            .map { String($0) }
    }
    
    
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String
    
    var entities: [String]
    
    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        let almanac = AlmanacParser.almanac(from: entities)
        return almanac.locations.min() ?? -1
    }
    
    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        return "Day 5 Part 2"
    }
}

extension Day05 {
    enum AlmanacParser {
        static func almanac(from sections: [String]) -> Day05.Almanac {
            let seedsSection = sections[0].split(separator: ":").last!.split(separator: " ")
            let seeds = seedsSection.compactMap { Int(String($0)) }
            
            return Almanac(
                seeds: seeds,
                seedToSoil: mappings(from: sections[1]),
                soilToFertilizer: mappings(from: sections[2]),
                fertilizerToWater: mappings(from: sections[3]),
                waterToLight: mappings(from: sections[4]),
                lightToTemperature: mappings(from: sections[5]),
                temperatureToHumidity: mappings(from: sections[6]),
                humidityToLocation: mappings(from: sections[7])
            )
        }
        
        static func mappings(from str: String) -> [Almanac.Mapping] {
            let lines = str.split(separator: "\n").map(String.init).dropFirst()
            return lines.compactMap(mapping(from:))
        }
        
        static func mapping(from line: String) -> Almanac.Mapping? {
            let numbers = line.split(separator: " ").compactMap { Int(String($0)) }
            guard numbers.count == 3 else {
                return nil
            }
            let destination = numbers[0]
            let source = numbers[1]
            let length = numbers[2]
            
            return .init(
                source: .init(uncheckedBounds: (lower: source, upper: source + length)),
                destination: .init(uncheckedBounds: (lower: destination, upper: destination + length))
            )
        }
    }
}

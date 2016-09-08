import Foundation

class Sum : NSObject, NSCopying {
	
    var resultsCache: [[Int]];
    var firstValue:Int;
    var secondValue:Int;
    
	init(first:Int, second:Int, cachedSize: Int) {
        resultsCache = [[Int]](count: cachedSize, repeatedValue:
            [Int](count:cachedSize, repeatedValue: 0));
		
        for i in 0..<cachedSize {
            for j in 0..<cachedSize {
                resultsCache[i][j] = i + j;
				
            }
        }
		
        self.firstValue = first;
        self.secondValue = second;
    }
    
    private init(first:Int, second:Int, cache:[[Int]]) {
        self.firstValue = first;
        self.secondValue = second;
        resultsCache = cache;
    }
    
    var Result:Int {
        get {
            return firstValue < resultsCache.count
                && secondValue < resultsCache[firstValue].count
                ? resultsCache[firstValue][secondValue]
                : firstValue + secondValue;
        }
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return Sum(first:self.firstValue,
            second: self.secondValue,
            cache: self.resultsCache);
    }
}

var calc1 = Sum(first:0, second:9, cachedSize: 100).Result
var calc2 = Sum(first:3, second:8, cachedSize: 20).Result;

//var calc1 = prototype.Result;
//var clone = prototype.copy() as! Sum;
//clone.firstValue = 3; clone.secondValue = 8;
//var calc2 = clone.Result;

print("Calc1: \(calc1) Calc2: \(calc2)");

class Model{
    var numberToGuess = 0
    var attempts = [Int]()
    
    
    func addGuessedNumber(guess guessedNumber: Int!) {
        attempts.append(guessedNumber)
    }
    
    func compare(guess guessedNumber:Int!) -> Int! {
        var result = 0
        
            if guessedNumber < numberToGuess {
                result = -1
            } else if guessedNumber > numberToGuess  {
                result = 1
            }
        
        return result
        }
    
    func isValid(guess guessedNumber:Int!) -> Bool!{
        if(guessedNumber == nil){
            return false
        }
        if guessedNumber < 101 && guessedNumber > -1 {
            return true
        }
        return false
    }
}


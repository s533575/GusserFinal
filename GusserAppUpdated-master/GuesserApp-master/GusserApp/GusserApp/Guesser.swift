//
//  Guesser.swift
//  GusserApp
//
//  Created by student on 2/26/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

class Guesser{
    static let shared = Guesser()
    
    private var correctAnswer : Int = 0
    private var _numAttempts : Int = 0
    private var guesses : [Guess] = []
    
    private init() {
        
    }
    
    var numAttemps : Int{
        return _numAttempts
    }

    func createNewProblem()
    {
        let generateRandom = Int.random(in: 1...10);
        self.correctAnswer = generateRandom
        self._numAttempts = 0
     }
    
    func amIRight(guess:Int) -> String
    {
        if guess != correctAnswer && guess < correctAnswer{
            _numAttempts = _numAttempts + 1
            return Result.tooLow.rawValue
        }
        else if guess != correctAnswer && guess > correctAnswer{
            _numAttempts = _numAttempts + 1
            return Result.tooHigh.rawValue
        }
        else
        {
             _numAttempts = _numAttempts + 1
           guesses.append(Guess(correctAnswer: correctAnswer, numAttemptsRequired: _numAttempts))
           return Result.correct.rawValue
        }
    }
    
    func guess(index:Int) -> Guess{
        print(guesses)
        return guesses[index]
    }
    
    func numGuesses() -> Int {
        return guesses.count
    }
    
    func minNumberOfAttempts() -> Int
    {
        var min : Int = guesses[0].numAttemptsRequired
        for i in 0 ... guesses.count-1
        {
            if guesses[i].numAttemptsRequired < min
            {
                min = guesses[i].numAttemptsRequired
            }
        }
        return min
    }
    
    func maxNumberOfAttempts() -> Int
    {
        var max : Int = guesses[0].numAttemptsRequired
        for i in 0 ... guesses.count-1
        {
            if guesses[i].numAttemptsRequired > max
            {
                max = guesses[i].numAttemptsRequired
            }
        }
        return max
    }
    
    func calculateMean() -> Double{
        var avg : Double = 0.0
        for i in 0 ... guesses.count-1
        {
            avg = avg + Double(guesses[i].numAttemptsRequired)
        }
        return avg/Double(guesses.count)
    }
    
    func calcStandardDev() -> Double
    {
        var stddev : Double = 0.0
        for i in 0 ... guesses.count-1
        {
            stddev = stddev + pow((Double(guesses[i].numAttemptsRequired) - calculateMean()),2)
        }
        return sqrt(stddev/Double(guesses.count))
    }
    
    func clearStatistics(){
        guesses = []
    }
    
}

struct Guess{
    var correctAnswer : Int
    var numAttemptsRequired :Int
}

enum Result:String {case tooLow = "Too Low", tooHigh = "Too High", correct = "Correct"}

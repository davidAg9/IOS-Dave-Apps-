//
//  WorthUser.swift
//  NetWorth
//
//  Created by Dave Agyakwa on 15/08/2021.
//

import Foundation



class WorthUser :Identifiable {
    let   id:String
    let   name:String
    var   avatar:String
    var   status:NetStatus

    var  currentAssets:[Assets] 
    var  currentLiabilities:[Liabilities]

    var goal:Goal
    var netIncome:Float64{
        return CalcNet()
    }
    init(id:String = UUID().uuidString,name:String,photo:String,status:NetStatus,amount:Float64?) {
        self.id = id
        self.name = name
        self.avatar = photo
        self.status = status
        self.goal = Goal(status: status)

        self.currentAssets = []
        self.currentLiabilities = []
    }



    convenience init(name:String, photo:String, amount:Float64) {
        let netStatus:NetStatus

        if  amount < 10_000 {
            netStatus = .Poor
        }else if amount > 10_000 && amount < 100_000 {
            netStatus = .Average10K
        }else if amount > 100_000 &&  amount < 1_000_000{
            netStatus = .Average100K
        }else if amount > 1_000_000 && amount < 1_000_000_000 {
            netStatus = .Millionare
        }
        else if amount > 1_000_000_000 && amount < 1_000_000_000_000 {
            netStatus = .Billionare
        }
        else {
            netStatus = .Trillionare
        }



        self.init(name:name,photo:photo,status:netStatus,amount:amount)

    }

    private func CalcAssets()-> Float64{
        var funds:Float64 = 0
        for asset in self.currentAssets {
            funds += asset.moneyEarned
        }
        return funds
    }
    private func CalcLiabilites()-> Float64{
        var totalDeficit:Float64 = 0
        for liablities in self.currentLiabilities {
            totalDeficit += liablities.amount
        }
        return totalDeficit
    }

    private func CalcNet()-> Float64{
       return  CalcAssets() - CalcLiabilites()
    }
}

struct Goal {
    var currentAmount:Float64?
    var goalAmount:Float64?

    init(currentAmount:Float64, goalAmount:Float64) {
        self.currentAmount = currentAmount
        self.goalAmount = goalAmount
    }
    init(status:NetStatus) {
        switch status {
            case .Average10K:
                self.init(currentAmount: 0, goalAmount: 10_000)
            case .Average100K:
                self.init(currentAmount: 0, goalAmount:100_000)
            case .Millionare:
                self.init(currentAmount: 0, goalAmount:1_000_000)
            case .Billionare:
                self.init(currentAmount: 0, goalAmount:1_000_000_000)
            case .Trillionare:
                self.init(currentAmount: 0, goalAmount:1_000_000_000_000)
            default:
                self.init(currentAmount: 0, goalAmount: 10_000)

        }
    }
}




enum NetStatus :String,Decodable{
    case Poor
    case Average10K
    case Average100K
    case Millionare
    case Billionare
    case Trillionare
    case Skipper

}

//
//  assetModel.swift
//  NetWorth
//
//  Created by Dave Agyakwa on 15/08/2021.
//

import Foundation


protocol Assets {

    var moneyEarned: Float64 { get set }

}

protocol Liabilities {
    var amount :Float64 {get set}
}



protocol Income :Assets {
    var title:String {get set}
    var amount:Float {get set}
    var duration:Date {get set}
    var isCancelled:Bool {get set}

}







struct Tax {
    var itemtaxed:String
    var  percentage:Double
    var amount:Float?
}







//
//struct Salarly:Income {
//    var title: String
//
//    var amount: Float
//
//    var duration: Date
//
//    var isCancelled: Bool
//
//
//}
//




protocol  Investments:Identifiable {
    var id:String{get set}
    var title:String{get set}
    var amountInvested:Float{get set}
    var interest:Double{get}
    var duration:Date{get set}
    var isCompleted:Bool{get set}
    var ROI:Float{get}
   func setInterest()->Void
}



struct Shares {
    var TotalShare:Float
    ///percentage of the [TotalShare]
    var divident:Double
}


struct CashInvestMent {

}

struct Property
{

}

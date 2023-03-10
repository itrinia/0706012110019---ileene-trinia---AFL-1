//
//  main.swift
//  0706012110019 - ileene trinia - AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

//global variables
var shoppingCart = [(cafetaria: String, order: String)]()
var totalPrice = 0.0
main()

func main(){
    var userInput: String = ""
    
    while true{
        print("Welcome to UC-Walk cafetaria šØš»āš³š©š»āš³ \nPlease choose cafetaria: \n[1] tuku-tuku \n[2] gotri \n[3] madam lie \n[4] kopte \n[5] xiangjia \n[6] raburi \n- \n[S]hopping cart \n[Q]uit")
        
        print("Your cafetaria choice?")
        userInput = readLine()!
        if userInput == "1"{
            tukutuku()
        } else if userInput == "2"{
            print("Welcome to gotri")
//            gotri()
        }else if userInput == "3"{
            print("Welcome to madam lie")
            //code
        }else if userInput == "4"{
            print("Welcome to kopte")
            //code
        }else if userInput == "5"{
            print("Welcome to xiangjia")
            //code
        }else if userInput == "6"{
            print("Welcome to raburi")
            //code
        }else if userInput.caseInsensitiveCompare("q") == .orderedSame {
            print("bye bye šš»\n")
            exit(0)
        } else if userInput.caseInsensitiveCompare("s") == .orderedSame {
            cart()
        } else {
            print("\nš” Please input a valid input š”\n")
            continue
        }
        break
    }
}

func cart(){
    var backpay: String = ""
    if shoppingCart.isEmpty{
        print("\nYour cart is Empty\nGo order for fulfill your card <3\n")
        main()
    }
    else {
        print("\nššš Shopping cart ššš")
        for item in shoppingCart {
            print("- \(item)")
        }
        print("\nTOTAL PRICE: \(totalPrice) IDR")
        while true{
            print("Press [B] to go back\nPress [P] to checkout your order.\nWatchuwannado?")
            backpay = readLine()!
            if backpay.caseInsensitiveCompare("B") == .orderedSame{
                main()
            } else if backpay.caseInsensitiveCompare("P") == .orderedSame{
                checkout()
            } else{
                print("please input a valid input!!\n")
                continue
            }
            break
        }
    }
}

func checkout(){
    print("\nššš Checkout ššš")
    print("TOTAL PRICE: \(totalPrice) IDR")
        
    while true {
        print("Please enter payment amount:")
        if let paymentAmount = readLine(), let amount = Double(paymentAmount) {
            if amount == 0 {
                print("your payment can not be zero\n")
            } else if amount < 0 {
                print("your payment is less than zero :) \n")
            }else if amount < totalPrice {
                print("The payment amount is less than the total price.\n")
            } else {
                let change = amount - totalPrice
                print("\nYour pay: \(amount)")
                print("Change: \(change) IDR")
                print("Thank you for shopping with us! Enjoy your meals!\n")
                shoppingCart.removeAll()
                totalPrice = 0
                main()
            }
        } else {
            print("\nInvalid input. Please enter a valid payment amount.\n")
        }
    }
}

func tukutuku(){
    var inputtuku: String = ""
    var jtahu: Int = 0
    var jnaskun: Int = 0
    var jnascam: Int = 0
    var jair: Int = 0
    var jlemper: Int = 0
    var jpoci: Int = 0
    
    while true{
        print("\nWelcome to tuku-tuku š° \nwhat would you like to order?\n\n[1] tahu isi\n[2] nasi kuning\n[3] nasi campur\n[4] air mineral\n[5] lemper\n[6] teh poci\n-\n[B]ack to main menu\nYour menu choice?")
        
        inputtuku = readLine()!
        if inputtuku == "1"{
            print("tahu isi @10k IDR \nhow many tahu isi do you want to buy?")
                if let jumtahu = readLine(), let jumtahu = Int(jumtahu) {
                    jtahu = jumtahu
                    if jtahu > 0 {
                        // Use the jumlah variable here
                        let price = Double(jtahu) * 10000
                                    print("\nšAdded \(jtahu) tahu isi to cart for \(price) IDRš \nšļøThank you for ordering šļø\n\n")
                                    shoppingCart.append((cafetaria: "tuku-tuku", order: "tahu isi \(jtahu)x"))
                                    totalPrice += price
                        tukutuku()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("š¾Please enter a positive numberš¾\n")
                    continue
                }
                break
            
        } else if inputtuku == "2"{
            print("nasi kuning @18k IDR \nhow many nasi kuning do you want to buy?")
                if let jumnaskun = readLine(), let jumnaskun = Int(jumnaskun) {
                    jnaskun = jumnaskun
                    if jnaskun > 0 {
                        // Use the jumlah variable here
                        let price = Double(jnaskun) * 18000
                                    print("\nšAdded \(jnaskun) nasi kuning to cart for \(price) IDRš \nšļøThank you for ordering šļø\n\n")
                                    shoppingCart.append("nasi kuning (\(jnaskun)) piece(s) from tuku-tuku")
                                    totalPrice += price
                        tukutuku()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("š¾Please enter a positive numberš¾\n")
                    continue
                }
                break
            
        }else if inputtuku == "3"{
            print("nasi campur @18k IDR \nhow many nasi kuning do you want to buy?")
                if let jumnascam = readLine(), let jumnascam = Int(jumnascam) {
                    jnascam = jumnascam
                    if jnascam > 0 {
                        // Use the jumlah variable here
                        let price = Double(jnascam) * 18000
                                    print("\nšAdded \(jnascam) nasi campur to cart for \(price) IDRš \nšļøThank you for ordering šļø\n\n")
                                    shoppingCart.append("nasi campur (\(jnascam)) piece(s) from tuku-tuku")
                                    totalPrice += price
                        tukutuku()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("š¾Please enter a positive numberš¾\n")
                    continue
                }
                break
            
        }else if inputtuku == "4"{
            print("air mineral @5k IDR \nhow many air mineral do you want to buy?")
                if let jumair = readLine(), let jumair = Int(jumair) {
                    jair = jumair
                    if jair > 0 {
                        // Use the jumlah variable here
                        let price = Double(jair) * 5000
                                    print("\nšAdded \(jair) air mineral to cart for \(price) IDRš \nšļøThank you for ordering šļø\n\n")
                                    shoppingCart.append("air mineral (\(jair)) piece(s) from tuku-tuku")
                                    totalPrice += price
                        tukutuku()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("š¾Please enter a positive numberš¾\n")
                    continue
                }
                break
            
        }else if inputtuku == "5"{
            print("lemper @8k IDR \nhow many lemper do you want to buy?")
                if let jumlemper = readLine(), let jumlemper = Int(jumlemper) {
                    jlemper = jumlemper
                    if jlemper > 0 {
                        // Use the jumlah variable here
                        let price = Double(jlemper) * 8000
                                    print("\nšAdded \(jlemper) lemper to cart for \(price) IDRš \nšļøThank you for ordering šļø\n\n")
                                    shoppingCart.append("lemper (\(jlemper)) piece(s) from tuku-tuku")
                                    totalPrice += price
                        tukutuku()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("š¾Please enter a positive numberš¾\n")
                    continue
                }
                break
            
        }else if inputtuku == "6"{
            print("teh poci @6k IDR \nhow many teh poci do you want to buy?")
                if let jumpoci = readLine(), let jumpoci = Int(jumpoci) {
                    jpoci = jumpoci
                    if jpoci > 0 {
                        // Use the jumlah variable here
                        let price = Double(jpoci) * 6000
                                    print("\nšAdded \(jpoci) teh poci to cart for \(price) IDRš \nšļøThank you for ordering šļø\n\n")
                                    shoppingCart.append("teh poci (\(jpoci)) piece(s) from tuku-tuku")
                                    totalPrice += price
                        tukutuku()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("š¾Please enter a positive numberš¾\n")
                    continue
                }
                break
            
            //code
        }else if inputtuku.caseInsensitiveCompare("b") == .orderedSame {
            print("back to main menu wushhhhh šš»\n")
            main()
        } else {
            print("\nš” Please input a valid input š”\n")
            continue
        }
        break
    }
}


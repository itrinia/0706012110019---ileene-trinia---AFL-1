//
//  main.swift
//  0706012110019 - ileene trinia - AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

//global variables
var shoppingCart = [String]()
var totalPrice = 0.0
main()

func main(){
    var userInput: String = ""
    
    while true{
        print("Welcome to UC-Walk cafetaria 👨🏻‍🍳👩🏻‍🍳 \nPlease choose cafetaria: \n[1] tuku-tuku \n[2] gotri \n[3] madam lie \n[4] kopte \n[5] xiangjia \n[6] raburi \n- \n[S]hopping cart \n[Q]uit")
        
        print("Your cafetaria choice?")
        userInput = readLine()!
        if userInput == "1"{
            print("Welcome to tuku-tuku")
            tukutuku()
        } else if userInput == "2"{
            print("Welcome to gotri")
            //code
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
            print("bye bye 👋🏻\n")
            exit(0)
        } else if userInput.caseInsensitiveCompare("s") == .orderedSame {
            cart()
        } else {
            print("\n😡 Please input a valid input 😡\n")
            continue
        }
        break
    }
}

func cart(){
    var backpay: String = ""
    if shoppingCart.isEmpty{
        print("Your cart is Empty\nGo order for fulfill your card <3")
        main()
    }
    else {
        print("\n🛒🛒🛒 Shopping cart 🛒🛒🛒")
        for item in shoppingCart {
            print("- \(item) piece(s)")
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
                print("please input a valid input!!")
                continue
            }
            break
        }
    }
}

func checkout(){
    
}

func tukutuku(){
    var inputtuku: String = ""
    var jtahu: Int = 0
    
    
    while true{
        print("welcome to tuku-tuku 💰 \nwhat would you like to order?\n\n[1] tahu isi\n[2] nasi kuning\n[3] nasi campur\n[4] air mineral\n[5] lemper\n[6] teh poci\n-\n[B]ack to main menu\nYour menu choice?")
        
        inputtuku = readLine()!
        if inputtuku == "1"{
            print("tahu isi @10k IDR \nhow many tahu isi do you want to buy?")
                if let jumtahu = readLine(), let jumtahu = Int(jumtahu) {
                    jtahu = jumtahu
                    if jtahu > 0 {
                        // Use the jumlah variable here
                        let price = Double(jtahu) * 10000
                                    print("\n🛒Added \(jtahu) tahu isi to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                                    shoppingCart.append("tahu isi (\(jtahu))")
                                    totalPrice += price
                        tukutuku()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("😾Please enter a positive number😾\n")
                    continue
                }
                break
        } else if inputtuku == "2"{
            print("beli nasi kuning")
            //code
        }else if inputtuku == "3"{
            print("beli nasi campur")
            //code
        }else if inputtuku == "4"{
            print("beli air mineral")
            //code
        }else if inputtuku == "5"{
            print("beli lemper")
            //code
        }else if inputtuku == "6"{
            print("beli teh poci")
            //code
        }else if inputtuku.caseInsensitiveCompare("b") == .orderedSame {
            print("back to main menu wushhhhh 🏃🏻\n")
            main()
        } else {
            print("\n😡 Please input a valid input 😡\n")
            continue
        }
        break
    }
}


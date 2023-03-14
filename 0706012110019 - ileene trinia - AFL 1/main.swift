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
        print("Welcome to UC-Walk cafetaria 👨🏻‍🍳👩🏻‍🍳 \nPlease choose cafetaria: \n[1] tuku-tuku \n[2] gotri \n[3] madam lie \n[4] kopte \n[5] xiangjia \n[6] raburi \n- \n[S]hopping cart \n[Q]uit")
        
        print("Your cafetaria choice?")
        userInput = readLine()!
        if userInput == "1"{
            tukutuku()
        } else if userInput == "2"{
            print("Welcome to gotri")
            gotri()
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
        print("\nYour cart is Empty\nGo order for fulfill your card <3\n")
        main()
    }
    else {
        print("\n🛒🛒🛒 Shopping cart 🛒🛒🛒")
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
    print("\n🛒🛒🛒 Checkout 🛒🛒🛒")
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
        print("\nWelcome to tuku-tuku 💰 \nwhat would you like to order?\n\n[1] tahu isi\n[2] nasi kuning\n[3] nasi campur\n[4] air mineral\n[5] lemper\n[6] teh poci\n-\n[B]ack to main menu\nYour menu choice?")
        
        inputtuku = readLine()!
        if inputtuku == "1"{
            print("tahu isi @10k IDR \nhow many tahu isi do you want to buy?")
                if let jumtahu = readLine(), let jumtahu = Int(jumtahu) {
                    jtahu = jumtahu
                    if jtahu > 0 {
                        // Use the jumlah variable here
                        let price = Double(jtahu) * 10000
                            print("\n🛒Added \(jtahu) tahu isi to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                            shoppingCart.append((cafetaria: "tuku-tuku", order: "tahu isi \(jtahu)x"))
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
            print("nasi kuning @18k IDR \nhow many nasi kuning do you want to buy?")
                if let jumnaskun = readLine(), let jumnaskun = Int(jumnaskun) {
                    jnaskun = jumnaskun
                    if jnaskun > 0 {
                        // Use the jumlah variable here
                        let price = Double(jnaskun) * 18000
                            print("\n🛒Added \(jnaskun) nasi kuning to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                            shoppingCart.append((cafetaria: "tuku-tuku", order: "nasi kuning \(jnaskun)x"))
                            totalPrice += price
                        tukutuku()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("😾Please enter a positive number!😾\n")
                    continue
                }
                break
            
        }else if inputtuku == "3"{
            print("nasi campur @18k IDR \nhow many nasi campur do you want to buy?")
                if let jumnascam = readLine(), let jumnascam = Int(jumnascam) {
                    jnascam = jumnascam
                    if jnascam > 0 {
                        // Use the jumlah variable here
                        let price = Double(jnascam) * 18000
                                    print("\n🛒Added \(jnascam) nasi campur to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                                    shoppingCart.append((cafetaria: "tuku-tuku", order: "nasi campur \(jnascam)x"))
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
            
        }else if inputtuku == "4"{
            print("air mineral @5k IDR \nhow many air mineral do you want to buy?")
                if let jumair = readLine(), let jumair = Int(jumair) {
                    jair = jumair
                    if jair > 0 {
                        // Use the jumlah variable here
                        let price = Double(jair) * 5000
                                    print("\n🛒Added \(jair) air mineral to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                                    shoppingCart.append((cafetaria: "tuku-tuku", order: "air mineral \(jair)x"))
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
            
        }else if inputtuku == "5"{
            print("lemper @8k IDR \nhow many lemper do you want to buy?")
                if let jumlemper = readLine(), let jumlemper = Int(jumlemper) {
                    jlemper = jumlemper
                    if jlemper > 0 {
                        // Use the jumlah variable here
                        let price = Double(jlemper) * 8000
                                    print("\n🛒Added \(jlemper) lemper to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                                    shoppingCart.append((cafetaria: "tuku-tuku", order: "lemper \(jlemper)x"))
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
            
        }else if inputtuku == "6"{
            print("teh poci @6k IDR \nhow many teh poci do you want to buy?")
                if let jumpoci = readLine(), let jumpoci = Int(jumpoci) {
                    jpoci = jumpoci
                    if jpoci > 0 {
                        // Use the jumlah variable here
                        let price = Double(jpoci) * 6000
                                    print("\n🛒Added \(jpoci) teh poci to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                                    shoppingCart.append((cafetaria: "tuku-tuku", order: "teh poci \(jnaskun)x"))
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

func gotri(){
    var inputgotri: String = ""
    var jescendol: Int = 0
    var jlanggi: Int = 0
    var jsuun: Int = 0
    var jbakar: Int = 0
    var jrendang: Int = 0
    var jtt: Int = 0
    
    while true{
        print("\nWelcome to gotri 💰 \nwhat would you like to order?\n\n[1] es cendol suji\n[2] nasi langgi\n[3] nasi campur suun\n[4] nasi bakar\n[5] nasi rendang\n[6] tahu telor\n-\n[B]ack to main menu\nYour menu choice?")
        
        inputgotri = readLine()!
        if inputgotri == "1"{
            print("es cendol suji @16.3k IDR \nhow many es cendol suji do you want to buy?")
                if let jumescendol = readLine(), let jumescendol = Int(jumescendol) {
                    jescendol = jumescendol
                    if jescendol > 0 {
                        // Use the jumlah variable here
                        let price = Double(jescendol) * 16300
                            print("\n🛒Added \(jescendol) es cendol suji to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                            shoppingCart.append((cafetaria: "gotri", order: "es cendol suji \(jescendol)x"))
                            totalPrice += price
                        gotri()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("😾Please enter a positive number😾\n")
                    continue
                }
                break
            
        } else if inputgotri == "2"{
            print("nasi langgi @27.2k IDR \nhow many nasi langgi do you want to buy?")
                if let jumlanggi = readLine(), let jumlanggi = Int(jumlanggi) {
                    jlanggi = jumlanggi
                    if jlanggi > 0 {
                        // Use the jumlah variable here
                        let price = Double(jlanggi) * 27200
                            print("\n🛒Added \(jlanggi) nasi langgi to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                            shoppingCart.append((cafetaria: "gotri", order: "nasi langgi \(jlanggi)x"))
                            totalPrice += price
                        gotri()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("😾Please enter a positive number😾\n")
                    continue
                }
                break
            
        }else if inputgotri == "3"{
            print("nasi campur suun @27.2k IDR \nhow many nasi campur suun do you want to buy?")
                if let jumsuun = readLine(), let jumsuun = Int(jumsuun) {
                    jsuun = jumsuun
                    if jsuun > 0 {
                        // Use the jumlah variable here
                        let price = Double(jsuun) * 27200
                            print("\n🛒Added \(jsuun) nasi campur suun to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                            shoppingCart.append((cafetaria: "gotri", order: "nasi campur suun \(jsuun)x"))
                            totalPrice += price
                        gotri()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("😾Please enter a positive number😾\n")
                    continue
                }
                break
            
        }else if inputgotri == "4"{
            print("nasi bakar @27.2k IDR \nhow many nasi bakar do you want to buy?")
                if let jumbakar = readLine(), let jumbakar = Int(jumbakar) {
                    jbakar = jumbakar
                    if jbakar > 0 {
                        // Use the jumlah variable here
                        let price = Double(jbakar) * 27200
                                    print("\n🛒Added \(jbakar) nasi bakar to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                                    shoppingCart.append((cafetaria: "gotri", order: "nasi bakar \(jbakar)x"))
                                    totalPrice += price
                        gotri()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("😾Please enter a positive number😾\n")
                    continue
                }
                break
            
        }else if inputgotri == "5"{
            print("nasi ayam rendang @20k IDR \nhow many nasi ayam rendang do you want to buy?")
                if let jumrendang = readLine(), let jumrendang = Int(jumrendang) {
                    jrendang = jumrendang
                    if jrendang > 0 {
                        // Use the jumlah variable here
                        let price = Double(jrendang) * 20000
                                    print("\n🛒Added \(jrendang) nasi ayam rendang to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                                    shoppingCart.append((cafetaria: "gotri", order: "nasi ayam rendang \(jrendang)x"))
                                    totalPrice += price
                        gotri()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("😾Please enter a positive number😾\n")
                    continue
                }
                break
            
        }else if inputgotri == "6"{
            print("tahu telor @19k IDR \nhow many tahu telor do you want to buy?")
                if let jumtt = readLine(), let jumtt = Int(jumtt) {
                    jtt = jumtt
                    if jtt > 0 {
                        // Use the jumlah variable here
                        let price = Double(jtt) * 19000
                                    print("\n🛒Added \(jumtt) tahu telor to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                                    shoppingCart.append((cafetaria: "gotri", order: "tahu telor \(jtt)x"))
                                    totalPrice += price
                        gotri()
                    } else {
                        print("Please enter a positive number")
                        continue
                    }
                } else {
                    print("😾Please enter a positive number😾\n")
                    continue
                }
                break
            
            //code
        }else if inputgotri.caseInsensitiveCompare("b") == .orderedSame {
            print("back to main menu wushhhhh 🏃🏻\n")
            main()
        } else {
            print("\n😡 Please input a valid input 😡\n")
            continue
        }
        break
    }
}


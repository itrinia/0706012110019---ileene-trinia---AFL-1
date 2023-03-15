//
//  main.swift
//  0706012110019 - ileene trinia - AFL 1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

//global variables
var shoppingCart: [String: [ String: (price: Int, amount: Int) ]] = [:]

main()

func addItemToCart(cafeteria: String, order: String, price: Int, amount: Int) {
    
    // set the cafeteria if it doesnt exist
    if shoppingCart[cafeteria] == nil {
        shoppingCart[cafeteria] = [:]
    }
    
    // set the product if it doesn't exist
    if shoppingCart[cafeteria]![order] == nil {
        shoppingCart[cafeteria]![order] = (
            price: price,
            amount: 0
        )
    }
    
    // finally, add the amount
    shoppingCart[cafeteria]![order]! = (
        price: price,
        amount: shoppingCart[cafeteria]![order]!.amount + amount
    )
}

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
            printShoppingCart()
        } else {
            print("\n😡 Please input a valid input 😡\n")
            continue
        }
        break
    }
}



func printShoppingCart() {
    
    var total = 0
    
    if shoppingCart.isEmpty {
        print("\nYou did not buy any item yet! Hit return to go back.")
        let _ = readLine()
        main()
    }
    shoppingCart.forEach({ (shop, shopCart) in
        print("\n🛒Your order in \(shop): ")
        
        shopCart.forEach({ (item, data) in
            total += data.amount * data.price
            print("- \(item) \(data.amount)x")
        })
        
    })
    //
    //    print("Total: \(total) IDR")
    
    print("\ndo you want to check out or no?\n[C]heckout\n[B]ack")
    var inputcart: String = ""
    while true{
        inputcart = readLine()!
        if inputcart.caseInsensitiveCompare("C") == .orderedSame{
            checkout(total: total)
        } else if inputcart.caseInsensitiveCompare("b") == .orderedSame{
            main()
        } else {
            print("\n😡 Please input a valid input 😡\n")
            continue
        }
        break
    }
}

func checkout(total: Int){
    print("\n🛒🛒🛒 Checkout 🛒🛒🛒")
    print("TOTAL PRICE: \(total) IDR")
    
    while true {
        print("Please enter payment amount:")
        if let paymentAmount = readLine(), let amount = Int(paymentAmount) {
            if amount == 0 {
                print("your payment can not be zero\n")
            } else if amount < 0 {
                print("your payment is less than zero :) \n")
            }else if amount < total {
                print("The payment amount is less than the total price.\n")
            } else {
                let change = amount - total
                print("\nYour pay: \(amount)")
                print("Change: \(change) IDR")
                print("Thank you for shopping with us! Enjoy your meals!\n")
                shoppingCart.removeAll()
                main()
            }
        } else {
            print("\nInvalid input. Please enter a valid payment amount.\n")
        }
    }
}

func tukutuku(){
    let product_tukutuku = [
        (ID: 1, name: "Nasi Kuning", price: 1),
        (ID: 2, name: "Nasi Campur", price: 1),
        (ID: 3, name: "Air Mineral", price: 1),
        (ID: 4, name: "Lemper", price: 1),
        (ID: 5, name: "Teh Poci", price: 1),
    ]
    
    var productSelected: (ID: Int, name: String, price: Int)? = nil
    
    print("\nWelcome to tuku-tuku 💰 \nwhat would you like to order?\n")
    product_tukutuku.forEach({ product in
        print("[\(product.ID)] \(product.name)")
    })
    
    print("[B]ack to main menu")
    print("Your choice? ")
    
    while true {
        let inputtuku = readLine()
        
        if inputtuku == nil {
            // if the person does not tuku a product, display error
            print("\n😡 Please input a valid input 😡\n")
        } else {
            if inputtuku!.lowercased() == "b" {
                main()
            }
            
            productSelected = product_tukutuku.first(where: { $0.ID == Int(inputtuku!) ?? 0 })
            
            if (productSelected == nil) {
                print("😾Please enter a product that exist!😾\n")
            } else {
                break
            }
        }
    }
    
    while true {
        print("\(productSelected!.name) @\(productSelected!.price) IDR \nhow many \(productSelected!.name) do you want to buy?")
        let tukuItemCount = Int(readLine() ?? "")
        
        if tukuItemCount == nil {
            print("please input a valid count!")
        } else {
            if tukuItemCount! <= 0 {
                print("Please enter a positive number")
            } else {
                let total = tukuItemCount! * productSelected!.price
                addItemToCart(cafeteria: "Tuku-Tuku", order: productSelected!.name, price: productSelected!.price, amount: tukuItemCount!)
                print("\n🛒Added \(productSelected!.name) tahu isi to cart for \(total) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                main()
            }
        }
    }
}

func gotri(){
    //    var inputgotri: String = ""
    //    var jescendol: Int = 0
    //    var jlanggi: Int = 0
    //    var jsuun: Int = 0
    //    var jbakar: Int = 0
    //    var jrendang: Int = 0
    //    var jtt: Int = 0
    //
    //    while true{
    //        print("\nWelcome to gotri 💰 \nwhat would you like to order?\n\n[1] es cendol suji\n[2] nasi langgi\n[3] nasi campur suun\n[4] nasi bakar\n[5] nasi rendang\n[6] tahu telor\n-\n[B]ack to main menu\nYour menu choice?")
    //
    //        inputgotri = readLine()!
    //        if inputgotri == "1"{
    //            print("es cendol suji @16.3k IDR \nhow many es cendol suji do you want to buy?")
    //            if let jumescendol = readLine(), let jumescendol = Int(jumescendol) {
    //                jescendol = jumescendol
    //                if jescendol > 0 {
    //                    // Use the jumlah variable here
    //                    let price = Double(jescendol) * 16300
    //                    print("\n🛒Added \(jescendol) es cendol suji to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
    //                    addItemToCart(cafeteria: "gotri", order: "es cendol suji")
    //                    totalPrice += price
    //                    gotri()
    //                } else {
    //                    print("Please enter a positive number")
    //                    continue
    //                }
    //            } else {
    //                print("😾Please enter a positive number😾\n")
    //                continue
    //            }
    //            break
    //
    //        } else if inputgotri == "2"{
    //            print("nasi langgi @27.2k IDR \nhow many nasi langgi do you want to buy?")
    //            if let jumlanggi = readLine(), let jumlanggi = Int(jumlanggi) {
    //                jlanggi = jumlanggi
    //                if jlanggi > 0 {
    //                    // Use the jumlah variable here
    //                    let price = Double(jlanggi) * 27200
    //                    print("\n🛒Added \(jlanggi) nasi langgi to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
    //                    addItemToCart(cafeteria: "gotri", order: "nasi langgi")
    //                    totalPrice += price
    //                    gotri()
    //                } else {
    //                    print("Please enter a positive number")
    //                    continue
    //                }
    //            } else {
    //                print("😾Please enter a positive number😾\n")
    //                continue
    //            }
    //            break
    //
    //        }else if inputgotri == "3"{
    //            print("nasi campur suun @27.2k IDR \nhow many nasi campur suun do you want to buy?")
    //            if let jumsuun = readLine(), let jumsuun = Int(jumsuun) {
    //                jsuun = jumsuun
    //                if jsuun > 0 {
    //                    // Use the jumlah variable here
    //                    let price = Double(jsuun) * 27200
    //                    print("\n🛒Added \(jsuun) nasi campur suun to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
    //                    addItemToCart(cafeteria: "gotri", order: "nasi campur suun")
    //                    totalPrice += price
    //                    gotri()
    //                } else {
    //                    print("Please enter a positive number")
    //                    continue
    //                }
    //            } else {
    //                print("😾Please enter a positive number😾\n")
    //                continue
    //            }
    //            break
    //
    //        }else if inputgotri == "4"{
    //            print("nasi bakar @27.2k IDR \nhow many nasi bakar do you want to buy?")
    //            if let jumbakar = readLine(), let jumbakar = Int(jumbakar) {
    //                jbakar = jumbakar
    //                if jbakar > 0 {
    //                    // Use the jumlah variable here
    //                    let price = Double(jbakar) * 27200
    //                    print("\n🛒Added \(jbakar) nasi bakar to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
    //                    addItemToCart(cafeteria: "gotri", order: "nasi bakar")
    //                    totalPrice += price
    //                    gotri()
    //                } else {
    //                    print("Please enter a positive number")
    //                    continue
    //                }
    //            } else {
    //                print("😾Please enter a positive number😾\n")
    //                continue
    //            }
    //            break
    //
    //        }else if inputgotri == "5"{
    //            print("nasi ayam rendang @20k IDR \nhow many nasi ayam rendang do you want to buy?")
    //            if let jumrendang = readLine(), let jumrendang = Int(jumrendang) {
    //                jrendang = jumrendang
    //                if jrendang > 0 {
    //                    // Use the jumlah variable here
    //                    let price = Double(jrendang) * 20000
    //                    print("\n🛒Added \(jrendang) nasi ayam rendang to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
    //                    addItemToCart(cafeteria: "gotri", order: "nasi ayam rendang")
    //                    totalPrice += price
    //                    gotri()
    //                } else {
    //                    print("Please enter a positive number")
    //                    continue
    //                }
    //            } else {
    //                print("😾Please enter a positive number😾\n")
    //                continue
    //            }
    //            break
    //
    //        }else if inputgotri == "6"{
    //            print("tahu telor @19k IDR \nhow many tahu telor do you want to buy?")
    //            if let jumtt = readLine(), let jumtt = Int(jumtt) {
    //                jtt = jumtt
    //                if jtt > 0 {
    //                    // Use the jumlah variable here
    //                    let price = Double(jtt) * 19000
    //                    print("\n🛒Added \(jumtt) tahu telor to cart for \(price) IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
    //                    addItemToCart(cafeteria: "gotri", order: "es cendol suji")
    //                    totalPrice += price
    //                    gotri()
    //                } else {
    //                    print("Please enter a positive number")
    //                    continue
    //                }
    //            } else {
    //                print("😾Please enter a positive number😾\n")
    //                continue
    //            }
    //            break
    //
    //            //code
    //        }else if inputgotri.caseInsensitiveCompare("b") == .orderedSame {
    //            print("back to main menu wushhhhh 🏃🏻\n")
    //            main()
    //        } else {
    //            print("\n😡 Please input a valid input 😡\n")
    //            continue
    //        }
    //        break
    //    }
}


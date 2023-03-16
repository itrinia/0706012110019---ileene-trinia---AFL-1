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
    print("TOTAL PRICE: \(total)k IDR")
    
    while true {
        print("Please enter payment amount: \n[Please enter without 000]")
        if let paymentAmount = readLine(), let amount = Int(paymentAmount) {
            if amount == 0 {
                print("your payment can not be zero\n")
            } else if amount < 0 {
                print("your payment is less than zero :) \n")
            }else if amount < total {
                print("The payment amount is less than the total price.\n")
            } else {
                let change = amount - total
                print("\nYour pay: \(amount)k IDR")
                print("Change: \(change)k IDR")
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
        (ID: 1, name: "Nasi Kuning", price: 20),
        (ID: 2, name: "Nasi Campur", price: 18),
        (ID: 3, name: "Air Mineral", price: 4),
        (ID: 4, name: "Lemper", price: 8),
        (ID: 5, name: "Teh Poci", price: 5),
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
        print("\(productSelected!.name) @\(productSelected!.price)k IDR \nhow many \(productSelected!.name) do you want to buy?")
        let tukuItemCount = Int(readLine() ?? "")
        
        if tukuItemCount == nil {
            print("please input a valid count!")
        } else {
            if tukuItemCount! <= 0 {
                print("Please enter a positive number")
            } else {
                let total = tukuItemCount! * productSelected!.price
                addItemToCart(cafeteria: "Tuku-Tuku", order: productSelected!.name, price: productSelected!.price, amount: tukuItemCount!)
                print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                main()
            }
        }
    }
}

func gotri(){
    let product_gotri = [
        (ID: 1, name: "Es Cendol Suji", price: 17),
        (ID: 2, name: "Nasi Campur Suun", price: 28),
        (ID: 3, name: "Nasi Langgi", price: 28),
        (ID: 4, name: "Nasi Ayam Rendang", price: 20),
        (ID: 5, name: "Tahu Telor", price: 20),
    ]
    
    var productSelected: (ID: Int, name: String, price: Int)? = nil
    
    print("\nWelcome to Gotri 💰 \nwhat would you like to order?\n")
    product_gotri.forEach({ product in
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
            
            productSelected = product_gotri.first(where: { $0.ID == Int(inputtuku!) ?? 0 })
            
            if (productSelected == nil) {
                print("😾Please enter a product that exist!😾\n")
            } else {
                break
            }
        }
    }
    
    while true {
        print("\(productSelected!.name) @\(productSelected!.price)k IDR \nhow many \(productSelected!.name) do you want to buy?")
        let tukuItemCount = Int(readLine() ?? "")
        
        if tukuItemCount == nil {
            print("please input a valid count!")
        } else {
            if tukuItemCount! <= 0 {
                print("Please enter a positive number")
            } else {
                let total = tukuItemCount! * productSelected!.price
                addItemToCart(cafeteria: "Gotri", order: productSelected!.name, price: productSelected!.price, amount: tukuItemCount!)
                print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                main()
            }
        }
    }
}


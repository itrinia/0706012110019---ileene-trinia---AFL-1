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
            madamlie()
        }else if userInput == "4"{
            print("Welcome to kopte")
            kopte()
        }else if userInput == "5"{
            print("Welcome to xiangjia")
            xiangjia()
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
        print("\nYou did not buy any item yet! Press 'return' to go back.")
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
        let inputbuy = readLine()
        
        if inputbuy == nil {
            // if the person does not tuku a product, display error
            print("\n😡 Please input a valid input 😡\n")
        } else {
            if inputbuy!.lowercased() == "b" {
                main()
            }
            
            productSelected = product_tukutuku.first(where: { $0.ID == Int(inputbuy!) ?? 0 })
            
            if (productSelected == nil) {
                print("😾Please enter a product that exist!😾\n")
            } else {
                break
            }
        }
    }
    
    while true {
        print("\(productSelected!.name) @\(productSelected!.price)k IDR \nhow many \(productSelected!.name) do you want to buy?")
        let buyItemCount = Int(readLine() ?? "")
        
        if buyItemCount == nil {
            print("please input a valid count!")
        } else {
            if buyItemCount! <= 0 {
                print("Please enter a positive number")
            } else {
                let total = buyItemCount! * productSelected!.price
                addItemToCart(cafeteria: "Tuku-Tuku", order: productSelected!.name, price: productSelected!.price, amount: buyItemCount!)
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
        let inputbuy = readLine()
        
        if inputbuy == nil {
            // if the person does not tuku a product, display error
            print("\n😡 Please input a valid input 😡\n")
        } else {
            if inputbuy!.lowercased() == "b" {
                main()
            }
            
            productSelected = product_gotri.first(where: { $0.ID == Int(inputbuy!) ?? 0 })
            
            if (productSelected == nil) {
                print("😾Please enter a product that exist!😾\n")
            } else {
                break
            }
        }
    }
    
    while true {
        print("\(productSelected!.name) @\(productSelected!.price)k IDR \nhow many \(productSelected!.name) do you want to buy?")
        let buyItemCount = Int(readLine() ?? "")
        
        if buyItemCount == nil {
            print("please input a valid count!")
        } else {
            if buyItemCount! <= 0 {
                print("Please enter a positive number")
            } else {
                let total = buyItemCount! * productSelected!.price
                addItemToCart(cafeteria: "Gotri", order: productSelected!.name, price: productSelected!.price, amount: buyItemCount!)
                print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                main()
            }
        }
    }
}

func madamlie(){
    let product_madamlie = [
        (ID: 1, name: "Nasi ayam geprek", price: 25),
        (ID: 2, name: "Nasi ayam geprek mozarella", price: 30),
        (ID: 3, name: "Nasi ayam geprek + 3T (tahu telor tempe)", price: 28),
        (ID: 4, name: "Nasi Ayam bakar geprek", price: 25),
        (ID: 5, name: "nasi ayam goreng telor", price: 22),
    ]
    
    var productSelected: (ID: Int, name: String, price: Int)? = nil
    
    print("\nWelcome to Madam Lie 👩🏻‍🍳 \nwhat would you like to order?\n")
    product_madamlie.forEach({ product in
        print("[\(product.ID)] \(product.name)")
    })
    
    print("[B]ack to main menu")
    print("Your choice? ")
    
    while true {
        let inputbuy = readLine()
        
        if inputbuy == nil {
            // if the person does not tuku a product, display error
            print("\n😡 Please input a valid input 😡\n")
        } else {
            if inputbuy!.lowercased() == "b" {
                main()
            }
            
            productSelected = product_madamlie.first(where: { $0.ID == Int(inputbuy!) ?? 0 })
            
            if (productSelected == nil) {
                print("😾Please enter a product that exist!😾\n")
            } else {
                break
            }
        }
    }
    
    while true {
        print("\(productSelected!.name) @\(productSelected!.price)k IDR \nhow many \(productSelected!.name) do you want to buy?")
        let buyItemCount = Int(readLine() ?? "")
        
        if buyItemCount == nil {
            print("please input a valid count!")
        } else {
            if buyItemCount! <= 0 {
                print("Please enter a positive number")
            } else {
                let total = buyItemCount! * productSelected!.price
                addItemToCart(cafeteria: "Madam Lie", order: productSelected!.name, price: productSelected!.price, amount: buyItemCount!)
                print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                main()
            }
        }
    }
}

func kopte(){
    let product_kopte = [
        (ID: 1, name: "kopi tarik kopte", price: 12),
        (ID: 2, name: "kopi tarik cincau", price: 14),
        (ID: 3, name: "kopi teh tarik", price: 13),
        (ID: 4, name: "kopi coklat tarik", price: 13),
        (ID: 5, name: "kopi hitam manis", price: 10),
        (ID: 6, name: "kopi hitam", price: 8),
        (ID: 7, name: "teh tarik kopte", price: 12),
        (ID: 8, name: "teh tarik cincau", price: 14),
        (ID: 9, name: "teh jeruk nipis", price: 12),
        (ID: 10, name: "teh manis", price: 10),
        (ID: 11, name: "teh tawar", price: 8),
        (ID: 12, name: "coklat tarik kopte", price: 12),
    ]
    
    var productSelected: (ID: Int, name: String, price: Int)? = nil
    
    print("\nWelcome to Kopte 👩🏻‍🍳 \nwhat would you like to order?\n")
    product_kopte.forEach({ product in
        print("[\(product.ID)] \(product.name)")
    })
    
    print("[B]ack to main menu")
    print("Your choice? ")
    
    while true {
        let inputbuy = readLine()
        
        if inputbuy == nil {
            // if the person does not tuku a product, display error
            print("\n😡 Please input a valid input 😡\n")
        } else {
            if inputbuy!.lowercased() == "b" {
                main()
            }
            
            productSelected = product_kopte.first(where: { $0.ID == Int(inputbuy!) ?? 0 })
            
            if (productSelected == nil) {
                print("😾Please enter a product that exist!😾\n")
            } else {
                break
            }
        }
    }
    
    while true {
        print("\(productSelected!.name) @\(productSelected!.price)k IDR \nhow many \(productSelected!.name) do you want to buy?")
        let buyItemCount = Int(readLine() ?? "")
        
        if buyItemCount == nil {
            print("please input a valid count!")
        } else {
            if buyItemCount! <= 0 {
                print("Please enter a positive number")
            } else {
                let total = buyItemCount! * productSelected!.price
                addItemToCart(cafeteria: "Kopte", order: productSelected!.name, price: productSelected!.price, amount: buyItemCount!)
                print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                main()
            }
        }
    }
}

func xiangjia(){
    let product_xiangjia = [
        (ID: 1, name: "kaya toast", price: 12),
        (ID: 2, name: "kacang kowa", price: 15),
        (ID: 3, name: "telur setengah matang", price: 12),
        (ID: 4, name: "kaya toast butter", price: 15),
        (ID: 5, name: "mie kosong selat panjang", price: 25),
        (ID: 6, name: "mie ayam kobe", price: 25),
        (ID: 7, name: "mie hijau", price: 25),
        (ID: 8, name: "nasi hainan", price: 30),
        (ID: 9, name: "bubur polos", price: 15),
        (ID: 10, name: "bubur ayam/bubur abon", price: 25),
        (ID: 11, name: "es kopi kosong", price: 12),
        (ID: 12, name: "es teh tarik", price: 14),
        (ID: 13, name: "es milo malay", price: 14),
        (ID: 14, name: "susu jahe hangat", price: 12),
        (ID: 15, name: "es teh O", price: 7),
    ]
    
    var productSelected: (ID: Int, name: String, price: Int)? = nil
    
    print("\nWelcome to XiangJia 👩🏻‍🍳 \nwhat would you like to order?\n")
    product_xiangjia.forEach({ product in
        print("[\(product.ID)] \(product.name)")
    })
    
    print("[B]ack to main menu")
    print("Your choice? ")
    
    while true {
        let inputbuy = readLine()
        
        if inputbuy == nil {
            // if the person does not tuku a product, display error
            print("\n😡 Please input a valid input 😡\n")
        } else {
            if inputbuy!.lowercased() == "b" {
                main()
            }
            
            productSelected = product_xiangjia.first(where: { $0.ID == Int(inputbuy!) ?? 0 })
            
            if (productSelected == nil) {
                print("😾Please enter a product that exist!😾\n")
            } else {
                break
            }
        }
    }
    
    while true {
        print("\(productSelected!.name) @\(productSelected!.price)k IDR \nhow many \(productSelected!.name) do you want to buy?")
        let buyItemCount = Int(readLine() ?? "")
        
        if buyItemCount == nil {
            print("please input a valid count!")
        } else {
            if buyItemCount! <= 0 {
                print("Please enter a positive number")
            } else {
                let total = buyItemCount! * productSelected!.price
                addItemToCart(cafeteria: "XiangJia", order: productSelected!.name, price: productSelected!.price, amount: buyItemCount!)
                print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                main()
            }
        }
    }
}



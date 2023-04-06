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
            let tukutukuInstance = tukutuku()
            tukutukuInstance.enter()
        } else if userInput == "2"{
            let gotrii = gotri()
            gotrii.enter()
        }else if userInput == "3"{
            let madamliee = madamlie()
            madamliee.enter()
        }else if userInput == "4"{
            let koptee = kopte()
            koptee.enter()
        }else if userInput == "5"{
            let xiangjiaa = xiangjia()
            xiangjiaa.enter()
        }else if userInput == "6"{
            let raburii = raburi()
            raburii.enter()
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
        print("\nYour order in \(shop): ")
        
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

struct Product {
    let id: Int
    let name: String
    let price: Int
}

protocol Cafeteria {
    var name: String { get }
    var menu: [Product] { get }
    func welcome()
    func selectItem(itemID: Int) -> Product?
}

class BaseCafeteria: Cafeteria {
    let name: String
    let menu: [Product]
    
    init(name: String, menu: [Product]) {
        self.name = name
        self.menu = menu
    }
    
    func welcome() {
        print("Welcome to \(name)👍")
        print("Menu:")
        for product in menu {
            print("\(product.id). \(product.name) (\(product.price)k IDR)")
        }
    }
    
    func selectItem(itemID: Int) -> Product? {
        return menu.first(where: { $0.id == itemID })
    }
}

class tukutuku: BaseCafeteria {
    init() {
        let menu = [
            Product(id: 1, name: "Nasi Kuning", price: 20),
            Product(id: 2, name: "Nasi Campur", price: 18),
            Product(id: 3, name: "Air Mineral", price: 4),
            Product(id: 4, name: "Lemper", price: 8),
            Product(id: 5, name: "Teh Poci", price: 5)
        ]
        super.init(name: "Tuku Tuku", menu: menu)
    }
    func enter() {
        var productSelected: Product? = nil
        
        print("\nWelcome to \(name) 💰 \nwhat would you like to order?\n")
        menu.forEach({ product in
            print("[\(product.id)] \(product.name)")
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
                
                productSelected = menu.first(where: { $0.id == Int(inputbuy!) ?? 0 })
                
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
                    addItemToCart(cafeteria: name, order: productSelected!.name, price: productSelected!.price, amount: buyItemCount!)
                    print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                    main()
                }
            }
        }
    }
}

class gotri: BaseCafeteria {
    init() {
        let menu = [
            Product(id: 1, name: "Es Cendol Suji", price: 17),
            Product(id: 2, name: "Nasi Campur Suun", price: 28),
            Product(id: 3, name: "Nasi langgi", price: 28),
            Product(id: 4, name: "Nasi Ayam Rendang", price: 20),
            Product(id: 5, name: "Tahu Telor", price: 20)
        ]
        super.init(name: "Gotri", menu: menu)
    }
    func enter() {
        var productSelected: Product? = nil
        
        print("\nWelcome to \(name) 💰 \nwhat would you like to order?\n")
        menu.forEach({ product in
            print("[\(product.id)] \(product.name)")
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
                
                productSelected = menu.first(where: { $0.id == Int(inputbuy!) ?? 0 })
                
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
                    addItemToCart(cafeteria: name, order: productSelected!.name, price: productSelected!.price, amount: buyItemCount!)
                    print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                    main()
                }
            }
        }
    }
}

class madamlie: BaseCafeteria {
    init() {
        let menu = [
            Product(id: 1, name: "Nasi ayam geprek", price: 25),
            Product(id: 2, name: "Nasi ayam geprek mozarella", price: 30),
            Product(id: 3, name: "Nasi ayam geprek + 3T (tahu telor tempe)", price: 28),
            Product(id: 4, name: "Nasi Ayam bakar geprek", price: 25),
            Product(id: 5, name: "Nasi ayam goreng telor", price: 22)
        ]
        super.init(name: "Madamlie", menu: menu)
    }
    func enter() {
        var productSelected: Product? = nil
        
        print("\nWelcome to \(name) 💰 \nwhat would you like to order?\n")
        menu.forEach({ product in
            print("[\(product.id)] \(product.name)")
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
                
                productSelected = menu.first(where: { $0.id == Int(inputbuy!) ?? 0 })
                
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
                    addItemToCart(cafeteria: name, order: productSelected!.name, price: productSelected!.price, amount: buyItemCount!)
                    print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                    main()
                }
            }
        }
    }
}

class kopte: BaseCafeteria {
    init() {
        let menu = [
            Product(id: 1, name: "kopi tarik kopte", price: 12),
            Product(id: 2, name: "kopi tarik cincau", price: 14),
            Product(id: 3, name: "kopi teh tarik", price: 13),
            Product(id: 4, name: "kopi coklat tarik", price: 13),
            Product(id: 5, name: "kopi hitam manis", price: 10),
            Product(id: 6, name: "kopi hitam", price: 8),
            Product(id: 7, name: "teh tarik kopte", price: 12),
            Product(id: 8, name: "teh tarik cincau", price: 14),
            Product(id: 9, name: "kopi hitam manis", price: 10),
            Product(id: 10, name: "teh manis", price: 10),
            Product(id: 11, name: "teh tawar", price: 8),
            Product(id: 12, name: "coklat tarik kopte", price: 12),
        ]
        super.init(name: "Kopte", menu: menu)
    }
    func enter() {
        var productSelected: Product? = nil
        
        print("\nWelcome to \(name) 💰 \nwhat would you like to order?\n")
        menu.forEach({ product in
            print("[\(product.id)] \(product.name)")
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
                
                productSelected = menu.first(where: { $0.id == Int(inputbuy!) ?? 0 })
                
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
                    addItemToCart(cafeteria: name, order: productSelected!.name, price: productSelected!.price, amount: buyItemCount!)
                    print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                    main()
                }
            }
        }
    }
}

class xiangjia: BaseCafeteria {
    init() {
        let menu = [
            Product(id: 1, name: "kaya toast", price: 12),
            Product(id: 2, name: "kacang kowa", price: 15),
            Product(id: 3, name: "telur setengah matang", price: 12),
            Product(id: 4, name: "kaya toast butter", price: 15),
            Product(id: 5, name: "mie kosong selat panjang", price: 25),
            Product(id: 6, name: "mie ayam kobe", price: 25),
            Product(id: 7, name: "mie hijau", price: 25),
            Product(id: 8, name: "nasi hainan", price: 30),
            Product(id: 9, name: "bubur polos", price: 15),
            Product(id: 11, name: "es kopi kosong", price: 12),
            Product(id: 12, name: "es teh tarik", price: 14),
            Product(id: 13, name: "es milo malay", price: 14),
            Product(id: 14, name: "susu jahe hangat", price: 12),
            Product(id: 10, name: "bubur ayam/bubur abon", price: 25),
            Product(id: 15, name: "es teh O", price: 7),
        ]
        super.init(name: "xiangjia", menu: menu)
    }
    func enter() {
        var productSelected: Product? = nil
        
        print("\nWelcome to \(name) 💰 \nwhat would you like to order?\n")
        menu.forEach({ product in
            print("[\(product.id)] \(product.name)")
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
                
                productSelected = menu.first(where: { $0.id == Int(inputbuy!) ?? 0 })
                
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
                    addItemToCart(cafeteria: name, order: productSelected!.name, price: productSelected!.price, amount: buyItemCount!)
                    print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                    main()
                }
            }
        }
    }
}

class raburi: BaseCafeteria {
    init() {
        let menu = [
            Product(id: 1, name: "Ramen Yakiniku Chicken Soup", price: 35),
            Product(id: 2, name: "Ramen Katsu Chicken Soup", price:32),
            Product(id: 3, name: "Ramen Teriyaki Chicken Soup", price: 32),
            Product(id: 4, name: "Ramen Yakiniku Shrimp Soup", price: 38),
            Product(id: 5, name: "Ramen Katsu Shrimp Soup", price: 35),
            Product(id: 6, name: "Ramen Teriyaki Shrimp Soup", price: 35),
            Product(id: 7, name: "Nasi Ayam Katsu", price: 35)
        ]
        super.init(name: "raburi", menu: menu)
    }
    func enter() {
        var productSelected: Product? = nil
        
        print("\nWelcome to \(name) 💰 \nwhat would you like to order?\n")
        menu.forEach({ product in
            print("[\(product.id)] \(product.name)")
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
                
                productSelected = menu.first(where: { $0.id == Int(inputbuy!) ?? 0 })
                
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
                    addItemToCart(cafeteria: name, order: productSelected!.name, price: productSelected!.price, amount: buyItemCount!)
                    print("\n🛒Added \(productSelected!.name) to cart for \(total)K IDR🛒 \n🛍️Thank you for ordering 🛍️\n\n")
                    main()
                }
            }
        }
    }
}

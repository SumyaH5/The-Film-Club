//
//  SwiftTwoView.swift
//  Le Art
//
//  Created by Sumya Hoque on 11/7/22.
//

import SwiftUI

struct SwiftTwoView: View {
    @State private var showingSheet = false
    var lottaFoods = ["Rice", "Pancakes", "Burger", "Pizza", "Pumpkin Pie", "Chicken Pot Pie", "Banofee", "Apple Pie", "Bagel", "Turkey Sandwich", "Barbecue Ribs", "Banana Split", "Chicken and Waffles", "Ice Cream Sandwich", "Biryani", "Mansaf", "Bhorta", "Tacos", "Ramen", "Tteokbokki", "Mochi", "Poutine", "Grilled Cheese", "Brownies", "Blondies", "Cheesecake", "Pop Tarts", "Blueberry Muffins", "Lollipops", "Heath Bar", "Biscuits", "Jello", "Macaroni", "Takis", "Cheetos", "Doritos", "Tostitos", "Tuna Melts", "Pastrami", "Doi", "Peeps", "Freak Shake", "Pudding", "Donuts", "Gummy Worms", "Toblerone", "Oatmeal Raisin", "Chocolate Chip", "Samoa", "Thin Mint", "Twix", "KitKat", "Bueno", "Mars", "MikyWay", "Cadbury", "Hershey", "Sashimi", "Takoyaki", "Red Bean", "Matcha", "Boba", "Pinkity Drinkity", "Fish Fillet", "Omurice", "Mug Cake", "Cake Pop", "Oreo", "McFlurry", "Streudel", "Chicken Wings", "Garlic Knots", "Mash Potatoes", "Sausage", "Funnel Cake", "Sundae", "Jalebi", "Samosa ", "Hush Puppies", "Jambalaya", "Seafood boil", "Grits", "Baklava", "Knafa", "Falooda", "Kulfi", "Lasagna", "Tiramisu", "Pesto", "Butter Chicken", "Naan", "Hot Honey", "Whipped Butter", "Guacamole", "Empanada", "Tamale", "Dulce De Leche", "Gyro", "Beef Wellington", "Pickles"]
    var body: some View {
    
            ScrollView
            {
                LazyVStack(alignment: .leading)
                {
                    Text("Title").padding()
                    ForEach(0..<100) { i in
                        HStack
                        {
                            Button {
                                showingSheet.toggle()
                            } label: {
                                ZStack
                                {
                                    Rectangle()
                                        .foregroundColor(Color.lavendar)
                                        .frame(width: 175, height: 100)
                                    Image("Icon").resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                }
                                
                                Text("Lorem ipsum dolor sit amet | \(lottaFoods[i])").foregroundColor(Color.white).multilineTextAlignment(.leading)
                            }.sheet(isPresented: $showingSheet) {
                               SwiftThreeView().preferredColorScheme(.dark)
                            }
                        }.padding(.horizontal)
                    }
                }
            }
        
        
    }
}

struct SwiftTwoView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftTwoView().preferredColorScheme(.dark)
    }
}

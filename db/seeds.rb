Mix.destroy_all
Snack.destroy_all
Ingredient.destroy_all
User.destroy_all

users = [
    {name: "Dave", password: "password123", username: "DavesDadSnacks"},
    {name: "Josh", password: "password321", username: "JoshsJonsingTreats"},
    {name: "Lexie", password: "123drowssap", username: "LexiesLemonLogs"},
    {name: "Cindi", password: "321drowssap", username: "CindisCinnamonSnacks"}
  ]

ingredients = [
  {name: "salt", type_of_ingredient: "salty"},
  {name: "pretzels", type_of_ingredient: "salty"},
  {name: "roasted almonds", type_of_ingredient: "salty"},
  {name: "roasted cashews", type_of_ingredient: "salty"},
  {name: "roasted peanuts", type_of_ingredient: "salty"},
  {name: "pepitas", type_of_ingredient: "salty"},
  {name: "sunflower seeds", type_of_ingredient: "salty"},
  {name: "wasabi peas", type_of_ingredient: "salty"},
  {name: "rye chips", type_of_ingredient: "salty"},
  {name: "bagel chips", type_of_ingredient: "salty"},
  {name: "cinnamon", type_of_ingredient: "sweet"},
  {name: "twix", type_of_ingredient: "sweet"},
  {name: "sugar", type_of_ingredient: "sweet"},
  {name: "twix", type_of_ingredient: "sweet"},
  {name: "raisins", type_of_ingredient: "sweet"},
  {name: "dried apricots", type_of_ingredient: "sweet"},
  {name: "dried apples", type_of_ingredient: "sweet"},
  {name: "dried pineapple", type_of_ingredient: "sweet"},
  {name: "dried cherries", type_of_ingredient: "sweet"},
  {name: "candied orange peel", type_of_ingredient: "sweet"},
  {name: "candied lemon peel", type_of_ingredient: "sweet"},
  {name: "banana chips", type_of_ingredient: "sweet"},
  {name: "chocolate chips", type_of_ingredient: "sweet"},
  {name: "chocolate covered almonds", type_of_ingredient: "sweet"},
  {name: "chocolate covered cashews", type_of_ingredient: "sweet"},
  {name: "chocolate covered peanuts", type_of_ingredient: "sweet"}
]
usersObj = users.collect do |user|
    User.create(user)
  end

ingredientsObj = ingredients.collect do |ingredient|
    Ingredient.create(ingredient)
  end

snacks = [
    {name: "Flavor Logs", description: "Scrumptious log of a very wide variety of ingredients that help encapsulate the flavors that lie within", occasion: "Couch Surfing", user: usersObj.sample},
    {name: "3 Bark Rosemary", description: "A delicate and light  snack that is lively and an all around enriching experience", occasion: "Dinning Party", user: usersObj.sample},
    {name: "Helna's  Suprise", description: "A suprising treat with serveral hidden gems that lie within not for ametures", occasion: "Home Alone", user: usersObj.sample},
    {name: "Dante's Inferno", description: "A fiery swirl of wild flavors that all help to enhance your dining experience small possibilty of burning your house down. Any skill level can make this.", occasion: "Public Park", user: usersObj.sample},
    {name: "A Dance In The Pale Moonlight", description: "A wild assortment of flavors just waiting to break free. Starts off slow but then its rhythm truly becomes evident", occasion: "Dinner Party", user: usersObj.sample},
    {name: "The Alamo", description: "Truly an unforgetable snack redefined a traditional and savory treat for everyone.  Best served warm or steaming hot.", occasion: "With Very Few Guests", user: usersObj.sample},
    {name: "Custards Last Stand", description: "The last thing you will want to serve at the dinner party a wild assortment of favors each with there own story to tell", occasion: "Dinnner", user: usersObj.sample},
  ]
  snacksObj = snacks.collect do |snack|
      Snack.create(snack)
    end
  amounts = ["1/4 cup", "1/2 cup", "3/4 cup", "1 cup"]

  snacksObj.each do |snack|
    (1..6).to_a.sample.times do
      Mix.create(snack: snack, ingredient: ingredientsObj.sample, amount: amounts.sample)
    end
  end

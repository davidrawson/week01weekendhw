def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash_amount)
  pet_shop[:admin][:total_cash] += cash_amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, sold)
  pet_shop[:admin][:pets_sold] += sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].count()
end

def pets_by_breed(pet_shop, breed)
  pets = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      pets.push(pet)
    end
  end
  return pets
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
#      p "in find pets by name if"
      pets = {}
      pets[:name] = name
    end
  end
  return pets
end

def remove_pet_by_name(pet_shop, name)
  pet_to_remove = find_pet_by_name(pet_shop, name)
  pet_shop[:pets].delete_if {|item| item = pet_to_remove}
  # all credit to rubber duck.
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] > new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil
#    if customer_can_afford_pet(customer, pet) == true
      for each_pet in pet_shop[:pets]
        if each_pet[:name] == pet[:name]
          price = each_pet.fetch_values(:price)
          pet_shop[:admin][:total_cash] += price[0]
          add_pet_to_customer(customer, pet)
          pet_shop[:admin][:pets_sold] +=1
        end
      end
    else
      return
    end
#  end
  # Have to take the money off the customer.
end

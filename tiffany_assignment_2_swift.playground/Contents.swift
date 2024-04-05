/* The Karmic Pizza Place */

/* Let's see who is close to our location so we can advertise to them */


struct Location {
    let x: Int
    let y: Int
}

let storeLocation = Location(x: 3, y: 3)
let storeRange = 2.5

let storeLocation_2 = Location(x: 4, y: 4)
let storeRange_2 = 2.5

struct customerList {
    var name: String
    var email: String
    var phone: String
    var acceptedNewsletter: Bool?
    var address: Location
}

func isAcceptedNewsletter(customer: customerList, storeLocation: Location, radius: Double) -> Bool {
    let distanceX = Double(customer.address.x - storeLocation.x)
    let distanceY = Double(customer.address.y - storeLocation.y)
    let distance = (distanceX * distanceX + distanceY * distanceY).squareRoot()
    return distance <= radius
}

func customersInRange(customers: [customerList], storeLocation: Location, radius: Double) -> [customerList] {
    var customerMatch: [customerList] = []
    for customer in customers {
        if isAcceptedNewsletter(customer: customer, storeLocation: storeLocation, radius: radius) {
            customerMatch.append(customer)
        }
    }
    return customerMatch
}

var database: [customerList] = []
var customer = customerList(name: "Cali", email: "cali@gmail.com", phone: "999", address: Location(x: 5, y: 5))
database.append(customer)
customer = customerList(name: "Karma", email: "karma@gmail.com", phone: "999", address: Location(x: 7, y: 7))
database.append(customer)
customer = customerList(name: "Sky", email: "sky@gmail.com", phone: "999", address: Location(x: 1, y: 4))
database.append(customer)
customer = customerList(name: "Angel", email: "angel@gmail.com", phone: "999", address: Location(x: 3, y: 7))
database.append(customer)
customer = customerList(name: "Brandy", email: "brandy@gmail.com", phone: "999", address: Location(x: 7, y: 8))
database.append(customer)
customer = customerList(name: "Bailey", email: "bailey@gmail.com", phone: "999", address: Location(x: 4, y: 3))
database.append(customer)
customer = customerList(name: "Zambooka", email: "zambooka@gmail.com", phone: "999", address: Location(x: 5, y: 6))
database.append(customer)
customer = customerList(name: "Lucky", email: "lucky@gmail.com", phone: "999", address: Location(x: 3, y: 2))
database.append(customer)
customer = customerList(name: "Kilo", email: "kilo@gmail.com", phone: "999", address: Location(x: 5, y: 2))
database.append(customer)
customer = customerList(name: "Chip", email: "chip@gmail.com", phone: "999", address: Location(x: 7, y: 1))
database.append(customer)

let targetCustomers = customersInRange(customers: database, storeLocation: storeLocation, radius: storeRange)

for customer in targetCustomers {
    print("Customer: \(customer.name) - Email: \(customer.email).")
}

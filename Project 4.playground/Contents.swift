import UIKit

class Person
{
    var name: String
    var age: Int?
    var homeTown: String?
    var interests: [Interest]
    
    static let nameOptions = ["Paul", "Mary", "Diana", "Adrian", "Kate", "John",
                              "Jane", "George", "Gabriela", "Denis", "Taylor", "Peter"]
    
    static let homeTownOptions = ["Berlin", "Tokyo", "Moscow", "Denver",
                                  "Rio", "Helsinki", "Oslo", "Nairobi"]

    
    init(name: String, age: Int?, homeTown: String?, interests: [Interest])
    {
        self.name = name
        self.age = age
        self.homeTown = homeTown
        self.interests = interests
    }
    
    func presentYourself()
    {
        print("Hello! My name is \(name).")
        if age != nil
        {
            print("I am \(age!) years old.")
        }
        
        if homeTown != nil
        {
            print ("I come from \(homeTown!)")
        }
        
        print("I have the following interests: ")
        for interest in interests
        {
            print("    - \(interest.name)")
        }
    }
}

class Interest
{
    var name: String
    var description: String?
    var reason: String?
    
    static let  options = ["footbal", "fishing", "movies", "music", "cars",
                           "boats", "fashion", "computers", "technology", "books",
                           "video games", "board games", "food", "cooking", "math",
                           "physics", "fitness", "cycling", "horoscope", "gardeniring",
                           "politics", "electronics", "motocycles", "programming", "decorations",
                           "handmades", "festivals", "toys", "flowes", "bowling"]
    
    static let numberOfOptions = options.count
    
    init(name: String, description:String?, reason:String?)
    {
        self.name = name
        self.description = description
        self.reason = reason
    }
    
}


// 1) Generate a number of participants (2-12 participants)
func chooseParticipantsNumber() -> Int
{
    return Int(arc4random_uniform(6)*2 + 2) //return an even number between 2 and 12
    /*
     0 => 2
     1 => 4
     2 => 6
     3 => 8
     4 => 10
     5 => 12
    */
}

let participantsNumber = chooseParticipantsNumber()

/* create the persons that will participate */
func createPersons() -> [Person]
{
    var persons = [Person]()
    
    for index in 0..<participantsNumber
    {
        let personConfiguration = generateConfigurationForPerson()
        let age: Int?
        let homeTown: String?
        
        if personConfiguration == 1 /* has only name and age described */
        {
            age = Int(arc4random_uniform(90)) + 10 // generate a number between 10 and 100
            homeTown = nil                         // home town information is not available
        }
        else if personConfiguration == 2 /* has name, age and home town described*/
        {
            age = Int(arc4random_uniform(90)) + 10  //generate a number between 10 and 100
            homeTown = Person.homeTownOptions[Int(arc4random_uniform(UInt32(Person.homeTownOptions.count)))]
            /* choose the home town of the person randomly from the homeTownOptions */
        }
        else /* the person has only a name described*/
        {
            age = nil
            homeTown = nil
        }
        
        persons.append(Person(name: Person.nameOptions[index], age: age, homeTown: homeTown, interests: generateInterests()))
        /* a person is created using the information generated above (age and home town)
           an unique name is assigned to the person and a set of interests is generated
           the new person is added to the persons that will participate in the game
         */
    }
    
    return persons
}

func generateConfigurationForPerson() -> Int
{
    return Int(arc4random_uniform(3))
    /*
     0 - person will have only name
     1 - person will have name and age
     2 - person will have name, age and hometown
     */
}


/* this function will generate a random number of different interests */
func generateInterests() -> [Interest]
{
    var interestsChoosen = [Interest]()
    /* generate a random number of interests between 1 and 10 */
    let numberOfInterestsToGenerate = Int(arc4random_uniform(10)) + 1
    /* generate as many differete numbers as the interests that we want to assign to a person */
    let numbers = generateDifferentNumbers(many: numberOfInterestsToGenerate)
    
    for index in numbers
    {
        interestsChoosen.append(Interest(name: Interest.options[index], description: nil, reason: nil))
    }
    
    return interestsChoosen
}

func generateDifferentNumbers(many: Int) -> [Int]
{
    var count = 1
    var arrayWithNumbers = [Int]()
    var n = 0
    
    repeat
    {
        repeat
        {
             n = Int(arc4random_uniform(UInt32(Interest.numberOfOptions)))
        }
        while (arrayWithNumbers.contains(n) == true)
        
        arrayWithNumbers.append(n)
        count+=1
    }
    while count < many
    
    return arrayWithNumbers
}

func comparePersons(pers1: Person, pers2: Person) -> Int
{
    var noOfSimilarities = 0
    
    for interestPerson1 in pers1.interests
    {
        if (pers2.interests).contains(where: { (interestPerson2) -> Bool in
            return interestPerson1.name == interestPerson2.name
        })
        {
            noOfSimilarities+=1
        }
    }
    
    return noOfSimilarities
}


let persons = createPersons()
print("We have \(participantsNumber) participants.\n")
for person in persons
{
    person.presentYourself()
    print("\n")
}

var personPaired = [Int]()

for index1 in 0..<participantsNumber
{
    var minimum = Interest.numberOfOptions
    var indexOfMin = 0
    
    if personPaired.contains(index1)
    {
        continue
    }
    for index2 in (index1+1)..<persons.count
    {
        if personPaired.contains(index2)
        {
            continue
        }
        
        let similarities = comparePersons(pers1: persons[index1], pers2: persons[index2])
        print("Person \(index1 + 1) and person \(index2 + 1) have \(similarities) similarities.")
        if similarities < minimum
        {
            minimum = similarities
            indexOfMin = index2
        }
    }
    personPaired.append(index1)
    personPaired.append(indexOfMin)
    print("\nPaired P\(index1 + 1) with P\(indexOfMin + 1) - similarities: \(minimum)\n")

}



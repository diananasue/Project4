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
            //print(interest.describeInterest())
        }
    }
}

class Interest
{
    var name: String
    var cost: Cost
    var frequency: Frequency
    var feeling: Feeling
    
    static let generalInterests = generateGeneralInterests()
    static let numberOfOptions = generalInterests.count
    
    static func generateGeneralInterests() -> [Interest]
    {
        var options = [Interest]()
        
        
        // Sports
        options.append(Sport(name: "footbal", cost: .expensive, frequency: .daily , feeling: .healthy, equipment: "clothes and a ball", weatherConditions: "prefarably a sunny day", numberOfParticipants: 22))
        options.append(Sport(name: "fishing", cost: .expensive, frequency: .severalTimesMonth , feeling: .interactive, equipment: "fishing rod and rell", weatherConditions: "sunny day", numberOfParticipants: 1))
        options.append(Sport(name: "cycling", cost: .affordable, frequency: .severalTimesWeek , feeling: .challenging, equipment: "bicycle", weatherConditions: "any type of day", numberOfParticipants: 1))
        options.append(Sport(name: "fitness", cost: .affordable, frequency: .daily, feeling: .enjoyable, equipment: "clothes", weatherConditions: "any type of day", numberOfParticipants: 1))
        options.append(Sport(name: "bowling", cost: .cheap, frequency: .onceAweek, feeling: .enjoyable, equipment: "bowling ball", weatherConditions: "any type of day", numberOfParticipants: 2))
        
        // Art
        
        options.append(Art(name: "movies", cost: .cheap, frequency: .severalTimesWeek, feeling: .relaxing, genre: .historical))
        options.append(Art(name: "music", cost: .cheap, frequency: .daily, feeling: .enjoyable, genre: .modern))
        options.append(Art(name: "fashion", cost: .expensive, frequency: .severalTimesWeek, feeling: .challenging, genre: .modern))
        options.append(Art(name: "books", cost: .affordable, frequency: .daily, feeling: .enjoyable, genre: .classical))
        options.append(Art(name: "cooking", cost: .affordable, frequency: .daily, feeling: .healthy, genre: .modern))
        options.append(Art(name: "decorations", cost: .affordable, frequency: .severalTimesWeek, feeling: .relaxing, genre: .none))
        options.append(Art(name: "handmades", cost: .cheap, frequency: .severalTimesMonth, feeling: .interactive, genre: .none))
        
        // Science
        
        options.append(Science(name: "technology", cost: .affordable, frequency: .onceAweek, feeling: .challenging, difficulty: .hard, experience: .intermediate))
        options.append(Science(name: "video games", cost: .affordable, frequency: .daily, feeling: .interactive, difficulty: .medium, experience: Experience.expert))
        options.append(Science(name: "math", cost: .cheap, frequency: .severalTimesWeek, feeling: .challenging, difficulty: .hard, experience: .begginer))
        options.append(Science(name: "physics", cost: .cheap, frequency: .daily, feeling: .interesting, difficulty: .hard, experience: .expert))
        options.append(Science(name: "electronics", cost: .affordable, frequency: .onceAweek, feeling: .challenging, difficulty: .medium, experience: .begginer))
        options.append(Science(name: "programming", cost: .cheap, frequency: .daily, feeling: .interesting, difficulty: .hard, experience: .expert))
        options.append(Science(name: "computers", cost: .affordable, frequency: .severalTimesWeek, feeling: .enjoyable, difficulty: .medium, experience: .intermediate))
        
        // Automobiles
        
        options.append(Automobiles(name: "cars", cost: .expensive, frequency: .onceAweek, feeling: .relaxing, power: 120, competing: true))
        options.append(Automobiles(name: "boats", cost: .expensive, frequency: .onceAmonth, feeling: .healthy, power: 200, competing: true))
        options.append(Automobiles(name: "motocycles", cost: .expensive, frequency: .severalTimesWeek, feeling: .challenging, power: 150, competing: false))
        options.append(Automobiles(name: "bicycles", cost: .affordable, frequency: .daily, feeling: .healthy, power: 0, competing: false))
        
        
        return options
    }
    
    func describeInterest() -> String
    {
        let begging = ["I realy like ", "One of my passions is ", "I enjoy very much "]
        var description = String()
        description += "    - \(name.uppercased())\n"
        description += (begging[Int(arc4random_uniform(UInt32(begging.count)))] + name)
        
        return description
    }
    
    
    init(name: String, cost: Cost, frequency: Frequency, feeling: Feeling)
    {
        self.name = name
        self.cost = cost
        self.frequency = frequency
        self.feeling = feeling
    }
    
}


enum Cost: String
{
    case cheap
    case affordable
    case expensive
}


enum Frequency: String
{
    case onceAweek = "once a week"
    case daily = "daily"
    case onceAmonth = "once a month"
    case severalTimesMonth = "several times a month"
    case severalTimesWeek = "several timea a week"
}

enum Feeling: String
{
    case relaxing
    case challenging
    case interactive
    case healthy
    case enjoyable
    case interesting
}

class Sport: Interest
{
    var equipment: String
    var weatherConditions: String
    var numberOfParticipants: Int
    
    
    init(name: String, cost: Cost, frequency: Frequency, feeling: Feeling, equipment: String, weatherConditions: String, numberOfParticipants: Int)
    {
        self.equipment = equipment
        self.weatherConditions = weatherConditions
        self.numberOfParticipants = numberOfParticipants
        super.init(name: name, cost: cost, frequency: frequency, feeling: feeling)
        
    }
    
    override func describeInterest() -> String {
        var description = super.describeInterest()
        
        description += " because practing this sport makes me feel" + feeling.rawValue + ".\n"
        
        description += ("I practice this sport " + frequency.rawValue + " and it is ")
        
        switch cost
        {
        case .cheap:
            description += "quit cheap.\n"
        case .affordable:
            description += "affordables: just my luck.\n"
        case .expensive:
            description += "expensive, but't that doesn't stop me.\n"
        }
        
        description += "In order to practice this sport we need the following equiptment" + equipment + ".\n"
        description += "The perfect weather conditions are" + weatherConditions + " and the minimum number of participants is  \(numberOfParticipants)" + ".\n"
        
        return description
    }
}



class Art: Interest
{
    var genre: Genre
    
    init(name: String, cost: Cost, frequency: Frequency, feeling: Feeling, genre: Genre)
    {
        self.genre = genre
        super.init(name: name, cost: cost, frequency: frequency, feeling: feeling)
    }
    
    override func describeInterest() -> String {
        var description = super.describeInterest()
        
        description += " because it makes me feel " + feeling.rawValue + ".\n"
        
        description += ("I am doing this activity " + frequency.rawValue + " and it is ")
        
        switch cost
        {
        case .cheap:
            description += "quit cheap.\n"
        case .affordable:
            description += "affordables: just my luck.\n"
        case .expensive:
            description += "expensive, but't that doesn't stop me.\n"
        }
        
        description += "The gender that I preffere is " + genre.rawValue + ".\n"
        
        return description
    }
    
}

enum Genre: String{
    case classical
    case modern
    case historical
    case none = "I doesn't have a particular genre."
}

class Science: Interest
{
    var difficulty: Difficulty
    var experience: Experience
    
    init(name: String, cost: Cost, frequency: Frequency, feeling: Feeling, difficulty: Difficulty, experience: Experience)
    {
        self.difficulty = difficulty
        self.experience = experience
        super.init(name: name, cost: cost, frequency: frequency, feeling: feeling)
    }
    
    override func describeInterest() -> String {
        var description = super.describeInterest()
        
        description += " because learning about this makes me feel " + feeling.rawValue + ".\n"
        
        description += ("I am doing this activity " + frequency.rawValue + " and it is ")
        
        switch cost
        {
        case .cheap:
            description += "quit cheap.\n"
        case .affordable:
            description += "affordables: just my luck.\n"
        case .expensive:
            description += "expensive, but't that doesn't stop me.\n"
        }
        
        description += "I like doint this because the difficulty is " + difficulty.rawValue + " and right now I belive that I am a " + experience.rawValue + " in this domain. \n"
        return description
    }
    
}

enum Difficulty: String
{
    case easy
    case medium
    case hard
}

enum Experience: String
{
    case begginer
    case intermediate
    case expert
}

class Automobiles: Interest
{
    var power: Int
    var competing: Bool
    
    init(name: String, cost: Cost, frequency: Frequency, feeling: Feeling, power: Int, competing: Bool)
    {
        //super.init(name: name, cost: cost, frequency: frequency, feeling: feeling)
        self.power = power
        self.competing = competing
        super.init(name: name, cost: cost, frequency: frequency, feeling: feeling)
    }
    
    override func describeInterest() -> String {
        var description = super.describeInterest()
        
        description += " because it makes me feel " + feeling.rawValue + ".\n"
        
        description += ("I am doing this activity " + frequency.rawValue + " and it is ")
        
        switch cost
        {
        case .cheap:
            description += "quit cheap.\n"
        case .affordable:
            description += "affordables: just my luck.\n"
        case .expensive:
            description += "expensive, but't that doesn't stop me.\n"
        }
        if power > 0
        {
            description += "The " + name + "that I own have around  \(power) " + " hourse power.\n"
        }
        else
        {
            description += "The power of the " + name + " is dependent on my strenght.\n"
        }
        
        if competing
        {
            description += "I usualy participate in competition with the " + name + " that I have.\n "
        }
        else
        {
            description += "I don't participate in competition with the " + name + " that I have.\n "
        }
        
        return description
    }
    
}

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


/* create the persons that will participate */
func createPersons() -> [Person]
{
    var persons = [Person]()
    
    for index in 0..<participantsNumber
    {
        let personConfiguration = generateConfigurationForPerson()
        let age: Int?
        let homeTown: String?
        
        if personConfiguration == Configurations.nameAndAge.rawValue /* has only name and age described */
        {
            age = Int(arc4random_uniform(90)) + 10 // generate a number between 10 and 100
            homeTown = nil                         // home town information is not available
        }
        else if personConfiguration == Configurations.nameAgeAndHomeTown.rawValue /* has name, age and home town described*/
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
enum Configurations: Int
{
    case onlyName = 0
    case nameAndAge
    case nameAgeAndHomeTown
}

/* this function will generate a random number of different interests */
func generateInterests() -> [Interest]
{
    var interestsChoosen = [Interest]()
    /* generate a random number of interests between 3 and 10 */
    let numberOfInterestsToGenerate = Int(arc4random_uniform(8)) + 3
    /* generate as many differete numbers as the interests that we want to assign to a person */
    let numbers = generateDifferentNumbers(many: numberOfInterestsToGenerate)
    
    for index in numbers
    {
        interestsChoosen.append(Interest.generalInterests[index])
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

func comparePersons(pers1: Person, pers2: Person) -> [String]
{
    var similarities = [String]()
    
    for interestPerson1 in pers1.interests
    {
        if (pers2.interests).contains(where: { (interestPerson2) -> Bool in
            return interestPerson1.name == interestPerson2.name
        })
        {
            similarities.append(interestPerson1.name)
        }
    }
    
    return similarities
}

func findUnshareInterests(pers1: Person, pers2: Person) -> [Interest]
{
    
    var nonSimilarities = [Interest]()
    let similarities = [String]()
    
    for interest in pers1.interests
    {
        if similarities.contains(interest.name) == false
        {
            nonSimilarities.append(interest)
        }
    }
    
    for interest in pers2.interests
    {
        if similarities.contains(interest.name) == false
        {
            nonSimilarities.append(interest)
        }
    }
    
    return nonSimilarities
}

// 1) Generate a number of participants (2-12 participants)
let participantsNumber = chooseParticipantsNumber()

// 2) Populate the initial data container and log participants introduction.
let persons = createPersons()
print("We have \(participantsNumber) participants.\n")
for person in persons
{
    person.presentYourself()
    print("\n")
}

// 3)Generate conversation pairs based on differences in participants’ interests.
var personPaired = [Int]()

for index1 in 0..<participantsNumber
{
    var minimum = Interest.numberOfOptions
    var indexOfMin = 0
    var pairedPersonSharedInterests = [String]()
    
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
        
        let sharedInterests = comparePersons(pers1: persons[index1], pers2: persons[index2])
        
        let similarities = sharedInterests.count
        
        print("\(persons[index1].name) and \(persons[index2].name) have \(similarities) similarities.")
        if similarities < minimum
        {
            minimum = similarities
            indexOfMin = index2
            pairedPersonSharedInterests = sharedInterests
            
        }
    }
    personPaired.append(index1)
    personPaired.append(indexOfMin)
    
    //4) Log the pairing results.
    print("\nWe choosed to pair \(persons[index1].name) with \(persons[indexOfMin].name) - similarities: \(minimum)\n")
    if minimum > 0
    {
        print ("They share the following interests:")
        for interestName in pairedPersonSharedInterests
        {
            print("   - \(interestName)")
        }
    }
    else
    {
        print("They don't have anything in common.")
    }
    
    let unsharedInterests = findUnshareInterests(pers1: persons[index1], pers2: persons[indexOfMin])
    print("\nThey discuss about the following:")
    for nonInterestName in unsharedInterests
    {
        //print(nonInterestName.describeInterest())
        print("   - \(nonInterestName.name)")
    }
    print("\n")
}


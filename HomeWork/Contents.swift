import Foundation 

func trim(_ word:String, _ str:String)->String{
    var result = Array<Character>()

    let wordCount = word.count
    let strCount = str.count

    if strCount == 0{
        return word
    }

    var index = 0
    var wordIndices = Array<String.Index>()

    for item in word.indices{
        wordIndices.append(item)
    }

    while index < wordCount{
        if wordCount - index - strCount >= 0 && str == word[wordIndices[index]...wordIndices[index + strCount - 1]]{
            index += strCount
        }
        else{
            result.append(word[wordIndices[index]])
            index += 1
        }
    }
    return String(result)
}

//print(trim("aslkjfjkdfskjbkjdfsbvkjldasasd","as"))


class Game{
    var players = [Player]()

    enum CharacterType : Int,CaseIterable {
        case Wizard = 1
        case Knight
        case Assassin
    }

    func createPlayers(){
        print("choose your hero")
        for item in CharacterType.allCases {
            print("\(item.rawValue) - \(item)")
        }
        // типо ввод
    }

    func resetGameProgress(){
        for man in players {
            man.wins = 0
            man.loss = 0
        }
    }

    class BattleField{
        func beginBattle(men:[Unit]){
            var livePlayers = men
            var index = 0
            while livePlayers.count > 1{
                let attackTo = /* тут должен был быть ввод */0
                livePlayers[index].attack(livePlayers[attackTo])
                if livePlayers[attackTo].health <= 0{
                    livePlayers.remove(at: attackTo)
                } 
                index += 1
                if index >= livePlayers.count{
                    index = 0
                }
                else{
                if let found = find(players.map({ $0.nickname }), livePlayers[0].nickname) {
                    players[found] = livePlayers[0]
                }
                    toSummarize[livePlayers[0]]
                }
            }
        }

        func toSummarize(_ lastPlayer:Unit){
            print("player \(lastPlayer.nickname) won!\n\n")
            
            players.sort { $0.wins > $1.wins }
            for i in 0..<3{
                if (players.count >= i){
                    print("\(i + 1) place takes \(players[i].nickname): \(players[i].wins) | \(players[i].loss)")
                }
            }
        }

    }

    class Player{
        var nickname:String
        
        var wins = 0
        var loss = 0

        init(_ nickname:String) {
            self.nickname = nickname
        }
    }

    class Unit : Player{
        var health:Double
        var damage:Double
        var protection:Double
        var agility:Double

        init(_ health:Double,_ damage:Double,_ protection:Double,_ agility:Double,_ nickname:String) {
            self.health = health
            self.damage = damage
            self.protection = protection
            self.agility = agility
            super.init(nickname)
        }

        func attack(_ attackTo:Unit){
            let damage = self.damage + self.agility * self.damage * 0.1
            let defense = attackTo.protection + attackTo.agility * attackTo.protection * 0.1
            attackTo.health -= max(0, damage - defense)
        }
        
    }
    class Wizard : Unit{
        init(nickname:String) {
            super.init(70, 30, 3, 1, nickname)
        }
    }
    class Knight : Unit{
        init(nickname:String) {
            super.init(140, 15, 5, 2, nickname)
        }
        
    }
    class Assassin : Unit{
        init(nickname:String) {
            super.init(100, 25, 2, 6, nickname)
        }
    }
}


var game = Game()
game.createPlayers()

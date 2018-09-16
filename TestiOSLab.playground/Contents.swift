import Foundation 

// Task 1
var testArray = [7,6,3,4,-1,8,6,5,3,2,0,1,5,3]

func InsertionSort(_ arr:[Int])->[Int]{
    var array = arr
    var x = 0
    var j = 0
    for i in 0...array.count - 1{
        x = arr[i]
        j = i - 1
        while j >= 0 && array[j] > x {
            array[j+1] = array[j]
            j -= 1
        }
        array[j+1] = x
    }
    return array
}
//print (InsertionSort(testArray))

// Task 2

class First{
    private var a = 0
    public var b = 1
}

class Second: First{
    private var c = 2

    func Example(_ a:Int){
        //...
    }
    func Example(_ a:Double){
        //...
    }
}

// Task 3

class BinaryTree<T>{
    var LeftTree:BinaryTree? = nil
    var RightTree:BinaryTree? = nil
    var Data:T
    
    init(_ data:T) {
        self.Data = data
    }

    class MyArray{
        public var array = Array<T>()
    }

    private var array = MyArray()

    func Add(_ data:T){
        var tree = self
        while true{
            if tree.LeftTree == nil{
                tree.LeftTree = BinaryTree(data)
                print("Записано влево")
                break
            }
            else if tree.RightTree == nil{
                tree.RightTree = BinaryTree(data)
                print("Записано вправо")
                break
            }
            else{
                if (arc4random_uniform(2) == 0){ // рандом не работает :(
                    tree = tree.LeftTree!
                }
                else{
                    tree = tree.RightTree!
                }
                print("Переход вниз на уровень")
            }
        }
    }

    func getArray()->Array<T>{
        getArray(self)
        var array = self.array.array
        self.array.array.removeAll()
        return array
    }
    private func getArray(_ tree:BinaryTree){
        array.array.append(tree.Data)
        if (LeftTree != nil){
            getArray(LeftTree!)
        }
        if (RightTree != nil){
            getArray(RightTree!)
        }
    }
}

var a = BinaryTree(1)
a.Add(2)
a.Add(3)
a.Add(4)




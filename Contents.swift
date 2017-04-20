
/* Matrix treverse to find neighboring ones.
 
 Examples:
 
 Input Grid:
 
 let sampleGrid = [[0,1,0], [0,0,0], [1,0,0]]
 
 Console Output:

 1 0 1
 2 2 1
 0 1 0
 
 /////////////////
 
 Input Grid:
 
 let sampleGrid = [[0,1,0,0], [0,0,0,1], [1,0,0,1],[0,1,0,1]]
 
 Console Output:
 
 1 0 2 1
 2 2 3 1
 1 2 4 2
 2 1 3 1
 
*/

let sampleGrid = [[0,1,0,0], [0,0,0,1], [1,0,0,1],[0,1,0,1]]
var counterRowArray = [Int]()

// Input parameters xBlockPoint and yBlockPoint represent location of a block within the matrix, nMulitpleGridSize is the size of the grid(assuming n * n)
func countNumberofNeighboringOnesForAGivenBlock(xBlockPoint: Int, yBlockPoint: Int, nMulitpleGridSize: Int) -> Int {
    var numberOfOnesForABlock = 0
    for x in (max(0, xBlockPoint - 1))...min(xBlockPoint + 1, nMulitpleGridSize - 1) {
        for y in (max(0, yBlockPoint - 1))...min(yBlockPoint + 1, nMulitpleGridSize - 1) {
            if (x != xBlockPoint || y != yBlockPoint) {
                if sampleGrid[x][y] == 1 {
                    numberOfOnesForABlock += 1
                }
            }
        }
    }
    return numberOfOnesForABlock
}

func countNumberOfNeighboringOnesForAllBlocks(){
    for gridRow in 0..<sampleGrid.count {
        for gridColumn in 0..<sampleGrid.count {
            let numberOfSurroundingOnesForABlock = countNumberofNeighboringOnesForAGivenBlock(xBlockPoint: gridRow, yBlockPoint: gridColumn, nMulitpleGridSize: sampleGrid.count)
            counterRowArray.append(numberOfSurroundingOnesForABlock)
        }
    }
}

func printNumberOfSurroundingOnesForEachBlock() {
    var breakLineCounter = 1
    for item in counterRowArray {
        print(item, terminator: " ")
        if breakLineCounter % sampleGrid.count == 0 {
            print("\r")
        }
        breakLineCounter += 1
    }
}

countNumberOfNeighboringOnesForAllBlocks()
printNumberOfSurroundingOnesForEachBlock()



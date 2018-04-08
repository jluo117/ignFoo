//: Playground - noun: a place where people can play

import Cocoa
class pair{
    var x : Int
    var y : Int
    init(x: Int,y: Int) {
        self.x = x
        self.y = y
    }
    
}

class gridLoc {
    var isValid = true
    var isVisit = false
    var hasEnd = false
    var validSet = [[pair]] ()
    var x : Int
    var y : Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    func storeSolution(validLoc: gridLoc) {
        let mySet = pair(x: self.x, y: self.y)
        for i in validLoc.validSet{
            var newSet = [pair]()
            newSet.append(mySet)
            var valid = true
            for j in i{
                for n in newSet{
                    if j.x == n.x && j.y == n.y{
                        valid = false
                        break
                    }
                    
                }
                newSet.append(j)
            }
            if valid{
            validSet.append(newSet)
            }
        }
    }
    
}

var grid = [[gridLoc]]()

func getValidRoutes(potHoles: [pair],start: pair){
    for i in 0...3{
        var yGrid = [gridLoc]()
        for j in 0...3{
            let newGrid = gridLoc(x:i,y:j)
            yGrid.append(newGrid)
        }
        grid.append(yGrid)
    }
    for i in potHoles{
        grid[i.x][i.y].isValid = false
    }
    for i in 0...3 {
        var printString = ""
        for j in grid{
            if j[3 - i].isValid{
                printString += "O"
            }
            else{
                printString += "X"
            }
        }
        print(printString)
    }
    let currentGrid = grid[start.x][start.y]
    //var totalRoutes = 0
    if routeSearch(currentGrid: currentGrid){
        print(currentGrid.validSet.count)
        for i in currentGrid.validSet{
            var printString = ""
            for j in i{
                printString += String(j.x)
                printString += ","
                printString += String(j.y)
                printString += " "
            }
            print(printString)
        }
    }
}
func routeSearch(currentGrid: gridLoc) -> Bool{
    var validRoute = false
    currentGrid.isVisit = true
    if (currentGrid.x == 3){
        currentGrid.hasEnd = true
        validRoute = true
        let foundSet = pair(x: currentGrid.x, y: currentGrid.y)
        var routeSet = [pair]()
        routeSet.append(foundSet)
        currentGrid.validSet.append(routeSet)
        return true
    }
    let xCord = currentGrid.x
    let yCord = currentGrid.y
    if (xCord < 3){
        if (grid[xCord + 1][yCord].isValid){
            if (grid[xCord + 1][yCord].hasEnd){
                validRoute = true
                   currentGrid.hasEnd = true
                currentGrid.storeSolution(validLoc: grid[xCord + 1][yCord])
            }
            else if (!(grid[xCord + 1][yCord].isVisit)){
                if (routeSearch(currentGrid: grid[xCord + 1][yCord])){
                    validRoute = true
                    currentGrid.hasEnd = true
                    currentGrid.storeSolution(validLoc: grid[xCord + 1][yCord])
                }
            }
        }
        
    }
    if yCord > 0{
        if (grid[xCord][yCord - 1].isValid){
            if (grid[xCord][yCord - 1].hasEnd){
                validRoute = true
                currentGrid.hasEnd = true
                currentGrid.storeSolution(validLoc: grid[xCord][yCord - 1])
            }
            else if (!(grid[xCord][yCord - 1].isVisit)){
                if (routeSearch(currentGrid: grid[xCord][yCord - 1])){
                    validRoute = true
                    currentGrid.hasEnd = true
                    currentGrid.storeSolution(validLoc: grid[xCord][yCord - 1])
                }
            }
        }
    }
    if yCord < 3{
        if (grid[xCord][yCord + 1].isValid){
            if (grid[xCord][yCord + 1].hasEnd){
                validRoute = true
                currentGrid.hasEnd = true
               currentGrid.storeSolution(validLoc: grid[xCord][yCord + 1])
                //   currentGrid.validSet.append(contentsOf: grid[currentGrid.x + 1][currentGrid.y].validSet)
            }
            else if (!(grid[xCord ][yCord + 1].isVisit)){
                if (routeSearch(currentGrid: grid[xCord][yCord + 1])){
                    validRoute = true
                    currentGrid.hasEnd = true
                    currentGrid.storeSolution(validLoc: grid[xCord][yCord + 1])
                }
            }
        }
    }
    return validRoute
}
var failOnes = [pair]()
var fail = pair(x: 0, y: 1)
var fail2 = pair(x: 2, y: 2)
var fail3 = pair(x: 1, y: 3)
var fail4 = pair(x: 3, y: 3)
failOnes.append(fail)
failOnes.append(fail2)
failOnes.append(fail3)
failOnes.append(fail4)
var start = pair(x: 0, y: 3)
getValidRoutes(potHoles: failOnes, start: start)
failOnes.removeAll()
var test2 = [pair] ()
fail = pair(x: 0, y: 1)
 fail2 = pair(x: 1, y: 1)
 fail3 = pair(x: 2, y: 1)
 fail4 = pair(x: 3, y: 1)
failOnes.append(fail)
failOnes.append(fail2)
failOnes.append(fail3)
failOnes.append(fail4)
start = pair(x: 0, y: 0)
grid.removeAll()
getValidRoutes(potHoles: failOnes, start: start)

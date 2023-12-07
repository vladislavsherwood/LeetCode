func isValidSudoku(board [][]byte) bool {

  hashMap := make(map[string]bool)
  for i:=0; i<9; i++{
    for j:=0; j<9; j++{
      row := i
      column := j

      current_value := string(board[i][j])

      if current_value == "."{
        continue
      }

      _, check1 := hashMap[current_value + "row f" + string(row)]
      _, check2 := hashMap[current_value + "column f" + string(column)]
      _, check3 := hashMap[current_value + "square f" + string(row/3) + "_" + string(column/3)]

      if check1 || check2 || check3{
        return false
        
      } else{
        hashMap[(current_value + "row f" + string(row))] = true
        hashMap[(current_value + "column f" + string(column))] = true
        hashMap[(current_value + "square f" + string(row/3) + "_" + string(column/3))] = true
      }
    }
  }
  return true
}
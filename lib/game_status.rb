# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |winplay|
    board_pt = [board[winplay[0]],board[winplay[1]],board[winplay[2]]]
    if board_pt.all?{|i| i=="X"} ||board_pt.all?{|i| i=="O"}
      return winplay
    end
  end
  return false
end

def full?(board)
  if board.none?{|i| i==" "} && board.none?{|i| i==""} && board.none?{|i| i==nil}
    return true
  else
    return false
  end
end

def draw?(board)
  if won?(board)==false && full?(board)==true
    return true
  else 
    return false
  end
end

def over?(board)
  if won?(board).class==Array || draw?(board)==true || full?(board)==true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board).class==Array
    winplay = won?(board)
    return board[winplay[0]]
  end
end
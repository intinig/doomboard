BASEPATH = File.dirname(__FILE__) + '/../'

require BASEPATH + 'lib/doom_board'

board = DoomBoard.new(:columns => 16, :rows => 10)
board.render

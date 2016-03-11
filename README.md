# aAChess
Two day chess project built in Ruby.

Begin by putting in both player's names.

![Input Player 1 name](/readme_images/player_names.png?raw=true "Player Names")

The game uses a red cursor. Move the cursor with the arrow keys, and select using the space bar.

![Standard Board](/readme_images/red_cursor.png?raw=true "Typical Board")

When a player selects a piece he/she owns, the valid moves for that piece will be highlighted in green.

![Valid moves for the queen are highlighted](/readme_images/move_highlighter.png?raw=true "Move Highlighter")

To capture a piece, simply move your piece on top of the other player's piece. Taken pieces will show up on the right.

![The black pawn can take the white pawn. Taken pieces are visible on the right.](/readme_images/capture.png?raw=true "Taken Pieces")

To castle, select the King, and select the position the King would be in after castling.

![The king is ready to castle](/readme_images/castle1.png?raw=true "Castling")

![Castled](/readme_images/castle2.png?raw=true "Castled")

To take a pawn en passant, simply move the piece diagonally behind the pawn to be taken.

![The black pawn can take the white pawn en passant](/readme_images/enpassant1.png?raw=true "En passant capture")

![The black pawn has taken the white pawn en passant](/readme_images/enpassant2.png?raw=true "En passant capture")

The fazibear/colorize gem was used to color the board, cursor, and move highlighter.

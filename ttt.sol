pragma solidity ^0.4.0;

contract TicTacToe {

    address public player1_id;
    address public player2_id;

    uint public turn_number;
    uint public winner;

    byte[9] public tiles;
    //  0 | 1 | 2
    //  3 | 4 | 5
    //  6 | 7 | 8


    // Initialize the contract with player#2's ID and the first tile player#1 would like to take.
    constructor (address invitee, uint256 tile) public
    {
        // Set Winner to 0 as neither player 1 or player 2 has won.
        winner = 0;

        // Set Player IDs
        player1_id = msg.sender;
        player2_id = invitee;

        // Set Game Tiles to 2 (0x00 = empty, 0x01 = player 1, 0x02 = player 2)
        tiles[0] = 0x00;
        tiles[1] = 0x00;
        tiles[2] = 0x00;
        tiles[3] = 0x00;
        tiles[4] = 0x00;
        tiles[5] = 0x00;
        tiles[6] = 0x00;
        tiles[7] = 0x00;
        tiles[8] = 0x00;

        // Player 1 makes the first move and incriments the turn number
        tiles[tile] = 0x01;
        turn_number++;

    }

    function Set_Tile(uint tile) public {
      if (winner == 0) {                    // If there is not yet a winner.
        if (turn_number % 2 != 0) {         // If it's Player 2's turn
          if (msg.sender == player2_id) {   // If function called by Player 2
            if (tiles[tile] == 0x00) {      // If the requested tile has not been claimed
              tiles[tile] = 0x02;             // Set the tile and Check Win Condition
              Check_Horizontal(0x02);
              Check_Vertical(0x02);
              Check_Diaginal(0x02);
              turn_number++;                // Incriment the turn counter
            }
          }
        } else {                            // If it's Player 1's turn
          if (msg.sender == player1_id) {   // If function called by Player 1
            if (tiles[tile] == 0x00) {      // If the requested tile has not been claimed
              tiles[tile] = 0x01;             // Set the tile and Check Win Condition
              Check_Horizontal(0x01);
              Check_Vertical(0x01);
              Check_Diaginal(0x01);
              turn_number++;                // Incriment the turn counter
            }
          }
        }
      }
    }

    function Check_Horizontal(byte player_val) internal {

      //  0 | 1 | 2
      //  3 | 4 | 5
      //  6 | 7 | 8

      // Horizontal
      if (tiles[0] == player_val) {
        if (tiles[1] == player_val) {
          if (tiles[2] == player_val) {
            winner = uint(player_val); } } }
      if (tiles[3] == player_val) {
        if (tiles[4] == player_val) {
          if (tiles[5] == player_val) {
            winner = uint(player_val); } } }
      if (tiles[6] == player_val) {
        if (tiles[7] == player_val) {
          if (tiles[8] == player_val) {
            winner = uint(player_val); } } }

    }

    function Check_Vertical(byte player_val) internal {

      //  0 | 1 | 2
      //  3 | 4 | 5
      //  6 | 7 | 8

      // Vertical
      if (tiles[0] == player_val) {
        if (tiles[3] == player_val) {
          if (tiles[6] == player_val) {
            winner = uint(player_val); } } }
      if (tiles[1] == player_val) {
        if (tiles[4] == player_val) {
          if (tiles[7] == player_val) {
            winner = uint(player_val); } } }
      if (tiles[2] == player_val) {
        if (tiles[5] == player_val) {
          if (tiles[8] == player_val) {
            winner = uint(player_val); } } }

    }

    function Check_Diaginal(byte player_val) internal {

      //  0 | 1 | 2
      //  3 | 4 | 5
      //  6 | 7 | 8

      // Diaginal
      if (tiles[0] == player_val) {
        if (tiles[4] == player_val) {
          if (tiles[8] == player_val) {
            winner = uint(player_val); } } }
      if (tiles[2] == player_val) {
        if (tiles[4] == player_val) {
          if (tiles[6] == player_val) {
            winner = uint(player_val); } } }
    }

}

module overmind::bingo_core {
    use std::signer;
    use aptos_framework::account;
    use std::string::String;
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::coin;
    use std::vector;
    use aptos_std::simple_map::{Self, SimpleMap};
    use aptos_framework::timestamp;
    use std::option::Option;
    use std::option;
    use aptos_framework::account::SignerCapability;
    use aptos_framework::event::EventHandle;
    use overmind::bingo_events::{CreateGameEvent, InsertNumberEvent, JoinGameEvent, BingoEvent, CancelGameEvent};
    use aptos_framework::event;
    use overmind::bingo_events;
    #[test_only]
    use std::string;
    #[test_only]
    use aptos_framework::aptos_coin;

    ////////////
    // ERRORS //
    ////////////

    const SIGNER_NOT_ADMIN: u64 = 0;
    const INVALID_START_TIMESTAMP: u64 = 1;
    const BINGO_NOT_INITIALIZED: u64 = 2;
    const GAME_NAME_TAKEN: u64 = 3;
    const INVALID_NUMBER: u64 = 4;
    const GAME_DOES_NOT_EXIST: u64 = 5;
    const GAME_NOT_STARTED_YET: u64 = 6;
    const NUMBER_DUPLICATED: u64 = 7;
    const INVALID_AMOUNT_OF_COLUMNS_IN_PICKED_NUMBERS: u64 = 8;
    const INVALID_AMOUNT_OF_NUMBERS_IN_COLUMN: u64 = 9;
    const COLUMN_HAS_INVALID_NUMBER: u64 = 10;
    const GAME_ALREADY_STARTED: u64 = 11;
    const INSUFFICIENT_FUNDS: u64 = 12;
    const PLAYER_ALREADY_JOINED: u64 = 13;
    const GAME_HAS_ENDED: u64 = 14;
    const PLAYER_NOT_JOINED: u64 = 15;
    const PLAYER_HAVE_NOT_WON: u64 = 16;

    // Static seed
    const BINGO_SEED: vector<u8> = b"BINGO";

    /*
        Resource being stored in admin account. Holds address of bingo game's PDA account
    */
    struct State has key {
        // PDA address
        bingo: address
    }

    /*
        Resource holding data about on current and past games
    */
    struct Bingo has key {
        // List of games
        games: SimpleMap<String, Game>,
        // SignerCapability instance to recreate PDA's signer
        cap: SignerCapability,
        // Events
        create_game_events: EventHandle<CreateGameEvent>,
        cancel_game_events: EventHandle<CancelGameEvent>
    }

    /*
        Struct holding data about a single game
    */
    struct Game has store {
        // List of players participating in a game.
        // Every inner vector of the value represents a single column of a bingo sheet.
        players: SimpleMap<address, vector<vector<u8>>>,
        // Number of APT needed to participate in a game
        entry_fee: u64,
        // Timestamp of game's start
        start_timestamp: u64,
        // Numbers drawn by the admin for a game
        drawn_numbers: vector<u8>,
        // Boolean flag indicating if a game is ongoing or has finished
        is_finished: bool,
        // Events
        insert_number_events: EventHandle<InsertNumberEvent>,
        join_game_events: EventHandle<JoinGameEvent>,
        bingo_events: EventHandle<BingoEvent>
    }

    /*
        Initializes bingo
        @param admin - signer of the admin
    */
    public entry fun init(admin: &signer) {
        // TODO: Assert that the signer is the admin

        // TODO: Create a bingo resource account

        // TODO: Register the resource account with AptosCoin

        // TODO: Move State resource to the admin's address

        // TODO: Move Bingo resource to the resource account's address
    }

    /*
        Creates a new game of bingo
        @param admin - signer of the admin
        @param game_name - name of the game
        @param entry_fee - entry fee of the game
        @param start_timestamp - start timestamp of the game
    */
    public entry fun create_game(
        admin: &signer,
        game_name: String,
        entry_fee: u64,
        start_timestamp: u64
    ) acquires State, Bingo {
        // TODO: Assert that start timestamp is valid

        // TODO: Assert that bingo is initialized

        // TODO: Assert that the game name is not taken

        // TODO: Create a new Game instance

        // TODO: Add the game to the bingo's game list

        // TODO: Emit CreateGameEvent event
    }

    /*
        Adds a number drawn by the admin to the vector of drawn numbers for a provided game
        @param admin - signer of the admin
        @param game_name - name of the game
        @param number - number drawn by the admin
    */
    public entry fun insert_number(admin: &signer, game_name: String, number: u8) acquires State, Bingo {
        // TODO: Assert that the drawn number is valid

        // TODO: Assert that bingo is initialized

        // TODO: Assert that the game exists

        // TODO: Assert that the game already started

        // TODO: Assert that the drawn number is not a duplicate

        // TODO: Add the drawn number to game's drawn numbers

        // TODO: Emit InsertNumberEvent event
    }

    /*
        Adds the signer to the list of participants of the provided game
        @param player - player wanting to join to the game
        @param game_name - name of the game
        @param numbers - vector of numbers picked by the player
            (should be 5x5 accordingly to https://pl.wikipedia.org/wiki/Bingo#Plansze_do_Bingo)
    */
    public entry fun join_game(player: &signer, game_name: String, numbers: vector<vector<u8>>) acquires State, Bingo {
        // TODO: Assert that bingo is initialized

        // TODO: Assert that amount of picked numbers is correct

        // TODO: Assert that the numbers are picked in correct way

        // TODO: Assert that the game exists

        // TODO: Assert that the game has not started yet

        // TODO: Assert that the player has enough APT to join the game

        // TODO: Assert that the player has not joined the game yet

        // TODO: Add the player to the game's list of players

        // TODO: Transfer entry fee from the player to the bingo PDA

        // TODO: Emit JoinGameEvent event
    }

    /*
        Allows a player to declare bingo for provided game
        @param player - player participating in the game
        @param game_name - name of the game
    */
    public entry fun bingo(player: &signer, game_name: String) acquires State, Bingo {
        // TODO: Assert that bingo is initialized

        // TODO: Assert that the game exists

        // TODO: Assert that the game has not ended yet

        // TODO: Assert that the player joined the game

        // TODO: Assert that the player has bingo

        // TODO: Change the game's is_finished field's value to true

        // TODO: Transfer all players' entry fees to the winner

        // TODO: Emit BingoEvent event
    }

    /*
        Cancels an ongoing game
        @param admin - signer of the admin
        @param game_name - name of the game
    */
    public entry fun cancel_game(admin: &signer, game_name: String) acquires State, Bingo {
        // TODO: Assert that bingo is initialized

        // TODO: Assert that the game exists

        // TODO: Assert that the game has not finished yet

        // TODO: Change the game's is_finished field's value to true

        // TODO: Transfer the players' entry fees back to them

        // TODO: Emit CancelGameEvent event
    }

    /*
        Checks if a player has bingo in either column, row or diagonal
        @param drawn_numbers - numbers drawn by the admin
        @param player_numbers - numbers picked by the player
        @returns - true if the player has bingo, otherwise false
    */
    fun check_player_numbers(drawn_numbers: &vector<u8>, player_numbers: vector<vector<u8>>): bool {
        // TODO: Iterate through player's numbers and:
        //      1) If a number matches any number in the drawn numbers, then replace it with Option::None
        //      2) If a number is 0, then replace it with Option::None
        //      3) If a number does not match any number in the drawn numbers, then replace it with Option::Some

        // TODO: Call check_columns, check_diagonals and check_rows and return true if any of those returns true
    }

    /*
        Checks if a player has bingo in any column
        @param player_numbers - numbers picked by the player
        @returns - true if player has bingo in any column, otherwise false
    */
    inline fun check_columns(player_numbers: &vector<vector<Option<u8>>>): bool {
        // TODO: Return true if any column consists of Option::None only
    }

    /*
        Checks if a player has bingo in any row
        @param player_numbers - numbers picked by the player
        @returns - true if player has bingo in any row, otherwise false
    */
    inline fun check_rows(player_numbers: &vector<vector<Option<u8>>>): bool {
        // TODO: Return true if any row consists of Option::None only
    }

    /*
        Checks if a player has bingo in any diagonal
        @param player_numbers - numbers picked by the player
        @returns - true if player has bingo in any diagonal, otherwise false
    */
    inline fun check_diagonals(player_numbers: &vector<vector<Option<u8>>>): bool {
        // TODO: Return true if any diagonal consists of Option::None only
    }

    /////////////
    // ASSERTS //
    /////////////

    inline fun assert_admin(admin: address) {
        // TODO: Assert that the provided address is the admin address
    }

    inline fun assert_start_timestamp_is_valid(start_timestamp: u64) {
        // TODO: Assert that provided start timestamp is greater than current timestamp
    }

    inline fun assert_bingo_initialized(admin: address) acquires State {
        // TODO: Assert that the admin has State resource and bingo PDA has Bingo resource
    }

    inline fun assert_game_name_not_taken(games: &SimpleMap<String, Game>, game_name: &String) {
        // TODO: Assert that the games list does not contain the provided game name
    }

    inline fun assert_inserted_number_is_valid(number: u8) {
        // TODO: Assert that the number is in a range <1;75>
    }

    inline fun assert_game_exists(games: &SimpleMap<String, Game>, game_name: &String) {
        // TODO: Assert that the games list contains the provided game name
    }

    inline fun assert_game_already_stared(start_timestamp: u64) {
        // TODO: Assert that the provided start timestamp is smaller or equals current timestamp
    }

    inline fun assert_number_not_duplicated(numbers: &vector<u8>, number: &u8) {
        // TODO: Assert that the numbers vector does not contains the provided number
    }

    inline fun assert_correct_amount_of_picked_numbers(picked_numbers: &vector<vector<u8>>) {
        // TODO: Assert that the picked numbers is a 2D vector 5x5
    }

    inline fun assert_numbers_are_picked_correctly(picked_numbers: &vector<vector<u8>>) {
        // TODO: Assert that the numbers are picked correctly accordingily to the rules:
        //      1) The first column must consist of numbers from a range of <1; 15>
        //      2) The second column must consist of numbers from a range of <16; 30>
        //      3) The third column must consist of numbers from a range of <31; 45>
        //      4) The fourth column must consist of numbers from a range of <46; 60>
        //      5) The fifth column must consist of numbers from a range of <61; 75>
        //      6) The middle number of the third column must be 0
    }

    inline fun assert_game_not_started(start_timestamp: u64) {
        // TODO: Assert that the start timestamp is greater that the current timestamp
    }

    inline fun assert_suffiecient_funds_to_join(player: address, entry_fee: u64) {
        // TODO: Assert that the player has enough APT coins to participate in a game
    }

    inline fun assert_player_not_joined_yet(players: &SimpleMap<address, vector<vector<u8>>>, player: &address) {
        // TODO: Assert that the players list does not contain the player's address
    }

    inline fun assert_game_not_finished(is_finished: bool) {
        // TODO: Assert that the game has not ended yet
    }

    inline fun assert_player_joined(players: &SimpleMap<address, vector<vector<u8>>>, player: &address) {
        // TODO: Assert that the players list contains the player's address
    }

    inline fun assert_player_has_bingo(drawn_numbers: &vector<u8>, player_numbers: vector<vector<u8>>) {
        // TODO: Assert that the player has bingo by comparing their numbers with the drawn ones
    }

    ///////////
    // TESTS //
    ///////////

    #[test]
    fun test_init() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        assert!(exists<State>(@admin), 0);

        let state = borrow_global<State>(@admin);
        assert!(state.bingo == account::create_resource_address(&@admin, b"BINGO"), 1);
        assert!(coin::is_account_registered<AptosCoin>(state.bingo), 2);
        assert!(exists<Bingo>(state.bingo), 3);

        let bingo = borrow_global<Bingo>(state.bingo);
        assert!(simple_map::length(&bingo.games) == 0, 4);
        assert!(&bingo.cap == &account::create_test_signer_cap(state.bingo), 5);
        assert!(event::counter(&bingo.create_game_events) == 0, 6);
        assert!(event::counter(&bingo.cancel_game_events) == 0, 7);
    }

    #[test]
    #[expected_failure(abort_code = 0, location = Self)]
    fun test_init_signer_not_admin() {
        let user = account::create_account_for_test(@0xCAFE);
        init(&user);
    }

    #[test]
    fun test_create_game() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5648964;
        let start_timestamp = 555;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        let state = borrow_global<State>(@admin);
        let bingo = borrow_global<Bingo>(state.bingo);
        assert!(simple_map::length(&bingo.games) == 1, 0);
        assert!(simple_map::contains_key(&bingo.games, &game_name), 1);
        assert!(&bingo.cap == &account::create_test_signer_cap(state.bingo), 2);
        assert!(event::counter(&bingo.create_game_events) == 1, 3);
        assert!(event::counter(&bingo.cancel_game_events) == 0, 4);

        let game = simple_map::borrow(&bingo.games, &game_name);
        assert!(simple_map::length(&game.players) == 0, 5);
        assert!(game.entry_fee == entry_fee, 6);
        assert!(game.start_timestamp == start_timestamp, 7);
        assert!(vector::length(&game.drawn_numbers) == 0, 8);
        assert!(!game.is_finished, 9);
        assert!(event::counter(&game.insert_number_events) == 0, 10);
        assert!(event::counter(&game.join_game_events) == 0, 11);
        assert!(event::counter(&game.bingo_events) == 0, 12);
    }

    #[test]
    #[expected_failure(abort_code = 1, location = Self)]
    fun test_create_game_invalid_timestamp() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);
        timestamp::fast_forward_seconds(100);

        let admin = account::create_account_for_test(@admin);
        let game_name = string::utf8(b"The first game");
        let entry_fee = 5648964;
        let start_timestamp = 99;
        create_game(&admin, game_name, entry_fee, start_timestamp);
    }

    #[test]
    #[expected_failure(abort_code = 2, location = Self)]
    fun test_create_game_bingo_not_initialized() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        let game_name = string::utf8(b"The first game");
        let entry_fee = 5648964;
        let start_timestamp = 555;
        create_game(&admin, game_name, entry_fee, start_timestamp);
    }

    #[test]
    #[expected_failure(abort_code = 3, location = Self)]
    fun test_create_game_name_taken() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5648964;
        let start_timestamp = 555;
        create_game(&admin, game_name, entry_fee, start_timestamp);
        create_game(&admin, game_name, entry_fee, start_timestamp);
    }

    #[test]
    fun test_insert_number() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5648964;
        let start_timestamp = 555;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        timestamp::fast_forward_seconds(555);

        let number_drawn = 55;
        insert_number(&admin, game_name, number_drawn);

        let state = borrow_global<State>(@admin);
        let bingo = borrow_global<Bingo>(state.bingo);
        assert!(simple_map::length(&bingo.games) == 1, 0);
        assert!(simple_map::contains_key(&bingo.games, &game_name), 1);
        assert!(&bingo.cap == &account::create_test_signer_cap(state.bingo), 2);
        assert!(event::counter(&bingo.create_game_events) == 1, 3);
        assert!(event::counter(&bingo.cancel_game_events) == 0, 4);

        let game = simple_map::borrow(&bingo.games, &game_name);
        assert!(simple_map::length(&game.players) == 0, 5);
        assert!(game.entry_fee == entry_fee, 6);
        assert!(game.start_timestamp == start_timestamp, 7);
        assert!(vector::length(&game.drawn_numbers) == 1, 8);
        assert!(vector::contains(&game.drawn_numbers, &number_drawn), 9);
        assert!(!game.is_finished, 10);
        assert!(event::counter(&game.insert_number_events) == 1, 11);
        assert!(event::counter(&game.join_game_events) == 0, 12);
        assert!(event::counter(&game.bingo_events) == 0, 13);
    }

    #[test]
    #[expected_failure(abort_code = 4, location = Self)]
    fun test_insert_number_invalid() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        let game_name = string::utf8(b"The first game");
        let number_drawn = 99;
        insert_number(&admin, game_name, number_drawn);
    }

    #[test]
    #[expected_failure(abort_code = 2, location = Self)]
    fun test_insert_number_bingo_not_initialized() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        let game_name = string::utf8(b"The first game");
        let number_drawn = 55;
        insert_number(&admin, game_name, number_drawn);
    }

    #[test]
    #[expected_failure(abort_code = 5, location = Self)]
    fun test_insert_number_game_does_not_exist() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let number_drawn = 55;
        insert_number(&admin, game_name, number_drawn);
    }

    #[test]
    #[expected_failure(abort_code = 6, location = Self)]
    fun test_inser_number_game_not_started_yet() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5648964;
        let start_timestamp = 555;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        let game_name = string::utf8(b"The first game");
        let number_drawn = 55;
        insert_number(&admin, game_name, number_drawn);
    }

    #[test]
    #[expected_failure(abort_code = 7, location = Self)]
    fun test_insert_number_duplicated() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5648964;
        let start_timestamp = 555;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        timestamp::fast_forward_seconds(555);

        let number_drawn = 55;
        insert_number(&admin, game_name, number_drawn);
        insert_number(&admin, game_name, number_drawn);
    }

    #[test]
    fun test_join_game() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        let (burn_cap, mint_cap) =
            aptos_coin::initialize_for_test(&aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5648964;
        let start_timestamp = 555;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        let player = account::create_account_for_test(@0xCAFE);
        let numbers = vector[
            vector[1, 2, 5, 4, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        coin::register<AptosCoin>(&player);
        aptos_coin::mint(&aptos_framework, @0xCAFE, entry_fee + 1);
        join_game(&player, game_name, numbers);

        let state = borrow_global<State>(@admin);
        let bingo = borrow_global<Bingo>(state.bingo);
        assert!(simple_map::length(&bingo.games) == 1, 0);
        assert!(simple_map::contains_key(&bingo.games, &game_name), 1);
        assert!(&bingo.cap == &account::create_test_signer_cap(state.bingo), 2);
        assert!(event::counter(&bingo.create_game_events) == 1, 3);
        assert!(event::counter(&bingo.cancel_game_events) == 0, 4);

        let game = simple_map::borrow(&bingo.games, &game_name);
        assert!(simple_map::length(&game.players) == 1, 5);
        assert!(simple_map::contains_key(&game.players, &@0xCAFE), 6);
        assert!(simple_map::borrow(&game.players, &@0xCAFE) == &numbers, 7);
        assert!(game.entry_fee == entry_fee, 8);
        assert!(game.start_timestamp == start_timestamp, 9);
        assert!(vector::length(&game.drawn_numbers) == 0, 10);
        assert!(!game.is_finished, 11);
        assert!(event::counter(&game.insert_number_events) == 0, 12);
        assert!(event::counter(&game.join_game_events) == 1, 13);
        assert!(event::counter(&game.bingo_events) == 0, 14);
        assert!(coin::balance<AptosCoin>(@0xCAFE) == 1, 15);
        assert!(coin::balance<AptosCoin>(state.bingo) == entry_fee, 16);

        coin::destroy_burn_cap(burn_cap);
        coin::destroy_mint_cap(mint_cap);
    }

    #[test]
    #[expected_failure(abort_code = 2, location = Self)]
    fun test_join_game_bingo_not_initialized() acquires State, Bingo {
        let player = account::create_account_for_test(@0xCAFE);
        let game_name = string::utf8(b"The first game");
        let numbers = vector[
            vector[1, 2, 5, 4, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 41, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);
    }

    #[test]
    #[expected_failure(abort_code = 8, location = Self)]
    fun test_join_game_invalid_number_of_columns() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let player = account::create_account_for_test(@0xCAFE);
        let game_name = string::utf8(b"The first game");
        let numbers = vector[
            vector[1, 2, 5, 4, 8],
            vector[16, 17, 20, 19, 30],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);
    }

    #[test]
    #[expected_failure(abort_code = 9, location = Self)]
    fun test_join_game_invalid_amount_of_numbers_in_column() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let player = account::create_account_for_test(@0xCAFE);
        let game_name = string::utf8(b"The first game");
        let numbers = vector[
            vector[1, 2, 5, 4, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70]
        ];
        join_game(&player, game_name, numbers);
    }

    #[test]
    #[expected_failure(abort_code = 10, location = Self)]
    fun test_join_game_invalid_numbers_first_column() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let player = account::create_account_for_test(@0xCAFE);
        let game_name = string::utf8(b"The first game");
        let numbers = vector[
            vector[1, 2, 5, 16, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);
    }

    #[test]
    #[expected_failure(abort_code = 10, location = Self)]
    fun test_join_game_invalid_numbers_second_column() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let player = account::create_account_for_test(@0xCAFE);
        let game_name = string::utf8(b"The first game");
        let numbers = vector[
            vector[1, 2, 5, 11, 8],
            vector[16, 17, 44, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);
    }

    #[test]
    #[expected_failure(abort_code = 10, location = Self)]
    fun test_join_game_invalid_numbers_third_column() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let player = account::create_account_for_test(@0xCAFE);
        let game_name = string::utf8(b"The first game");
        let numbers = vector[
            vector[1, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 11, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);
    }

    #[test]
    #[expected_failure(abort_code = 10, location = Self)]
    fun test_join_game_invalid_numbers_fourth_column() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let player = account::create_account_for_test(@0xCAFE);
        let game_name = string::utf8(b"The first game");
        let numbers = vector[
            vector[1, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[5, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);
    }

    #[test]
    #[expected_failure(abort_code = 10, location = Self)]
    fun test_join_game_invalid_numbers_fifth_column() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let player = account::create_account_for_test(@0xCAFE);
        let game_name = string::utf8(b"The first game");
        let numbers = vector[
            vector[1, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 18]
        ];
        join_game(&player, game_name, numbers);
    }

    #[test]
    #[expected_failure(abort_code = 5, location = Self)]
    fun test_join_game_does_not_exist() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let player = account::create_account_for_test(@0xCAFE);
        let game_name = string::utf8(b"The first game");
        let numbers = vector[
            vector[1, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);
    }

    #[test]
    #[expected_failure(abort_code = 11, location = Self)]
    fun test_join_game_already_started() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5984255;
        let start_timestamp = 45462;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        timestamp::fast_forward_seconds(45462);

        let player = account::create_account_for_test(@0xCAFE);
        let numbers = vector[
            vector[1, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);
    }

    #[test]
    #[expected_failure(abort_code = 12, location = Self)]
    fun test_join_game_insufficient_funds() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);
        let (burn_cap, mint_cap) =
            aptos_coin::initialize_for_test(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5984255;
        let start_timestamp = 45462;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        let player = account::create_account_for_test(@0xCAFE);
        coin::register<AptosCoin>(&player);
        aptos_coin::mint(&aptos_framework, @0xCAFE, 44564);

        let numbers = vector[
            vector[1, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);

        coin::destroy_mint_cap(mint_cap);
        coin::destroy_burn_cap(burn_cap);
    }

    #[test]
    #[expected_failure(abort_code = 13, location = Self)]
    fun test_join_game_player_already_joined() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);
        let (burn_cap, mint_cap) =
            aptos_coin::initialize_for_test(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5984255;
        let start_timestamp = 45462;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        let player = account::create_account_for_test(@0xCAFE);
        coin::register<AptosCoin>(&player);
        aptos_coin::mint(&aptos_framework, @0xCAFE, 2 * entry_fee);

        let numbers = vector[
            vector[1, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);
        join_game(&player, game_name, numbers);

        coin::destroy_mint_cap(mint_cap);
        coin::destroy_burn_cap(burn_cap);
    }

    #[test]
    fun test_bingo() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);
        let (burn_cap, mint_cap) =
            aptos_coin::initialize_for_test(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5984255;
        let start_timestamp = 45462;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        let player = account::create_account_for_test(@0xCAFE);
        coin::register<AptosCoin>(&player);
        aptos_coin::mint(&aptos_framework, @0xCAFE, entry_fee);

        let numbers = vector[
            vector[1, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);

        let another_player = account::create_account_for_test(@0xACE);
        coin::register<AptosCoin>(&another_player);
        aptos_coin::mint(&aptos_framework, @0xACE, entry_fee);

        let another_numbers = vector[
            vector[3, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[33, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&another_player, game_name, another_numbers);

        timestamp::fast_forward_seconds(45462);

        let drawn_numbers = vector[1, 16, 31, 46, 66];
        vector::for_each_ref(&drawn_numbers, |number| {
            insert_number(&admin, game_name, *number);
        });

        bingo(&player, game_name);

        let state = borrow_global<State>(@admin);
        let bingo = borrow_global<Bingo>(state.bingo);
        assert!(simple_map::length(&bingo.games) == 1, 0);
        assert!(simple_map::contains_key(&bingo.games, &game_name), 1);
        assert!(&bingo.cap == &account::create_test_signer_cap(state.bingo), 2);
        assert!(event::counter(&bingo.create_game_events) == 1, 3);
        assert!(event::counter(&bingo.cancel_game_events) == 0, 4);

        let game = simple_map::borrow(&bingo.games, &game_name);
        assert!(simple_map::length(&game.players) == 2, 5);
        assert!(simple_map::contains_key(&game.players, &@0xCAFE), 6);
        assert!(simple_map::contains_key(&game.players, &@0xACE), 7);
        assert!(simple_map::borrow(&game.players, &@0xCAFE) == &numbers, 8);
        assert!(simple_map::borrow(&game.players, &@0xACE) == &another_numbers, 9);
        assert!(game.entry_fee == entry_fee, 10);
        assert!(game.start_timestamp == start_timestamp, 11);
        assert!(game.drawn_numbers == drawn_numbers, 12);
        assert!(game.is_finished, 13);
        assert!(event::counter(&game.insert_number_events) == 5, 14);
        assert!(event::counter(&game.join_game_events) == 2, 15);
        assert!(event::counter(&game.bingo_events) == 1, 16);
        assert!(coin::balance<AptosCoin>(state.bingo) == 0, 17);
        assert!(coin::balance<AptosCoin>(@0xACE) == 0, 18);
        assert!(coin::balance<AptosCoin>(@0xCAFE) == 2 * entry_fee, 19);

        coin::destroy_burn_cap(burn_cap);
        coin::destroy_mint_cap(mint_cap);
    }

    #[test]
    #[expected_failure(abort_code = 2, location = Self)]
    fun test_bingo_not_initialized() acquires State, Bingo {
        let player = account::create_account_for_test(@0xCAFE);
        let game_name = string::utf8(b"The first game");
        bingo(&player, game_name);
    }

    #[test]
    #[expected_failure(abort_code = 5, location = Self)]
    fun test_bingo_game_does_not_exist() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let player = account::create_account_for_test(@0xCAFE);
        let game_name = string::utf8(b"The first game");
        bingo(&player, game_name);
    }

    #[test]
    #[expected_failure(abort_code = 14, location = Self)]
    fun test_bingo_game_has_ended() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5984255;
        let start_timestamp = 45462;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        {
            let state = borrow_global<State>(@admin);
            let bingo = borrow_global_mut<Bingo>(state.bingo);
            let game = simple_map::borrow_mut(&mut bingo.games, &game_name);
            game.is_finished = true;
        };

        let player = account::create_account_for_test(@0xCAFE);
        bingo(&player, game_name);
    }

    #[test]
    #[expected_failure(abort_code = 15, location = Self)]
    fun test_bingo_player_not_joined() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5984255;
        let start_timestamp = 45462;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        let player = account::create_account_for_test(@0xCAFE);
        bingo(&player, game_name);
    }

    #[test]
    #[expected_failure(abort_code = 16, location = Self)]
    fun test_bingo_player_not_won() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);
        let (burn_cap, mint_cap) =
            aptos_coin::initialize_for_test(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5984255;
        let start_timestamp = 45462;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        let player = account::create_account_for_test(@0xCAFE);
        coin::register<AptosCoin>(&player);
        aptos_coin::mint(&aptos_framework, @0xCAFE, entry_fee);

        let numbers = vector[
            vector[1, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);
        bingo(&player, game_name);

        coin::destroy_mint_cap(mint_cap);
        coin::destroy_burn_cap(burn_cap);
    }

    #[test]
    fun test_cancel_game() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);
        let (burn_cap, mint_cap) =
            aptos_coin::initialize_for_test(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5984255;
        let start_timestamp = 45462;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        let player = account::create_account_for_test(@0xCAFE);
        coin::register<AptosCoin>(&player);
        aptos_coin::mint(&aptos_framework, @0xCAFE, entry_fee);

        let numbers = vector[
            vector[1, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[31, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&player, game_name, numbers);

        let another_player = account::create_account_for_test(@0xACE);
        coin::register<AptosCoin>(&another_player);
        aptos_coin::mint(&aptos_framework, @0xACE, entry_fee);

        let another_numbers = vector[
            vector[3, 2, 5, 10, 8],
            vector[16, 17, 20, 19, 30],
            vector[33, 45, 0, 42, 43],
            vector[46, 50, 54, 49, 55],
            vector[66, 61, 65, 70, 69]
        ];
        join_game(&another_player, game_name, another_numbers);

        cancel_game(&admin, game_name);

        let state = borrow_global<State>(@admin);
        let bingo = borrow_global<Bingo>(state.bingo);
        assert!(simple_map::length(&bingo.games) == 1, 0);
        assert!(simple_map::contains_key(&bingo.games, &game_name), 1);
        assert!(&bingo.cap == &account::create_test_signer_cap(state.bingo), 2);
        assert!(event::counter(&bingo.create_game_events) == 1, 3);
        assert!(event::counter(&bingo.cancel_game_events) == 1, 4);

        let game = simple_map::borrow(&bingo.games, &game_name);
        assert!(simple_map::length(&game.players) == 2, 5);
        assert!(simple_map::contains_key(&game.players, &@0xCAFE), 6);
        assert!(simple_map::contains_key(&game.players, &@0xACE), 7);
        assert!(simple_map::borrow(&game.players, &@0xCAFE) == &numbers, 8);
        assert!(simple_map::borrow(&game.players, &@0xACE) == &another_numbers, 9);
        assert!(game.entry_fee == entry_fee, 10);
        assert!(game.start_timestamp == start_timestamp, 11);
        assert!(vector::length(&game.drawn_numbers) == 0, 12);
        assert!(game.is_finished, 13);
        assert!(event::counter(&game.insert_number_events) == 0, 14);
        assert!(event::counter(&game.join_game_events) == 2, 15);
        assert!(event::counter(&game.bingo_events) == 0, 16);
        assert!(coin::balance<AptosCoin>(state.bingo) == 0, 17);
        assert!(coin::balance<AptosCoin>(@0xACE) == entry_fee, 18);
        assert!(coin::balance<AptosCoin>(@0xCAFE) == entry_fee, 19);

        coin::destroy_burn_cap(burn_cap);
        coin::destroy_mint_cap(mint_cap);
    }

    #[test]
    #[expected_failure(abort_code = 2, location = Self)]
    fun test_cancel_game_bingo_not_initialized() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        let game_name = string::utf8(b"The first game");
        cancel_game(&admin, game_name);
    }

    #[test]
    #[expected_failure(abort_code = 5, location = Self)]
    fun test_cancel_game_does_not_exist() acquires State, Bingo {
        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        cancel_game(&admin, game_name);
    }

    #[test]
    #[expected_failure(abort_code = 14, location = Self)]
    fun test_cancel_game_has_ended() acquires State, Bingo {
        let aptos_framework = account::create_account_for_test(@aptos_framework);
        timestamp::set_time_has_started_for_testing(&aptos_framework);

        let admin = account::create_account_for_test(@admin);
        init(&admin);

        let game_name = string::utf8(b"The first game");
        let entry_fee = 5984255;
        let start_timestamp = 45462;
        create_game(&admin, game_name, entry_fee, start_timestamp);

        let game_name = string::utf8(b"The first game");
        cancel_game(&admin, game_name);
        cancel_game(&admin, game_name);
    }

    #[test]
    fun test_check_player_numbers() {
        let drawn_numbers = vector[1, 2, 4, 6, 11];
        let player_numbers = vector[
            vector[1, 2, 4, 6, 11],
            vector[16, 18, 17, 25, 24],
            vector[31, 40, 0, 39, 44],
            vector[46, 50, 55, 59, 51],
            vector[61, 62, 75, 74, 70]
        ];
        assert!(check_player_numbers(&drawn_numbers, player_numbers), 0);

        let drawn_numbers = vector[4, 17, 55, 75];
        let player_numbers = vector[
            vector[1, 2, 4, 6, 11],
            vector[16, 18, 17, 25, 24],
            vector[31, 40, 0, 39, 44],
            vector[46, 50, 55, 59, 51],
            vector[61, 62, 75, 74, 70]
        ];
        assert!(check_player_numbers(&drawn_numbers, player_numbers), 1);

        let drawn_numbers = vector[61, 50, 25, 11];
        let player_numbers = vector[
            vector[1, 2, 4, 6, 11],
            vector[16, 18, 17, 25, 24],
            vector[31, 40, 0, 39, 44],
            vector[46, 50, 55, 59, 51],
            vector[61, 62, 75, 74, 70]
        ];
        assert!(check_player_numbers(&drawn_numbers, player_numbers), 2);

        let drawn_numbers = vector[61, 50, 24, 11];
        let player_numbers = vector[
            vector[1, 2, 4, 6, 11],
            vector[16, 18, 17, 25, 24],
            vector[31, 40, 0, 39, 44],
            vector[46, 50, 55, 59, 51],
            vector[61, 62, 75, 74, 70]
        ];
        assert!(!check_player_numbers(&drawn_numbers, player_numbers), 3);
    }

    #[test]
    fun test_check_diagonals() {
        let numbers_fist_diagonal = vector[
            vector[option::none(), option::some(12), option::some(4), option::some(8), option::some(11)],
            vector[option::some(16), option::none(), option::some(21), option::some(17), option::some(26)],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::some(51), option::some(49), option::none(), option::some(52)],
            vector[option::some(63), option::some(61), option::some(70), option::some(74), option::none()],
        ];
        assert!(check_diagonals(&numbers_fist_diagonal), 0);

        let numbers_second_diagonal = vector[
            vector[option::some(11), option::some(12), option::some(4), option::some(8), option::none()],
            vector[option::some(16), option::some(17), option::some(21), option::none(), option::some(26)],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::none(), option::some(49), option::some(51), option::some(52)],
            vector[option::none(), option::some(61), option::some(70), option::some(74), option::some(63)],
        ];
        assert!(check_diagonals(&numbers_second_diagonal), 1);

        let numbers_both_diagonals = vector[
            vector[option::none(), option::some(12), option::some(4), option::some(8), option::none()],
            vector[option::some(16), option::none(), option::some(21), option::none(), option::some(26)],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::none(), option::some(49), option::none(), option::some(52)],
            vector[option::none(), option::some(61), option::some(70), option::some(74), option::none()],
        ];
        assert!(check_diagonals(&numbers_both_diagonals), 2);

        let numbers_random_pattern = vector[
            vector[option::some(11), option::some(12), option::some(4), option::some(8), option::none()],
            vector[option::some(16), option::none(), option::some(21), option::none(), option::some(26)],
            vector[option::none(), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::none(), option::some(49), option::some(51), option::some(52)],
            vector[option::some(71), option::some(61), option::none(), option::some(74), option::some(63)],
        ];
        assert!(!check_diagonals(&numbers_random_pattern), 3);

        let all_numbers = vector[
            vector[option::some(1), option::some(12), option::some(4), option::some(8), option::some(11)],
            vector[option::some(16), option::some(18), option::some(21), option::some(17), option::some(26)],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::some(51), option::some(49), option::some(50), option::some(52)],
            vector[option::some(63), option::some(61), option::some(70), option::some(74), option::some(75)],
        ];
        assert!(!check_diagonals(&all_numbers), 4);
    }

    #[test]
    fun test_check_columns() {
        let first_column = vector[
            vector[option::none(), option::none(), option::none(), option::none(), option::none()],
            vector[option::some(16), option::some(18), option::some(21), option::some(17), option::some(26)],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::some(51), option::some(49), option::some(50), option::some(52)],
            vector[option::some(63), option::some(61), option::some(70), option::some(74), option::some(75)],
        ];
        assert!(check_columns(&first_column), 0);

        let second_column = vector[
            vector[option::some(1), option::some(12), option::some(4), option::some(8), option::some(11)],
            vector[option::none(), option::none(), option::none(), option::none(), option::none()],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::some(51), option::some(49), option::some(50), option::some(52)],
            vector[option::some(63), option::some(61), option::some(70), option::some(74), option::some(75)],
        ];
        assert!(check_columns(&second_column), 1);

        let third_column = vector[
            vector[option::some(1), option::some(12), option::some(4), option::some(8), option::some(11)],
            vector[option::some(16), option::some(18), option::some(21), option::some(17), option::some(26)],
            vector[option::none(), option::none(), option::none(), option::none(), option::none()],
            vector[option::some(46), option::some(51), option::some(49), option::some(50), option::some(52)],
            vector[option::some(63), option::some(61), option::some(70), option::some(74), option::some(75)],
        ];
        assert!(check_columns(&third_column), 2);

        let fourth_column = vector[
            vector[option::some(1), option::some(12), option::some(4), option::some(8), option::some(11)],
            vector[option::some(16), option::some(18), option::some(21), option::some(17), option::some(26)],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::none(), option::none(), option::none(), option::none(), option::none()],
            vector[option::some(63), option::some(61), option::some(70), option::some(74), option::some(75)],
        ];
        assert!(check_columns(&fourth_column), 3);

        let fifth_column = vector[
            vector[option::some(1), option::some(12), option::some(4), option::some(8), option::some(11)],
            vector[option::some(16), option::some(18), option::some(21), option::some(17), option::some(26)],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::some(51), option::some(49), option::some(50), option::some(52)],
            vector[option::none(), option::none(), option::none(), option::none(), option::none()],
        ];
        assert!(check_columns(&fifth_column), 4);

        let numbers_random_pattern = vector[
            vector[option::some(11), option::some(12), option::some(4), option::some(8), option::none()],
            vector[option::some(16), option::none(), option::some(21), option::none(), option::some(26)],
            vector[option::none(), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::none(), option::some(49), option::some(51), option::some(52)],
            vector[option::some(71), option::some(61), option::none(), option::some(74), option::some(63)],
        ];
        assert!(!check_columns(&numbers_random_pattern), 5);

        let all_numbers = vector[
            vector[option::some(1), option::some(12), option::some(4), option::some(8), option::some(11)],
            vector[option::some(16), option::some(18), option::some(21), option::some(17), option::some(26)],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::some(51), option::some(49), option::some(50), option::some(52)],
            vector[option::some(63), option::some(61), option::some(70), option::some(74), option::some(75)],
        ];
        assert!(!check_columns(&all_numbers), 6);
    }

    #[test]
    fun test_check_rows() {
        let first_row = vector[
            vector[option::none(), option::some(12), option::some(4), option::some(8), option::some(11)],
            vector[option::none(), option::some(18), option::some(21), option::some(17), option::some(26)],
            vector[option::none(), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::none(), option::some(51), option::some(49), option::some(50), option::some(52)],
            vector[option::none(), option::some(61), option::some(70), option::some(74), option::some(75)],
        ];
        assert!(check_rows(&first_row), 0);

        let second_row = vector[
            vector[option::some(1), option::none(), option::some(4), option::some(8), option::some(11)],
            vector[option::some(16), option::none(), option::some(21), option::some(17), option::some(26)],
            vector[option::some(31), option::none(), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::none(), option::some(49), option::some(50), option::some(52)],
            vector[option::some(63), option::none(), option::some(70), option::some(74), option::some(75)],
        ];
        assert!(check_rows(&second_row), 1);

        let third_row = vector[
            vector[option::some(1), option::some(12), option::none(), option::some(8), option::some(11)],
            vector[option::some(16), option::some(18), option::none(), option::some(17), option::some(26)],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::some(51), option::none(), option::some(50), option::some(52)],
            vector[option::some(63), option::some(61), option::none(), option::some(74), option::some(75)],
        ];
        assert!(check_rows(&third_row), 2);

        let fourth_row = vector[
            vector[option::some(1), option::some(12), option::some(4), option::none(), option::some(11)],
            vector[option::some(16), option::some(18), option::some(21), option::none(), option::some(26)],
            vector[option::some(31), option::some(32), option::none(), option::none(), option::some(41)],
            vector[option::some(46), option::some(51), option::some(49), option::none(), option::some(52)],
            vector[option::some(63), option::some(61), option::some(70), option::none(), option::some(75)],
        ];
        assert!(check_rows(&fourth_row), 3);

        let fifth_row = vector[
            vector[option::some(1), option::some(12), option::some(4), option::some(8), option::none()],
            vector[option::some(16), option::some(18), option::some(21), option::some(17), option::none()],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::none()],
            vector[option::some(46), option::some(51), option::some(49), option::some(50), option::none()],
            vector[option::some(63), option::some(61), option::some(70), option::some(74), option::none()],
        ];
        assert!(check_rows(&fifth_row), 4);

        let numbers_random_pattern = vector[
            vector[option::some(11), option::some(12), option::some(4), option::some(8), option::none()],
            vector[option::some(16), option::none(), option::some(21), option::none(), option::some(26)],
            vector[option::none(), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::none(), option::some(49), option::some(51), option::some(52)],
            vector[option::some(71), option::some(61), option::none(), option::some(74), option::some(63)],
        ];
        assert!(!check_rows(&numbers_random_pattern), 5);

        let all_numbers = vector[
            vector[option::some(1), option::some(12), option::some(4), option::some(8), option::some(11)],
            vector[option::some(16), option::some(18), option::some(21), option::some(17), option::some(26)],
            vector[option::some(31), option::some(32), option::none(), option::some(44), option::some(41)],
            vector[option::some(46), option::some(51), option::some(49), option::some(50), option::some(52)],
            vector[option::some(63), option::some(61), option::some(70), option::some(74), option::some(75)],
        ];
        assert!(!check_rows(&all_numbers), 6);
    }
}

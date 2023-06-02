module overmind::bingo_events {
    use std::string::String;

    struct CreateGameEvent has store, drop {
        game_name: String,
        entry_fee: u64,
        start_timestamp: u64,
        timestamp: u64
    }

    struct InsertNumberEvent has store, drop {
        game_name: String,
        number: u8,
        timestamp: u64
    }

    struct JoinGameEvent has store, drop {
        game_name: String,
        player: address,
        numbers: vector<vector<u8>>,
        timestamp: u64
    }

    struct BingoEvent has store, drop {
        game_name: String,
        player: address,
        timestamp: u64
    }

    struct CancelGameEvent has store, drop {
        game_name: String,
        timestamp: u64
    }

    public fun new_create_game_event(
        game_name: String,
        entry_fee: u64,
        start_timestamp: u64,
        timestamp: u64
    ): CreateGameEvent {
        CreateGameEvent { game_name, entry_fee, start_timestamp, timestamp }
    }

    public fun new_inser_number_event(game_name: String, number: u8, timestamp: u64): InsertNumberEvent {
        InsertNumberEvent { game_name, number, timestamp }
    }

    public fun new_join_game_event(
        game_name: String,
        player: address,
        numbers: vector<vector<u8>>,
        timestamp: u64
    ): JoinGameEvent {
        JoinGameEvent { game_name, player, numbers, timestamp }
    }

    public fun new_bingo_event(game_name: String, player: address, timestamp: u64): BingoEvent {
        BingoEvent { game_name, player, timestamp }
    }

    public fun new_cance_game_event(game_name: String, timestamp: u64): CancelGameEvent {
        CancelGameEvent { game_name, timestamp }
    }
}

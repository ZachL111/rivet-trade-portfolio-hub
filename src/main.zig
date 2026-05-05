const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 177;
const risk_penalty: i32 = 4;
const latency_penalty: i32 = 4;
const weight_bonus: i32 = 5;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 81, .capacity = 105, .latency = 8, .risk = 11, .weight = 7 };
    try std.testing.expectEqual(@as(i32, 226), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "accept"));
    const signal_case_2 = Signal{ .demand = 81, .capacity = 100, .latency = 13, .risk = 17, .weight = 4 };
    try std.testing.expectEqual(@as(i32, 162), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "review"));
    const signal_case_3 = Signal{ .demand = 70, .capacity = 90, .latency = 21, .risk = 9, .weight = 6 };
    try std.testing.expectEqual(@as(i32, 140), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "review"));
}

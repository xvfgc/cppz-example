const std = @import("std");
const c = @import("cppz");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    const xx = c.zadd(3, 2);
    std.debug.print("{}\n", .{xx});
}

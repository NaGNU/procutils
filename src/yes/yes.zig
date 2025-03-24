const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer allocator.free(args);

    var output: []const u8 = undefined;

    if (args.len > 1) {
        output = args[1];
    } else {
        output = "y";
    }

    while (true) {
        try std.io.getStdOut().writer().print("{s}\n", .{output});
    }

    try std.io.getStdOut().writer().print("{s}\n", .{output});
}

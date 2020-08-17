#include <string>
#include <unordered_map>

std::unordered_map<std::string, std::string> PEALUMAP = {
    {"nop", "5'd0"},     {"sadd", "5'd1"},
    {"mul", "5'd2"},          {"add", "5'd3"},
    {"sub", "5'd4"},          {"less_than", "5'd5"},
    {"less_than_equal", "5'd6"},{"equal", "5'd7"},        
    {"mac", "5'd8"},           {"bit_and", "5'd9"},  
    {"bit_or", "5'd10"},       {"bit_not", "5'd11"},
    {"bit_xor", "5'd12"},      {"mux", "5'd13"},
    {"left_shift", "5'd14"},   {"right_shift", "5'd15"},
    {"logic_and", "5'd16"},    {"logic_or", "5'd17"},
    {"logic_not", "5'd18"},    {"great_than", "5'd19"},
    {"great_than_equal", "5'd20"},{"not_equal", "5'd21"},
    /**
     * 为支持之前的配置字
     */
    {"lt", "5'd5"},{"eq", "5'd7"},{"hlt", "5'd5"},
};
std::unordered_map<std::string, std::string> PEBUF02CFGMAP = {
    {"buffer", "0"}, {"keep", "1"}, {"null", "0"}, {"in0", "1"}, {"in2", "1"}};
std::unordered_map<std::string, std::string> PEBUF1CFGMAP = {
    {"null", "00"}, {"in1", "01"}, {"aluin1", "10"}, {"in0in1", "11"}};
std::unordered_map<std::string, std::string> PEBUFMODE   = {{"buffer", "0"}, {"keep", "1"}};
std::unordered_map<std::string, std::string> PEBUFBYPASS = {
    {"inbuffer", "0"}, {"outbuffer", "0"}, {"bypass", "1"}};
std::unordered_map<std::string, std::string> PECTRMAP = {
    {"null", "4'd0"},       {"inner_loop", "4'd1"},      {"outermost_loop", "4'd2"},
    {"last_match0", "4'd3"},     {"last_match1", "4'd4"},     {"break_gen", "4'd5"},
    {"break_pre", "4'd6"},       {"break_post", "4'd7"},      {"systolic", "4'd8"},
    {"inner_loop_sync", "4'd9"}, {"inner_loop_ini", "4'd10"}, {"inner_loop_ini_sync", "4'd11"},
    {"trans", "4'd12"}};
std::unordered_map<std::string, std::string> BRANCHCONTROL = {
    {"null", "2'd0"}, {"cb", "2'd1"}, {"cinvb", "2'd2"}, {"merge", "2'd3"}};
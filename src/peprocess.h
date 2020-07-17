#pragma once

#include <iostream>
#include <string>

using namespace std;

struct PEBPPORT
{
    int peIndex;
    int pePort;
};

class PEPROCESS {
    // PE_Configure={
    //        1'b0,       inport0_valid
    //        5'd3,       alu
    //        3'b010,     buf_mode
    //        4'b1010,    buf_from
    //        2'b00,      buf_bypass
    //        1'b0,       outmode
    //        4'b0000,    loop_control
    //        2'b00       branch_control
    //        };
public:
    PEPROCESS();
//    PEPROCESS(int index, string config,int* inport, PEBPPORT bpFrom,int fanOut);
    ~PEPROCESS();

public:
    void pePortCout();
    void peInstantiateCout();
    void peConfigCout();
    
public:
    int _index;
    string _config;
    int _inport[3] = {-1,-1,-1};
    PEBPPORT _bpFrom[8] = { {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0}, {-1, 0} };
    int _fanOut;
};
#pragma once

#include<stdio.h>
#include<string>
#include "enum_define.h"
class NodeTypeConverter
{
public:
    static auto toString(NodeType type_)->string
    {
        if (type_ == NodeType::pe)
            return "pe";
        if (type_ == NodeType::fifo)
            return "fifo";
        if (type_ == NodeType::fg)
            return "fg";
        if (type_ == NodeType::ls)
            return "ls";
        if (type_ == NodeType::lv)
            return "lv";
        if (type_ == NodeType::lc)
            return "lc";
        if (type_ == NodeType::bus)
            return "bus";
        if (type_ == NodeType::null)
            return "null";
        if (type_ == NodeType::begin)
            return "begin";
        return "";
    }

    static auto toEnum(string s_)->NodeType
    {
        if (s_ == "pe")
            return NodeType::pe;
        if (s_ == "fifo")
            return NodeType::fifo;
        if (s_ == "fg")
            return NodeType::fg;
        if (s_ == "ls")
            return NodeType::ls;
        if (s_ == "bus")
            return NodeType::bus;
        if (s_ == "lv")
            return NodeType::lv;
        if (s_ == "lc")
            return NodeType::lc;
        if (s_ == "null")
            return NodeType::null;
        if (s_ == "begin")
            return NodeType::begin;
        return NodeType::null;
    }
};

/*class PeConfigConverter
{
public:
    static auto toString(NodeType type_)->string
    {
        if (s_ == NodeType::pe)
            return "pe";
        if (s_ == NodeType::fifo)
            return "pe";
        if (s_ == NodeType::fg)
            return "pe";
        if (s_ == NodeType::ls)
            return "pe";
        if (s_ == NodeType::lv)
            return "pe";
        if (s_ == NodeType::lc)
            return "pe";
        if (s_ == NodeType::bus)
            return "pe";
        if (s_ == NodeType::null)
            return "pe";
        if (s_ == NodeType::begin)
            return "pe";
        return "";
    }

    static auto toEnum(string s_)->NodeType
    {
        if (s_ == "pe")
            return NodeType::pe;
        if (s_ == "fifo")
            return NodeType::fifo;
        if (s_ == "fg")
            return NodeType::fg;
        if (s_ == "ls")
            return NodeType::ls;
        if (s_ == "bus")
            return NodeType::bus;
        if (s_ == "lv")
            return NodeType::lv;
        if (s_ == "lc")
            return NodeType::lc;
        if (s_ == "null")
            return NodeType::null;
        if (s_ == "begin")
            return NodeType::begin;
        return NodeType::null;
    }
};*/
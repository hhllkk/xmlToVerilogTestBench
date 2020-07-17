 #pragma once

#include "../lib/tinyxml2/tinyxml2.h"

    enum class NodeType
    {
        /** real node */
        pe,
        fg,
        ls,
        lv,
        lc,
        /** functional node */
        null,
        begin,
        bus,
        fifo
    };
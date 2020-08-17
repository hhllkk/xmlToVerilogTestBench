#include <fstream> 
#include "peprocess.h"
#include "filedefine.h"



PEPROCESS::PEPROCESS() {
    _index     = 0;
    _config    = "{}";

    _fanOut    = 0;
};

PEPROCESS::~PEPROCESS(){};
void PEPROCESS::pePortCout(){
    ofstream ofs;
    ofs.open(OUTPUTADDR, ios::app);
    ofs<<"//pe"<<_index<<"输出端口定义"<<endl;
    if (_outloop)
    {
        ofs<<"  reg  [35:0]    PE"<<_index<<"_Inport1;"<<endl;
    }
    ofs<<"  reg  [32:0]    PE"<<_index<<"_Configure_Inport;"<<endl;
    ofs<<"  wire [35:0]    PE"<<_index<<"_Outport0;"<<endl;
    ofs<<"  wire Pre_PE"<<_index<<"_Bp0;"<<endl;
    ofs<<"  wire Pre_PE"<<_index<<"_Bp1;"<<endl;
    ofs<<"  wire Pre_PE"<<_index<<"_Bp2;"<<endl;   
    ofs<<"//end pe"<<_index<<" 端口定义"<<endl;
    ofs<<endl;
    ofs.close();
 
}
void PEPROCESS::peInstantiateCout(){
    ofstream ofs;
    ofs.open(OUTPUTADDR, ios::app);
    ofs<<"//pe"<<_index<<"例化"<<endl;
    ofs<<"PE_top"<<"  "<<"pe"<<_index<<"_top"<<"("<<endl;
    ofs<<"    .clk(clk),"<<endl;
    ofs<<"    .reset(rst),"<<endl;
    
    for (int i = 0; i < 3; ++i)
    {
        if (_outloop&&i==1)
        {
           ofs<<"    .PE_Inport1(PE"<<_index<<"_Inport1),"<<endl;
        }else if (_inport[i]==-1)
        {
            ofs<<"    .PE_Inport"<<i<<"(36'b0),"<<endl;
        }else{
            ofs<<"    .PE_Inport"<<i<<"(PE"<<_inport[i]<<"_Outport0),"<<endl;
        }
        
    }
    ofs<<"    .PE_Bus_Port0(4'b0),"<<endl;

    for (int i = 0; i < 8; ++i)
    {
        if (_bpFrom[i].peIndex==-1)
        {
            ofs<<"    .Post_PE_Bp"<<i<<"(1'b1),"<<endl;
        }else{
            ofs<<"    .Post_PE_Bp"<<i<<"(Pre_PE"<<_bpFrom[i].peIndex<<"_Bp"<<_bpFrom[i].pePort<<"),"<<endl;
        }
        
    }

    ofs<<"    .PE_Configure_Inport(PE"<<_index<<"_Configure_Inport),"<<endl;

    ofs<<"    .PE_Outport0(PE"<<_index<<"_Outport0),"<<endl;
    ofs<<"    .Pre_PE_Bp0(Pre_PE"<<_index<<"_Bp0),"<<endl;
    ofs<<"    .Pre_PE_Bp1(Pre_PE"<<_index<<"_Bp1),"<<endl;
    ofs<<"    .Pre_PE_Bp2(Pre_PE"<<_index<<"_Bp2)"<<endl;
    ofs<<");"<<endl;
    ofs<<"//end pe"<<_index<<" 例化"<<endl;
    ofs<<"    "<<endl;  
    ofs.close();
};

void PEPROCESS::peConfigCout(){
    ofstream ofs;
    ofs.open(OUTPUTADDR, ios::app);
    ofs<<"    PE"<<_index<<"_Configure_Inport <="<<_config<<";"<<endl;
    ofs.close();
}
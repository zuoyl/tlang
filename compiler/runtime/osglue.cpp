//
// osglue.cpp
//  A toyable language compiler (like a simple c++)

#include "tlang/compiler/runtime/osglue.h"

using namespace tlang;

void os::getWorkPath(string &path)
{
}

bool os::isFolderExist(const string &folder)
{
    return true; 
}

bool os::isFilesExist(const string &fullPathFile) 
{
    return true;
}

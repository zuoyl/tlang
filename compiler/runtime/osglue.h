//
//  osglue.h
//  A toyable language compiler (like a simple c++)
//

#ifndef __TL_OSGLUE_H__
#define __TL_OSGLUE_H__

#include "tlang/compiler/common.h"

namespace tlang {
    namespace os {
        bool isFilesExist(const string &fullPathFile);
        bool isFolderExist(const string &folder);
        void getWorkPath(string &path);
    } // namespace os

} // namespace tlang 
#endif // __TL_OSGLUE_H__ 

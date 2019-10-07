
/*
 * pwn - implements a system library to suc`klessly print current dir. It PWNs!1
 * a C++ reimplementation of 'pwd'
 */

#include <iostream>
#include <experimental/filesystem>
#include <string>
#include <algorithm>
using namespace std;
namespace fs = std::experimental::filesystem;
int main(int argc, char *argv[]) {
	string s = fs::current_path();
	s.erase(
    		remove( s.begin(), s.end(), '\"' ),
    	s.end()
   	 );
	cout << s << endl;
	return 0;
}


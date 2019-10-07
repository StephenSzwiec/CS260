
//This program created by Stephen Szwiec [stephen.szwiec@ndus.edu]

/*
* see - read from standard input and SEE what it writes to standard output and files
* a C++ reimplementation of 'tee'
*/

#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char * argv[]) {
	string curLine;
	if (argc == 1){
		while(getline(cin,curLine)) {
				cout << curLine << endl;
			}
	}


	if (argc >= 2){
		ofstream afile;
		while(getline(std::cin,curLine)) {
			std::cout << curLine << endl;
			for(int i = 1; i < argc; i++){
				afile.open(argv[i],fstream::app);
				afile << curLine << endl;
				afile.close();
			}
		}
	}
	return 0;
}

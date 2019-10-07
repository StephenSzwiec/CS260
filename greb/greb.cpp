#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char * argv[]) {
	string curLine;
	if (argc == 2){
		while(getline(cin,curLine)) {
			if (curLine.find(argv[1]) != string::npos) {
				cout << curLine << endl;
			}
		}
	}

	else if (argc == 3){
		ifstream inFile(argv[2], ifstream::in);

		while(getline(inFile,curLine)) {
			if (curLine.find(argv[1]) != string::npos) {
				cout << curLine << endl;
			}
		}
	}
	else {
		cerr << "Error: unknown parameters." << endl;
		return 1;
	}
	return 0;
}

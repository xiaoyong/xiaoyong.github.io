#include <iostream>
#include <cstdlib>

int fibonacci(int i) {
	if (i <= 1) {
		return i;
	} else {
		return fibonacci(i-1) + fibonacci(i-2);
	}
}

int main(int argc, char* argv[]) {
	if (argc < 2) {
		std::cerr << "Usage: " << argv[0] << " number" << std::endl;
	} else {
		int n = atoi(argv[1]);
		std::cout << "F(" << n << ") = " << fibonacci(n) << std::endl;
	}
	return 0;
}

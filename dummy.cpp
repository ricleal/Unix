/*
 * dummy.cpp
 *
 *  Created on: 1 Dec 2013
 *      Author: leal
 *
 *
 *
 *      Reads from stdin and prints to stdout
 */

#include <stdlib.h>
#include <signal.h>
#include <iostream>

/**
 * Define the function to be called when ctrl-c (SIGINT)
 *  signal is sent to process
 */
void signal_callback_handler(int signum) {
	std::cout << "Caught signal : " << signum << std::endl;
	exit(signum);
}

int main(int argc, char *argv[]) {

	// Register signal and signal handler
	signal(SIGINT, signal_callback_handler);

	std::string line;
	while (std::getline(std::cin, line)) {
		std::cout << "\t" << line << std::endl;
	}

	return EXIT_SUCCESS;
}


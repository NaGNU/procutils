/* NaGNU/muname 
 * main.c
 * Maksim Yarovoy 
 * 24.03.2025
 * NaGNU License
 */


#include <iostream>
#include <fstream>
#include <cstring>
#include <unistd.h>
#include <sys/utsname.h>
#include <getopt.h>
#include <cstdlib>

std::string get_operating_system() {
    std::ifstream os_release("/etc/os-release");
    if (os_release) {
        std::string line;
        while (std::getline(os_release, line)) {
            if (line.find("PRETTY_NAME=") == 0) {
                size_t start = line.find("\"");
                size_t end = line.rfind("\"");
                if (start != std::string::npos && end != std::string::npos && start < end) {
                    return line.substr(start + 1, end - start - 1);
                }
            }
        }
    }

    #ifdef __APPLE__
        return "macOS";
    #elif defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__NetBSD__)
        return "BSD";
    #elif defined(__linux__)
        return "Linux";
    #elif defined(_WIN32)
        return "Windows";
    #else
        return "Unknown OS";
    #endif
}

void print_help() {
    std::cout << "Usage: muname [OPTION]...\n"
              << "print certain system information.\n\n"
              << "  -a, --all                print all information\n"
              << "  -s, --sysname            print the system name\n"
              << "  -n, --nodename           print the node name\n"
              << "  -r, --release            print the system release\n"
              << "  -v, --version            print the version\n"
              << "  -m, --machine            print the machine hardware name\n"
              << "  -p, --processor          print the processor type\n"
              << "  -i, --hardware-platform  print the hardware platform\n"
              << "  -o, --operating-system   print the operating system\n"
              << "  -h, --help               display this help and exit\n";
}

int main(int argc, char *argv[]) {
    struct utsname buffer;
    if (uname(&buffer) != 0) {
        std::cerr << "!!! unable to retrieve system information" << std::endl;
        return 1;
    }

    bool show_all = false;
    bool show_sysname = false;
    bool show_nodename = false;
    bool show_release = false;
    bool show_version = false;
    bool show_machine = false;
    bool show_processor = false;
    bool show_hw_platform = false;
    bool show_operating_system = false;

    int option;
    static struct option long_options[] = {
        {"all", no_argument, nullptr, 'a'},
        {"sysname", no_argument, nullptr, 's'},
        {"nodename", no_argument, nullptr, 'n'},
        {"release", no_argument, nullptr, 'r'},
        {"version", no_argument, nullptr, 'v'},
        {"machine", no_argument, nullptr, 'm'},
        {"processor", no_argument, nullptr, 'p'},
        {"hardware-platform", no_argument, nullptr, 'i'},
        {"operating-system", no_argument, nullptr, 'o'},
        {"help", no_argument, nullptr, 'h'},
        {nullptr, 0, nullptr, 0}
    };

    while ((option = getopt_long(argc, argv, "asnrvmpioh", long_options, nullptr)) != -1) {
        switch (option) {
            case 'a':
                show_all = true;
                break;
            case 's':
                show_sysname = true;
                break;
            case 'n':
                show_nodename = true;
                break;
            case 'r':
                show_release = true;
                break;
            case 'v':
                show_version = true;
                break;
            case 'm':
                show_machine = true;
                break;
            case 'p':
                show_processor = true;
                break;
            case 'i':
                show_hw_platform = true;
                break;
            case 'o':
                show_operating_system = true;
                break;
            case 'h':
                print_help();
                return 0;
            default:
                print_help();
                return 1;
        }
    }

    if (show_all || argc == 1) {
        std::cout << buffer.sysname << " ";
        std::cout << buffer.nodename << " ";
        std::cout << buffer.release << " ";
        std::cout << buffer.version << " ";
        std::cout << buffer.machine << " ";
        std::cout << get_operating_system() << std::endl;
    } else {
        if (show_sysname) std::cout << buffer.sysname << std::endl;
        if (show_nodename) std::cout << buffer.nodename << std::endl;
        if (show_release) std::cout << buffer.release << std::endl;
        if (show_version) std::cout << buffer.version << std::endl;
        if (show_machine) std::cout << buffer.machine << std::endl;
        if (show_processor) std::cout << buffer.machine << std::endl;
        if (show_hw_platform) std::cout << buffer.machine << std::endl;
        if (show_operating_system) std::cout << get_operating_system() << std::endl;
    }

    return 0;
}


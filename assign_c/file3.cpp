#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

bool isPalindrome(std::string &str)
{
    std::string reversedStr = str;
    std::reverse(reversedStr.begin(), reversedStr.end());

    return str == reversedStr;
}

int main()
{
    string input;

    cout << "Enter a string: ";
    cin >> input;

    if (isPalindrome(input)) {
        cout << "The entered string is a palindrome.\n";
    }
    else {
        cout << "The entered string is not a palindrome.\n";
    }

    return 0;
}

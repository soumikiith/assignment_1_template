#include <iostream> 
using namespace std; 

int main()
{
	int n;
    cin >> n;

	if (n % 4 == 0) {
		if (n % 100 == 0) {
			if (n % 400 == 0) {
				cout << "YES\n";
			}
			else {
				cout << "NO\n";
			}
		}
		else {
            cout << "YES\n";
        }
	}
	else {
        cout << "NO\n";
    }

	return 0;
}

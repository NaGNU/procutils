#include <iostream>
#include <stack>
#include <string>
#include <cctype>
#include <cmath>
#include <stdexcept>
#include <map>

using namespace std;

map<string, double> variables;

int getPriority(char op) {
    if (op == '+' || op == '-') return 1;
    if (op == '*' || op == '/') return 2;
    if (op == '^') return 3;
    return 0;
}

double applyOperation(double a, double b, char op) {
    switch (op) {
    case '+': return a + b;
    case '-': return a - b;
    case '*': return a * b;
    case '/':
        if (b == 0) throw runtime_error("D to 0");
        return a / b;
    case '^': return pow(a, b);
    default: throw runtime_error("False operator");
    }
}

double applyFunction(const string& func, double value) {
    if (func == "sin") return sin(value);
    if (func == "cos") return cos(value);
    if (func == "tan") return tan(value);
    if (func == "log") return log(value);
    if (func == "sqrt") return sqrt(value);
    throw runtime_error("False function: " + func);
}

double evaluateExpression(const string& expression) {
    stack<double> values;
    stack<char> ops;

    for (int i = 0; i < expression.length(); ++i) {
        char current = expression[i];


        if (isspace(current)) continue;

        if (isdigit(current) || current == '.') {
            double value = 0;
            int decimalPoint = -1;
            while (i < expression.length() && (isdigit(expression[i]) || expression[i] == '.')) {
                if (expression[i] == '.') {
                    decimalPoint = 0;
                }
                else {
                    if (decimalPoint == -1) {
                        value = value * 10 + (expression[i] - '0');
                    }
                    else {
                        value = value + (expression[i] - '0') * pow(10, decimalPoint);
                        decimalPoint++;
                    }
                }
                i++;
            }
            i--;
            values.push(value);
        }
        else if (current == '(') {
            ops.push(current);
        }
        else if (current == ')') {
            while (!ops.empty() && ops.top() != '(') {
                double b = values.top(); values.pop();
                double a = values.top(); values.pop();
                char op = ops.top(); ops.pop();
                values.push(applyOperation(a, b, op));
            }
            ops.pop();
        }

        else if (current == '+' || current == '-' || current == '*' || current == '/' || current == '^') {
            while (!ops.empty() && getPriority(ops.top()) >= getPriority(current)) {
                double b = values.top(); values.pop();
                double a = values.top(); values.pop();
                char op = ops.top(); ops.pop();
                values.push(applyOperation(a, b, op));
            }
            ops.push(current);
        }
        else if (current == 's' || current == 'c' || current == 't' || current == 'l') {
            string func;
            if (current == 's') func = "sin";
            else if (current == 'c') func = "cos";
            else if (current == 't') func = "tan";
            else if (current == 'l') func = "log";
            i += func.size() - 1;
            double value = evaluateExpression(expression.substr(i + 1));
            values.push(applyFunction(func, value));
        }
    }

    while (!ops.empty()) {
        double b = values.top(); values.pop();
        double a = values.top(); values.pop();
        char op = ops.top(); ops.pop();
        values.push(applyOperation(a, b, op));
    }

    return values.top();
}

void solveEquation(const string& equation) {
    double a = 0, b = 0;
    size_t xPos = equation.find("x");

    if (xPos == string::npos) {
        cout << "False format!" << endl;
        return;
    }


    size_t equalPos = equation.find('=');
    if (equalPos == string::npos) {
        cout << "False format!" << endl;
        return;
    }

    string left = equation.substr(0, equalPos);
    string right = equation.substr(equalPos + 1);


    a = stod(left.substr(0, xPos));
    b = stod(right);

    if (a == 0) {
        if (b == 0) {
            cout << "No sum" << endl;
        }
        else {
            cout << "No sum" << endl;
        }
    }
    else {
        double x = -b / a;
        cout << "Sum: x = " << x << endl;
    }
}

void displayHelp() {
    cout << "          \n";
    cout << "|          Command calc:\n";
    cout << "|          /help - Help\n";
    cout << "|          All operation: +, -, *, /, ^\n";
    cout << "|          Math function: sin, cos, tan, log, sqrt\n";
    cout << "          \n";
}

int main() {
    string expression;

    cout << "Calc" << endl;

    while (true) {
        cout << "Write number or '/help' for help: ";
        getline(cin, expression);

        if (expression == "/help") {
            displayHelp();
        }
        else if (expression.find("solve") != string::npos) {
            solveEquation(expression.substr(5));
        }
        else if (expression == "exit") {
            cout << "Programm exit." << endl;
            break;
        }
        else {
            try {
                double result = evaluateExpression(expression);
                cout << "          \n";
                cout << "Result: " << result << endl;
                cout << "          \n";

            }
            catch (const exception& e) {
                cout << "Error: " << e.what() << endl;
            }
        }
    }

    return 0;
}

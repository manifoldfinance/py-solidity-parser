#!/usr/bin/env bash
set -o errexit

# antlr -Dlanguage=Python3 solidity-antlr4/Solidity.g4 -o src -visitor

sleep 1

[ ! -f ./solidity-antlr4/antlr4.jar ] && { echo "ANTLR4 Jar does not exist."; exit 1; }

chmod +x ./solidity-antlr4/antlr4.jar
java -jar ./solidity-antlr4/antlr4.jar -Dlanguage=Python3 solidity-antlr4/Solidity.g4 -o src -visitor || exit 1

mv src/solidity-antlr4/* solidity_parser/solidity_antlr4
rm -rf src/solidity-antlr4

touch solidity_parser/solidity_antlr4/__init__.py
touch solidity_parser/solidity_antlr4/__AUTOGENERATED__
echo "Autogeneration and update FINISHED"
exit 0

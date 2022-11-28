# Create your grading script here

# set -e

CP=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"

echo "cloning..."
rm -rf student-submission
git clone $1 student-submission

echo "sucessfully cloned"

#cp TestListExamples.java student-submission/
cd student-submission

if [[ -e ListExamples.java ]]
then
    echo 'ListExamples.java was found! +1 pts'
else
    echo 'File not found, check file name. +0 pts'
    echo 'Some tests failed.'
    echo 'Total: 0 pts'
    exit 1
fi

cd ..
cp TestListExamples.java ./student-submission
cd student-submission

javac -cp $CP *.java 2> output-error.txt

file="output-error.txt"
if [[ -s $file ]]
then
    echo "File Compile Error, check error message. +0 pts"
    echo "Some tests failed."
    echo "Total: 1 pts"
    exit 1
else
    echo 'Compile success! +1 pts'
fi

java -cp $CP org.junit.runner.JUnitCore TestListExamples > junit-output.txt

if [[ $? -eq 0 ]]
then
    echo 'JUnit passed! +1 pts'
    echo 'All tests passed!'
    echo 'Total: 3 pts'
else
    echo 'JUnit failed! Check JUnit output +0 pts'
    echo 'Some tests failed.'
    echo 'Total: 2 pts'
    exit 1
fi
echo $?



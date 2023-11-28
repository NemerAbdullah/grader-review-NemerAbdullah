set -e

CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

#2
files=`find student-submission`
if [[ -f student-submission/ListExamples.java ]]
then
echo  correct file submitted.
else
echo not found
fi

#3
cp -r TestListExamples.java lib student-submission/ListExamples.java grading-area
set +e
#4 
cd grading-area
javac -cp $CPATH *.java 
java  -cp $CPATH org.junit.runner.JUnitCore TestListExamples
if [[ $? == 0 ]]
then
    echo 'correct'
else
    echo 'incorrect'
fi
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

dateTest=`date`
echo
echo "========== Starting unit tests $dateTest ============"
echo
echo
echo "When nothing is provided, the correct error message is returned : "
java Dec2Hex 
echo
echo
echo "When an invalid data type is provided, the correct error message is returned : "
java Dec2Hex h
echo
echo
echo "When a valid number is provided : "
java Dec2Hex 1
echo
echo "========== End of testing at: $dateTest ==========="
echo
exit
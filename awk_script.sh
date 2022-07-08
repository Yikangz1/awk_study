#!/bin/csh -f
echo "the name of the running script: $0" # $0 is the name of the running script
awk -F "" '{print $2,$3}' $0 # $2 and $3 in '{print $2,$3}' represent the 2nd and 3rd rows.
echo "********************the whole input txt content**********************************"
cat $1

echo "*************show the 2/3 column********************"
awk -F "" '{print $2,$3}' $1 # as $1 is the input argv, which is a .txt file, {print $2,$3} print the 2/3 column; 
echo "*************show the 2/3 column, where the 1st column is larger than 3********************"
awk -F "" '($1>3){print $2,$3}' $1
echo "*************************the separator is : ******************************************************************"
echo "1:2:3" | awk -F: '{print $1 " and " $2 " and " $3}'
echo "*************show the 3/4 rows, NR represent the row num********************"
awk 'NR==4||NR==3' $1
echo "************* first find the row, which contains "data"; then print the 2nd parameter, where the separator is "blank space"********************"
awk '/data/ {print $2}' $1
echo "***********first find the 2nd colunm, which contains "data", then print all of these rows, whose 2nd colunm is "data" **********************************************************************"
awk '$2 ~ /data/' $1 # here,"~" represents whether match the latter "data" in 2nd colunm
echo "***********first find the 2nd colunm, which contains "data", then print the second part of these rows, whose 2nd colunm is "data" **********************************************************************"
awk '$2 ~ /data/{print $2}' $1 # here,"~" represents whether match the latter "data" in 2nd colunm

echo "*******************************************find and print the rows, which including "data"**********************************************************************"
awk '/data/' $1
echo "*******************************************experiment2**********************************************************************"
awk '~/data/' $1

echo "***********first find the 2nd colunm, which does not contain "data", then print all of these rows, whose 2nd colunm is not "data" **********************************************************************"
awk '$2 !~ /data/' $1 # here, "!~" represents not match the latter "data" in 2nd colunm

#awk -F  '{print $2,$3}' $1
echo "//***************the following codes are learned from ZHIHU net***********//"
echo "*********************set separator as :, then print the 1st parameter (method1)*******************************"
awk -F: '{print $1}' /etc/passwd
echo "*********************set separator as :, then print the 1st parameter (method2)*******************************"
cat /etc/passwd | awk -F: '{print $1}' 

echo "****************************the standard output are as followings*******************************************"
cat  /etc/passwd
echo "****************************print the beginning with "root"******************************************"
awk -F: '/^root/' /etc/passwd
echo "****************************print the row, which including "root"******************************************"
awk -F: '/root/' /etc/passwd
echo "******************************print the 3rd and 5th column ********************************************"
awk -F: '{print $3, $5}' /etc/passwd # "-F:" indicates that the separator is ":"
echo "******************************print the 0th column ********************************************"
awk -F: '{print $0}'  /etc/passwd

echo "******************************print the 7th column ********************************************"
awk -F: '{print $7}'  /etc/passwd
echo "******************************print the 7th column, which beginning with root or ftp (method1) ********************************************"
awk -F: '/^root|^ftp/{print $7}'  /etc/passwd
echo "******************************print the 7th column, which beginning with root or ftp (method2) ********************************************"
awk -F: '/^(root|ftp)/{print $7}'  /etc/passwd
echo "******************************print the rows, which beginning with root or ftp ********************************************"
awk -F: '/^root|^ftp/'  /etc/passwd


echo "******************************print the 1st and 3rd column ********************************************"
awk -F: '{print $1, $3}' /etc/passwd # "-F:" indicates that the separator is ":"
echo "******************************print the 1st and 3rd column (with OFS setting 1)********************************************"
awk -F: 'BEGIN{OFS="-"}{print $1, $3}' /etc/passwd # "-F:" indicates that the separator is ":"
echo "******************************print the 1st and 3rd column (with OFS setting 2)********************************************"
awk -F: 'BEGIN{OFS="_"}{print $1, $3}' /etc/passwd # "-F:" indicates that the separator is ":"
echo "******************************print the 1st and 3rd column (with OFS setting 3)********************************************"
awk -F: 'BEGIN{OFS="="}{print $1, $3}' /etc/passwd # "-F:" indicates that the separator is ":"

echo "******************************print the 1st and 3rd column (with OFS setting 4)********************************************"
awk -F: 'BEGIN{OFS="="}/root/{print $1, $3}' /etc/passwd # "-F:" indicates that the separator is ":"
#echo "******************************print the 1st and 3rd colunm (with OFS setting (syntax error))********************************************"
#awk -F: '/root/BEGIN{OFS="="}{print $1, $3}' /etc/passwd # NOte: you can not put /root/ before BEGIN

echo "******************************print all of the contents with row num********************************************"
awk -F: '{print NR, $0}' /etc/passwd # "-F:" indicates that the separator is ":"

echo "******************************print the contents with row num larger than 7********************************************"
awk -F: 'NR > 7{print NR, $0}' /etc/passwd # "-F:" indicates that the separator is ":"

echo "******************************print the 1st column with row num larger than 7********************************************"
awk -F: 'NR > 7{print NR, $1}' /etc/passwd # "-F:" indicates that the separator is ":"
echo "******************************print the 1st column with row num larger than 7********************************************"
awk -F: 'NR > 7' /etc/passwd # whithout {print NR, $1}, print the rows, which row_num larger than 7

echo "******************************print the 3rd column (and value of 3rd colunm plus 1) with row num between 7 and 14********************************************"
awk -F: 'NR > 7&&NR < 14{print NR, $3,$3+1}' /etc/passwd # "-F:" indicates that the separator is ":"

echo "******************************print NF ********************************************"
awk -F: '{print NR,NF}' /etc/passwd # note: NF is the number of colunm

echo "******************************print NF ********************************************"
awk -F: '{print NR,NF}' /etc/passwd # note: NF is the number of colunm

echo "******************************print the 3rd column count backwards ********************************************"
awk -F: '{print $(NF-2)}' /etc/passwd # note: NF is the number of colunm

echo "******************************print the 1st and 3rd column (method 1)********************************************"
awk -F: '{print $1, $3}' /etc/passwd # "-F:" indicates that the separator is ":"

echo "******************************print the 1st and 3rd column (method 2)********************************************"
awk 'BEGIN{FS=":"}{print $1, $3}' /etc/passwd # "-F:" indicates that the separator is ":"

echo "******************************print the 1st and 3rd column (method 3_1)********************************************"
awk 'BEGIN{FS=":"}{OFS="_"}{print $1, $3}' /etc/passwd # "-F:" indicates that the separator is ":"
echo "******************************print the 1st and 3rd column (method 3_2)********************************************"
awk -F: 'BEGIN{OFS="_"}{print $1, $3}' /etc/passwd # "-F:" indicates that the separator is ":"


echo "******************************print the 1st and 3rd column (change separator1)********************************************"
awk -F/ '{print $1," and " $3}' /etc/passwd # "-F:" indicates that the separator is ":"


echo "******************************print the 1st and 3rd column (change separator2)********************************************"
awk -F/ '{print $1," and " $3, "NF value is " NF}' /etc/passwd # "-F/" indicates that the separator is "/" 

echo "****************************** explore the priority of separator "-F/" and "FS=":********************************************"
awk -F/ 'BEGIN{FS=":"}{print $1," and " $3, "NF value is " NF}' /etc/passwd  # by checking the results, we can find that the "FS=:" priority level is higher than that of "-F/"



echo "//*****************************************format the output study1*************************************//"
awk -F: '{printf "user_name:%s  user_ID: %s\n", $1,$3}' /etc/passwd # by using printf, we can print functional output format. But printf is stupid(can not switch row automatically), we need add "\n" to switch rows. 

echo "//*****************************************format the output study2************************************//"
awk -F: '{printf "user_name:%-15s  user_ID: %-5s\n", $1,$3}' /etc/passwd # by adding a value_number between % and s, you can realize the fromat output

echo "//*****************************************format the output study3************************************//"
awk -F: '{printf "user_name:%-15s  user_ID: %-5d\n", $1,$3}' /etc/passwd # by adding a value_number between % and s, you can realize the fromat output

echo "//*****************************************calculate the max character length of the first column************************************//"
awk -F: 'BEGIN{num=0}{if(length($1)>num){num=length($1)}}END{print num}' /etc/passwd

#echo "//*****************************************calculate the max ************************************//"
#awk -F: 'BEGIN{num=0,max_row=0}{if(length($1)>num){num=length($1) max_row=NR}}END{print num, max_row}' /etc/passwd

echo "//*****************************************output the 1st and 3rd column with good format*************************************//"
awk -F: '{printf "1st_column:%-18s  3rd_column: %s\n", $1,$3}' /etc/passwd 

echo "//*****************************************regular expression*************************************//"
awk -F: '/^root/' /etc/passwd 

echo "//*****************************************regular expression2*************************************//"
set abd = "1:2:3"
#awk -F: '{print $1}' abd

echo "1:2:3" | awk -F: '{print $1 " and " $2 " and " $3}'
echo $abd | awk -F: '{print $1 " and " $2 " and " $3}'

#awk -F: '{print $1 " and " $2 " and " $3}' '$abd'

echo "******************************show the contents of the input file ltec_sub.ini(begin)***********************"
cat $2
echo "******************************show the contents of the input file ltec_sub.ini(end)***********************"


set ini_name = ltec_sub.ini# lte_d.ini 
echo "**********************pattern match learning (end)***********************************"
set section = Module
set key = module

#set key_module = `awk -F '=' '/\['$section'\]/{a=1} a==1&&$1~/'$key'/ {print $2;exit}' $ini_name` 
#alias get_key 'awk -F '\''='\'' '\''/['\''$section'\'']/{a=1} a==1&&$1~/'\''$key'\''/ {print $2;exit}'\'' $ini_name'
# get_key is get vaule of $1-section : $2-param 
alias get_key 'awk -F '\''='\''  '\''/\['\''\!:1'\''\]/{a=1} a==1&&$1~/'\''\!:2'\''/ {print $2;exit}'\'' $ini_name'
# get_simop is get simulation options, use :=
alias get_simop 'awk -F '\'':='\''  '\''/\['\''\!:1'\''\]/{a=1} a==1&&$1~/'\''\!:2'\''/ {print $2;exit}'\'' $ini_name'

alias get_key_sub 'awk -F '\''[+=]'\''  '\''/\['\''\!:1'\''\]/{a=1} a==1&&$3~/'\''\!:2'\''/ {print $4;exit}'\'' $ini_name'
alias get_key_test 'awk -F '\''[+=]'\''  '\''/\['\''\!:1'\''\]/{a=1} a==1&&$5~/'\''\!:2'\''/ {print $6;exit}'\'' $ini_name'

# get ltex module
set  key_module = `get_key $section $key`
echo "module is: $key_module" # 


# get fpga param, NULL:use asic ram, FPGA:use fpga ram
   set key_fpga = `get_key Module fpga`
   echo "fpga is :$key_fpga"
#awk -F "" '{print $2,$3}' $1 # as $1 is the input argv, which is a .txt file, {print $2,$3} print the 2/3 column; 

#awk -F: 'BEGIN{FS="="}{print $1}' $1

# get run_all flag
   set key_runall = `get_key Module run_all`
   echo "runall is :$key_runall"

   # get test-case count
   set case_num = `get_key Module case_cnt`
   echo "the case_num is $case_num"

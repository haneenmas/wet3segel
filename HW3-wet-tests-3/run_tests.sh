#!/bin/bash

function run_tests_part1 {
	GRADE="0"
	gcc -std=c99 hw3_part1.c -o prf &>/dev/null
	if [ -f "prf" ]; then
		cp prf ../tests/part1/prf
		cd ../tests/part1/

		timeout 20s ./prf foo "test1.out" > studentout.txt 2>/dev/null
		if [ $? -eq 0 ]; then
			diff out1 studentout.txt &>/dev/null
			if [ $? -eq 0 ]; then
				echo -e "\tTest 1:\t\tPASS" >> ../../feedback.txt
				let "GRADE+=5";
			else
				echo -e "\tTest 1:\t\tFAIL - diff" >> ../../feedback.txt
			fi
		else
			echo -e "\tTest 1:\t\tFAIL - Infinite loop / Exit status error" >> ../../feedback.txt
		fi

		timeout 20s ./prf foo "test2.out" > studentout.txt 2>/dev/null
		if [ $? -eq 0 ]; then
			diff out2 studentout.txt &>/dev/null
			if [ $? -eq 0 ]; then
				echo -e "\tTest 2:\t\tPASS" >> ../../feedback.txt
				let "GRADE+=5";
			else
				echo -e "\tTest 2:\t\tFAIL - diff" >> ../../feedback.txt
			fi
		else
			echo -e "\tTest 2:\t\tFAIL - Infinite loop / Exit status error" >> ../../feedback.txt
		fi

		timeout 20s ./prf foo "test3.out" > studentout.txt 2>/dev/null
		if [ $? -eq 0 ]; then
			diff out3 studentout.txt &>/dev/null
			if [ $? -eq 0 ]; then
				echo -e "\tTest 3:\t\tPASS" >> ../../feedback.txt
				let "GRADE+=5";
			else
				echo -e "\tTest 3:\t\tFAIL - diff" >> ../../feedback.txt
			fi
		else
			echo -e "\tTest 3:\t\tFAIL - Infinite loop / Exit status error" >> ../../feedback.txt
		fi

		timeout 20s ./prf foo "test4.out" > studentout.txt 2>/dev/null
		if [ $? -eq 0 ]; then
			diff out4 studentout.txt &>/dev/null
			if [ $? -eq 0 ]; then
				echo -e "\tTest 4:\t\tPASS" >> ../../feedback.txt
				let "GRADE+=5";
			else
				echo -e "\tTest 4:\t\tFAIL - diff" >> ../../feedback.txt
			fi
		else
			echo -e "\tTest 4:\t\tFAIL - Infinite loop / Exit status error" >> ../../feedback.txt
		fi

		timeout 20s ./prf foo "test5.out" > studentout.txt 2>/dev/null
		if [ $? -eq 0 ]; then
			diff out5 studentout.txt &>/dev/null
			if [ $? -eq 0 ]; then
				echo -e "\tTest 5:\t\tPASS" >> ../../feedback.txt
				let "GRADE+=5";
			else
				echo -e "\tTest 5:\t\tFAIL - diff" >> ../../feedback.txt
			fi
		else
			echo -e "\tTest 5:\t\tFAIL - Infinite loop / Exit status error" >> ../../feedback.txt
		fi

		timeout 20s ./prf foobar "test6.out" > studentout.txt 2>/dev/null
		if [ $? -eq 0 ]; then
			diff out6 studentout.txt &>/dev/null
			if [ $? -eq 0 ]; then
				echo -e "\tTest 6:\t\tPASS" >> ../../feedback.txt
				let "GRADE+=5";
			else
				echo -e "\tTest 6:\t\tFAIL - diff" >> ../../feedback.txt
			fi
		else
			echo -e "\tTest 6:\t\tFAIL - Infinite loop / Exit status error" >> ../../feedback.txt
		fi

		timeout 20s ./prf barboor "test7.out" > studentout.txt 2>/dev/null
		if [ $? -eq 0 ]; then
			diff out7 studentout.txt &>/dev/null
			if [ $? -eq 0 ]; then
				echo -e "\tTest 7:\t\tPASS" >> ../../feedback.txt
				let "GRADE+=5";
			else
				echo -e "\tTest 7:\t\tFAIL - diff" >> ../../feedback.txt
			fi
		else
			echo -e "\tTest 7:\t\tFAIL - Infinite loop / Exit status error" >> ../../feedback.txt
		fi

		timeout 20s ./prf bar "test8.out" > studentout.txt 2>/dev/null
		if [ $? -eq 0 ]; then
			diff out8 studentout.txt &>/dev/null
			if [ $? -eq 0 ]; then
				echo -e "\tTest 8:\t\tPASS" >> ../../feedback.txt
				let "GRADE+=5";
			else
				echo -e "\tTest 8:\t\tFAIL - diff" >> ../../feedback.txt
			fi
		else
			echo -e "\tTest 8:\t\tFAIL - Infinite loop / Exit status error" >> ../../feedback.txt
		fi

		timeout 20s ./prf foo "test9.out" > studentout.txt 2>/dev/null
		if [ $? -eq 0 ]; then
			diff out9 studentout.txt &>/dev/null
			if [ $? -eq 0 ]; then
				echo -e "\tTest 9:\t\tPASS" >> ../../feedback.txt
				let "GRADE+=5";
			else
				echo -e "\tTest 9:\t\tFAIL - diff" >> ../../feedback.txt
			fi
		else
			echo -e "\tTest 9:\t\tFAIL - Infinite loop / Exit status error" >> ../../feedback.txt
		fi

		timeout 20s ./prf libfoo "test10.out" > studentout.txt 2>/dev/null
		if [ $? -eq 0 ]; then
			diff out10 studentout.txt &>/dev/null
			if [ $? -eq 0 ]; then
				echo -e "\tTest 10:\tPASS" >> ../../feedback.txt
				let "GRADE+=5";
			else
				echo -e "\tTest 10:\tFAIL - diff" >> ../../feedback.txt
			fi
		else
			echo -e "\tTest 10:\t\tFAIL - Infinite loop / Exit status error" >> ../../feedback.txt
		fi

	else
		echo -e "FAIL - compile error" >> ../feedback.txt
	fi

	sudo rm prf &>/dev/null
	sudo rm studentout.txt &>/dev/null

	echo "${GRADE}"
}


function run_tests_part2 {
	GRADE="0"
	ld ../tests/part2/a.o ../tests/part2/b.o -T hw3_part2.ld -o ../tests/part2/out
	cd ../tests/part2/

	if [ -f "out" ]; then
		
		readelf -h out | grep Entry > student_out_stream 2>/dev/null
		diff student_out_stream out1 &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 1:\t\tPASS" >> ../../feedback.txt
			let "GRADE+=5";
		else
			echo -e "\tTest 1:\t\tFAIL" >> ../../feedback.txt
		fi

		./out
		echo $? > student_out_stream 2>/dev/null
		diff student_out_stream out2 &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 2:\t\tPASS" >> ../../feedback.txt
			let "GRADE+=4";
		else
			echo -e "\tTest 2:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -Wl out | grep 0x0000000000400000 > student_out_stream 2>/dev/null
		diff  <(cut -c -17 student_out_stream)  <(cut -c -17 out3) &>/dev/null
		if [ $? -eq 0 ]; then
			diff  <(cut -c 26-64 student_out_stream) <(cut -c 26-64 out3) &>/dev/null
			if [ $? -eq 0 ]; then
				diff  <(cut -c 74-86 student_out_stream) <(cut -c 74-86 out3) &>/dev/null
				if [ $? -eq 0 ]; then
					echo -e "\tTest 3:\t\tPASS" >> ../../feedback.txt	
					let "GRADE+=5";
				else 
					echo -e "\tTest 3:\t\tFAIL" >> ../../feedback.txt
				fi
			fi
		fi
		
		readelf -Wl out | grep 0x0000000000060000 > student_out_stream 2>/dev/null
		diff  <(cut -c -17 student_out_stream)  <(cut -c -17 out4) &>/dev/null
		if [ $? -eq 0 ]; then
			diff  <(cut -c 26-64 student_out_stream) <(cut -c 26-64 out4) &>/dev/null
			if [ $? -eq 0 ]; then
				diff  <(cut -c 74-86 student_out_stream) <(cut -c 74-86 out4) &>/dev/null
				if [ $? -eq 0 ]; then
					echo -e "\tTest 4:\t\tPASS" >> ../../feedback.txt	
					let "GRADE+=5";
				else 
					echo -e "\tTest 4:\t\tFAIL" >> ../../feedback.txt
				fi
			fi
		fi

		readelf -Wl out | grep  0x0000000080000000 > student_out_stream 2>/dev/null
		diff  <(cut -c -17 student_out_stream)  <(cut -c -17 out5) &>/dev/null
		if [ $? -eq 0 ]; then
			diff  <(cut -c 26-64 student_out_stream) <(cut -c 26-64 out5) &>/dev/null
			if [ $? -eq 0 ]; then
				diff  <(cut -c 74-86 student_out_stream) <(cut -c 74-86 out5) &>/dev/null
				if [ $? -eq 0 ]; then
					echo -e "\tTest 5:\t\tPASS" >> ../../feedback.txt	
					let "GRADE+=5";
				else 
					echo -e "\tTest 5:\t\tFAIL" >> ../../feedback.txt
				fi
			fi
		fi
		
		readelf -s out | grep purple > student_out_stream 2>/dev/null
		diff <(cut -c 7- student_out_stream) <(cut -c 7- out6) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 6:\t\tPASS" >> ../../feedback.txt
			let "GRADE+=3";
		else
			echo -e "\tTest 6:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep msg > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out7) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 7a:\tPASS" >> ../../feedback.txt
			let "GRADE+=1";
		else
			echo -e "\tTest 7a:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep endmsg > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out8) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 7b:\tPASS" >> ../../feedback.txt
			let "GRADE+=1";
		else
			echo -e "\tTest 7b:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep this_is_ro > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out9) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 7c:\tPASS" >> ../../feedback.txt
			let "GRADE+=2";
		else
			echo -e "\tTest 7c:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep noinit > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out10) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 7d:\tPASS" >> ../../feedback.txt
			let "GRADE+=2";
		else
			echo -e "\tTest 7d:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep b_data > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out11) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 7e:\tPASS" >> ../../feedback.txt
			let "GRADE+=2";
		else
			echo -e "\tTest 7e:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep b_ro > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out12) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 7f:\tPASS" >> ../../feedback.txt
			let "GRADE+=2";
		else
			echo -e "\tTest 7f:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep b_bss > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out13) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 7g:\tPASS" >> ../../feedback.txt
			let "GRADE+=2";
		else
			echo -e "\tTest 7g:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep foo > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out14) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 7h:\tPASS" >> ../../feedback.txt
			let "GRADE+=2";
		else
			echo -e "\tTest 7h:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep buff > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out15) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 7i:\tPASS" >> ../../feedback.txt
			let "GRADE+=2";
		else
			echo -e "\tTest 7i:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep _start > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out16) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 7j:\tPASS" >> ../../feedback.txt
			let "GRADE+=2";
		else
			echo -e "\tTest 7j:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep _hw3_unicorn > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out17) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 7k:\tPASS" >> ../../feedback.txt
			let "GRADE+=2";
		else
			echo -e "\tTest 7k:\t\tFAIL" >> ../../feedback.txt
		fi

		readelf -s out | grep white > student_out_stream 2>/dev/null
		diff <(cut -c 7-53 student_out_stream) <(cut -c 7-53 out18) &>/dev/null
		if [ $? -eq 0 ]; then
			echo -e "\tTest 8:\t\tPASS" >> ../../feedback.txt
			let "GRADE+=3";
		else
			echo -e "\tTest 8:\t\tFAIL" >> ../../feedback.txt
		fi

	else
		echo -e "FAIL - linking error" >> ../../feedback.txt
	fi

	sudo rm out &>/dev/null
	sudo rm student_out_stream &>/dev/null
	echo "${GRADE}"
}

cp elf64.h ./part1/elf64.h
cd part1
echo "Part 1:" > ../feedback.txt
grade_p1=$(run_tests_part1)
cd ../part2
echo -e "\n\nPart 2:" >> ../feedback.txt
grade_p2=$(run_tests_part2)
echo "END OF TEST"


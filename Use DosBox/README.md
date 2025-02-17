Assembly Language 
===
Abstract:Using Microprocessor emu8086
## EMU 8086
- Title:  `Emu8086`
- Authors:  `pan78m`,`B`,`C`
- Preprint: [https://arxiv.org/abs/xx]()
- Full-preprint: [paper position]()
- Video: [video position]()

## Install & Dependence
- python
- pytorch
- numpy

## Dataset Preparation
| Dataset | Download |
| ---     | ---   |
| dataset-A | [download]() |
| dataset-B | [download]() |
| dataset-C | [download]() |

## Use
- for train
  ```
  python train.py
  ```
- for test
  ```
  python test.py
  ```
## Pretrained model
| Model | Download |
| ---     | ---   |
| Model-1 | [download]() |
| Model-2 | [download]() |
| Model-3 | [download]() |


## Directory Hierarchy
```
|—— Basic_examples_8086
|    |—— 0_sample_add_huge_numbers.asm
|    |—— 0_sample_vga_graphics.asm
|    |—— 1_sample.asm
|    |—— 2_sample.asm
|    |—— 3_sample.asm
|    |—— 4_sample.asm
|    |—— 5_sample.asm
|    |—— add_two_arrays.asm
|    |—— attrib.asm
|    |—— bcd_aaa.asm
|    |—— bcd_aas.asm
|    |—— bin2dec.asm
|    |—— bintest.asm
|    |—— calc.asm
|    |—— Calculator.asm
|    |—— cmpsb.asm
|    |—— cmpsw.asm
|    |—— colors.asm
|    |—— convert_string_number_to_binary.asm
|    |—— convert_string_to_packed_bcd.asm
|    |—— convert_to_upper_case.asm
|    |—— count_chars.asm
|    |—— Count_Key_Presses.asm
|    |—— Custom_Interrupt.asm
|    |—— datefile.asm
|    |—— double_word.asm
|    |—— encrypt_subrotine.asm
|    |—— exetest.asm
|    |—— factorial.asm
|    |—— fahrenheit.asm
|    |—— far_call-2.asm
|    |—— far_call.asm
|    |—— far_call_advanced.asm
|    |—— fasm_compatibility.asm
|    |—— file-operations.asm
|    |—— float.asm
|    |—— hello.asm
|    |—— HelloWorld.asm
|    |—— HexConvertor.asm
|    |—— include.asm
|    |—— int10_13.asm
|    |—— int21.asm
|    |—— keybrd.asm
|    |—— LED_display_test.asm
|    |—— loops.asm
|    |—— matrix.asm
|    |—— micro-os_kernel.asm
|    |—— micro-os_loader.asm
|    |—— mouse.asm
|    |—— mouse2.asm
|    |—— no-close.asm
|    |—— pages.asm
|    |—— palindrome.asm
|    |—— param.asm
|    |—— paramexe.asm
|    |—— pixel.asm
|    |—— print.asm
|    |—— PrinterDemo.asm
|    |—— print_al.asm
|    |—— print_AX.asm
|    |—— print_char_by_char.asm
|    |—— print_hex_digit.asm
|    |—— reverse.asm
|    |—— robot.asm
|    |—— scasb.asm
|    |—— scasw.asm
|    |—— scroll.asm
|    |—— self_modifying_code.asm
|    |—— simple_io.asm
|    |—— snake.asm
|    |—— sort.asm
|    |—— stack.asm
|    |—— stepper_motor.asm
|    |—— string.asm
|    |—— thermometer.asm
|    |—— timer.asm
|    |—— ToBin.asm
|    |—— traffic_lights.asm
|    |—— traffic_lights2.asm
|    |—— writebin.asm
|    |—— z01.asm
|    |—— z02.asm
|    |—— z03.asm
|    |—— z04.asm
|    |—— _ReadMe.txt
|—— CLP
|    |—— 30_10.asm
|    |—— even_odd.asm
|    |—— task_1.asm
|    |—— task_1_or.asm
|—— Lab_Report
|    |—— Report_5_Odd_Even_Num_Sum_Total_Sum.asm
|    |—— Report_7_task_1_Odd_Even_Sum_Using_Macro.asm
|    |—— sortAscendDescend.asm
|    |—— task_1.asm
|    |—— task_1_alter_Average_Largest_Smallest_Reminder.asm
|    |—— task_1_report_6Average_Largest_Smallest_Reminder.asm
|    |—— task_1_using_Procedure_Avg_L_S_Rem.asm
|    |—— task_2_report_6_Sort_AD.asm
|—— Lab_Work
|    |—— AAM er kaj.asm
|    |—— Arithmetic.asm
|    |—— Array Even Number and Odd number Sum.asm
|    |—— Array.asm
|    |—— Beep Sound.asm
|    |—— Check Even odd Untile enter N.asm
|    |—— Check Number is Divisible 5.asm
|    |—— Check Vowel or Cosonant.asm
|    |—— Check Which number is Greater and Less and equal.asm
|    |—— class_2.asm
|    |—— class_2_2.asm
|    |—— Divident and reminder.asm
|    |—— Double digit output.asm
|    |—— Double_Digit_With_Reminder.asm
|    |—— Encryption.asm
|    |—— Even Odd Number.asm
|    |—— Factorial Number.asm
|    |—— Find Digit Character Or Others.asm
|    |—— Find Odd Number Sum Using formula.asm
|    |—— Find Reminder and Result using Two digit.asm
|    |—— Find Reminder with 2 digit input.asm
|    |—— Find the Greatest Number.asm
|    |—— Find The smallest value from the array.asm
|    |—— Game.asm
|    |—— Game_2.asm
|    |—— Increment_Decrement.asm
|    |—— Letter lower to Upper.asm
|    |—— Multiple find and output more digit.asm
|    |—— Multiple_Line_Input_Ouput_New_Line.asm
|    |—— N number Sum Without loop.asm
|    |—— Normal_User_Input.asm
|    |—— Odd number sum Equation.asm
|    |—— Print Even Odd from the Array.asm
|    |—— Print Reverse Order Two Char.asm
|    |—— Reminder Normal.asm
|    |—— Reminder_DX and Ouput_AX.asm
|    |—— Reversely Print Array Element.asm
|    |—— Rotation of Motor.asm
|    |—— Sorted_Order Print Value.asm
|    |—— Sum With n to the power 2 Sum.asm
|    |—— task_2.asm
|    |—— Temperature Convert.asm
|    |—— Upper and Lower work.asm
|    |—— User Input In Array.asm
|    |—— User Input Three Digit.asm
|    |—— UserInputString.asm
|    |—— User_Input_Information_print_newline.asm
|    |—— User_input_with_Space_print_New_line.asm
|—— Others
|    |—— Array_2.asm
|    |—— Factor of a numbers.asm
|    |—— Find Sum Any Series Using Loop.asm
|    |—— mycode.asm
|    |—— Procedure.asm
|    |—— s.asm
|    |—— s2.asm
|    |—— Task_Array.asm
|    |—— User Defind function.asm
|    |—— User Defind function_2_For 2 Digit Output.asm
|—— Project
|    |—— WORD GAME EXPRIMENT HERE.asm
|    |—— WordHunter_Project.asm
|    |—— wordHunt_user_input.asm
|—— Use DosBox
|    |—— Assembly_Run_VSCode.txt
|    |—— Discuss_Code.asm
|    |—— Divisible_By_Any_Number.asm
|    |—— Even Odd Number.asm
|    |—— l.asm
|    |—— p.asm
|    |—— p2.asm
|    |—— Procedure.asm
|    |—— Sum_Without_Loop.asm
|    |—— Task_1_Lab_6.asm
|    |—— test.asm
```
## Code Details
### Tested Platform
- software
  ```
  OS: Debian unstable (May 2021), Windows 11/10/7
  Emu8086: 3.8.5 (anaconda)
  
  ```
- hardware
  ```
  CPU: Intel Xeon 6226R or Any Processor
  GPU: Nvidia RTX3090 (At least 4GB)
  ```
### Hyper parameters
```
```
## References
- [paper-1]()
- [paper-2]()
- [code-1](https://github.com)
- [code-2](https://github.com)
  
## License

## Citing
If you use xxx,please use the following BibTeX entry.
```
```

<#
.SYNOPSIS
  Assignment #1 - PowerShell Basics
.DESCRIPTION
  The goal of this assignment is to get you familiar with PowerShell basic concepts.
  You will demonstrate your knowledge in Variables, Arrays, and CMDLETs.
  There are a total of 12 problems in this assignment.
.NOTES
  Version:        1.0
  Author:         <Brian Ortiz>

#>

###################### DO NOT MODIFY #############################
# (Updates Console to location of Script File)                   #
$Path = $PSScriptRoot                                            #
cd $Path                                                         #
##################################################################

#----------------------------------------------------------[Variables]-------------------------------------------------------
### You can store all types of values in PowerShell variables.
### A variable is a unit of memory in which values are stored.
### 1. Create a two int variables $i and $x and assign the value to 200 and 305 respectively.
## YOUR CODE HERE
 $i = 200
 $x = 305


### 2. Now, add $i and $x together and store the value in another variable $y.
### Then output(print) the value of $y to the console.
## YOUR CODE HERE
$y=$i+$x
Write-host ($y)

### 3. Divide $y by $i and round the answer to the two closest decimal places and
### store the value in variable $z. Then print value of $z to the console.
### HINT: Do some research on how to round values in PowerShell online. Lots of examples are available ;)
## YOUR CODE HERE
$z = $y/$i
$z = [math]::Round($z,2)
Write-host ($z)


### 4. In PowerShell strings and number variables can added together.
### Create a variable $str and set it to "The value of z is: " and
### add $str and $z together. Then output $str to the console.
## YOUR CODE HERE
$str = "The value of z is: "
$str = $str + $z
Write-host $str


#----------------------------------------------------------[Arrays]-------------------------------------------------------
### Arrays are powerfull datatype that can store a collection of items.
### 1. Create an array variable named $arr and set it to
### the following collection of integers (10,20,30,40,50,60,70,80,90,100)
## YOUR CODE HERE
$arr = 10,20,30,40,50,60,70,80,90,100


### 2. Create a new variable called $itemSum and store the sum of the 2nd and last item in $arr.
### Print the resule to the console. (10,->20<-,30,40,50,60,70,80,90,->100<-)
## YOUR CODE HERE
$itemsum = $arr[1]+$arr[9]
Write-Host $itemsum


#----------------------------------------------------------[CMDLET]-------------------------------------------------------
### This section examines the use of CMDLETs to find information.
### It begins with a large set of data returned back to us. Later we will continue
### to filter out unneccessary data until the desired set of data is returned.
### 1. Create a variable called $files1 and assign it the output all files including
### inside of subfolders in C:\Windows\System32\driverStore using the cmdlet Get-ChildItem
## HINT: You will need to use two additional parameters to recusively retrieve files in sub-directories
## HINT: 1644 items will be returned. Use count attribute to verify size (Example: $files1.count)
## YOUR CODE HERE
$files1=Get-ChildItem -File -Recurse C:\Windows\System32\driverStore
$files1.count

### 2. Create a variable called $files2 and assign it the output all ".sys" files
### in C:\Windows\System32\driverStore using the cmdlet: Get-ChildItem
## HINT: 329 files returned
## YOUR CODE HERE
$files2=Get-ChildItem -File -Recurse *.sys C:\Windows\System32\driverStore
$files2.count

### 3. Create a variable called $files3 and assign it the output all ".sys" files
### larger than 500 KB (Length > 500KB) in
### C:\Windows\System32\driverStore using the cmdlet: Get-ChildItem
## HINT: Length property is in Bytes 500KB = 512000 Bytes
## HINT: 51 files returned.
## YOUR CODE HERE
$files3=Get-ChildItem -File -Recurse *.sys C:\Windows\System32\driverStore | Where-Object { $_.Length -gt 500kb }
$files3.count


### 4.  Create a variable called $files4 and nassign it the output all ".sys" files
### that start with the letter s and larger than 500 KB (Length > 500KB) i
### C:\Windows\System32\driverStore using the cmdlet: Get-ChildItem
## HINT: 2 files returned
## YOUR CODE HERE
$files4=Get-ChildItem -File -Recurse *.sys C:\Windows\System32\driverStore | Where-Object {$_.Name -Match "^s.*" -and $_.Length -gt 500kb}
$files4.count

### 5. Now that the two files we were looking for are found and stored in $files4,
## let's export them out to CSV file named findings.csv
## HINT: 1 CSV file should output to the current directory.
## YOUR CODE HERE
Get-Item $files4 | export-csv -Path c:\findings.csv


### 6. Over 1000 CMDLETS are available in PowerShell, research and find
### a cmdlet to get content from a web page. For this exercise, pull
### the web content of https://ung.edu and store in the variable $site.
### Lastly, print $site to the console.
#HINT If using Invoke-WebRequest use "-UseBasicParsing" parameter if it hangs during execution.
## YOUR CODE HERE
$site = Invoke-WebRequest -URI https://ung.edu -UseBasicParsing
Write-host $site
#----------------------------------------------------------[Complete]-------------------------------------------------------------

# DevTool
A development tool designed by Group 1 as a part of the Software Evolution Project course 2018.
The tool identifies associations between any group of files that can be interpreted as plaintext.
The tool is a Windows PowerShell script - as it is executed via command-line, it might be
helpful to be familiar with PowerShell. 

# Usage
* Install the latest version of Graphviz dot. https://graphviz.gitlab.io/_pages/Download/Download_windows.html

* Download the main script (main.ps1) from this repository and place it in the folder containing 
  (either directly or in subfolders) the files to be analyzed. NOTE: there should NOT be a file named
  swevoDevToolTemp.txt in this folder already, as this will be overwritten by the program.

* Open PowerShell (on Windows, click on the search-icon and type "PowerShell" into the search bar.)

* Navigate to the folder where you placed the script. Via command line, type:

  cd \<path>\<to>\<folder>

  (... And hit enter.)
  
* Execute the script - either save the output as [filename].dot or pipe it to dot. 
  You may also choose to specify the granularity (if not specified, default value is given).
  Granularity is given as an Integer.
  Template for execution (after following all steps above): 
  
  .\main.ps1 <granularity> | Out-File <dot-file-name>.dot -Encoding ASCII\

  For further detailed decription of execution, see (1) below.  
  NOTE: you may be asked to set execution policy the first time you run the script. 
  For further help, see:
  https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-6

* To generate the graph in dot, execute:

  $HOME\\Downloads\\release\\bin\\dot.exe -Tpng example.dot -o example.png

(1) Example:\
PS C:\Users\AwesomeUser\Project\Src> ..\\..\DevTool\main.ps1 6 | Out-File example.dot -Encoding ASCII\
PS C:\Users\AwesomeUser\Project\Src> $HOME\\Downloads\\release\\bin\\dot.exe -Tpng example.dot -o example.png
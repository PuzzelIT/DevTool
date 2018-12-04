# DevTool
A development tool designed by Group 1 as a part of the Software Evolution Project course 2018.

# Usage
* Install the latest version of Graphviz dot. https://graphviz.gitlab.io/_pages/Download/Download_windows.html
* Navigate to a suitable folder and execute DevTool.
* Either save the output as [filename].dot or pipe it to dot.

Example:\
PS C:\Users\AwesomeUser\Project\Src> ..\\..\DevTool\main.ps1 6 | Out-File example.dot -Encoding ASCII\
PS C:\Users\AwesomeUser\Project\Src> $HOME\\Downloads\\release\\bin\\dot.exe -Tpng example.dot -o example.png
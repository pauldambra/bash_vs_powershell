# things that happened

```
iex : At line:1 char:55
+ git checkout 65ec94134a192525e80cb2719cf90e8d21e51cc9 &> /dev/null
+                                                       ~
The ampersand (&) character is not allowed. The & operator is reserved
for future use; wrap an ampersand in double quotation marks ("&") to pass
it as part of a string.
At /Users/pauldambra/Documents/git/data-lines/find-error.ps1:5 char:5
+     iex "git checkout $commit &> /dev/null"
+     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ParserError: (:) [Invoke-Expression], Parse
   Exception
    + FullyQualifiedErrorId : AmpersandNotAllowed,Microsoft.PowerShell.Co
   mmands.InvokeExpressionCommand
   ```

   ```
   iex : At line:1 char:7
+ wc -l < big-data.txt
+       ~
The '<' operator is reserved for future use.
At /Users/pauldambra/Documents/git/data-lines/find-error.ps1:6 char:12
+     $lines=iex "wc -l < big-data.txt"
+            ~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ParserError: (:) [Invoke-Expression], Parse
   Exception
    + FullyQualifiedErrorId : RedirectionNotSupported,Microsoft.PowerShel
   l.Commands.InvokeExpressionCommand
   ```
# bran - the list builder

Bran, the List Builder. Build lists with increasing numbers. Useful for quickly 
building test data. 

Completely redundant functionality, but it gives me a chance to learn about Neovim, Lua, and Fennel.

Usage: 

:Bran {string} {# of iterations} {optional: format} {optional: separator}

Examples:

:Bran UserID_ 5 

UserID_1  
UserID_2  
UserID_3  
UserID_4  
UserID_5  

:Bran AccountNo- 10 %04d

AccountNo-0001  
AccountNo-0002  
AccountNo-0003  
AccountNo-0004  
AccountNo-0005  
AccountNo-0006  
AccountNo-0007  
AccountNo-0008  
AccountNo-0009  
AccountNo-0010  

:Bran EmpBadge_ 5 %03d |

EmpBadge_001|EmpBadge_002|EmpBadge_003|EmpBadge_004|EmpBadge_005|




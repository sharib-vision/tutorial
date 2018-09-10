#### About Screen 

``The screen program allows you to use multiple windows (virtual VT100 terminals) in Unix.``
     
  See [here](https://kb.iu.edu/d/acuy)
     

1.  To see the screen list 
    
        screen -ls 
        
2.  To make a new screen 
  
        screen -S $NAME
        
3.  To detach 

        crtl+A then d
        
4.  To resume screen 

        screen -R
      
 
5.  To scroll 
    
        ctrl + A then Esc and use the arrow keys to move up/down 
        
6.  To exit the "scrolling mode"
    
        q or Esc         
               
7.  To kill the screen

        ctrl + A (then 'K' to kill)

 *Note: you will have to be in the same terminal to be able to resume the screen.*
 
 

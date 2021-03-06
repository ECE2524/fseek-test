# fseek-test

A simple demonstration of the difference between redirecting 
*standard input* from a pipe vs. a file. I have come accross a number of 
casual comments indicating that

    cat fox.txt | ./myprog

and 

    ./myprog <fox.txt

are identical from the point of view of `myprog`.  This is not strictly 
true, as this short program demonstrates (though in most common-use cases 
the distinction is probably irrelevant).

Run `make` to compile and run tests.

    $ make
    Running tests...

    Redirect standard in from file:
    ./fdaccess <fox.txt
    god yzal eht
    revo deppmuj
    xof nworb kciuq eht

    Redirect standard in from pipe:
    cat fox.txt | ./fdaccess
    fdaccess: (standard input): Illegal seek
    make: [fdtests] Error 1 (ignored)


When *standard in* comes from a pipe, the process does not have seek access, 
i.e. the file stream is a FIFO, any buffering for random access of the 
input data must be implemented in the process itself. In contrast, when 
*standard input* is redirect from a file the process may use the `fseek(3)` 
class of library calls to randomly access the stream.

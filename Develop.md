# Code repository #

## Subversion ##

### New tag ###
```
svn copy https://grendel-arsenal.googlecode.com/svn/trunk/ https://grendel-arsenal.googlecode.com/svn/tags/0.1.0 -m "Version 0.1.0 tag."
```

## Git ##

### Checkout ###
```
git clone [URL]
```

### Update ###
```
git pull
```

### References ###
  * [Git - SVN Crash Course](http://git.or.cz/course/svn.html)

# Debug #

## Valgrind ##
Compile with debug info:
```
gcc -o test -g test.c
```

Then:
```
valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./test
```

References:
  * [Basic Valgrind Tutorial](http://cs.ecs.baylor.edu/~donahoo/tools/valgrind/)

# Misc #

## Install build dependencies in Debian ##
```
sudo aptitude build-dep [PACKAGE]
```
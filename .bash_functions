function du_top { 
	if [ -z $1 ] ;then
	   dir='.'
	else
	   dir=$1
	fi
	echo "Find top 10 files from $dir sort du wise" 
	du -B1 -sx $dir/* | sort -n -k1 -r | head -10 
}
	
function pkg { 
	if [ -z $1 ] ; then 
	   exit 1
	else 
	   pkg=$1
	fi
	dpkg -l | grep $pkg
}

function pkgl { 
	if [ -z $1 ] ; then 
	  echo "USAGE: pkgl <package_name>"
	else 
	   pkg=$1
	fi
	dpkg -L $pkg
}
function egcc { 
    if [ -z $1 ]; then
        echo "USAGE egcc <program_name>"
    else
        prog=$1
        binary=$(expr match "$prog" '\([a-zA-Z_1-9-]*\)')
        gcc -o $binary $prog
        if [ $? -eq 0 ]; then
            ./$binary  $2 $3
        else
            echo "$binary failed with return status code : $? "
        fi
    fi
}
	 
			

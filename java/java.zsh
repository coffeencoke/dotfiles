if [ `uname` = "Darwin" ]; then
  export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
  export JRE_HOME=$JAVA_HOME
fi

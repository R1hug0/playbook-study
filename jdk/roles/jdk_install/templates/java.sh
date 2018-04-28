export JAVA_HOME=/usr/local/{{ jdk_version }}
export JAVA_BIN=/usr/local/{{ jdk_version }}/bin
export PATH=$JAVA_HOME/bin:$PATH 
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

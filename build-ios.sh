#!/bin/bash
mvn install -Djavacpp.platform=ios-x86_64 -Djavacpp.compiler.skip=false -P ios -am -pl nd4j-backends/nd4j-backend-impls/nd4j-native -DskipTests -Denforcer.skip -Dmaven.javadoc.skip 
mkdir -p target/ios-x86_64
mkdir -p target/ios-arm64
ar rcs target/ios-x86_64/libjnind4j.a ./nd4j-backends/nd4j-backend-impls/nd4j-native/target/classes/org/nd4j/nativeblas/ios-x86_64/jnijavacpp.o ./nd4j-backends/nd4j-backend-impls/nd4j-native/target/classes/org/nd4j/nativeblas/ios-x86_64/jnind4jcpu.o
ar rcs target/ios-arm64/libjnind4j.a ./nd4j-backends/nd4j-backend-impls/nd4j-native/target/classes/org/nd4j/nativeblas/ios-arm64/jnijavacpp.o ./nd4j-backends/nd4j-backend-impls/nd4j-native/target/classes/org/nd4j/nativeblas/ios-arm64/jnind4jcpu.o
lipo -create -output target/libjnind4j.a target/ios-x86_64/libjnind4j.a  target/ios-arm64/libjnind4j.a

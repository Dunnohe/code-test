package com.github.dunno.btrace;

import static com.sun.btrace.BTraceUtils.*;
import com.sun.btrace.annotations.*;


@BTrace public class NoahBtrace {


    @OnMethod(clazz = "java.util.zip.Inflater", method = "/.*/")
    public static void traceMethod() {
        println("[who call java.util.zip.Inflater_inflateBytes]:");
        jstack();
    }
}

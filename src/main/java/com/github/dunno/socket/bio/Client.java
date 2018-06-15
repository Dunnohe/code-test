package com.github.dunno.socket.bio;

import org.apache.commons.io.IOUtils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Client {

    public static void main(String[] args) {
        Socket socket = null;
        BufferedReader bufferedReader = null;
        PrintWriter printWriter = null;
        try {
            socket = new Socket("127.0.0.1", 9001);
            bufferedReader = new BufferedReader(new InputStreamReader(socket.getInputStream()));

            //printWriter.print(socket.getOutputStream(), true)   ;
        } catch (Exception e) {

        } finally {
            IOUtils.closeQuietly();
        }
    }
}

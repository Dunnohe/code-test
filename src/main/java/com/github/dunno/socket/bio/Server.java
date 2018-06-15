package com.github.dunno.socket.bio;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

@Slf4j
public class Server {


    public static void main(String[] args) {
        ServerSocket serverSocket = null;
        try {
            serverSocket = new ServerSocket(9001);



            //监听这个端口来的连接,阻塞的
            Socket accept = serverSocket.accept();


        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(serverSocket);
        }

    }
}

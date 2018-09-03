package com.lz.wechat;

import org.json.JSONException;
import org.json.JSONObject;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

public class try1 {
    public static void main(String[] args) {
        String message = "{\"nickname\":\"风清扬0.9789030612571901\",\"content\":\"a\"}";
        System.out.println(message);
        JSONObject obj=null;
        try {
            obj = new JSONObject(message);
        }catch (JSONException e){
            e.printStackTrace();
        }
        System.out.println(obj);
    }

}

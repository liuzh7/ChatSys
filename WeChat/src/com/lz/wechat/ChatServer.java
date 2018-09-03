package com.lz.wechat;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import org.json.JSONException;
import org.json.JSONObject;
//import net.sf.json.JSONObject;

@ServerEndpoint("/websocket")
public class ChatServer {
    private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static Vector<Session> room = new Vector<Session>();

    /**
     * 用户接入，放进Vector
     * @param session 可选
     */
    @OnOpen
    public void onOpen(Session session){
        room.addElement(session);
    }

    /**
     * 接收到来自用户的消息
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message,Session session){
        //把用户发来的消息解析为JSON对象
        System.out.println(message);
        JSONObject obj=null;
        try {
            obj = new JSONObject(message);
            //向JSON对象中添加发送时间
            obj.put("date", df.format(new Date()));
            //遍历聊天室中的所有会话
            for(Session se : room){
                //设置消息是否为自己的
                obj.put("isSelf", se.equals(session));
                //发送消息给远程用户
                se.getAsyncRemote().sendText(obj.toString());
            }
        }catch (JSONException e){
            e.printStackTrace();
        }

    }

    /**
     * 用户断开
     * @param session
     */
    @OnClose
    public void onClose(Session session){
        room.remove(session);
    }

    /**
     * 用户连接异常
     * @param t
     */
    @OnError
    public void onError(Throwable t){

    }
}
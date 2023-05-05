package com.sys.lawyer.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sys.lawyer.App;
import com.sys.lawyer.base.Base;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
public class WxUserUtils extends Base {

    public static JSONObject getOpenId(String code) {
        List<NameValuePair> params = new ArrayList<>();
        // 添加至HTTP请求参数集合
        params.add(new BasicNameValuePair("appid", App.wxAppId));
        params.add(new BasicNameValuePair("js_code", code));
        params.add(new BasicNameValuePair("secret", App.wxSecret));
        params.add(new BasicNameValuePair("grant_type", "authorization_code"));
        // 将请求参数转换成GET方式
        String queryString = URLEncodedUtils.format(params, "UTF-8");
        HttpRequestBase httpRequestBase = new HttpGet(App.URL + queryString);
        // HTTP客户端
        CloseableHttpClient httpClient = HttpClients.createDefault();
        String body = "";
        try {
            // HTTP响应
            CloseableHttpResponse httpResponse = httpClient.execute(httpRequestBase);
            // HTTP实体
            HttpEntity entity = httpResponse.getEntity();
            // 输出内容
            body = EntityUtils.toString(entity);
            // 销毁HTTP实体
            entity.getContent();
            // 关闭HTTP响应
            httpResponse.close();
            // HTTP请求关闭
            httpRequestBase.abort();
            // 关闭HTTP客户端
            httpClient.close();// 输出到客户端
        } catch (IOException e) {
            //e.printStackTrace();
        }
        JSONObject jsonObject = new JSONObject();
        if (notEmpty(body)){
           jsonObject = (JSONObject) JSON.parse(body);
        }
        System.out.println(jsonObject);
        return jsonObject;
    }
}

package com.sys.lawyer;

public class App {

    // 经纬度获取地址
    public static final String JWDJKDZ = "http://api.map.baidu.com/geocoder/v2/?address=:address&output=json&ak=deuzkrF5Zmv6dWpIROXkUfCeIeXQgu0I";
    // 里程计算接口地址
    public static final String LCJSJKDZ = "http://api.map.baidu.com/routematrix/v2/driving?output=json&origins=:origins&destinations=:destinations&tactics=11&ak=TIdTzyvLujB1caeCQGUcg4BPiHyZLHMG";

    public static boolean isStart = false;
    public final static String wxAppId = "wxde0dd7d23b24b0eb";
    public final static String wxSecret = "5e442865b2cb0fb0167a995fe962aae0";
    public final static String URL = "https://api.weixin.qq.com/sns/jscode2session?";
}

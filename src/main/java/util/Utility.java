package util;

public class Utility {

    /**
     * 引数に指定した文字列がnull、または空文字かを判定します。
     * @param str
     * @return
     */
    public static boolean isNullOrEmpty(String str) {
        if(str == null || str.isEmpty()) {
            return true;
        }else {
            return false;
        }
    }

    /**
     * 石の残数に応じて表示する"●"用のhtmlソースを生成します
     * @return
     */
    public static String getStoneDisplayHtml(int num,String kigou) {
    	String a = "";
    	for(int i = 0; i < num; i++) {
    		if(i % 10 == 0 && i != 0) {
    			a += "<br>";
    		}
    		a += kigou;
    	}
    	return a;
    }
    // todo:ここにgetStoneDisplayHtmlメソッドを定義

}
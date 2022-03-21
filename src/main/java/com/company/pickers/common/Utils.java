package com.company.pickers.common;

import javax.servlet.http.HttpSession;

public class Utils {
    //세션 체크 (세션 유효하면 true, 없으면 false)
    public boolean sessionCheck(HttpSession session){
        boolean sc = false;
        if(session.getAttribute("user_id") != null &&
                session.getAttribute("user_name") != null &&
                session.getAttribute("user_nickname") != null &&
                session.getAttribute("grade_code") != null &&
                session.getAttribute("grade_name") != null &&
                session.getAttribute("role") != null
        )sc = true;
        else sc = false;

        return sc;
    }

    public void sessionLogout(HttpSession session){
        session.invalidate();
    }

    public static String getTempPassword(int length) {
        int index = 0;
        char[] charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
                'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                'w', 'x', 'y', 'z' };

        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < length; i++) {
            index = (int) (charArr.length * Math.random());
            sb.append(charArr[index]);
        }

        return sb.toString();
    }
}

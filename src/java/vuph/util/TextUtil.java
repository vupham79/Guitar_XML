/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import state_machine.XMLSyntaxChecker;

/**
 *
 * @author VuPH
 */
public class TextUtil {
    public static String wellformHTML(String src){
        src = getBody(src);
        src = removeMiscellaneousTags(src);
        
        XMLSyntaxChecker checker = new XMLSyntaxChecker();
        src = checker.check(src);
        
        return src;
    }
    public static String getBody(String src){
        String result = src; 
        
        String expression = "<body.*?</body>";
        Pattern pattern = Pattern.compile(expression);
        
        Matcher matcher = pattern.matcher(result);
        if (matcher.find()) {
            result = matcher.group(0);
        }
        return result;
    }
    public static String removeMiscellaneousTags(String src) {
        String result = src; 
        
        // REMOVE ALL SCRIPT TAG 
        String expression = "<script.*?</script>";
        result = result.replaceAll(expression, "");
        
        // REMOVE ALL COMMENTS
        expression = "<!--.*?-->";
        result = result.replaceAll(expression, "");
        
        // REMOVE ALL WHITESHPACE;
        expression = "&nbsp;?";
        result = result.replaceAll(expression, "");
        
        return result;
    }
}

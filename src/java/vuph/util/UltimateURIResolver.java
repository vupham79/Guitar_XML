/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuph.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.URIResolver;
import javax.xml.transform.stream.StreamSource;
import vuph.constant.Constant;

/**
 *
 * @author VuPH
 */
public class UltimateURIResolver implements URIResolver {

    @Override
    public Source resolve(String href, String base) throws TransformerException {
        URL url;
        URLConnection connection = null;
        InputStream is = null;
        StreamSource ss = null;
        System.out.println(href);
        if (href != null
                && (href.indexOf(Constant.DUC_THUONG) == 0
                || href.indexOf(Constant.NHAC_CU_DONG_NAI) == 0
                || href.indexOf(Constant.SAI_GON_MUSICAL) == 0
                || href.indexOf(Constant.HARMONICASHOP) == 0)) {
            try {
                url = new URL(href);
                connection = url.openConnection();
                connection.addRequestProperty("User-Agent", Constant.USER_AGENT);
                connection.setReadTimeout(20 * 1000);
                connection.setConnectTimeout(20 * 1000);
                System.out.println("Connect: " + href);
                is = connection.getInputStream();
                ss = preProcessInputStream(is);
                return ss;
            } catch (Exception e) {
                System.out.println("UltimateURIResolver-resolve: " + e);
            }
        }
        return null;
    }

    private StreamSource preProcessInputStream(InputStream httpResult) throws IOException {
        String textContent = getString(httpResult);
        textContent = TextUtil.refineHtml(textContent);
        InputStream htmlResult = new ByteArrayInputStream(textContent.getBytes("UTF-8"));
        return new StreamSource(htmlResult);
    }

    private static String getString(InputStream stream) {
        StringBuilder stringBuilder = new StringBuilder();
        String line;
        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(stream, StandardCharsets.UTF_8))) {
            while ((line = bufferedReader.readLine()) != null) {
                stringBuilder.append(line);
            }
        } catch (IOException e) {
            System.out.println("UltimateURIResolver-getString: " + e);
        }
        return stringBuilder.toString();
    }
}

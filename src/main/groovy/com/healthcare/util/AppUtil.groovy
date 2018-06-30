package com.healthcare.util

import com.healthcare.Preference
import com.healthcare.User
import grails.gsp.PageRenderer
import grails.util.Holders
import grails.web.mvc.FlashScope
import grails.web.servlet.mvc.GrailsHttpSession
import grails.web.servlet.mvc.GrailsParameterMap
import org.grails.web.servlet.mvc.GrailsWebRequest
import org.springframework.web.context.request.RequestContextHolder
import org.w3c.dom.Node

import javax.servlet.ServletContext
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import javax.xml.transform.Transformer
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import java.util.concurrent.ConcurrentHashMap

class AppUtil {
    static ServletContext servletContext
    private static ConcurrentHashMap site_config = null
    private static final ThreadLocal<GrailsWebRequest> requestCache = new ThreadLocal<GrailsWebRequest>()

    public static clearConfig() {
        site_config = null;
    }

    static String getBaseUrl() {
        return "/";
    }

    private static GrailsWebRequest getCurrentRequest() {
        GrailsWebRequest request = requestCache.get()
        if(!request) {
            request = RequestContextHolder.currentRequestAttributes()
            if(!request) {
                requestCache.set(request)
            }
        }
        return request
    }

    static getConfig(String type, String key = null) {
        if(key) {
            return Preference.findByTypeAndConfigKey(type, key).value
        } else {
            return Preference.findAllByType(type).collectEntries{[(it.configKey): it.value]}
        }
    }

    static getDateFormate() {
        return AppUtil.getConfig("global", "date_formate")
    }

    static getTimeFormate() {
        return AppUtil.getConfig("global", "time_formate")
    }

    public static GrailsParameterMap getParams() {
        try {
            currentRequest.params;
        } catch (Throwable t) {
            return null;
        }
    }

    public static GrailsHttpSession getSession() {
        try {
            currentRequest.session;
        } catch (Throwable t) {
            return null;
        }
    }

    public static HttpServletRequest getRequest() {
        try {
            currentRequest.request;
        } catch (Throwable t) {
            return null;
        }
    }

    public static HttpServletResponse getResponse() {
        try {
            currentRequest.response;
        } catch (Throwable t) {
            return null;
        }
    }

    public static FlashScope getFlash() {
        try {
            currentRequest.flashScope;
        } catch (Throwable t) {
            return null;
        }
    }

    public static String convertToByteNotation(Long size) {
        if (size < 1024) {
            return size.toString() + " B";
        }
        size = size / 1024;
        if (size < 1024) {
            return size.toString() + " KB";
        }
        size = size / 1024;
        if (size < 1024) {
            return size.toString() + " MB";
        }
        size = size / 1024;
        return size.toString() + " GB";
    }

    public static String pluginPackageCase(string) {
        def parts = string.split("-");
        if(parts.size() == 1) {
            return string;
        }
        parts.eachWithIndex { v, i ->
            if(i == 0) {
                string = v;
                return;
            }
            string += v.capitalize()
        }
        return string;
    }

    public static waitFor(Object obj, String property, Object compareValue, Long timeout = 30000) {
        if(obj."$property" != compareValue && timeout > 0) {
            Thread.sleep(1000)
            waitFor(obj, property, compareValue, timeout - 1000)
        }
    }

    public static GrailsWebRequest initialDummyRequest() {
        HttpServletRequest _request = PageRenderer.PageRenderRequestCreator.createInstance("/page/dummy")
        _request.IS_DUMMY = true;
        GrailsWebRequest webRequest = new GrailsWebRequest(_request, PageRenderer.PageRenderResponseCreator.createInstance(new PrintWriter(new StringWriter())), servletContext)
        RequestContextHolder.setRequestAttributes(webRequest)
        return webRequest
    }

    public static String getQueryStringFromMap(Map params) {
        if(params.size() == 0) {
            return "";
        }
        StringBuffer buffer = new StringBuffer();
        for (Map.Entry param: params.entrySet()) {
            buffer.append("&").append(param.key).append("=").append(param.value.encodeAsURL());
        }
        return buffer.substring(1);
    }

    public static Map<String, String> getURLQueryMap(String query) {
        String[] params = query.split("&")
        Map<String, String> map = new HashMap<String, String>()
        for (String param: params) {
            String name = param.split("=")[0]
            String value = param.split("=")[1]
            map.put(name, value.decodeURL())
        }
        return map
    }

    public static XMLNodeToString(Node nd) {
        Transformer trans = TransformerFactory.newInstance().newTransformer();
        ByteArrayOutputStream serialized = new ByteArrayOutputStream();
        trans.transform(new DOMSource(nd), new StreamResult(serialized))
        return serialized.toString();
    }

    public static String docBaseUrl() {
        return Holders.config.kb_server.base_url
    }

    public static Map getResponseMapFromUrl(String url, Map model = null) {
        URLConnection con = new URL(url).openConnection()
        con.doOutput = true
        con.doInput = true
        con.outputStream << AppUtil.getQueryStringFromMap(model ?: [:])
        InputStream stream = con.getInputStream()
        ByteArrayOutputStream output = new ByteArrayOutputStream()
        output << stream
        String response = output.toString()
        Properties properties = new Properties()
        properties.load(new StringReader(response))
        return properties
    }

    static Long getLoggedUser() {
        return session ? session.admin : null
    }

    static User getCurrentUser() {
        return User.get(loggedUser)
    }

    public static Integer getIntervalInMinute(Map config) {
        if(config.interval_type == "day") {
            return config.interval.toInteger() * 24 * 60
        } else if(config.interval_type == "hr") {
            return config.interval.toInteger() * 60
        } else {
            return config.interval.toInteger()
        }
    }

    static getTimeZone() {
        return new SimpleTimeZone(6*60*60000, "admin")
    }

    static String getCurrentDate(int type = Calendar.YEAR) {
        Calendar calendar = Calendar.instance
        return String.valueOf(calendar.get(type))
    }
}

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
import java.text.DateFormatSymbols
import java.time.Year

class AppUtil {
    static ServletContext servletContext
    private static final ThreadLocal<GrailsWebRequest> requestCache = new ThreadLocal<GrailsWebRequest>()

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

    static getConfig(String type, String key = null, def _default = null) {
        if(key) {
            Preference preference = Preference.findByTypeAndConfigKey(type, key)
            return preference ? preference.value : _default
        } else {
            return Preference.findAllByType(type).collectEntries{[(it.configKey): it.value]}
        }
    }

    static String getDateFormate() {
        return AppUtil.getConfig("others", "date_formate", "dd-MM-yyyy")
    }

    static String getTimeFormate() {
        return AppUtil.getConfig("others", "time_formate", "hh:mm:ss a")
    }

    static GrailsParameterMap getParams() {
        try {
            currentRequest.params;
        } catch (Throwable t) {
            return null;
        }
    }

    static GrailsHttpSession getSession() {
        try {
            currentRequest.session;
        } catch (Throwable t) {
            return null;
        }
    }

    static HttpServletRequest getRequest() {
        try {
            currentRequest.request;
        } catch (Throwable t) {
            return null;
        }
    }

    static HttpServletResponse getResponse() {
        try {
            currentRequest.response;
        } catch (Throwable t) {
            return null;
        }
    }

    static FlashScope getFlash() {
        try {
            currentRequest.flashScope;
        } catch (Throwable t) {
            return null;
        }
    }

    static String convertToByteNotation(Long size) {
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

    static waitFor(Object obj, String property, Object compareValue, Long timeout = 30000) {
        if(obj."$property" != compareValue && timeout > 0) {
            Thread.sleep(1000)
            waitFor(obj, property, compareValue, timeout - 1000)
        }
    }

    static GrailsWebRequest initialDummyRequest() {
        HttpServletRequest _request = PageRenderer.PageRenderRequestCreator.createInstance("/page/dummy")
        _request.IS_DUMMY = true;
        GrailsWebRequest webRequest = new GrailsWebRequest(_request, PageRenderer.PageRenderResponseCreator.createInstance(new PrintWriter(new StringWriter())), servletContext)
        RequestContextHolder.setRequestAttributes(webRequest)
        return webRequest
    }

    static String getQueryStringFromMap(Map params) {
        if(params.size() == 0) {
            return "";
        }
        StringBuffer buffer = new StringBuffer();
        for (Map.Entry param: params.entrySet()) {
            buffer.append("&").append(param.key).append("=").append(param.value.encodeAsURL());
        }
        return buffer.substring(1);
    }

    static Map<String, String> getURLQueryMap(String query) {
        String[] params = query.split("&")
        Map<String, String> map = new HashMap<String, String>()
        for (String param: params) {
            String name = param.split("=")[0]
            String value = param.split("=")[1]
            map.put(name, value.decodeURL())
        }
        return map
    }

    static XMLNodeToString(Node nd) {
        Transformer trans = TransformerFactory.newInstance().newTransformer();
        ByteArrayOutputStream serialized = new ByteArrayOutputStream();
        trans.transform(new DOMSource(nd), new StreamResult(serialized))
        return serialized.toString();
    }

    static String docBaseUrl() {
        return Holders.config.kb_server.base_url
    }

    static Map getResponseMapFromUrl(String url, Map model = null) {
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

    static getTimeZone() {
        return new SimpleTimeZone(6*60*60000, "admin")
    }

    static String getCurrentDate(int type = Calendar.YEAR) {
        Calendar calendar = Calendar.instance
        return String.valueOf(calendar.get(type))
    }

    static <T> T getBean(Class<T> requiredType) {
        return Holders.applicationContext.getBean(requiredType)
    }

    static Object getBean(String beanName) {
        return Holders.applicationContext.getBean(beanName)
    }

    static List getMonth(Boolean years = false) {
        List months = new DateFormatSymbols().months.findAll {it}
        if(years) {
            int year = Year.now().getValue()
            return [year-1, year, year+1].collect { y->
                months.collect { (it + " " + y).toUpperCase()}
            }.flatten()
        }
        return months
    }
}
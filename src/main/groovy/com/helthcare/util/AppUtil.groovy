package com.helthcare.util

import grails.gsp.PageRenderer
import grails.util.Holders
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
    static Long api_monthly_hit_count = 0
    private static ConcurrentHashMap site_config = null
    private static final ThreadLocal<GrailsWebRequest> requestCache = new ThreadLocal<GrailsWebRequest>()

    public static String getProductImageSize(Integer size) {
        if(size <= 150) {
            return "150";
        } else if (size > 150 && size <= 300) {
            return "300";
        } else if (size > 300 && size <= 450) {
            return "450";
        } else if (size > 450 && size <= 600) {
            return "600";
        } else if (size > 600) {
            return "900";
        }
    }

    public static String getCategoryImageSize(Integer size) {
        if(size <= 150) {
            return "150";
        } else if (size > 150 && size <= 300) {
            return "300";
        } else if (size > 300 && size <= 450) {
            return "450";
        } else if (size > 450 && size <= 600) {
            return "600";
        } else if (size > 600) {
            return "900";
        }
    }

    public static String geBrandManufacturerImageSize(Integer size) {
        if(size <= 150) {
            return "thumb";
        } else if (size > 150 && size <= 200) {
            return "200";
        } else if (size > 200 && size <= 300) {
            return "300";
        } else if (size > 300) {
            return "400";
        }
    }

    public static clearConfig() {
        site_config = null;
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

    public static grails.web.servlet.mvc.GrailsParameterMap getParams() {
        try {
            currentRequest.params;
        } catch (Throwable t) {
            return null;
        }
    }

    public static grails.web.servlet.mvc.GrailsHttpSession getSession() {
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

    public static grails.web.mvc.FlashScope getFlash() {
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

    public static Long getLoggedUser() {
        return isApiRequest() ? request.getAttribute("admin") : session.admin
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
}

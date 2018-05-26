package com.helthcare.util

import org.apache.commons.io.FilenameUtils

/**
 * Created by zobair on 19/11/13.*/
class StringUtil {
    public static String getCapitalizedAndPluralName(String name) {
        String pname = name.capitalize() + "s";
        if(pname.endsWith("ys")) {
            pname = pname.replaceAll(/ys$/, "ies");
        } else if(pname.endsWith("xs")) {
            pname = pname.replaceAll(/xs$/, "xes");
        }
        return pname
    }

    public static String getUuid() {
        return UUID.randomUUID().toString().toUpperCase()
    }

    public static String RemoveHTMLTag(String html) {
        if (html) {
            return html.replaceAll("</?[^>]*>", "");
        } else {
            return "";
        }
    }

    public static Collection sortInCustomOrder(Collection objs, String matchProperty, List order) {
        return objs.sort {
            order.indexOf(it[matchProperty])
        }
    }

    public static String fileExtension(String url) {
        String ext = FilenameUtils.getExtension(url)
        if(ext && ext.indexOf((int)('/' as char)) > -1) {
            return null
        }
        return ext;
    }

}

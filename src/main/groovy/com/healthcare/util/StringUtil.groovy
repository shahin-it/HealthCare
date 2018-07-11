package com.healthcare.util

import org.apache.commons.io.FilenameUtils

class StringUtil {
    static String getCapitalizedAndPluralName(String name) {
        String pname = name.capitalize() + "s";
        if(pname.endsWith("ys")) {
            pname = pname.replaceAll(/ys$/, "ies");
        } else if(pname.endsWith("xs")) {
            pname = pname.replaceAll(/xs$/, "xes");
        }
        return pname
    }

    static String getUuid() {
        return UUID.randomUUID().toString().toUpperCase()
    }

    static String RemoveHTMLTag(String html) {
        if (html) {
            return html.replaceAll("</?[^>]*>", "");
        } else {
            return "";
        }
    }

    static Collection sortInCustomOrder(Collection objs, String matchProperty, List order) {
        return objs.sort {
            order.indexOf(it[matchProperty])
        }
    }

    static String fileExtension(String url) {
        String ext = FilenameUtils.getExtension(url)
        if(ext && ext.indexOf((int)('/' as char)) > -1) {
            return null
        }
        return ext;
    }

}

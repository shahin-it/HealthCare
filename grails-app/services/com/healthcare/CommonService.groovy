package com.healthcare

import com.healthcare.util.AppUtil
import grails.gorm.transactions.Transactional

@Transactional
class CommonService {
    void uploadImage(def sourceFile, String destination, Map params = [:]) {
        String filename = params.fileName
        String folderPath = destination
        def folder = new File(AppUtil.servletContext.getRealPath(folderPath))
        folder.mkdirs()
        if (folder.isFile()) {
            folder.parentFile.mkdirs()
        }
        File file = new File(AppUtil.servletContext.getRealPath(folderPath + (filename ?: '')))
        if(file.exists()) {
            file.delete()
        }
        file << sourceFile.inputStream
    }
}

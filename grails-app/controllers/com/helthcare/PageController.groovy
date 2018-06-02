package com.helthcare

class PageController {

    def pathology() {
        render(model: [pathology: "current"])
    }
}

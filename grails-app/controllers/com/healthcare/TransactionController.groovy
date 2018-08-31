package com.healthcare

import com.healthcare.crm.Transaction
import grails.converters.JSON

class TransactionController {

    DomainService domainService
    TransactionService transactionService

    def pay(Long domainId, Double amount) {
        if(transactionService.pay(params.title, params.type, domainId, amount, params.note)) {
            render([status: "success", message: "$params.type successfully paid"] as JSON)
        } else {
            render([status: "error", message: "Could'nt pay $params.type"] as JSON)
        }
    }

    def history() {
        Map data = domainService.dataTableElement(Transaction, params)
        [patient: "current", items: data.items as List<Transaction>, count: data.count]
    }
}

package com.healthcare

import com.healthcare.crm.Transaction
import grails.converters.JSON

class TransactionController {

    DomainService domainService
    TransactionService transactionService

    def pay(Long id, Long domainId, Double unitAmount, Integer quantity) {
        if(transactionService.pay(id, params.title, params.type, domainId, unitAmount, quantity, params.note)) {
            render([status: "success", message: "$params.type successfully paid"] as JSON)
        } else {
            render([status: "error", message: "Could'nt pay $params.type"] as JSON)
        }
    }

    def history() {
        Map data = domainService.dataTableElement(Transaction, params)
        [transection: "current", items: data.items as List<Transaction>, count: data.count]
    }

    def edit(Transaction transaction) {
        transaction = transaction ?: new Transaction()
        [transaction: transaction]
    }

    def delete(Transaction transaction) {
        //domainService.delete(transaction)
        render([message: "Successfully deleted", status: "success"] as JSON)
    }
}

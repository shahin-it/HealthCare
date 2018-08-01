<tr class="order-item service-${service.id}">
    <td class="id"><span class="value">#service</span><input type="hidden" name="service_${service.id}.id" value="${service.id}"></td>
    <td class="name"><span class="value">${service.name}</span><input type="hidden" name="serviceId" value="${service.id}"></td>
    <td class="quantity"><span class="value"><input name="service_${service.id}.quantity" type="number" step="0.01" required value="1" min="1"></span></td>
    <td class="rate"><span class="value"><input name="service_${service.id}.basePrice" type="number" step="0.01" required value="${service.basePrice}" min="0"></span></td>
    <td class="discount"><span class="value"><input name="service_${service.id}.discount" type="number" step="0.01" required value="${service.plainDiscount}" min="0"></span></td>
    <td class="price"><span class="value">0.0</span></td>
    <td class="action-navigator btn-group center">
        <span class="btn btn-sm btn-warning remove" title="Remove"><i class="fas fa-trash-alt"></i></span>
    </td>
</tr>
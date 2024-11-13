package taller1.grupo.vueadmin.system.entity;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Facturas", schema = "northwind")
public class Facturas {
    @Id
    @Column(name="Id de factura")
    Integer id_factura;

    @Column(name="Id de pedido")
    Integer id_pedido;

    @Column(name="Fecha")
    Date fecha;

    @Column(name="Fecha de vencimiento")
    Date fecha_vencimiento;

    @Column(name="Impuestos")
    Double impuestos;

    @Column(name="Envío")
    double envio;

    @Column(name="Importe debido")
    double importe_debido;
}

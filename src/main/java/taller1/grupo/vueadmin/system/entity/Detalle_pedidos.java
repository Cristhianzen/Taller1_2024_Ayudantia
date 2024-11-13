package taller1.grupo.vueadmin.system.entity;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Detalles de pedido", schema = "northwind")
public class Detalle_pedidos {

    @Id
    @Column(name="Id")
    Integer id;

    @Column(name="Id de pedido")
    Integer id_pedido;

    @Column(name="Id de producto")
    Integer id_producto;

    @Column(name="Cantidad")
    double cantidad;

    @Column(name="Precio")
    String precio;

    @Column(name="Descuento")
    double descuento;

    @Column(name="Id de situación")
    Integer id_situacion;

    @Column(name="Fecha de asignacion")
    Date fecha_asignacion;

    @Column(name="Id de pedido de compra")
    Integer id_pedido_compra;

    @Column(name="Id de inventario")
    Integer id_inventario;
}

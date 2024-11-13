package taller1.grupo.vueadmin.system.entity;

import java.sql.Date;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Pedidos", schema = "northwind")
public class Pedidos {

    @Id
    @Column(name="Id de pedido")
    Integer id_pedido;

    @Column(name="Id de empleado")
    Integer id_empleado;

    @Column(name="Id de cliente")
    Integer id_cliente;

    @Column(name="Fecha de pedido")
    Date fecho_pedido;

    @Column(name="Fecha de envío")
    Date fecha_envio;

    @Column(name="Precio listado")
    double precio_listado;

    @Column(name="Id de transportista")
    Integer id_transportista;

    @Column(name="Nombre de envío")
    String nombre_envio;

    @Column(name="Dirección de envío")
    String direccion_envio;

    @Column(name="Ciudad dest")
    String ciudad_destino;

    @Column(name="Edo/Prov dest")
    String prov_destino;

    @Column(name="Código postal de envío")
    String cod_postal_envio;

    @Column(name="País o región de envío")
    String pais_envio;

    @Column(name="Gastos de envío")
    double gastos_envio;

    @Column(name="Impuestos")
    double impuestos;

    @Column(name="Tipo de pago")
    String tipo_pago;

    @Column(name="Fecha de pago")
    Date fecha_pago;

    @Column(name="Notas")
    String notas;

    @Column(name="Tipo impositivo")
    double tipo_imposicion;

    @Column(name="Estado de impuestos")
    Integer estados_impuestos;

    @Column(name="Id de situación")
    Integer id_situcacion;
}

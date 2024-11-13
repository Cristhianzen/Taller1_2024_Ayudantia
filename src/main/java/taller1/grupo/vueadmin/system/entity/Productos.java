package taller1.grupo.vueadmin.system.entity;

import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Productos", schema = "northwind")
public class Productos {

    @Id
    @Column(name="Id")
    Integer id;

    @Column(name="Código de producto")
    String codigo_producto;

    @Column(name="Nombre del producto")
    String nombre_producto;

    @Column(name="Descripción")
    String descripcion;

    @Column(name="Costo estándar")
    String costo_estandar;

    @Column(name="Precio listado")
    double precio_listado;

    @Column(name="Punto de pedido")
    Integer punto_pedido;

    @Column(name="Nivel objetivo")
    Integer nivel_objetivo;

    @Column(name="Cantidad por unidad")
    String cantidad_por_unidad;

    @Column(name="Suspendido")
    boolean suspendido;

    @Column(name="Cantidad mínima de reposición")
    Integer cantidad_minima_reposicion;

    @Column(name="Categoría")
    String categoria;

    @Column(name="Datos adjuntos")
    String datos_adjuntos;

   
}

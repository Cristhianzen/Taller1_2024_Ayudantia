PGDMP                     
    |            taller12024    15.4    15.4 r    i           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            j           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            k           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            l           1262    205861    taller12024    DATABASE        CREATE DATABASE taller12024 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE taller12024;
                postgres    false                        2615    205862 	   northwind    SCHEMA        CREATE SCHEMA northwind;
    DROP SCHEMA northwind;
                postgres    false            �            1255    279655    ccur(numeric)    FUNCTION     �   CREATE FUNCTION northwind.ccur(value numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN ROUND(value::numeric, 2);  -- Redondea a 2 decimales
END;
$$;
 -   DROP FUNCTION northwind.ccur(value numeric);
    	   northwind          postgres    false    6            �            1255    279656    iif(boolean, text, text)    FUNCTION     �   CREATE FUNCTION northwind.iif(condition boolean, true_result text, false_result text) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN
     IF condition THEN
        RETURN true_result;
     ELSE
        RETURN false_result;
     END IF;
    END
$$;
 U   DROP FUNCTION northwind.iif(condition boolean, true_result text, false_result text);
    	   northwind          postgres    false    6            �            1255    279657    isnull(text)    FUNCTION     �   CREATE FUNCTION northwind."isnull"(value text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN value IS NULL;
END;
$$;
 .   DROP FUNCTION northwind."isnull"(value text);
    	   northwind          postgres    false    6            �            1259    205863    Clientes    TABLE     �  CREATE TABLE northwind."Clientes" (
    "Id" integer NOT NULL,
    "Compañía" character varying(50),
    "Apellidos" character varying(50),
    "Nombre" character varying(50),
    "Dirección de correo electrónico" character varying(50),
    "Cargo" character varying(50),
    "Teléfono del trabajo" character varying(25),
    "Teléfono particular" character varying(25),
    "Teléfono móvil" character varying(25),
    "Número de fax" character varying(25),
    "Dirección" text,
    "Ciudad" character varying(50),
    "Estado o provincia" character varying(50),
    "C Postal" character varying(15),
    "País o región" character varying(50),
    "Página Web" text,
    "Notas" text,
    "Datos adjuntos" text
);
 !   DROP TABLE northwind."Clientes";
    	   northwind         heap    postgres    false    6            �            1259    279658    Clientes ampliados    VIEW     �  CREATE VIEW northwind."Clientes ampliados" AS
 SELECT northwind.iif(northwind."isnull"(("Clientes"."Apellidos")::text), northwind.iif(northwind."isnull"(("Clientes"."Nombre")::text), ("Clientes"."Compañía")::text, ("Clientes"."Nombre")::text), northwind.iif(northwind."isnull"(("Clientes"."Nombre")::text), ("Clientes"."Apellidos")::text, ((("Clientes"."Nombre")::text || ' '::text) || ("Clientes"."Apellidos")::text))) AS "Nombre del contacto",
    northwind.iif(northwind."isnull"(("Clientes"."Apellidos")::text), northwind.iif(northwind."isnull"(("Clientes"."Nombre")::text), ("Clientes"."Compañía")::text, ("Clientes"."Nombre")::text), northwind.iif(northwind."isnull"(("Clientes"."Nombre")::text), ("Clientes"."Apellidos")::text, ((("Clientes"."Apellidos")::text || ', '::text) || ("Clientes"."Nombre")::text))) AS "Archivar como",
    "Clientes"."Id",
    "Clientes"."Compañía",
    "Clientes"."Apellidos",
    "Clientes"."Nombre",
    "Clientes"."Dirección de correo electrónico",
    "Clientes"."Cargo",
    "Clientes"."Teléfono del trabajo",
    "Clientes"."Teléfono particular",
    "Clientes"."Teléfono móvil",
    "Clientes"."Número de fax",
    "Clientes"."Dirección",
    "Clientes"."Ciudad",
    "Clientes"."Estado o provincia",
    "Clientes"."C Postal",
    "Clientes"."País o región",
    "Clientes"."Página Web",
    "Clientes"."Notas",
    "Clientes"."Datos adjuntos"
   FROM northwind."Clientes"
  ORDER BY (northwind.iif(northwind."isnull"(("Clientes"."Apellidos")::text), northwind.iif(northwind."isnull"(("Clientes"."Nombre")::text), ("Clientes"."Compañía")::text, ("Clientes"."Nombre")::text), northwind.iif(northwind."isnull"(("Clientes"."Nombre")::text), ("Clientes"."Apellidos")::text, ((("Clientes"."Apellidos")::text || ', '::text) || ("Clientes"."Nombre")::text)))), (northwind.iif(northwind."isnull"(("Clientes"."Apellidos")::text), northwind.iif(northwind."isnull"(("Clientes"."Nombre")::text), ("Clientes"."Compañía")::text, ("Clientes"."Nombre")::text), northwind.iif(northwind."isnull"(("Clientes"."Nombre")::text), ("Clientes"."Apellidos")::text, ((("Clientes"."Nombre")::text || ' '::text) || ("Clientes"."Apellidos")::text))));
 *   DROP VIEW northwind."Clientes ampliados";
    	   northwind          postgres    false    215    240    239    215    215    215    215    215    215    215    215    215    215    215    215    215    215    215    215    215    6            �            1259    279663    Detalles de pedido    TABLE     |  CREATE TABLE northwind."Detalles de pedido" (
    "Id" integer,
    "Id de pedido" integer,
    "Id de producto" integer,
    "Cantidad" numeric(18,4),
    "Precio" character varying(255),
    "Descuento" double precision,
    "Id de situación" integer,
    "Fecha de asignación" timestamp with time zone,
    "Id de pedido de compra" integer,
    "Id de inventario" integer
);
 +   DROP TABLE northwind."Detalles de pedido";
    	   northwind         heap    postgres    false    6            �            1259    279697    Detalles de pedidos de compra    TABLE     T  CREATE TABLE northwind."Detalles de pedidos de compra" (
    "Id" integer,
    "Id de pedido de compra" integer,
    "Id de producto" integer,
    "Cantidad" numeric(18,4),
    "Costo unitario" double precision,
    "Fecha de recepción" timestamp with time zone,
    "Publicado en el inventario" boolean,
    "Id de inventario" integer
);
 6   DROP TABLE northwind."Detalles de pedidos de compra";
    	   northwind         heap    postgres    false    6            �            1259    279666    Pedidos    TABLE     1  CREATE TABLE northwind."Pedidos" (
    "Id de pedido" integer,
    "Id de empleado" integer,
    "Id de cliente" integer,
    "Fecha de pedido" timestamp with time zone,
    "Fecha de envío" timestamp with time zone,
    "Id de transportista" integer,
    "Nombre de envío" character varying(50),
    "Dirección de envío" text,
    "Ciudad dest" character varying(50),
    "Edo/Prov dest" character varying(50),
    "Código postal de envío" character varying(50),
    "País o región de envío" character varying(50),
    "Gastos de envío" double precision,
    "Impuestos" double precision,
    "Tipo de pago" character varying(50),
    "Fecha de pago" timestamp with time zone,
    "Notas" text,
    "Tipo impositivo" double precision,
    "Estado de impuestos" smallint,
    "Id de situación" smallint
);
     DROP TABLE northwind."Pedidos";
    	   northwind         heap    postgres    false    6            �            1259    279671    Subtotales de pedidos    VIEW     �  CREATE VIEW northwind."Subtotales de pedidos" AS
 SELECT "Detalles de pedido"."Id de pedido",
    sum((northwind.ccur((((("Detalles de pedido"."Precio")::numeric * "Detalles de pedido"."Cantidad") * ((1)::numeric - ("Detalles de pedido"."Descuento")::numeric)) / (100)::numeric)) * (100)::numeric)) AS subtotal
   FROM northwind."Detalles de pedido"
  GROUP BY "Detalles de pedido"."Id de pedido";
 -   DROP VIEW northwind."Subtotales de pedidos";
    	   northwind          postgres    false    238    229    229    229    229    6            �            1259    279675 *   Diez mejores pedidos por importe de ventas    VIEW     �  CREATE VIEW northwind."Diez mejores pedidos por importe de ventas" AS
 SELECT DISTINCT "Subtotales de pedidos".subtotal AS "ImporteVentas",
    "Pedidos"."Id de pedido" AS idpedido,
    (to_char("Pedidos"."Fecha de pedido", 'dd/mm/YYYY'::text))::date AS fechapedido,
    "Clientes ampliados"."Compañía" AS nombrecompania,
    (to_char("Pedidos"."Fecha de envío", 'dd/mm/YYYY'::text))::date AS fechaenvio
   FROM ((northwind."Clientes ampliados"
     JOIN northwind."Pedidos" ON (("Clientes ampliados"."Id" = "Pedidos"."Id de cliente")))
     JOIN northwind."Subtotales de pedidos" ON (("Pedidos"."Id de pedido" = "Subtotales de pedidos"."Id de pedido")))
  ORDER BY "Subtotales de pedidos".subtotal DESC
 LIMIT 10;
 B   DROP VIEW northwind."Diez mejores pedidos por importe de ventas";
    	   northwind          postgres    false    230    231    231    230    230    230    228    228    6            �            1259    279720    Facturas    TABLE     "  CREATE TABLE northwind."Facturas" (
    "Id de factura" integer,
    "Id de pedido" integer,
    "Fecha" timestamp with time zone,
    "Fecha de vencimiento" timestamp with time zone,
    "Impuestos" double precision,
    "Envío" double precision,
    "Importe debido" double precision
);
 !   DROP TABLE northwind."Facturas";
    	   northwind         heap    postgres    false    6            �            1259    279680    MIVISTA    VIEW       CREATE VIEW northwind."MIVISTA" AS
 SELECT c."Id",
    c."Compañía",
    c."Apellidos",
    c."Nombre",
    c."Dirección de correo electrónico",
    c."Cargo",
    c."Teléfono del trabajo",
    c."Teléfono particular",
    c."Teléfono móvil",
    c."Número de fax",
    c."Dirección",
    c."Ciudad",
    c."Estado o provincia",
    c."C Postal",
    c."País o región",
    c."Página Web",
    c."Notas",
    c."Datos adjuntos"
   FROM northwind."Clientes" c
  WHERE ((c."Id" = 1) OR (c."Id" = 2) OR (c."Id" = 3));
    DROP VIEW northwind."MIVISTA";
    	   northwind          postgres    false    215    215    215    215    215    215    215    215    215    215    215    215    215    215    215    215    215    215    6            �            1259    279705    Pedidos de compra    TABLE     �  CREATE TABLE northwind."Pedidos de compra" (
    "Id de pedido de compra" integer,
    "IdProveedor" integer,
    "Creado por" integer,
    "Fecha de envío" timestamp with time zone,
    "Fecha de creación" timestamp with time zone,
    "Id de situación" integer,
    "Fecha prevista" timestamp with time zone,
    "Gastos de envío" double precision,
    "Impuestos" double precision,
    "Fecha de pago" timestamp with time zone,
    "Importe de pago" double precision,
    "Modo de pago" character varying(50),
    "Notas" text,
    "Aprobado por" integer,
    "Fecha de aprobación" timestamp with time zone,
    "Enviado por" integer
);
 *   DROP TABLE northwind."Pedidos de compra";
    	   northwind         heap    postgres    false    6            �            1259    279710 	   Productos    TABLE       CREATE TABLE northwind."Productos" (
    "Id de proveedores" text,
    "Id" integer,
    "Código de producto" character varying(25),
    "Nombre del producto" character varying(50),
    "Descripción" text,
    "Costo estándar" double precision,
    "Precio listado" double precision,
    "Punto de pedido" smallint,
    "Nivel objetivo" integer,
    "Cantidad por unidad" character varying(50),
    "Suspendido" boolean,
    "Cantidad mínima de reposición" smallint,
    "Categoría" character varying(50),
    "Datos adjuntos" text
);
 "   DROP TABLE northwind."Productos";
    	   northwind         heap    postgres    false    6            �            1259    205868    sys_log    TABLE     h  CREATE TABLE public.sys_log (
    id integer NOT NULL,
    log_type character varying(2),
    method character varying(100),
    params character varying(255),
    "time" bigint,
    ip character varying(20),
    username character varying(100),
    exception_detail text,
    create_time timestamp without time zone,
    description character varying(255)
);
    DROP TABLE public.sys_log;
       public         heap    postgres    false            m           0    0    COLUMN sys_log.id    COMMENT     9   COMMENT ON COLUMN public.sys_log.id IS 'Clave Primaria';
          public          postgres    false    216            n           0    0    COLUMN sys_log.log_type    COMMENT     T   COMMENT ON COLUMN public.sys_log.log_type IS 'Tipo de registro (1 normal 2 error)';
          public          postgres    false    216            o           0    0    COLUMN sys_log.method    COMMENT     C   COMMENT ON COLUMN public.sys_log.method IS 'Método de solicitud';
          public          postgres    false    216            p           0    0    COLUMN sys_log.params    COMMENT     D   COMMENT ON COLUMN public.sys_log.params IS 'Solicitar parámetros';
          public          postgres    false    216            q           0    0    COLUMN sys_log."time"    COMMENT     N   COMMENT ON COLUMN public.sys_log."time" IS 'Tiempo necesario (milisegundos)';
          public          postgres    false    216            r           0    0    COLUMN sys_log.ip    COMMENT     -   COMMENT ON COLUMN public.sys_log.ip IS 'IP';
          public          postgres    false    216            s           0    0    COLUMN sys_log.username    COMMENT     L   COMMENT ON COLUMN public.sys_log.username IS 'Solicitar nombre de usuario';
          public          postgres    false    216            t           0    0    COLUMN sys_log.exception_detail    COMMENT     V   COMMENT ON COLUMN public.sys_log.exception_detail IS 'Detalles del mensaje de error';
          public          postgres    false    216            u           0    0    COLUMN sys_log.create_time    COMMENT     G   COMMENT ON COLUMN public.sys_log.create_time IS 'tiempo de creación';
          public          postgres    false    216            v           0    0    COLUMN sys_log.description    COMMENT     =   COMMENT ON COLUMN public.sys_log.description IS 'describir';
          public          postgres    false    216            �            1259    205873    sys_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.sys_log_id_seq;
       public          postgres    false    216            w           0    0    sys_log_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.sys_log_id_seq OWNED BY public.sys_log.id;
          public          postgres    false    217            �            1259    205874    sys_menu    TABLE     �  CREATE TABLE public.sys_menu (
    id integer NOT NULL,
    name character varying(40),
    parent_id bigint,
    path character varying(100),
    type character varying(2),
    sort integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    component character varying(100),
    permission character varying(100),
    icon character varying(100)
);
    DROP TABLE public.sys_menu;
       public         heap    postgres    false            x           0    0    COLUMN sys_menu.id    COMMENT     =   COMMENT ON COLUMN public.sys_menu.id IS 'Clave Primaria ID';
          public          postgres    false    218            y           0    0    COLUMN sys_menu.name    COMMENT     5   COMMENT ON COLUMN public.sys_menu.name IS 'nombre ';
          public          postgres    false    218            z           0    0    COLUMN sys_menu.parent_id    COMMENT     ;   COMMENT ON COLUMN public.sys_menu.parent_id IS 'padre ID';
          public          postgres    false    218            {           0    0    COLUMN sys_menu.path    COMMENT     1   COMMENT ON COLUMN public.sys_menu.path IS 'url';
          public          postgres    false    218            |           0    0    COLUMN sys_menu.type    COMMENT     Q   COMMENT ON COLUMN public.sys_menu.type IS 'Tipo (1 menú 2 páginas 3 botones)';
          public          postgres    false    218            }           0    0    COLUMN sys_menu.sort    COMMENT     8   COMMENT ON COLUMN public.sys_menu.sort IS 'clasificar';
          public          postgres    false    218            ~           0    0    COLUMN sys_menu.create_time    COMMENT     G   COMMENT ON COLUMN public.sys_menu.create_time IS 'tiempo de creacion';
          public          postgres    false    218                       0    0    COLUMN sys_menu.update_time    COMMENT     I   COMMENT ON COLUMN public.sys_menu.update_time IS 'hora de modificacion';
          public          postgres    false    218            �           0    0    COLUMN sys_menu.component    COMMENT     >   COMMENT ON COLUMN public.sys_menu.component IS 'componentes';
          public          postgres    false    218            �           0    0    COLUMN sys_menu.permission    COMMENT     A   COMMENT ON COLUMN public.sys_menu.permission IS 'ID de permiso';
          public          postgres    false    218            �           0    0    COLUMN sys_menu.icon    COMMENT     3   COMMENT ON COLUMN public.sys_menu.icon IS 'icono';
          public          postgres    false    218            �            1259    205877    sys_menu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_menu_id_seq
    AS integer
    START WITH 37
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sys_menu_id_seq;
       public          postgres    false    218            �           0    0    sys_menu_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sys_menu_id_seq OWNED BY public.sys_menu.id;
          public          postgres    false    219            �            1259    205878    sys_role    TABLE       CREATE TABLE public.sys_role (
    id integer NOT NULL,
    role_code character varying(20),
    role_name character varying(20),
    create_time timestamp without time zone,
    description character varying(200),
    update_time timestamp without time zone
);
    DROP TABLE public.sys_role;
       public         heap    postgres    false            �           0    0    COLUMN sys_role.id    COMMENT     :   COMMENT ON COLUMN public.sys_role.id IS 'clave primaria';
          public          postgres    false    220            �           0    0    COLUMN sys_role.role_code    COMMENT     A   COMMENT ON COLUMN public.sys_role.role_code IS 'código de rol';
          public          postgres    false    220            �           0    0    COLUMN sys_role.role_name    COMMENT     G   COMMENT ON COLUMN public.sys_role.role_name IS 'Nombre del personaje';
          public          postgres    false    220            �           0    0    COLUMN sys_role.create_time    COMMENT     H   COMMENT ON COLUMN public.sys_role.create_time IS 'tiempo de creación';
          public          postgres    false    220            �           0    0    COLUMN sys_role.description    COMMENT     A   COMMENT ON COLUMN public.sys_role.description IS 'Observación';
          public          postgres    false    220            �           0    0    COLUMN sys_role.update_time    COMMENT     I   COMMENT ON COLUMN public.sys_role.update_time IS 'hora de modificacion';
          public          postgres    false    220            �            1259    205881    sys_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_role_id_seq
    AS integer
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sys_role_id_seq;
       public          postgres    false    220            �           0    0    sys_role_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sys_role_id_seq OWNED BY public.sys_role.id;
          public          postgres    false    221            �            1259    205882    sys_role_menu    TABLE     �   CREATE TABLE public.sys_role_menu (
    id integer NOT NULL,
    role_id bigint,
    menu_id bigint,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);
 !   DROP TABLE public.sys_role_menu;
       public         heap    postgres    false            �           0    0    COLUMN sys_role_menu.id    COMMENT     ?   COMMENT ON COLUMN public.sys_role_menu.id IS 'clave primaria';
          public          postgres    false    222            �           0    0    COLUMN sys_role_menu.role_id    COMMENT     =   COMMENT ON COLUMN public.sys_role_menu.role_id IS 'Role ID';
          public          postgres    false    222            �           0    0    COLUMN sys_role_menu.menu_id    COMMENT     =   COMMENT ON COLUMN public.sys_role_menu.menu_id IS 'Menu ID';
          public          postgres    false    222            �           0    0     COLUMN sys_role_menu.create_time    COMMENT     M   COMMENT ON COLUMN public.sys_role_menu.create_time IS 'tiempo de creación';
          public          postgres    false    222            �           0    0     COLUMN sys_role_menu.update_time    COMMENT     O   COMMENT ON COLUMN public.sys_role_menu.update_time IS 'hora de modificación';
          public          postgres    false    222            �            1259    205885    sys_role_menu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_role_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_role_menu_id_seq;
       public          postgres    false    222            �           0    0    sys_role_menu_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_role_menu_id_seq OWNED BY public.sys_role_menu.id;
          public          postgres    false    223            �            1259    205886    sys_role_user    TABLE     �   CREATE TABLE public.sys_role_user (
    id integer NOT NULL,
    user_id bigint,
    role_id bigint,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);
 !   DROP TABLE public.sys_role_user;
       public         heap    postgres    false            �           0    0    COLUMN sys_role_user.id    COMMENT     ?   COMMENT ON COLUMN public.sys_role_user.id IS 'clave primaria';
          public          postgres    false    224            �           0    0    COLUMN sys_role_user.user_id    COMMENT     C   COMMENT ON COLUMN public.sys_role_user.user_id IS 'ID de usuario';
          public          postgres    false    224            �           0    0    COLUMN sys_role_user.role_id    COMMENT     ?   COMMENT ON COLUMN public.sys_role_user.role_id IS 'ID de rol';
          public          postgres    false    224            �           0    0     COLUMN sys_role_user.create_time    COMMENT     L   COMMENT ON COLUMN public.sys_role_user.create_time IS 'tiempo de creacion';
          public          postgres    false    224            �           0    0     COLUMN sys_role_user.update_time    COMMENT     O   COMMENT ON COLUMN public.sys_role_user.update_time IS 'hora de modificación';
          public          postgres    false    224            �            1259    205889    sys_role_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_role_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sys_role_user_id_seq;
       public          postgres    false    224            �           0    0    sys_role_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sys_role_user_id_seq OWNED BY public.sys_role_user.id;
          public          postgres    false    225            �            1259    205890    sys_user    TABLE     9  CREATE TABLE public.sys_user (
    id integer NOT NULL,
    email character varying(100),
    username character varying(50),
    password character varying(100),
    create_time timestamp without time zone,
    enabled boolean,
    nick_name character varying(50),
    update_time timestamp without time zone
);
    DROP TABLE public.sys_user;
       public         heap    postgres    false            �           0    0    COLUMN sys_user.id    COMMENT     :   COMMENT ON COLUMN public.sys_user.id IS 'clave primaria';
          public          postgres    false    226            �           0    0    COLUMN sys_user.email    COMMENT     5   COMMENT ON COLUMN public.sys_user.email IS 'Correo';
          public          postgres    false    226            �           0    0    COLUMN sys_user.username    COMMENT     C   COMMENT ON COLUMN public.sys_user.username IS 'nombre de usuario';
          public          postgres    false    226            �           0    0    COLUMN sys_user.password    COMMENT     =   COMMENT ON COLUMN public.sys_user.password IS 'contraseña';
          public          postgres    false    226            �           0    0    COLUMN sys_user.create_time    COMMENT     H   COMMENT ON COLUMN public.sys_user.create_time IS 'tiempo de creación';
          public          postgres    false    226            �           0    0    COLUMN sys_user.enabled    COMMENT     V   COMMENT ON COLUMN public.sys_user.enabled IS 'Estado (0 deshabilitado 1 habilitado)';
          public          postgres    false    226            �           0    0    COLUMN sys_user.nick_name    COMMENT     8   COMMENT ON COLUMN public.sys_user.nick_name IS 'apodo';
          public          postgres    false    226            �           0    0    COLUMN sys_user.update_time    COMMENT     I   COMMENT ON COLUMN public.sys_user.update_time IS 'hora de modificacion';
          public          postgres    false    226            �            1259    205893    sys_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sys_user_id_seq
    AS integer
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sys_user_id_seq;
       public          postgres    false    226            �           0    0    sys_user_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sys_user_id_seq OWNED BY public.sys_user.id;
          public          postgres    false    227            �           2604    279691 
   sys_log id    DEFAULT     h   ALTER TABLE ONLY public.sys_log ALTER COLUMN id SET DEFAULT nextval('public.sys_log_id_seq'::regclass);
 9   ALTER TABLE public.sys_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            �           2604    279692    sys_menu id    DEFAULT     j   ALTER TABLE ONLY public.sys_menu ALTER COLUMN id SET DEFAULT nextval('public.sys_menu_id_seq'::regclass);
 :   ALTER TABLE public.sys_menu ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            �           2604    279693    sys_role id    DEFAULT     j   ALTER TABLE ONLY public.sys_role ALTER COLUMN id SET DEFAULT nextval('public.sys_role_id_seq'::regclass);
 :   ALTER TABLE public.sys_role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            �           2604    279694    sys_role_menu id    DEFAULT     t   ALTER TABLE ONLY public.sys_role_menu ALTER COLUMN id SET DEFAULT nextval('public.sys_role_menu_id_seq'::regclass);
 ?   ALTER TABLE public.sys_role_menu ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            �           2604    279695    sys_role_user id    DEFAULT     t   ALTER TABLE ONLY public.sys_role_user ALTER COLUMN id SET DEFAULT nextval('public.sys_role_user_id_seq'::regclass);
 ?   ALTER TABLE public.sys_role_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            �           2604    279696    sys_user id    DEFAULT     j   ALTER TABLE ONLY public.sys_user ALTER COLUMN id SET DEFAULT nextval('public.sys_user_id_seq'::regclass);
 :   ALTER TABLE public.sys_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            T          0    205863    Clientes 
   TABLE DATA           N  COPY northwind."Clientes" ("Id", "Compañía", "Apellidos", "Nombre", "Dirección de correo electrónico", "Cargo", "Teléfono del trabajo", "Teléfono particular", "Teléfono móvil", "Número de fax", "Dirección", "Ciudad", "Estado o provincia", "C Postal", "País o región", "Página Web", "Notas", "Datos adjuntos") FROM stdin;
 	   northwind          postgres    false    215   1�       a          0    279663    Detalles de pedido 
   TABLE DATA           �   COPY northwind."Detalles de pedido" ("Id", "Id de pedido", "Id de producto", "Cantidad", "Precio", "Descuento", "Id de situación", "Fecha de asignación", "Id de pedido de compra", "Id de inventario") FROM stdin;
 	   northwind          postgres    false    229   �       c          0    279697    Detalles de pedidos de compra 
   TABLE DATA           �   COPY northwind."Detalles de pedidos de compra" ("Id", "Id de pedido de compra", "Id de producto", "Cantidad", "Costo unitario", "Fecha de recepción", "Publicado en el inventario", "Id de inventario") FROM stdin;
 	   northwind          postgres    false    234   ��       f          0    279720    Facturas 
   TABLE DATA           �   COPY northwind."Facturas" ("Id de factura", "Id de pedido", "Fecha", "Fecha de vencimiento", "Impuestos", "Envío", "Importe debido") FROM stdin;
 	   northwind          postgres    false    237   !�       b          0    279666    Pedidos 
   TABLE DATA           �  COPY northwind."Pedidos" ("Id de pedido", "Id de empleado", "Id de cliente", "Fecha de pedido", "Fecha de envío", "Id de transportista", "Nombre de envío", "Dirección de envío", "Ciudad dest", "Edo/Prov dest", "Código postal de envío", "País o región de envío", "Gastos de envío", "Impuestos", "Tipo de pago", "Fecha de pago", "Notas", "Tipo impositivo", "Estado de impuestos", "Id de situación") FROM stdin;
 	   northwind          postgres    false    230   w�       d          0    279705    Pedidos de compra 
   TABLE DATA           K  COPY northwind."Pedidos de compra" ("Id de pedido de compra", "IdProveedor", "Creado por", "Fecha de envío", "Fecha de creación", "Id de situación", "Fecha prevista", "Gastos de envío", "Impuestos", "Fecha de pago", "Importe de pago", "Modo de pago", "Notas", "Aprobado por", "Fecha de aprobación", "Enviado por") FROM stdin;
 	   northwind          postgres    false    235   Σ       e          0    279710 	   Productos 
   TABLE DATA           3  COPY northwind."Productos" ("Id de proveedores", "Id", "Código de producto", "Nombre del producto", "Descripción", "Costo estándar", "Precio listado", "Punto de pedido", "Nivel objetivo", "Cantidad por unidad", "Suspendido", "Cantidad mínima de reposición", "Categoría", "Datos adjuntos") FROM stdin;
 	   northwind          postgres    false    236   ��       U          0    205868    sys_log 
   TABLE DATA           �   COPY public.sys_log (id, log_type, method, params, "time", ip, username, exception_detail, create_time, description) FROM stdin;
    public          postgres    false    216   *�       W          0    205874    sys_menu 
   TABLE DATA           �   COPY public.sys_menu (id, name, parent_id, path, type, sort, create_time, update_time, component, permission, icon) FROM stdin;
    public          postgres    false    218   �A      Y          0    205878    sys_role 
   TABLE DATA           c   COPY public.sys_role (id, role_code, role_name, create_time, description, update_time) FROM stdin;
    public          postgres    false    220   �E      [          0    205882    sys_role_menu 
   TABLE DATA           W   COPY public.sys_role_menu (id, role_id, menu_id, create_time, update_time) FROM stdin;
    public          postgres    false    222   qG      ]          0    205886    sys_role_user 
   TABLE DATA           W   COPY public.sys_role_user (id, user_id, role_id, create_time, update_time) FROM stdin;
    public          postgres    false    224   gH      _          0    205890    sys_user 
   TABLE DATA           o   COPY public.sys_user (id, email, username, password, create_time, enabled, nick_name, update_time) FROM stdin;
    public          postgres    false    226    I      �           0    0    sys_log_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.sys_log_id_seq', 6628, true);
          public          postgres    false    217            �           0    0    sys_menu_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sys_menu_id_seq', 56, true);
          public          postgres    false    219            �           0    0    sys_role_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sys_role_id_seq', 8, true);
          public          postgres    false    221            �           0    0    sys_role_menu_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sys_role_menu_id_seq', 28, true);
          public          postgres    false    223            �           0    0    sys_role_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sys_role_user_id_seq', 15, true);
          public          postgres    false    225            �           0    0    sys_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sys_user_id_seq', 10, true);
          public          postgres    false    227            �           2606    205902    Clientes Clientes_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY northwind."Clientes"
    ADD CONSTRAINT "Clientes_pkey" PRIMARY KEY ("Id");
 G   ALTER TABLE ONLY northwind."Clientes" DROP CONSTRAINT "Clientes_pkey";
    	   northwind            postgres    false    215            �           2606    205904    sys_log sys_log_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.sys_log
    ADD CONSTRAINT sys_log_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.sys_log DROP CONSTRAINT sys_log_pkey;
       public            postgres    false    216            �           2606    205906    sys_menu sys_menu_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT sys_menu_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sys_menu DROP CONSTRAINT sys_menu_pkey;
       public            postgres    false    218            �           2606    205908     sys_role_menu sys_role_menu_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sys_role_menu
    ADD CONSTRAINT sys_role_menu_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sys_role_menu DROP CONSTRAINT sys_role_menu_pkey;
       public            postgres    false    222            �           2606    205910    sys_role sys_role_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sys_role
    ADD CONSTRAINT sys_role_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sys_role DROP CONSTRAINT sys_role_pkey;
       public            postgres    false    220            �           2606    205912     sys_role_user sys_role_user_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sys_role_user
    ADD CONSTRAINT sys_role_user_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sys_role_user DROP CONSTRAINT sys_role_user_pkey;
       public            postgres    false    224            �           2606    205914    sys_user sys_user_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT sys_user_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sys_user DROP CONSTRAINT sys_user_pkey;
       public            postgres    false    226            T   �  x����r�H������Vr��"`��q�:�KG����vf�n|�G٣9��z�4FCŊ��������nB��|�J`Ђ6)�4��<�H!\al�B�C#4�~�|�<8���[���������߂0:�	�s� �̈�V?��.����;\���fN��A9���&4�U�Fhk�7��U�����1��]C˸��=���,)��Q�Q���m-�32��,��jF�,ĕ8�K��Ф�W�)*���>}ڙ#�Ѹ5�0�%��\��
�E	�z�ŭ&ZZͱأ6os��Q��BKa!V��,Y�0.n]�>��τ�A�
��3�K��WD���
�U�҃I�J/�:��εD�]��7'��
Kpҩ�x]rs6dV�XN���;J.�cm����i�Q	r�M.3NG��^N�pL�'CY�����	J���,�xwVE�Q"��`�-�0�9b1:�M��L|)R�i8T�%��|�H���sl|b ��Ś��VSxN@���h��[��(�� m0��`8���$�@7�t��2���
�^��A�|�&4_\r��*�z���� �p�3���DH�'�)%ģJ Ͼ#N.��8C�7՘2�g���|�������z�g��zB����$�E|�s���'������2���v30c6"�&&^�l���zZ>ݐ$b��\O���S)�Gכ�s��s�!wZ�fz}Y�K��(��QH�a���L]s͉<O��͸��sq�ʙ�q)�4��T�8��Z{"��+�ȶ!v<#&!�����>���)�"�gY*P=P����h��u����{&��_��E��Rv��#���ez�
u�*��c�6��%��sD��ϙ¸��}��ތ��{<���@"��`��oSf~�����er���׫H�	�������j��fñ��:�H�Y���p�x��&u��a��w�ȓss`�%>MO�R~t�xvpp��/��      a   �  x��UKv$![[��À1\"'����t�J׬gSy��T����.%I��)}$��VI���SF�^�{0:I/���kćg������*��`�$���z���d���K`?qG)��"���v:X9:VcU���f�
0��JRj_���
�ؤ*�2VFg6��D�%�l�S������"�w����7�����ꇌ���*����MNDIk��l��N�^7�O�*,pvS�vS��	��$x>���O�Ks��p���b~*;b�ua�� ��L0��Q������˓�6��ʡ��3���W>�XLV��yj��	h�1��z�wj���b/�.�H�B�>7g,�1J3lP�d]3�sCGFK�a[H=��6=Ξ�� -O¾#׎���m�����M�v�ۋIr�p���q9F�1�`[���v8�F��W��hNpz��q��
N�Y��q���/�k�Z�.����߿�0u��K�5|�}p�`X�ϑԻ�hv��G�N��`�/�<޶��	�86�r�XZ�C.W(}s�d(:�o֍'!�� ��ީ,��E+E���[0l����[Ti�.���hi3lD�G�^��'����>m<?/��?/��?/��?/�|��> |��t�      c   _  x��VA�!<3���B�$�#�=����0���ڋ�H�n��\C�AB���� %���ү��-��/h�Rn�I�A�P�eK%2���m�����|C~
-��H�P" � RZ������q����̗�ľ d �v�& ���z VHie~����@N[�(�и��4�C�{���Ƞ�
��.خT ��e�t53l��-��O�Ag�:�����)��:{*+ K@�0�(��2����SZH��S��5Ī���l=Y_h�Y!/ h	nk%x��^TȰ�u��\��b���~�~��3H��?�>��hv`�*��	X�Ǝ ��q��T���Ν�?���{�+�!şN�s�B�+���u�����AQ25�Z0�۹���ן���g�"�1�M�p�v�Iz!3zBD;!��+ʝ�s���A���1�Z�����y�s�|��c욓�J����Dp2��㠧��\ X�~U&=:$��@��GÐ����4c�"�|�@A9��A�>�7t��4;}Z���u\u�� ��z�F���f~�p�}������q�=�{�2.B)����]�b����W��m�Ⱦ�o      f   F  x�e��m�0�3]�6�ů�"R��_G�	��c��E�I	s<Y�"�Ż�<���I�~� @�Kr�$�?d���h�@�e1�!݈�|�n1i���=�"T���RGu0�RRj��Oe��J���I��rS�ozk�XZε��I��g-���j�/T}�:�!��y@�dU�~��,�D�k�\"dqW6;P���Sk��^�)1�F�<m	JL��`�I��5;�T�ӷ�=JC�����mR�Jg�P�ܕ���N�	���\�Ή=�
�2
��u����1�j+��Y��}�@����z�8s:�*	��I	��Ǟ��Ǚ��q]���      b   G  x���n�6����ԅΒs�u�@vc'��l�+�6��J�w�w}�\��b��"))�� #D����?�1� ��M��V���<{��M����0��SY�@#�\��IFWI�}z��
�bX���pfܑ9����t�=�������D���&*�����rz��p�&���)�rʰqEȎt��i�㛬��I��&�%@�k�p�ɱ#J�O1�`�9�e+s�J�d����;N�l�zN�"�d�fq}Jk�m��|�9��:�I�AK��A�1d1I3�v��Q�7;ޛ$͗������k��:���h�`v��%�<�x�Rn�XY��q1{pXh������&��i�� o�X�!l�yN؆�ht]BDDK�Aٯ�)�]jh�HV���?[=#iD�}m&�����ɒ�
J�.�$QN7�J�"��:G��<<(~L1�h%���)%?��K��kG;%?��=���x��3����nUa
0 :,�ixX(�y.���*�9f�¸���T6�1Y=.h�f�2��Q�:�GRi��a��3/*��k}�T����6)��/8z(��K#�>E��4��]^��5�^���l��u�3�l޿��x�N��{z���ty^�2_T^>��=��u�q�-�zCnD
��:�U�y-�����4���\k�)]Zǘ�E�U�w/�H�(���HL��Uzզ����1�S7��
�P�XE����Vߔ�.(L����N��������SL��O�4��ܸ�����跙Њ�^$� ʀwz��.�S��zǬ�m��y
_�[��WS��zϯ{������M�f�����,���x�WAZ��JHݮ�qE��#�]�S��W�>w���7?�$V�
�g&��N;�&��}��x�����x
2����x6���x*YyJ�x6Oi�Ƴ"��(���J����x
���0��_�O�m��iC��
Sn�x
 ����"ܺ�$���xz��T���x
� �4�^�a*��OA
���xzr�"��7�� ��l�؝�T��b��k�x���	dU(Z�oh\4���d�#�1Y��KJ���nʴ�����\�m���m��{F���t��8�m�����m
2��nӗ�M1�.nS��p�Msہ۬J��f��o�mVA�m6���mV���m6����f� �M_>H��MA�����/���t�<�xO��.��!߽ӧ.״�3�9j��]+u�<W�s�<W�se�z���z���z���z���z���z�[O��z�ۙ���\=�Ӫ�z���z����#(=����WB�y����/�_��z�pw�O      d   �  x�͖Mn�0���S��<��[�=$"Z�J�˱l/��JR��*V"MF�}N����Vh�R1�J�c���{P|��xP�Y]܃��{h��=��Lq�����1Y=�73�h��f6���f�]�u3����}+�Vy+�绾F��&�:�E�����A���8H����ͅqHB�$0	�E"1=˕�� ��]Q�y�:��)'��$��<	����Hl?��H�7�L���f ���x�q����f�s�@����qH|��1I;f��y�$ῐ�j%~a��'���v��Jc'���U$�g�r�r����w��@IetѨh���،Q�B=��GTQ�a.��ڃ�ƥ�����T&�N�QMN��\���贌��O�=�3E�#���r�b�K�R��W�Oqz'��tdץ      e   �  x��W�r�6]�_�(Y>&+[�x&S9�:�n��)�fJ
D������eYt��V?�{��#�q3���8�u�5'����E�������^6ѕ6���M����TfC�]��%�d%�R�S��j�^n��M��n���ᅺi����_�gobF����ˍ4��O	�_@� ٫�����H�U�p<�ݲY��מ�|z��~��f��Nʁ��� ^ZJ{1+���YsL'��M,�y��^���m�$iϦY��@�r�;��`���I��qN�ʬT+�Vڀ+>E�F�n�
��+�B��;�ZE��
�FlĬuw��[�bFI�Ox��*.�B!�F�!>J��,�IA����X�H���2[��8'��D��$�'���|:M��l�GcX>��bl�3���U�UE�:�%�G��ґ��������/1��VK�5����S�
1E�1xPf��T��^��!Ye��r��R���]I�����6[�c��fϓ�� k飢�P5jg�P����m�F�k�)�ԣ?��qF��J1���g�'3�N���D�eP#�X�]�ue��ݓ�aM��E�cğa'�;Ճu��\dI�$�d�C��.1�Kp:������ǰ�I �!�ݝQ�uP^K,_n��Y�����ddΧ�KGnw��k���!ەzʊ"���U��Cm�l��4k{�	g�g���-4����c<(? �tT��]�[A��ǰ���}�JD��t:����!_jț��j&2����n��IIc"68F$��%!#�"�e�1z���4�o�A(��U�bP��z�=�Il{Xİ�����4�DY.'��m�M Nr���p�|h����'��Ub��<	M'�%Ʌ�zX�د(�Pt3�ea�e:���� �n*�@�D�@��zL$�A�ߣ!�N�GK(�1�s��I�o
 O2�?.M�tȢ�:��?�^T���`rR�҄�� ���D��ǉ���&��5*�}�26h(�8��a]8�v��l��#XgJ�(�.`����[�՟ҍ��3���&U5L@�aB���X+�E��6��V�J�.�
�FO�US���M��H�_tD��2xk�>��k[�t�~�zp�Z���g�h�[&�.�]�a0D3��1��`�$��#znkZ�OuI�|�����)�!����S>������$|9)K?���ͭ��
fG�|c�jd�`�i�M�����#���J=�����hbs���!#?��)hSkid�K��B�!�wa���#/%�����Ɩ�N�� b#������������%�a�h�I�gs��	��~�O`�ʣ�X"CF!:1���E��w��߮�"����T�A;�ZK8��O�	�-��6~��.��S�q~��cV#���V"�.9;;�a��b      U      x��[�#Ǖ&���ij>T�iB~���슢��ڤ��F-Y[ S�ʬ�������؇�y�W��=�@F�s w!G�-V!��_��;����詿�d��������C�zws�=���4���wO�����8<|��ɿ~��~�/n�7���+?l�{�y��[=�w���O�?��{�˫������#U']�t'��(��G����P�?��^I}-���P�
� z�p��?\��<>�W�����������PAi�=�}����������������8���)�����_�)c}P�f�4����c�\�B�Vbi��9�:(�p�u0�\~�j�G'��!Z��V��f�h9C���ۛ�� o��q�l�+�F_}5,?<�O���O��߮��O���/��ǧ�?��a���������������C�n�����q���wâ��
�>O��=|<<�������G����-�3R,��3����J�C�[+�U�¸�~yw����)}o��?�&�����c�X@�T^��A�`�+?�a��T�:D�碳JF3s�/?H���n�� o�AEXəAJq�A�Td��FR��u�b�N�-����w!�W̅�&vZ����*9�~�bZ��i�v�^?�/�x��r 12��(q*�C�oD�Xm���/Cd��F'V����p�
h���+[����t"k��;�go�3e�p�c[��n��Sz���il�:��vQZ��������~u�R���@n
�N��]b�Z���9g�N�)5�Y;�^�a=��$1���N�ѡ�x��J����E`�����Ν<��_��//y��W�h�݇�۴������yP{b枇�	ei�ɳ鮍��%E����D�j�1'���+.	���QuB8x���|	��0|5�˧��giW;���v�o�W����aq8��oq����gЯ���QoI�Q+ŵ���`3ʹ��H2����1iZ�5D4����~��_����?��镞��4W�Q����iAm2�ێ� �r�ۈ�uBJ+3����H���-D�bb%q��*�`�:t�:z�=*|5��D�i��3��x����"lq����K�v��Ƙ�`p�����*��:k!}T�P��>S�V7	5����T�E0B��"�
%Z��������|��TR��w�pq)�񻅫��SK��@��5+��[e��p%yM)�4X5�S>x{|MA�YA�/tq�@s*��^W0�L%A��5Ջ���N�F[ډ�B��q�j��pϷ
�l�i�Ud�ye3�E�u� c���f�$7�=����FJ_8ѶŽHu  D�;�U�(Fl�K�.^PQꂴ��m�_�<c�-0�����	TN�2�(f��l��"�'���e��RdCJ�k���R���W�!/�FG�X�E�zJ�y�d�a��v�̼�JJ۳�a8��&���l����wS`j��i~&ʓ�5�Z>�b���Z{��5{�A;y �!�er����]K�E�����h�mY�rxG0�u�/8�6��n�#YUu�}�1���p|���WH������c�뼷����2 �Vt^1�B<���Ҍ#WRpA��e�[�T�JK������<�:F��`��L����[��jt���5�;�9-���7؍d�PZ�9'�(��d�;��QlR�V�2tV;�{�wZD�8�e��+yoC%��D�
2BTN:Y�ZC��|`sQ% �Ժ�.M�@���~õ�kBN`l�P/#X02�����,V�/3�cD�xT�$Bl!��f+"t]N��bղ��(�2��&����R[���p�r5�����9Ku�̍xzPq�/�^�z�:cD�aL�qg�����z�FXZ9��$�V:��^6�	ʠ�&�x�[v�2a^%�" �)g�F-L�+H��JƱ��S���4<o-�@u.�"9T�#P�E��8n��א!(�҆�S��à�T��s��
��[�L�\��Yj��8Fkl3���b�j�W�qR�a�
C�NI3c���/�)��8�o��SLF���c����䮎L�"Bvb!y�Mҳ�4����Wp#i��j��{��3�s��N?S�i�a��aև^��*��g<̕NYv0z��TEV�ʹݬ�q�K���gLV�`���n,/�Z��^�0����U�땊C��?���`�l����p�t�.����sV��q�M��N*!r�i�B79�ꮥ�+���5��#��13�	l)����C�؄Q�0e*�b��(P�|�%Ǚ?s�Ov�q��]�)6^�y������@����'|.�n˨�r��``Ą0�✳�j�c�hUg����CDO&���1O�`��m2[�^��TΪ~-F�v�.z���B�@8��h����n,D*%��\�	0S�"�?�934~z����m�O���ށ�ۂ���J��
����ҊL��T7P9ɕ�����Ns��h�M�RP'�u.�gWBz�oϦ(��D��#Z�&26�v]�"
jm��X�xh����y��FW3t袗�/�%�� 0ڧ�"A��ʙ;�䓸��s�)���^ҧe3͊K�����1
��\n�*�GA�pI�uT��1|������+P�}C0§�	g���V�ٰIrb�߈�w�:W��l-⑗&�<l1Z��x�}�J/�b�=Vw��(f�Og����~�6V0C�)�f���П�&b�H�e�˵wj3��)�b�%r,ˮSo����˘�d��s������]��"��������e���ޙ�]xT�#ξ����.����3�]XR:�|L ��{DD������_�pH���<�v�8ds�Ny�x7����]��q޹[?�w�⏦�ɇ`����a��#�!��٤�c�>��z;P�w�x���8�0z2G���+˨���P�w�ϩ'���Iߑ��s
�k��H��q7��1�U�9�&���hӡ��U�~g���M��Z"�bz4���N��x��hqG!l�7�p�1����]Ѕj��
�<��q1���H-	!�V�j���;b���R}&����|�pA�H�O���u�%��h5�'�t]@�oƧsīz1ڮ�k'Y��cр4^���J�T���_�{�8F����}�<�P�����ݘ��s�6�&Y�3ݖ���I4�UPG��+/Rڽ#[�ɧ'��s�iۂL��ӓޔ}z����-�R��Ғ��/��2ҹ;�f�0�E�,�!eF6m=lv��X.CLĺDv��3��\��rg�[D��m�EƧ���Euw
=��-��*�(۽L�����b4^�w�l����1k¦�� �Z��D^� Spd���b�4F�|y@��I�/i�t�z�3~��fc��5�l^+�7�^3�ҕ��:y,p�R��W?,��R�U��.���li���}�?��Ϫ��7�K�t+����J�4r۠�f�Dl�h�B	s|g���C��ֶE���g+�(r��f��?���`ٴ^-���_}X��f�D�fԠט����%��k����Q�86��L�(ugbn��AZ	�@=R�vs�!��@jf�����f"$�1M�1Q"GP9�\�n�IC���בfh�1Z	Z��yWl����jm�_XE��`h�Z��Y�+ff�˩ڨ�*,˨Qߎ�G�FX^�3+{�Y���N��%I#�R� _/�;>�B��6��y/��!���.�#F۩��EJ�!q��fN�a$&g Ƒ�;8���P^��[�mX��MZ�fp`&:��a��>���d�Z��n&�㰜���Y��`~Iǰ��g-����l��Ujp������%©
�����l!iJ�hMjL��xD�/"l�+F�M�!��9l��BM�����(�+���i)���[�*�,#�Vʰ+���׷5\������l�l��k����TٴA��p��+���!(��}xJ�ힶ��)�ξ_�0�#�9��[�N�m;^�;�K�kʀ�V
ײ)�k�    ��Qj�\3�Ҙ$��Xc�f�>O�jM��;��d��I�|���0��4�'��J���J��u5Z+
u�����A~16c&�	[�-Ȣ鳘 �z�!�hh΄�0��EVf�x���8X��,l��C5�,�D��D�㲭@А�5�ն��ȡN�ȵ璄��q�{�aї{�bJ���5�J`Z��z/���f��h��Nݹ�ٌKOF�a�<ܧE1'\���5�G����j�^��" ��
	wn6��r�Dڱ�n$�=�Υ�?��X�Zh��{.Ё��Y!�����j���l8�@W��\��nԱoR_2�ҚNG=嵝��j4g΋�S���=rF8���+/p���_�b���n��-H�s)Q�X�� bk6�
$��Em���͛:m�k�b�f��������8ѝ[�q���J.�zYX||J\�hY������$�C��[f;�����H�!��������\S�P_+�i#C8^�j1��0�JkL4�JUr�W��� 3Ey1í�R�,xk��<�`wހe�i�w�n2�tZ�MF]춋����˛��k�pE�m`i�׌U��6��)�`Qj�5a��0
)s]�'%�+R/qZ�̰��%N��W=\����t6���J�-�Ɗ�vd9u���z<�NK���r�9�&����!�� S��AEϮ�&�7�#l�\%�a�б�؅���v_AZ�[ke�B�d�5� 5:���8��zj�����t�2�s�IR���B��]5��[�ǐi�Wc��+3S��پ�&c+����@��2a�1�wn�-Z;N�3b��ѷh���v^�(;c�(�����_Xbd� :���8�F�%tE `�kA;��Pl0�����!Z��k��.r\�ѺhJ��z��I�:��+3�MA�s즙� ���f��9����a~�~��|Boj�	�Uh�|�iz/{~V�7���D�m<_+���(�-�@�\簪g�Z+W�a�.g��.�v�����T��i��Ǵ���+z�v��&}F��3JLS\����ac�ʇ�	UMQ:o�3:�kh��ް~`(c�1�(	c|�(�4�l�Na����n�Ba3��2�h���6���ꇯ%<_��4c�V�#=�M�NJ
��������3=�2e�=g�QQYr���i����"�����g3cr���B�Ǥw����W����Cr��Hk�v�֛N���_0( g�=��u��|����M���y�H�<�r�E���+�I24�ۼdT1½83�W@��Z�c��n��4*�9=�ݚ�"c9�:�Ă�e�h��c�~A�1`{��$UE�4F��-Cl�U2 ¬�X0�ل}	Ɛ�TR}��ʛ3�25c�S;vLA0�K��� �����F_�k��PõT�@��g��]��ʳgΎ����	+�|�Y�7O��y�v;3�vg|��<=���V�\y�$���ǎ �PSrF��"gqNA�0:Y�{ 1�Bh��w�����-�,T{y�n$\���`�����4�N%' $G�B�t��۳�	Қh�m�(�s;�j��A˄��Y(�kv"9Mj��>B��b5iɓ��H��������+�R,�V\� &uF�I}�`�B`��:����~�?_���?�u�o?z��ۏ�$�6����?���b�c���yxw��>F���\��O�Ų�Y����o�	>|�?|��rx�2�������������M�|��E�8tWW�����z����ax�������m��W��W�g}�嗿���j����mٯ��w�W��0�������-���Z~�?��'��}z�>��__���������������p����x�~�z�0�Z����bO������������ ���Aw��YI��������7�z�Gu���Ǜq(1n'�_û���C��싟�}����ɸ/~�.��~���N����_�Y������̿������o1]b��}��ǅ|JO9�������ð����[��.���/=nV����~�٧���Y������㻛�7����ݚ?��7�?�P��x�0�.����ʸ�ӟ�~��o~}��7|���?���������پ�ou����W�~��}�v<mW��G��?<�O��n:��޿�x�����/�)��C�x�?�?t���_�73_��v-��G��?Y<>��6��_~s��O;�_HP�~-H�z�H����n7��_��3�k�}��r���eb���k�,��WC��~;�{�/����_�y|������6�����3yϟV�t���A������_���S��o�7�����������?�{�@'�9�J:������n�߿�Y��>���G��CwG�nX����"����������p�6.n<�=ij>�⶿���4ݻi?��f�&Tx��[��+��ڬ��~ �����#;T8����t�=k���_ ·�8�,�~��%,��x3~�j�F�Ǿ9���B���|�$H��_V��x�t��������m�M�]�ɖ�.��������w��w �7�g�����~�����.��쾗^���=��x���9�i�=�����}S���f���aXͿ�͌u����T#@��[s�^e��G��������y��� e�f	{��-��Iz�2�x�h�5S��@��f9t7x�6��W�g��t�olv�����7�}���f���o7��ۛ�a��o����o��t1Vڼ�U���?��?��c��������OV�7�����ƣ��ߏ���Q���J�B���Wg.o��������O�'����v�o�~����7��(|c�X��l�y	.7���b|.|���=w�|���:r��޿}("�.a\2�����w�7ϟ,Y����E���a�)N������vGd������2>��7O_��ڻO�>����8�����煛�O;'L4��k�n&
�g߿���1�J_p��P�K�ieU�]Cq=IO����:nv,�{7��V�7��v���[�����љ����G烰��7���۪��{���E{�vx��}��b����������"�O�V��o��1I�ܗ1m���d���;>Y��v>�/~S��Q}����D�u��/7� ����G m��	x��M�;�t0^���������K����9��&�f.��7l<�^=c=��t��$��G���1H������ñGGe�W�7��S�{��OO������qؼ�~6^sqF�)�>61�*�ݻ��=,f�A{s׏ѥO޿�����>�ӯ����|�����#�����7�(o�&f��t�~'��~��f6���q|���w���'�BS#�K������8���-�/vU��S���F�������+?_/h&�>�����Ū�x�����X�9��x�虛��������Ӈ�6;����Q _��O*��}�$���L&o2��n܌�X}�sB;7�\@s���l�3��v/~�S�8��t���_�w������y��h2��yg�����օ#�U��'w�w?�����ɋ�j�k�;ٍ~ؿ��fYl����s�<h?����a���?E��Ƴ?�c_ظ�/8�#ޱ�q�v����wO%�����|o���C��2�A}z��o,��m�lN���\�������R���?��n���G�w�藝ǣ�`�����}���8<�4*�mo�{�'�Y����r��y�J�/����������_�4oex���ݲ�����0��i��}(ʼ���Df�ַ��(���#�>�[ޯ��=���#��G�y����˿E�s���$Cqy�Ϛ� o~6�$N�4Η�o��cv�)�E���=l��,�%y�f�E�b[ѿ�����û4���������E9yQ>��&���J2�ޑ/n"\����V(������U��ڰ*�����]�[�g�d^�x���>��ϲV���'&��C���o?�J�m���F�h_�/"���1���}3}����%��/̀y�؃    ϳWR�gwoo�,��FCrv���K��O�����8��O7��G�-}5�̥LAs)��������}���#�i�����ۯw�o��8�U<������ǟ���l�R�{I��6Y9�l"婶�nx�������UJ����;�������L���6�k����� O�}>����b�ܧ��~���6�������Rm/��G��`��2?��#�I{���������b���7�ߌ��8]oX���.q9����|��i�v&+o��gx���1����j��� ��tE&O�׷z$	�.dJ�|�w�|;l.����w�Ûï�Z��{���]
��>}���9H�V�y�޷�&M�
_�M|��g�T���F��O�<e_�>勇�}�0���9�����>��}ic���_x�47�����{���v,�.�d�����8'f�韧?ϼ��%|�i�(����l�훑�����[$�����
~�L�p�Ǜ|�����s��ޔHK�wkW"�x	s؊�����٪�>���ǣ�����o����ӑ���&��-h���|��`�����^�v�X��{)�f=N�X_a��SyV�I��������?���/&\�x����ٛ?E���9��<Lڼ���0����{�����K���.9�ǅ}�Һ��>�i�|a���z-y�(���콳,l8����?<s�l� 7��7�T`�w��ƪ􎼉�}�&y��;��ů�V$]��Ѯ뮤UW�� �O�I3S�-oC4}ڿ[܌6������ߴsrg����[3A�Vq���Cpb���o�P�hM��*DgۭUj�0i����#N����Ί^q�s)��ɻ�p���Y=i\�O�����@`Sfk]����G��Ә`Js�9���d�y7jj�O�l���I?�Cf{v3b\Ei��(mBi�3�V�������`��Ȼk?VӮ�3��}#� ����|�o�S�0;���������W���3xs�(�?�8��Kr��xml�6��{Ξϟ}p�R;H�����_j���S�KJ���V]t��Z5l�-�
:��UXG��^����$�������G9�]�C4��Kݜ#Q�N������= �y�[��R�� ��N�3ӗ�z�����o��f.p�E4�(z�1�Y��6�8:P�n�����Ԁ�F��KP�(�M� ��]Am��4���7��nOJw��ämi��D�V7���3xk�h)�Lwr�D�g���W��`/g�*a�\��Ǟ�����<�Wu%aR�6�.j+�,Q˲D+��ʊ~���̚A�>,E�Y��S'K[��Ԟ߳��lYΨu𙞻ӣŵNȍ�\,�V��O���;%�[p�W�8^��q0~�D��у��gt(o_A�_g��`d���a�AI��ƳM�6ʾ+�C��XE�\�_נ�[�t���N��q�m�נc��s9T
�,4�s��F�A�D�8��le ^*`Y[��A�-@����i:��#e�w�k����m8��ɜkz��~�]M�q`��`i
�w�5�c2�p!���`�F��5����t	��?�K��?�~�襔{=n�#�hjEkl0[w)��ap���i�D���@���P���s�U4��]�� /g�h��Z�	DRO������윉��(�qp� �{{~$r���ʛ��BtB٠N���9�qұ�B�y�u��]��1t�k]갭+9�_�E�/K���o(���fjT��2�D�T�GjXOWj)��Y=�¦s6�%GO5W9��q�e�X��S�SZ;��^F"u�6��	H�2����e��]��^&��Mm��d�f�s��3o��7����cˉd����<�����0�;�L��x1��uGOb =\mm&U���8�;yw,պ���a������g���a�'2���zY����ն�5UzP ;a����H���k�B�����@k�)�Q`��#e�ZxIA�Z����Գ C�� �sa`˽6�.� �_���4D#��3�`��P҃��n��jL�
�9
����o���Z\�)'t�����+���~�X��0&���5��b.��j�&����M�#��<�#;����xZBD�;z:Y��+�c9!��v��}��Mj;}V�*�쳛�S��G���tb�[|����v��v��d�����[���� tW=�M��G��Ǳ6p�SJ����9�vlGz��� �+�<
�Kf�B�>s)zu�߶gB2�%C筒9ce�-|���I��eOϟY1�F(i �ڋ�j���&',�ki��v��9���d8M� *N#L'E4%_��֢�Әk���u9��~@H1�AA��:�B�Jxf��b��b4 ��XJu�4���6����[�>��>�<�[�33�P��N��`��8�|^Ԝt}mD�m0`l�-�7G`�o�E��K�r��3륗��x+���n&'Z�`v�=s3�%/aC��o�hC,���J9N���H�lY���{����x��eiF%��D �����֋Bm��T�����*٩���<E�l�,�=vFQ��\�k=��HI�3*�fԌ��]��2eP`��Q�Ӎ(P���X�t S����A�p��[X�P��M_C�5�<|fԜ���RJ_!��֚8�x^A	h���_�YU�I]Ŋ&?���jZ�a9h���KP����&�W/R��J�CAzyv�.%w�1j1Bg��*#��y�!e
���L3;�4;��
����I�D�C�Ԩ��qr���,�Y��� -��Y��H�j~�ŕ��6`�����5#Nbui��w(�+JI��k�n� *%d�,`�,�5O(�<�\��p9���M�Ī��K5%%&U�R�h�׳������L�)\izv�|�5�^�t������U(H˚ �=�"�#�*��˰���R�Ct�A:���;mz�-��O��8�T����y�!��W׬�T���.��\����C��r���P�yeR^	qm����SěfN`W��b^�`�΀��%��g�U\���K��$��z�[F��rTu-��-��8dǁ@��pzR;J��R�PNE�]ٕ�ԇ�z���l���bJZ�:X��	����T���l�2wɥ�J:��ze/x�1��^-67 ��@��vN͖�U�)�SGFD)�DsJPvx��,ʊ��K�v}Az/��ƍ�*RQ<I0�
��\0B�=O��YC��L߉�.YC�ԓ���AG��+�@�Ն)�M���pWY2Mel�#����gҵ^��lN�U� ��Eʹ��l(��gѩ���"��y~js�
eH!�Y+�*��K�c��:w��/�E�7���Y�)��7ː�����Uzf�[T��r�ॱ2G��;D�>WƊ�pAvi���'�ǭ�����}�(I�#P䐍N͔��Z*i�H��@4�p���3�4����0E�� ��0Z�T1 �א�*�cu;��J�N�ehty�x��k+��J
^���s����+(��!�k�t��{T����9r����rw����8MHj�I���î�� ��� z�L��n�Jd�\G��2�3Ca��q��� C'\�.��)U�e����L��.���NƬ��-/�v�_�>)~Ĩ��(�]"�-+}A^ʟ�lo/�Y��Zn����j1�+C�v.�du�)Cl��D5%�:L�a���4~�&�X)��ʚf��pj�fc��Pt�Y���}'`7�㔃A��+��i+Z��+:�������nE0	Ta�k�+��-��k}A�F�Y����ߔ�J�k����Us�`�R���j��Q\P�k�^��`6Yv�F�8��a�gk
B��{Ǌ�[`�tJ_jEc��y)9;�/}v������Zj��񂕔Q�Ԙ���|6{��df�aV��Y�	��:�9��!L̢y�^YQ�ل&M#-a�2�8��+(V�j!d#��$�8�ģ齋r��.��@I⬰b�tF<	i�p���93����!떫=J��������n�B1@�t8�:t�V�}�;a��%�MJ� A�b��q���]v�b%�~�\ynp�E�h7�0gsN��j]���{�"�=�-gSV��    h�ԫ�)����Z��P���EO�TX�i!�<�L%�b���m�>m|�M8��:�"�h��4���Di� �7�}Γ����<�,���#<���G;�.�� �����݈zM!���8�6���5�E���z)�{�,�".b*ޏ��9a�l̞MBބMw!����Ƨ��3��Ma�`|�I�v�O^� �5v�N`�HJX�J��\�L��a�	>gF�"�O)#�I��p-*��������LI����S�q�-lI��s�K;|�e(���ض����־2:�M��[`S����TxJ�!\N������<{ ϙT{�+�_���K�{ۨÜ���aa�j5���Aɚ�+p�j�K����4f�
|�~��z$}��y/��m@�O�?T�`��B@0��[\���{���9k�vXv�C��٢����J�gr��A�Ġe�a?�X�*�R�!%n���k��&QB*o5�Q�f���vg6�+���/���W�f�Qz1�.f����0�¡%��z)��,��"�ϰ*�X>��@�J�S�dl�qx.�Y���N��U�1Q�����Fl&���|�Í��L�+� ����}!�P����YeB���5h�Kf,1������>��C�7�.ӑ�_&B��~D�+ƵZpW8�dZH#�)6󠵎3Y�X���Ox�ل���ic�|T޸\k�g|�i�c ZdբtMW��:,�c�A*Q�W��xAPB�w�u����	�,?I`7o�B���&`��Ƃkjc�p.��=s�K��n�tΠ}�.K/��
t`'�#���
�T��lU�-�}�����
�+��U�>I�9r��v�x��;��,���
�%��T��t�(K��(�N�A�g2��3���N�c��̺l�HUj*g�#e�w,��à#��n8�����s�t�T��^�M���\qs�ec����=,�)�+�l��*��5Ǵ�N����ka�үÃ�&����ZT!{�d���;�����Ft�:]Dעm����2X��� �����u��0��}fgQM��NA����N�H��8$l��T�X����V<����+�ڱ��{6Sy�����b" Iߒ#�`���8�zw�Kg�a���`DuƟ��D6?��ϮC�B
�<Ջ٬FԹ��Zt2��3:�����OGmL�ALIj����?��=AF�1�h���O�Q ��]�Bә�-��#�M��4��GkK�lV�R���1�\�Db�9[Z�V���~�Gi�8ct��*Ε�E6Q�Q.���Y'�uΈ�A��M���9�!��4�2�#�|�ER�Z��_�.P�5>݅ w�L�L����ց��u�`���@mס[K�6�1D���ꋨ�N/<]돘R"�9_C^�W`�8� ��	(R�4�����c1�C�T$~\��bI8�"�)�]`%��MC@��y�]������^���c�ě�S�Ȝ�)��-O?9�j��0I8�mE!\h2x�1/���]�\m �l���2Amn 2uv�Vi�?����G\�R�B�8�kV)w/}�&x'\ɸb��R�#���|Mw���c�B�5��FU��/�����Fra#�6Q���� ��^v�6d1x���yP������ig��T5�1�u&���Qbp��sד1
�¦l�6O��k쳲�P!����4 R�X:����7@��Q�RD�Vj�����6ʖ:��
�Ǉ?�������u��j�n�9%U��f;���g�9_�����M!���1�-�e~*�^F�#$K��Y�4�CB�\���z��BgD���R�(�c�*}?�k):�A���
�8g���k�4%�Vz��Zg͜�`�L,��r�N۱	���2v{D�:d��%�� �y�O>T��q�̊g�Ø�)��w�Z5'�[C��Y���-�ssC�p��^,%�ᓼo�����k�$���k��+������E���ӕ�x�}'���>�a����$����!;O���x��]z�{�d�a�h�qv�ʨŏ~Z�0�
:�b�ⲙU����%�-[���� N-.(zxr\��܍'֢�>5Hu\�D��B�԰��@��1Ã���"S���QK�+k�al��HױE�#���}-�����g �0M֪��T�t��6��l�^q6�muV�̾#9�G@7��倆��1����f����(�Wڨ��I6��طyjq���/�蔶Bҏ癗���?����q��f�J4(��
d�T���p��ώ���R���墘9���JZu&5R�#��-8J�̤yM��:y�4U��NZ�ݤ��0�T������b	����c3TV�i�Z`)��1��_��N���3a�X�5ϓ�B�J­�/�*�7fg��O�K���?��:�#b)ś|�
�s�v�&��G��	WD^���d�>R�aVr�@�����Z����rS��,y�٬����� ��٘x���~�`�m��{ݙ�.�!mΒ�¬^�ʙJ�;�I��\���V��p�sd�;�g�i~�;!�A:oe<�/h����/�/Ee>�Z�\g$X)�)ԇ��luL�`ej��y��DݣQT�����9�=�|*�1��Y$�vБf!� ���w����_�6�qrG��<�K ��O-*PA�!�sA���lЖ�vU�C#����D�Oe��1�|���)�%#\E�f� v/z�S|�H�S��K�F\k�E�g  ��d�!���%�([��1S(�Ӣw�i�;Y��]�)��HL�N�";��:'GS� �+pKiQ��CѸt�;-r�әl���Ҋ���1a|z{3�=�/!n?���SΌ\����f��<�����jŻ�2�h��Ϝ�)�r,��<���^���s�H� b�>�s =��m�8�=�d}�D�@�����ɡ�i����U��sY&��ǶQ��cE`�TR�V{I���(N��F\p�|.t���|���'����2��ɍU+�trc�m�-H
�W�xI�h��uǫ) b�vQ��J{,���K �f���&I���fl�0�_�ɃdeԢ|d*$�.�G�
@/@�-#��RU��2�4��d}È~Cn@��VR���ʰf2v�뙓S+��ԙD�J���� �-#�<H+:����< �>�g��(E�5s.��{Ң�	:]�q0�C�.�G�&HSܓ�P�����˕O&�b�8�>d�у�^��si��)_�Ju�	�K2�a�*P���(�t���!#��b��7,�vJzˍ3a�\i�`�V�BjÚ��hAު�1֗#t�y��m(���W@5+�+��`�5��~~���S	��!r��Q]�A­Vc-6���!V���ц���Z�JQ?%bfoJ�*ʇ�)]��Yg
�ٕ5-��������F�rq�.-���
�fK;D!^�������z&dƮj!k�z��]�R��U���K���؇K��)���En8��ހ�/��am�����8�5:�Y�U'�,��f����PK��Zr.�Ūt���Y�[&���MJ`|���26Ԃ*�������+��O]ۤT�Y }�J"�[i���Mm�d�V��r�t���2�����Q�e�I�X�RY��#�Rݗ�TF2���q��:���7�%�=l\�c)��m^�p�1]�G����v�^
�2����!1sc��}R�Z��ɘ��Ǡr��s]����6`D�I�+�'����d�tRZgK�
Etg��	��Z�
w��W8 ��L]Q��P�w��Wj��Q(G�+�1�q�G�xI��w�@6���z�cA6�K=-D�\|&�^�v�B`5H|�,. �깂�����Z_j)����H~^��Kk}�L_��j�5C��k��J����������e�K��?.'�F��	Ro[$=�d����x��b�+;�JLA
�Z���i� U�l��t_]N� eK�`�����T��FZh�t {Zέ�>�J��h�a�^��]��zx�֢j?��B�s�fR����c�0��Đ0/VB�    R����y&/����h�:�ʹb�:/� JL���Yʣ���ߌ����B)k�\f��+ ��X�F���.�p����&M)�l(��P�
��3It�$��%"X���|�I։��3R��	��2�f�BP�*�� &��Y�A�d�ٞg�u��IW��_��d.�0�����ٔ�`g�R�U���,n !v��F����%f�5�Fq\��+�O!J0��@s�:Fɫ\�?��uҸRlP	LV� �U�G9^�5d�J`�v�5,����cun�3���*[�څ�E&�Jߨma��eՍ�9�,�u"l2_�r�Y�[҉���8���	��:�g]Cg��'([���|���9'gP^�l��HoL!�S�8=*�c���`�b�cP>YL�Wj?�����ߧ�͋����v�=�}fwn�2<���=����闕���T�ڔ�SE>���itQ8�˞qQ��v��p�U*@�\W��K]�B�����q��!�f��� 苵�:�݂�a?�,�d|�a�\���	`�����8���-d6�Ӎ;���:
QJZ�Mz�qV�d�گť�"��Z��0�SقL�n'��S#�X,���48�)a���w�[�M�Ѣ�D���re��`%(�.�i�I�y8�qPf���t;D�{�Bhf�\Y�b�~q��9�q��3�2Y��T9��bֈ�]�変�PZ�.��Z9���Bc٪�$��Y��b����s�@N�F�ʮV+��G(�a�DD���6Z�5�S�p�za��`����N: %�_�C'�r}�Ւ��Տ�� a4�*W��*0 ��B���[ԕB�HEN�1�N�]�1���|�Ax�����
LY�?�i�3A�^��U�ت��s�A6)c �|���ƣ��{�G�W<OI��³�R6����ob�:�V���eޗsl|�I+e�Ep'�Av���s7��3���A�*�W�
gDE��n�6
�k/8]��amAJ]b��l��ka9%,+]�ka��m���l��&<rqѯ�%Uj�*��q�H�@�qΉ0���r���I�s�5N�o܁�j
��D�93Z�J��^�~���� 5f^bzhy�T`�8C\P,B��J �ۥ�-ǹ`H7��.�I��;	�~@��ċV�mAZ_�ȕ�rf����0}j�U�p��1N)�ۂ�>WA���MA���N�OM����G��ۂ4��!FV �8��Z)eCT��'+\��$�n܀�B�R�D}r�݃]�I`%Vv٤C�y ����:';BT@-J(�B�:��Ț�'s 3ބ��"�ц��Y|J^��f�t����I�.l��G���KI��[#r�����A�fo��Es/��b�-b�Qt�-�:�:t��a�we�r.�E^�&}�J7u~���H��T��;�=�d���2��
3��}J�6��I�v�7�)?cܲ)-�O�~�2ee`�,qx�:5��E���?K 2W�XV�+�`�L��N��=���h�(\��5΂=�7Z=���B� \��Q�������u0�p���:M�X�9%u,De�^`�9��b;<��.O=m��˝��lh����讱�FY��-*;O�����q,���4�z����#3{-J���^P�l�5 	!��x:�H���תA!,a�!8�϶�[WHA�N�n�	Y W߿AZ_��(�\��x����ƐIjnZp�&5���5X�d���X&�*�i��vp&�+^)�Q��,>{-���R�l�&u�%ysl}D�Tq��.R��q��w��L��d-�G={x%l�J室@�J ����dXq,O�2|��6f�{
�u�0�"И�,�Թ^)S�-�7�l���«,���t<��؜��t.�~��Ԟ�ҵ����F��>�Y]����b���euX�J�O�hE,sf�
�\��'$ơ�\�ZǓ����M4Fk��+&۱�T�s�ҏM4�M\���!Fd�8,�\���R?�"HЃ��F�"Hϋ~V�̥�OB^	���s.��:��+}&�I�M$Z���b�Y���6O�3,M���;l#R���#=�Ʋ�¤v�H�c>�m�?�@ݵ�B)r��S����Ԣ�L���x�O���`�i�j�m �L� zQ��CI�x����$ޟ*��?��p���0��g�
�`�/����a �t�����R��@[-}�Z{�w�Բ��)R��k�2�{sbS��]�T5 J�I2Wu�5��͢�a
t�˱�Lg���$
#�G��ę�^�n��!O!Z����J��Z��ٱ�3�Q�I^]~}��֢�҆��h������A���^Et�	5�v5���+�*��O(�Ĥ%�LNU����#�HP�y��k�Z�f�<�����	����p���=U8�K�Ђ���+���!�V3�G<�F;��<�A�&���
��TB�rn��Ţ�����1���2
T����I+���չ��a�>	$�!�zZ�ZĪ'�����*U�63�Z�"�nы�n�*PR���2C��q�e)�2�0��]�1��jr��"z<i��.$�*6	")���vQS�k1�ek�g*4�p�K[���u֖��4tY�let�`S:.ܲ�/d�p��?2*U����A�YDX�D�j4`��^��K-α,��<B�Sg����U����hU�b��
VU���t�Q�Ήl��)�&��4��cЪT�*�5�#$ߌ�3:�"���^e!ݔ7g!lD�BYDX����Т	�༖ҙT��U1�������I�w!������\4q���B�!�9l�Q���t���c�Y�����X�ib+��J@�mA[,���N�ÐzЄ��i���F$�aaG9��d#�(S'Ob��pXB�+�l@F� i��Fd�kͮ�g\)��L��g�EU�T�ԟ�v&�����di޿�{s7�x�g�<c�t*y�{�W_��S|�����������������?�O������x�=���{�~����?|�=n~��nXt_�[���?�����_����~<�h�؟�د�XLR�<�8�\���~yw����}o��?�&��0��ʛ�ou��ޢ!]*�jPK�G�+�	l�RH9oT!N/��`��R$��5sN8�p�tۥ*h�@�r%�բ;Pd�*&��&9�d�!�Ȣ����@F}�G�n���l1�1A�y�U�6f��F�j�������K���d�m	�Nwd�F�=��&b�u���ån�r��0�aPpT�t���e-�|ӂ2V�Rl�B����	��<6�m΋)d]�t������%ͧB��Su�M<AJc�[\�w}
(�4��̴m7Msٻ�&������:E�l���2{��s����B���A�:fMQ�7����G[��4H�`D�5l�5� C��B�\��a����q�+=��Q�%��D���G�5� ��c���õQ���� "����\�,���;׻ �V�r�\�4��+�Ǳ�����r-�Z>�ϭO�L>@c��K[̬��2|�	J�m���T�VOE"�ē;@�hb�%κ�� �گl��b�J����֏/,r6υCZ�l49��7� s��9Y�ے��d��K���X�K"���&�~t&���0���){�eJ%��x��"G:e�i1���*v�Q�:�n�gG�5��y�ϵ��3�2��~�5L$=F�2�����NCU蕲oے��7��3S�<�ϋO�<'��X$ۭ�0~�y)1�}?��(&y(b���6��;��<���0��B|����OP��J
2`��k��<+�;fP�Պ-�Z��0�h��q"�(ℓ���Q�NpV�!����@�9�dٻ��a�-:�6�°�IE`��0ӧ÷H_�D��Y޽	�]�������g����o�H��ROZl�BɁ��6 ��c�������&�Vu�Z�K:���Z����a���B�./���㣂�N(�Z�$3fS�R(��zOg�E,�I���SB���NK�Ǒ���X�0���x<�����b�@
$k�SE�ַ    \p"��L�������0%F8;C�Z�����J�Y�6G�097����dFc_i]��A�U~��/�`+osyPS+��߄�J#w{P��)�Fǝx����R�)�F��̊�b�u3�y��9��)��z���&�TM��8��Ϋhn1��u�E?����pz�}.�z����S^�9��-�O�2���~�Թ-J8���%"��P���5C�p 6��G�n�k�;]�%{l��D�ֹ�݌���"�-�ע�	'U!�xq՝�`k���ݕ�-�Z�Sق�_YO{td&�e�V#n����v��:\���-I��Nem��b;�I6Q\�����KQ�@���	m5,Zѧ��uM�h�P�ké��2�1y��<�_�4���`�c�CQ�C:��RMcќm%��MF~s��)���fR��q+P3�h���W�n1��kf,�Z�hGI8��5�h/���eg���D�$�Xy����{�8�<'v�Rҕq���۴{��W��=���Ք��Q�}��6@:�u�mjԶ:�T��B�dg���B�f451�I/ �X�Is0�L�.(kmA9�H�OR$��qAF�c�~��b�D�KiS=��	�e������2�49\����e%�H�*�P�9o�����Jo�D8@p�E!�$�����LaZ�I���<���L�����2���)�V��b!ЀNu��m�y�f4U�E��WL� JI)C����������3���|��祯ψ�J
�JY����ݬ;sCSq�;�>�e�Q{rX�E�Ib�76�A� �V���+t�kf�D��	eU��e2# ���/2B�˵�!�.�hEF�o ������B�l����߂-��d[��&qJ��}1ʱ)N��^���� ��=С9������ׂ._�S�h2�-��ĳx���d��5�-����O{^��6{f��~�v� ���Z 5Z�r&��c�o�p*3�8��������P�k��Un��2�rB�@/��EU�2��=�Y_��BTH#�.#F^�}"I0�up�g\�Y	
�X@� ڎ��x���9���E� tg��E�<��Z�Km�\�nD��I*N�ylAYt��K�o��!�{gEyB�}�Zd��|t���A�/eDBiq��+Ж�`��q�P��QH�83D�۹�A�׽Yr��!zG�+HYZ/��~�y{|p�a83������T��G�w@X�j툋a��.G�C؂����9���!lডJ��(���Q����O݆��a��r����vx	?��U<�����I������1���J��p��xFʘ���qEYe|.j�38w��r���z�Ri}�R���)�T-"�K�w��2����8��l�>��<�����q�GU|�QzU��n?Z�QF��q��W_z�/��·	9������
1__�k�걠J�62���XP��W���ȂJm
(��T����iP5����!����(���(pu�*���G�^+_���yL%w���~p�}���{�E�\�ƹڠ��p�i�3�]Z�("�ƙ����PB�*@&(�s*�Q�����i�1���i-�B�;�)��hق7�ڧ�Ѱ���W�rl��Q
dG�^�b� B%;cAq,��
��7��)�f�u��t�v�X�j�T�$�)��9��Ŏ(Ñ��Ԭ@W��>����+���X�$�m)�Σ�D��l��a)3�F�Qpgp�`����5R����\�=��5�3v1��i �*�HİId�N�b�c�޶�	_�AO�M��E,\+n�Vѫ��ёC�<fAE!}�˂jU)� zk׈l��i2��~ g�.�^&8yE4Q4��x��3ej�՛�JAT���H�t��9��4o�U����Wl�ZzI��_��\Ly|I-��M*G��4�Ew*H�@�i稤��K�y!P�f�rR�Z\Ng�2�i�����Nq�ʍ���-Xg��x�ьlsj`٤��J'�KV��
��Y������Z�g�熫�&�V�E_>�8�8��3Gi4�y�3o�~ vF�kvAļ��quɔ� ���%�9����g�pʑ��[H#��.�ɩ�:�9��(/��8��pEg{�crd[�Kh��c���r��6��xʦ>��,����ƙ�/�m^㧺��Ɠ������jM�֓�g���t}1C�!7��`u����Q��+f�[���IѪ`x�5F�����$�*̂L�g��E`�%�OW��!�b �5�=�p���@sV�n���{�����B�VעTcz��j� �����aҙ��
.���!�Q��h�S��f�N����T!e�
���+���֯��s�U{`{љEx+�����8��5a���j��~�k�������Gg��
�rr�@B�	��u��<5�}4c�bŀ�T��+�AG*���X�nJ�{�&��䓛���IK(r��DMb��lIwJ�~9p�6�@z�h�l����E���Ҩ2�kłEl=�D�CUn/q�=��|����/����s؀K#E�F�3Q�aJe1�]�F7'�� �E�2��L6::�7Di:�/sz^d���q��/�|DV��^�`ĴRkg���^���z�kg8��!� �d�7;&�B�k-�㭢G��3CԪ����Q��wX*q%:����GbJ�	��K��L�䇩�~���bLt:^�\��M!��<>�:����Ez��e�&_���4��> �@�n�\������#$g!�s�;���<#(��3�{��%�!�k�st�ӧ��07��ҿԜ(��[
�e����h�f���	C�2�07�W�Y��\��^\f~�����0�vN�W���ܻ�tF��U4�sx(��2�Za{[�Z�տ�L��9����U�)�>���U���0;��j�#��Ӱ��(� �G���p;,�fPzL���Ɍ������}�|f�{X�$��k󈟪A�DR���C������.-�I�8�"_#.L�g���z�/6��O6�v�Đ��?�C�̈<y�H��K�=��I-n�RH��r� �#�pc�Zo��`��q��f ��B_*�g3��H�Pa��z�RZC�h(�����l����$�4��J�mrI�mD�q��a��*Bc�̕��),����ifL�Qd� �w��.|4����&�ԙ� ����a�������P<Qn$����&�>��[��G�3�FtVIз�g�ܜ�)�TR��uV�zd�?@u����7K�X.�5��R?Jf�K	�憨yuG������p1�zP$<UZ��L��T�|�t��,�$[��a{i�� �\�%{��[�V� ���τM�K	81dt�6eN͙.t�ܭr�l����bd���F;�*����'��x��l��KH!�sޚ1V����DP��DV�@Lz��7f�� ��c��gM�`?ϥ��U/���\Pca�Q2�ݥ�s�&Y���2-1qa���Q`0��<��"�r�`-7�\�ƶ��"-�d�/��5k��t�T[B9�.������e�d���P�<;ʻ:^8�-!�»�>��8I�9\)��Fer��S��vF�f�Z-s]V&���hv	�`|���fl9�<� FZ(���l��&^X�}V̼��e���E�lN�#�C+i٭=Aj9��W���Դs����Q%ܳ��[�!�Z��_2����fvZ�\�
���j�'������ЊjS���_��9ӧ9����96����X�@/�6��0�ú�"�VdST�6�^$+��u����lUH]�4 �"='��"�/���D!e�n�GҤ!(f4�����lt�8]���L����op�R�U띷3;�ՙ/qO;�
����W��g_�C"³Q�� �e��)P):낝��e�����ʜ���7E�J�<�)��ȆTm���9H���Lqu�/:��`G��t��˨�K�5l~��!A߁~�s�hj�~F�����^rb�}�ט��D���9ɳ�\�߄<�.�    �.d��q�� `�N���V�}-� �؂���d..ͳ�k6�fXy{�vl�l/n�J��y���]�gڱ�e�ͭ�_�rskv��0���f���Z��+%�����P�K��2Ku��u�[� M�ZG�4F�A&��f�>�y$�N��V`��x�J�dJZ��
���f��#%x�C��{��%�I	�O�LAO���R�Ǩf�"R�2� /\s�G��SF�x\]�l�幘"bUω�yԲ�����ݬ�E�������g�Fh$�͍��25���CŲ*���-��Q�eCkCc넙Ex�\��V~��f\3���~/T�a���
.��D�l��+�0�1O�1:��z�gV\��Sl����i�4 �-M^�Y�p�3ƈ�*��l>���F���`���~uA�VI�TCH������چ��*�2j�B��;I��%|%� 
�qI �¢�b��ȫ@�#K@�����'�6v�:�ډ[�^X��y����p�kR�`=dh�J��g�������
8�O�`#�g�6��,�鬍�\:�
P����4���WsZ?�dĩL�3���$�� ��݆��}h�.��~{�����Lt��Xw~�8^$c*t���:�|����v�
+���Z�2�uRO�t��B���TN��_���_�j,��F�0�62\��~�}�J����B?�K�#j��UX[���3�\V��!7���gj�-�9Fcm(�������	� �ꂱ���ALw�O��S�u�s��nrF�(�:G���Z��ǹ�� #�
����b-��!��ʥ��+*g�a�6�:���y�_�M*��֊�12���}x��rs�j���ym�uU�ǅ��މөe�e�c6�|�� ��&إ/Ƈ��1șQ��EP^F�
km0�(4j�"�`��Ю�"u*���lO^-v�8"��7*BQ�U�8\hJg��-5[��^Z_�Pę��}�wr1����68��DV�\��g�d��E�Da  ��T�.=͆��Q��q��!��,�%W�{r(=�v�U>��G��/�ff����J�\%����.6��q+�)G��}t�k(��vb\{j�v7:-R���e'��"0a��	�t�,��>��L�j>�g�ܬ�>G��|#�f��Dq�5úS*�r�̪F⊺�o�L.(>�٪ڍ�6�����2q��h�2�P`�`� ����{���z�N?B�p�s\*�S�����'=^��)��g���i]C�����>g�N�����nכ[Z	���RJ4����/Ј�<Vkl��]�g���$OΈ�&�� *��4nQڤjO��5��hRnP�/��d�>.����!��j"�.c㐙�ZZ>��>���S'�+hѺ	I9V;b�2��0=G�RG,y:S��4^��\���޷4�udi��~¥;��:�NG��$��j?Ԓ���⊀(� �HY�����Y�b�w�����^�̓�M��r��-�������2���Nj&
���ch�4�B��I����;d���5
�ӊZ�?�Ic"SZP��'��4��.��d��ؘ�@3��X��4�'s�`]��w�X��"dV0_b�aV_!#��M�"<Z�[����{�pě1T*<w�r�W��P �/)>�J�DT�V����Q�u�f���+�Dr�WJ�J u�5)�����P��c4�Pʡˑ���z�0P�hdZ�[�����h���fU��u�<�X��	74��*��&^b3n|��y��<�GX�y~�z�!��U��!|¤��2���y(��9�HwC�5Z�jtd���2��>��[Q�������`�?�+��c,״�Z�� PY��a�!��Q���b�V(�|����>�BT�����m�_Bb��G���b`�����Ц-q�|�����p���Ucpl$�}7�e�^u��J,!{L����+���^��S|��xFK���<��5�z�����1Z	���3��{��}J\�h��n�m�c�� S��6���Q��������5�Kk*��t1����tAe�4X[<�y���Hv�R�n����+��e��p���7q��< B �5��tmA��P��\%�	�X�V�H�$���׌���V�p}�H#,@���.�-\]-Ҋ���t���HA���\w�q|v�:̔�F�!У�d�^��{1�k+�8Seڋh�0��r�m�u8w8C�	�~-i����)*����s(����R'���$�VGX��}�A��Lb.g��Y9�[zy� !�e���"� Gp}ލ�n��km؉,s]��O�%M*��Y���jS�a2|Tɱ�aQ&:ӕ��(9�y�qs%!M�>!�{�솉�ǈ��+ m�[��ɴ�Q@d�����6d��2�z���1Pa b5:��W�"�T(s=��i�l��Q�!�s�1C4֥ZS�2l��4��#��kP�X��g(*��<5�v�L���*M�`g&��+2�.{�LN������o���x�PĠ=PM�ީ@��θmMx��bue������X\B�:��
�&������kP�'x�\���Kx\퉣@o�� R�ʶ ݭ6Ĺؘ'�i8鹄r�N�H�����\�����6E�14��?�1�P����}�������t�����^���iݒ�b_�	�(�\��t}o�@=��	qW��*�e� #G�&�}�U4�T�)F
͠E�D���
�}����-R۳ZL�$n���Q��)b��"26�Ĝ��0�#�^c��w�1�z�Z���lt�M�� dd$�Q���S��T��j��kܝ�.#�Σ\|+�I+��������p2�r�"�i� f��:N�|�`C���'�p�wI=am1�RATJ~(]��XeC�Yn��?��c�w9����bmT[
k���H�\,�Ʀ�*����be-�D�	��g�o���^�R˕�����v�	D.�iՄ	�(�S��WZ���u �q J��ȴB��ò�%dQCd��9>#::,�\�k��uz�2�`#�M^8�`�,��� X�)P�I%���ȴ��f��P�h8cL��{��S��S��Kxd�3RO������d�4�ը9K�I�```��
�Fפڼ���0	&;����Wy���ȱ�;�h�T$X�-Ә�G��'��>x��䪐Z�a�V�i|>���0+��]	]�R��P�!���A��ǐy }<+��#���CuSͭa�y����."�#�X�
s���J���3�1���ǓI��k�$��F��u��L�EAY��Ea��<���wE%3N��'X>~'*	s�;����w�G�9P�&T���)��'eōS3����W�b��Ν�S�R��\< nɤ��Z�d'�1�]�y��N�fj�|	�}���	ZP��/*�^:1��)�i�s�B��}Y�"ܒ2�zn|C�S��a�R!X��]K�5�i�`YpJ�3	3`�n MM�ܻ���H�Q�-���B��3SA/�qӸ=���[҇8��`���*�|�zC�㗦`�{{��F�<L����n�1�}�����a)��\��	8y�MC��6�@���4��3�������+ЮT�0M|�p,�y��J����R4t�Y+�O���3PQb�L����$�\��$��yi���tּ(���rj�1�9�B@sp�o��S�*Bc���,�R���Dk��&��,a4QUL.��sj	�pPe�i�v���q���H�M6�~�,?���ڊp����;EU�#��6�2�h28��NKF�^T��*r� 䢒�
(�6i�;�J���Kaq#�la��Y��)�F�N�I�2X�ڡ�O���p�`շ�<�J*}	�C�(W������Ծ���Q�Չ�FDt�%Q�G>#��\���I4:׍�X����D�F 2ُ�#O�N#�DDt�d��z�n 6v/����!�s\̈M�hJ%��lc0�iyS�K���jI�u0z|f�H��-�BV�H����    �v�9�-BK��w���2�]�Zf��%Jב�{���xo�I�PY�����e�T1���d�|=V���`��=�5C�"�����#~�5��q���]�P/e�`��oLP�^	�dD���+�V�޲4�3&ǭ%ȓ�y5�T����[o&ߤս%��Ha����z�����(?q�UeH��R���yvJ�ٜ��>��Q�ʤ�-56P� Ì���8��U\ã.8q�q��㋙h�j!J¬�9�L	�HD��i��p���u�-vU*�0̈P�k�m�;l�8��V)C������H�i�c0!ʦe����y�,�<x��\	{��i�!\��3׵��cҸ*e��x��D{�*���i���͕Z�>����@56$2�G��N)�	+H6�M����`�*�}ExC��6�}Ѹk<a�W_�0�
�S�?v 69\�\���4Ⱥi�gS��������>��BA<��ɱ�/���u�����х�]_6~F�u{Z[M¹2�XNCmg.z9T�+loz���4L�s�]��Z�-P�ZiF�\�hG������GeEka0�4���\�h(��ⴎ{��p��Q+Q�s�%N(�}9�C�Ǭ�q:R���Α���t )+�4{5e.*<\Ae�]CdL�(Z�7@��2B��+o墸|M�t��	q���$�a��'�\�\����Hv�g��8��w"�\)g)�	.���pΙA��s@�Z�p%��|�P����&���4�n�r'�*�W=���d� A ���1=1��/�K�톪<�~mދ�8���@�I�L>	��@��1|}��Εdwk�������2L�i��b�q���k ��̕J�w�3��Dڰ4���@f^P�c�exD�\Ή��2�'���9X1�����Zp 1�M8l��4��چ�܆s�l�+iݶC ^�i�X�ց-���%�����D֥b�Qљ��Ò�\���e�"�Y���!�
w1&��i)7�w��q)}�p�PK��T�R�G<to�Z�X'q燳g�A}�%��f+��O\ތ�J���΁�n�S��*��Jc�M�ܢd�Wĩp��,�7�;��ei�y��rQݠ�î��:id(S>J��o���{���S�9�q���[�e䋰�݈�'OH#�"��E�%��(қݚ��r���لS��F����d��Z�Jr����6�L���a�G�����]�j�]ن��Z�iq&庲��������$�����v��x�F!_����l�h��÷��4Y���H-HI**I�H�)�{(���2|=�M�� Ԃ��T�l�����-���L�p:��Vt�Mgx��w�PX~��2�����-$<�ɷ��S��R�`����+W�^��	�1�����@/M�
q��"�x@��,9�MɪK�
h��|�����ݸ�� 4��c����c"H	@s�<R���`�3�����\!�M�p�S�j�@2�g>[;���D�HL�@�=�P�,Q!u^���xƟy�(�c�-���cÒ>p
PUI-U��_�l9�x���>�<i��Jڰ�H�U����iT�(��x�&��u/z�lSl�C�Q,D�(G���(1�����"���Si~���n��9g,աX��P�	Y:|�v����-Sir�e�+]DM�������6��.t��$x_��l�u��ULv1�4q0�`�J��U@G(ߘ��]�F)nh��+�g�B�bJ�0TGH�s� ��@'1�&�v�L�l�UhT0f�q����,�S.�w��Q���r�V����vI� %�Pw3I� !̓;��b���>!ẓ\�d4P��O"�� �F���z���1k÷��l�f��P�l�O��ȃ�U�:n�0�c:LP�4�*R�F�5z�s���(�"�fi�_Yp�Jl8o�������^�㌕|�^���(1*D�bria�Z��Iw�]p$�r[�-��r�e���M��&�LR��BE22L?�x�B-@w/�4�81�x�`j�:9�]�<�#sٻ�PV9��0%�������t%�3�MTH��R�'1>��!�\���d�5B*�� M���1�¸�@����e�HI��u�)ZA�N�7
�Π>�*�Ƿ��:�t��F�0Gs�lu����EY�2¤��:��s��,�AIO���GN;�`F�|��Nu>oG�)���1�|=�S��X&�)l,�-���jbE��iC�9v�B�"L�)>8>1�A��H�F�qKS.Q�,�����:��
��~�^�����'C	��Gd��_%��%SA�Mx=�r��J� �
(I�GTo��4� ��h��<%�g|mѥ&s���k.}Y�=��K=���ɦ��`}Y������������l�lի	(y%��&�xt$��Z�Bv ͥw��`g�����T��:p�pGl�ɷ��)z�7tl_R�_j od|F/�����HS!u�����1I�Њ8��3F�g�)=�v�SK)�?X��2�Xڪ�����G�hj�o�z=2>A��] ��7��N§�* g���W�������˔�� ]h�G��#�=�8��*x;��$�T)��o+s�������s�� �N[����� ͥ�&	����` [�l��	��8��D�f�P,�kS��cW���A�%@���?���̙͞:2>m�7B��w4����9���n��"7u�O�7��.i�վ��-��
�tU�����r�;{��X�ط��f���/�Bf�p$�����+�Iw ���!DѢ�&&�s�t�p|�,A
8�xrhZ�
��|ʑ@�4��y��F_��ߑk�JY�M0��JqMNY	���c���fs�s�]c4Wz^N.��� �L�v�78�m+�j 832I8'���v'��v@me���`��C�{2��<L� s��&l�=��� �|�-NJA'���v�sH���Z�e�>��J��oF]1���L�^9�[�mg�s('o.�
���'ʃS�ũ_83�Cx�\W�%���1Sq�8':��8�ϐB�$i��KF_� }���F(�s��l�£ Nw�s)��M����0�E��<�Z�VNY��r�E|���/���8�s
@3\�m�ެ[ %������"��!B�*�a �+�?}�0m���K��ND�� (H#q'�яwx��;�A/�6d�@COyS	 V4��i��B|��j������.��<ET��G�ldm��	@��"r�s�;�%�0x�����r=_��^��_V럫���Ϊ?�ӗ]�	>����ޝ�.�`%�N~\�����0y�^�֓��	~<��W��z3�&�'��fv:q-_�6W���毋��j�������m={�����b��UUO���j2{���9��9������M��Ϯ���u�ߏ���Kx�t�-����˛�V����u�t-/W�ֳ����и���� �V�j��z�l����l�q�N��׮����z3����л�Ň����	k����ͼ}IH?4߿�ΛṨ߷�/3���fZ?���vZ?��/�>�'�����m=9y5�ίg��?���/߮og��u}��z^����V��:;�^�g��/o���WWn/�m���d�N^>��ٓ�'�Ͼ�~���=Y]\��߇�������b1��6��o�a�<��ggg͠�����`J���5|6?[}6y�r2�>�t��y����&i�}?[|���W�*�0�WkXc?�-\��<�-�o?>os5?�^���O?�~>|�����/n?�M��ه�_����u��yf�~�t�E�n��n����ڍ�3������Wo݊���Κ��{��p��F��Y����y��o�5,Ŧe�����'�ȇ�:�/���W����𧛎��M�������t��{;����'��/��6����/����_��M�����g/�MN��O���_�M�e�݋I?��G��}z��?���_���ӕ��1yUO�    ���Bt�������A������ɨ�w/���p�`�/7��u5]��N"�:rJ��|�_m���U}�󁖯��?h�h�P��P�\�U_�7���t��~��kX�����~�tki�[8�_����ť����G_��\�v�1w��q���!��4�����=���գ�V��hT��,^�~YN^����D�Æ�bl�)�Vիzu��u����z��zV�`��A��T4ߴ��7��7�i5{7;���}���v����H�	����i}�~��x�|Qϗm�_5������f��c��[MVbV���;]��zQ�g���?9�ɴ}��gplVkk{l[��Ӄ?���
'Nݺ��W�,���ϴ��{;t�Z԰�޺%��`�He¢�^]�H���_���t���K��W��O^�}9#s�\�9ﺸ��o���fŝծ��nO���Ъ�z��t6�M�=�ȻN��v8�;=����lO0��j�/Z8\��`"����<����e}1?�5sk�{�iE��M�0�>la�
�v~6��n�������f�پg�M �}�Y��G�a�hQ�m}3�1DN�&�c5{r�������"J�=>9_�_���Q����o=ۭ7I�՛K@�S�����������
�����VR��"�DӝJ��c�f��:�h�6��m�w��[�۾0���bu��^��S�>}�^]/�'7��MY��G�n7ege�[o��?ڦ�_�������|s��U;��)��`�,�����Z���W�@�ʏ]��:�w����q��z���<p���C��
<,��lz{t�{�$|e�ѣ��'���?>zD���:��.�����_f�������.�W�ٗ�r��z����+ur��� "r��ڷ�b�~1����Q�_*I�_gg.fW��۳C�\�������6���r�~|~��Dc�Խ�s��/�>O�˫�s�V�'��*[L��՛�ϯ�� �c�� ����5 �Q��i�#����e}u�f��f�D�����] �DD{����q�����Ӿ��L�l�-��}�4��ژ��4;Դ%�D�����޶������O���Qt2��s���Y?Dc��ܑ�e�Y�rP/�˺u�?��\�[}��V�7�|�=_���OO<��)=M1=Pa�=\�.�n�7����р��æm���'���_ih��f�?4����}��g���|�"���B�x����fvv�vW������ūi���?��G[Y�#�?�ݣ������-�rQ ouX7*�S=��~=�������ew�E����2vh�����}��3훲��9_�z�7m�B��-|S/��KT�}�Ct����2N�&e���K� �Y�x�Z��X]o��|o��-l�N?�/�0����c2{w��j1�z=;p�aН8�9�C�v6]��{��;���}�Ct��#�����j�z~��'��*t�lm�ϵo�k�C)g���d/�d��5��6�ΛN�I�UH�.V��&���}�[�v24���/{�����g@�e����z�J퇛&�|�y��c���Β?ԟF�Y?�֞���u��Ң"����I��1��^o�/Ϫf���*i�\���3/��.6��/��(x:߸�³��j:��zqh\<׆�>���kco���0~��*�4Aq�	�m�7���C]F$~��پL��f��=l���VHڣާpVl�-������E3�{��Ϳ�JW-�r�Iy�6�V�xl�v�#X~�y{xyU/��z�ú� ��z�v�����K �	mw2�����V�n��t��������3���hգ]�?�������n�D��oݳ����1s0�����+��P�-��˙��֐����rv������j�'O�q�۟v����y�	�S��)}���n���mrWc��d�������7�䆓_{���Z��������K)�u�<�'H��H)o
���������r�	<z���oF`�zq�<<����m{��f��E��m8޿/��^�Y���������j�)���� �A$y��ȁ����m�y�C](�P��C���m�Q#�\i��r�̪����]���ZOV^���n)t6ES�?��z�I���d���z˫s�&�T6��k�t�v։���j����?����lgT�$����js�q��u���w-�A�M=���l��F��VI~�i6�5O+�G�~+�׳�z=������X���C��K��|���"���߽s���a�B ��5ж��vLD��/�G�>�zȖ�Ji*>�J�Np�[��������dw ��oo��}���+j�7����o�To�.D�p�?�6۹�C�+��>�������{{��v�t��C�v��w\���X���kX����?�Zk�ڛ�P�4�M����KW,=�*=�Us���|Rqw[t�����/֫����ɭ�ۣ��-�xÞƨ�+ʻ��� ����v?�k�����c��9[6.�vb7=CL��_Ls��V��k��ðk�'��>�Б�m`�5���k�����S���C�H}�;�9����\lD�z˪�&T��(���Fw�&��b��s=>g�g��O��\�>/c�m,������6����Xxoc�m,������6����Xxoca�)���6����X$j�m,����Sxoc�m�����XxGEUxoc�m,����1cI�'�CXƫ�6����Xxo�og�����Xxoc�m,������6���ۘd��1Fs����Xxo�'17���NJ�m|3Tx���֐,����oc�m��.�����x�m,������6�Əd	����Xx��Qx?Q�F�*����F���Q��B�X�qc!n,č���U�qc!n,č�������B��#nL������S$[�Q��~��
�b��*<��G��(ŇģX��C ��p^h�a��Bkx�>
�a�h_h�a��+�UhC��ְ�ZC|����!�w�5,���ְ�Z�BkXh�a�5,��IFA�5c4��(���ְ�~sSh�Z�1C���m�5l�Bk�k��Zî�BkXhэZ�BkXh�a�5�H�`�5,����0k���#�5i)hÕ�`3�0���Jkh
�a�5,���ְ�Z�Bk�Ȏ*���ְ�Z�BkXȿ
�a�5,��E�������
�a�5,���ְ�Z�Bk��Em�5,����*���ְ�Z�Bk������+�Uh�a�5,�����e�a�5,���ְ�Z�BkXh�a�5L2

�����F�5,����𓘛Bk� '��>�*��o�akHZC\Åְ�vmZ�Bk�n��Z�BkXh��G��a�5,��Y�(���$�!s��T�i��P��Q<�����of������׳�c4����Q�2���]��T�Q�n~������A�����>��G����LA)�D���{ ����fֻ�d$��D탼l�]5 y��dh�� Pcb�)� ��l����)G�>ȅ��)���Zj�?*ӌk4LA*f��L�ΰ}����h��p��LcI�8�1k`a���jSpJ.��A�r����9������v�L:}p��^}�R&�<�%s�m�a:,,e��+2(��f���t���%GB䧄V�P�eh]����_���"�.s=�u	@y�4��N:{2�����Ȱ\�I��ӮݴkŵOuN{��3���A��<*���tԧ�TJj����V�L�pPk��a��2�>�M.5X�6�M>X�*��Dθh�!#�a�L%���s�a�l����JI)e!����LKYiPѩg��[&ӑ��-;�J��}�2�8��S.N����$� ��O�~H��	Y:ӁC5����4��R������8�n�*����N�9%p�3I·��L&Fma�Yx������-H*@hJn�G����0�� ��6d��L��|�w�sY<�`TU
lȈXgr���ം9��y�#�n�Ҟ2
 ��a��'�s���1���lJV1Ɲ[?4�&��0� 5  b\j��!�\7��l�J�Dd��L��
妞S.x�@7Ig��#��T��4��oI#��,�}3��"�oqj"yDE2�7�v�'R���8ex0Tnr�A�H+P�D���l!���ZA����2�0A���eĆ7��t!��'�$�s��[HmS�S�.EH��9l �j 
�=Xd��:����^����t�$���eI#�'�)�='�\+������̔�T��Xp�d�:��F-L%4	�p������H�ރ�D{b}7��L�r�8��ru��?-N-�"Ay���_�fB�)էLW�J�5a���������Db����l�OR%�&(.�e��5�PŘ6���\Yeq�L��4�B_>�h&��H��2^	�jQ�+ނQ ���z�̭-P[	�U8��L~$��{�`������GJj���'�$�pҞ�U���GP����iO3�&�WaT�c0��K�LQUIb�Y(�lt<"J�B���tM`���큕�L�:yDv��EV�8��Ix8�L���!���M$�s�J씋S�*���n�u<��E����.�2�!�=Х�㍡ ܃��3�H�}�)��Z>'y.38n_n��
��gt1�+�&�]�R^S��<�'��L��U$|Z�\��ƚM��h�"R��R@R��صf2�N�
>v>r�r�6��F6T��O��-PX����SZ�'�@�7z��0�T�%�Hs�|�����,�*"�s�-
���˘s-#�4��-�C�S��/-�*���j�R��e
H)�� �"H3m(�o��#�ꈌ�U�Ƒ� e�bZ�p"K+�ɳL���5*b!g�z���2��Ҫ^�w�9�`6Y�T� �L�T"U��"��rCn��Ȩ�m ��=�v��e�K�I�{Ԃ=
�np�y�pJ�op��DH���%�m��Jkat$ڙ)[ ��#�ȳ��Ȧ���(�nn(&�����i�"R���pih$�p�ӎ��c
M}=XL��ƎC@3��j���d�6:v,����;�ء�Ɠ��2��i�s�!X�h�vL���:4�<�=�?^��V )'9��1���\cx?�Cr�Li�S8Ѥ����fL0���QNa��J��2�̵}	?G�B��:���H+i�>��1$�&ZX�Ϧ��hNs&KX*�dS� D��%��B�be�6����!=vD�!����FN�\�4h�7u���l�EI�<K ۹K��x�2)J?�\:�6��e�}I���i��M+1CF�Q�ɜ"Ol��|���b4��Ź���[��[J��UV&P'f������S,��l��-P�>b@s����F$��svg�1ïPT�§Q�3�*���M�t�Q����*R�ÎRd�BdN,QfO�R)��ll�B�R)ldif8��?C��xA�\5fh�Ĝ�t	�$x�Ud���78�T�����,8u�@�Σ���@��ζ�i�fY�:J�@_
=^�� ��܆�Ty�z3\ص
�g�(�BE�mbZ�X�f�R@�Z�p�	�S�����t�T\�H��|Ç3?�!��%��z �5�]ZH ������C���      W   "  x�}Vˎ�6<S_����Cy�� �����Bcq=d	�� �_�nJ��� M�U���MC�^j�M\���k}S3 v���� !cn�V�'hx,�Ji�fx�����Ǿ}f���?���iq���o>�}�ݿM�W�7� ��}o�}�nGW��ɁN8B��2�����j��J+[�%�Gا��?����j�����
(�-��"
�~����2��B�$��9�� x�>���k���+�l넘������Wi5�V:��J��j9尀�D�K�V�;
eͲ�S|q3��%KGw}i*cnM�v%˭0S
�����V
!�k7	V�i�`�(g��]���@�ӥ�:,����'6����ѹ�n��Ho��Z�h1ώ��$�?|�������p'\��2sgGC�+�����\/��J����n�cbSC;������VbKJ�����_�+-�8�{�[�7C^aEL�0��[���:W��}����US��#I��� ��V� �Ck<���N_1)w-�Qw �(9��; �y��חH���b	o�
�i,������ԗ���u忿��kQG��H�M�Pk����� R�aM����!;�D||�N_���a�rb����U�3d����O��4ڑ7a�O�*F(�f9r��D��/��2E�?ܿi�����\�����ѤZ[� ����>�.МuEU�\��2,�gB31�S�D��b����%F,���,�$U�Q�#,�0��H��<8��4Y&���u"3��a�;_B=v���5�>.��<)"�R�� �&$��6�7�Q�?�c����H1)�&���Ɍ�΃D����i�$�2M�a�ܛ�d
g\�u�Ă�h2�y*�|�����_+���Hg�x>̒0��e�bN�⫈%E�sP��co-���uqu�J������ᓧ.Q�G$�X�cH�UE����;٩l�2nf7�Q��ܤ��N�D�1h����*$����d�T�JA�U���"�!��>��$����
d�      Y   �  x�mR�n�0<K_�P	\>,�7Q� n8�-@��l��R���z͏�*#�� ;;�;K,v߶�����ۻ"�I{u8�ф9=�/(�X���(�BH.�����.�-���/Q��A�[����K4���8���XOw%�]<�������0bE�"�[I�y�VH�2ɘ���f��C�+b���zL��#U#9����*B��(�Y�0�K��7���m�y]l�Om���$�E� �A�F���i0n��t�F�\e�/�m��k�{g�e��uWh�{��n��'����hkD�q�O�&�X@�9�g����MK��W��4�0.�kτ6����kw����i�\J+��jtp�N'��>ҳ���������7�}?����|%��+��,�0ʰ      [   �   x�u��m�0�3]�6`��*b+���(g���0P"�@��'��"�C>�C�bz�mƂO1��p�zbV�4���93���#���iL�΅��h��5�����?�_8�kh��$/�{��a�:��)_(�bPo=-Ce�ܢD̠u&� �U����T�b݀��?���A�R�W�t��:�m� f-"�׭Ȧ2ܫ�7~���A��+J�ʯ�d�����O;���\�      ]   �   x�u���0�3����kEl����%n�4P��餺=X1���9�����Ik0�Q�݂�t�'Ɖ6�S#���m{�QX��m֨m�I8Ã�ػ!��6v}��Ieh���p����(i���\����$u��TwF��@9*�l�St�ť��~QQ��w��t�@g      _   1  x�m�I��JF��+\�Vȑ�dե%΢�c��_��U�AD�yN�{IX��JS�M�������7�b3 z0j/o!��x�E�lk�v?`es؅^��1\0���=?�@i� O 
�ڹvʏ~��=<���$��K�x�򓟕H�������?�k�Ž=�z���>0��?�c����J�����m��D�D���(� -��)��0���@���R%�8f��ؤtH��}�8h�料�O���;�(o,ts/�@O:�^�5�S�?w' ��!�Hql(#�)S���W�BT!��	+M�F�$ofV-Z��H�-�~d�tkv�!7k�v%�m.��E�W�ـB�,TH8�2a�(� ���\	?M���J�v4HRۺg���}�:�n1����v��������s|�u�¦�g������ ���ϯ����HU\ZV��U?�i�T�ZgJ��y��?ؼ��h:pR�O�N/͜xa@�?J�^]�2�*U5��XE%�	i�H�ѭm&���|�=C�݌ *��-_/��z0���:���VD^H��UZ�TL���
�: Z���"��xeA��?��~S�Ե��z�r02Z��N��g�6?��}\/ths�Q<�A��2�B`��R ����03��k����`�������͑��� �mL|�A�@�2�L��'?Z��tgd�s�C>[��B�����$|�"�*# �R�Y�����	�in��fX�=y�����\�LHl�6�]�e1}�^����UF�
+��|���*+���1&TH�eI��h�     
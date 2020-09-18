PGDMP             	            x            cgsproys_rails_development    12.4    12.4     +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    16558    cgsproys_rails_development    DATABASE     �   CREATE DATABASE cgsproys_rails_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
 *   DROP DATABASE cgsproys_rails_development;
                postgres    false            �            1259    16568    ar_internal_metadata    TABLE     �   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         heap    postgres    false            �            1259    16597 	   proyectos    TABLE     �  CREATE TABLE public.proyectos (
    id bigint NOT NULL,
    nombre character varying,
    descripcion character varying,
    comitente character varying,
    constructor character varying,
    proyectista character varying,
    fproyecto date,
    ubicacion character varying,
    expediente character varying,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.proyectos;
       public         heap    postgres    false            �            1259    16595    proyectos_id_seq    SEQUENCE     y   CREATE SEQUENCE public.proyectos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.proyectos_id_seq;
       public          postgres    false    207            /           0    0    proyectos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.proyectos_id_seq OWNED BY public.proyectos.id;
          public          postgres    false    206            �            1259    16560    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         heap    postgres    false            �            1259    16578    users    TABLE     �  CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16576    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    205            0           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    204            �
           2604    16600    proyectos id    DEFAULT     l   ALTER TABLE ONLY public.proyectos ALTER COLUMN id SET DEFAULT nextval('public.proyectos_id_seq'::regclass);
 ;   ALTER TABLE public.proyectos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �
           2604    16581    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            $          0    16568    ar_internal_metadata 
   TABLE DATA           R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public          postgres    false    203   �&       (          0    16597 	   proyectos 
   TABLE DATA           �   COPY public.proyectos (id, nombre, descripcion, comitente, constructor, proyectista, fproyecto, ubicacion, expediente, user_id, created_at, updated_at) FROM stdin;
    public          postgres    false    207   �&       #          0    16560    schema_migrations 
   TABLE DATA           4   COPY public.schema_migrations (version) FROM stdin;
    public          postgres    false    202   �'       &          0    16578    users 
   TABLE DATA           g  COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at, created_at, updated_at) FROM stdin;
    public          postgres    false    205   �'       1           0    0    proyectos_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.proyectos_id_seq', 2, true);
          public          postgres    false    206            2           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    204            �
           2606    16575 .   ar_internal_metadata ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public            postgres    false    203            �
           2606    16605    proyectos proyectos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.proyectos DROP CONSTRAINT proyectos_pkey;
       public            postgres    false    207            �
           2606    16567 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            postgres    false    202            �
           2606    16590    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    205            �
           1259    16611    index_proyectos_on_user_id    INDEX     S   CREATE INDEX index_proyectos_on_user_id ON public.proyectos USING btree (user_id);
 .   DROP INDEX public.index_proyectos_on_user_id;
       public            postgres    false    207            �
           1259    16593 !   index_users_on_confirmation_token    INDEX     h   CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);
 5   DROP INDEX public.index_users_on_confirmation_token;
       public            postgres    false    205            �
           1259    16591    index_users_on_email    INDEX     N   CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);
 (   DROP INDEX public.index_users_on_email;
       public            postgres    false    205            �
           1259    16592 #   index_users_on_reset_password_token    INDEX     l   CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);
 7   DROP INDEX public.index_users_on_reset_password_token;
       public            postgres    false    205            �
           1259    16594    index_users_on_unlock_token    INDEX     \   CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);
 /   DROP INDEX public.index_users_on_unlock_token;
       public            postgres    false    205            �
           2606    16606    proyectos fk_rails_7f11443020    FK CONSTRAINT     |   ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT fk_rails_7f11443020 FOREIGN KEY (user_id) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.proyectos DROP CONSTRAINT fk_rails_7f11443020;
       public          postgres    false    205    207    2720            $   ?   x�K�+�,���M�+�LI-K��/ ���t,u-��L�L-�L�M�M,�Hq��qqq �]l      (   �   x�͏M
�0���)�y/�KvR�]�WnR-�*��G�8�ŋYED\;�a�� �7���t5l�7}�[@������+H���� �n�U˒:���=�W'd���\	I�v�T���*�e$I��aĞ�����M�	�� d�����` Hk���oO����h|O:P���"#I�0���k�9�^�m�      #   &   x�32020�44343202�2�p-���b���� wz=      &   �   x�u��
�0E��W��֐��e�@�]8�����Ո��/�n��չ'���Z�٭st�$r׹爐ﳂ�zeǓ�k]T��v�_���ܥ�a������Bg�"}0`U�UU87P3i!�?G�� %�1��U|��4��icw;a���1�P}m8�Z* �pao��+)��'+T��A��$E�     
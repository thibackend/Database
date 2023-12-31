PGDMP     2    !                {            wecommit    15.3    15.3 H    X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            [           1262    16399    wecommit    DATABASE     �   CREATE DATABASE wecommit WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United Kingdom.1252';
    DROP DATABASE wecommit;
                postgres    false            �            1259    16407 	   countries    TABLE     �   CREATE TABLE public.countries (
    country_id character(2) NOT NULL,
    country_name character varying(40),
    region_id integer
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    16516    countries_new    TABLE     �   CREATE TABLE public.countries_new (
    country_id character(2),
    country_name character varying(40),
    region_id integer
);
 !   DROP TABLE public.countries_new;
       public         heap    postgres    false            �            1259    16430    departments    TABLE     �   CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    manager_id integer,
    location_id integer
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    16429    departments_department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.departments_department_id_seq;
       public          postgres    false    220            \           0    0    departments_department_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;
          public          postgres    false    219            �            1259    16447 	   employees    TABLE     �  CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(25) NOT NULL,
    phone_number character varying(20),
    hire_date timestamp without time zone NOT NULL,
    job_id character varying(10) NOT NULL,
    salary numeric(8,2),
    commission_pct numeric(2,2),
    manager_id integer,
    department_id integer,
    CONSTRAINT emp_salary_min CHECK ((salary > (0)::numeric))
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    16446    employees_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.employees_employee_id_seq;
       public          postgres    false    223            ]           0    0    employees_employee_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;
          public          postgres    false    222            �            1259    16476    job_history    TABLE     8  CREATE TABLE public.job_history (
    employee_id integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    job_id character varying(10) NOT NULL,
    department_id integer,
    CONSTRAINT jhist_date_interval CHECK ((end_date > start_date))
);
    DROP TABLE public.job_history;
       public         heap    postgres    false            �            1259    16441    jobs    TABLE     �   CREATE TABLE public.jobs (
    job_id character varying(10) NOT NULL,
    job_title character varying(35) NOT NULL,
    min_salary numeric(6,0),
    max_salary numeric(6,0)
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    16418 	   locations    TABLE       CREATE TABLE public.locations (
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30) NOT NULL,
    state_province character varying(25),
    country_id character(2)
);
    DROP TABLE public.locations;
       public         heap    postgres    false            �            1259    16417    locations_location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.locations_location_id_seq;
       public          postgres    false    218            ^           0    0    locations_location_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;
          public          postgres    false    217            �            1259    16401    regions    TABLE     g   CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(25)
);
    DROP TABLE public.regions;
       public         heap    postgres    false            �            1259    16400    regions_region_id_seq    SEQUENCE     �   CREATE SEQUENCE public.regions_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.regions_region_id_seq;
       public          postgres    false    215            _           0    0    regions_region_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.regions_region_id_seq OWNED BY public.regions.region_id;
          public          postgres    false    214            �            1259    16513    test    TABLE     G   CREATE TABLE public.test (
    "ID " integer,
    name character(1)
);
    DROP TABLE public.test;
       public         heap    postgres    false            �            1259    16522    test_bk    TABLE     w   CREATE TABLE public.test_bk (
    employee_id integer,
    last_name character varying(25),
    salary numeric(8,2)
);
    DROP TABLE public.test_bk;
       public         heap    postgres    false            �           2604    16433    departments department_id    DEFAULT     �   ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);
 H   ALTER TABLE public.departments ALTER COLUMN department_id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    16450    employees employee_id    DEFAULT     ~   ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);
 D   ALTER TABLE public.employees ALTER COLUMN employee_id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16421    locations location_id    DEFAULT     ~   ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);
 D   ALTER TABLE public.locations ALTER COLUMN location_id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16404    regions region_id    DEFAULT     v   ALTER TABLE ONLY public.regions ALTER COLUMN region_id SET DEFAULT nextval('public.regions_region_id_seq'::regclass);
 @   ALTER TABLE public.regions ALTER COLUMN region_id DROP DEFAULT;
       public          postgres    false    215    214    215            J          0    16407 	   countries 
   TABLE DATA           H   COPY public.countries (country_id, country_name, region_id) FROM stdin;
    public          postgres    false    216   �T       T          0    16516    countries_new 
   TABLE DATA           L   COPY public.countries_new (country_id, country_name, region_id) FROM stdin;
    public          postgres    false    226   �U       N          0    16430    departments 
   TABLE DATA           ^   COPY public.departments (department_id, department_name, manager_id, location_id) FROM stdin;
    public          postgres    false    220   �V       Q          0    16447 	   employees 
   TABLE DATA           �   COPY public.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) FROM stdin;
    public          postgres    false    223   EX       R          0    16476    job_history 
   TABLE DATA           _   COPY public.job_history (employee_id, start_date, end_date, job_id, department_id) FROM stdin;
    public          postgres    false    224   �d       O          0    16441    jobs 
   TABLE DATA           I   COPY public.jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
    public          postgres    false    221   �e       L          0    16418 	   locations 
   TABLE DATA           o   COPY public.locations (location_id, street_address, postal_code, city, state_province, country_id) FROM stdin;
    public          postgres    false    218   ;g       I          0    16401    regions 
   TABLE DATA           9   COPY public.regions (region_id, region_name) FROM stdin;
    public          postgres    false    215   hj       S          0    16513    test 
   TABLE DATA           +   COPY public.test ("ID ", name) FROM stdin;
    public          postgres    false    225   �j       U          0    16522    test_bk 
   TABLE DATA           A   COPY public.test_bk (employee_id, last_name, salary) FROM stdin;
    public          postgres    false    227   �j       `           0    0    departments_department_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.departments_department_id_seq', 1, false);
          public          postgres    false    219            a           0    0    employees_employee_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.employees_employee_id_seq', 1, false);
          public          postgres    false    222            b           0    0    locations_location_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.locations_location_id_seq', 1, false);
          public          postgres    false    217            c           0    0    regions_region_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.regions_region_id_seq', 1, false);
          public          postgres    false    214            �           2606    16411    countries countries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    216            �           2606    16435    departments departments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    220            �           2606    16455    employees emp_email_uk 
   CONSTRAINT     R   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_email_uk UNIQUE (email);
 @   ALTER TABLE ONLY public.employees DROP CONSTRAINT emp_email_uk;
       public            postgres    false    223            �           2606    16453    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    223            �           2606    16481    job_history job_history_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_pkey PRIMARY KEY (employee_id, start_date);
 F   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_pkey;
       public            postgres    false    224    224            �           2606    16445    jobs jobs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    221            �           2606    16423    locations locations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    218            �           2606    16406    regions regions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);
 >   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_pkey;
       public            postgres    false    215            �           1259    16506    dept_location_ix    INDEX     O   CREATE INDEX dept_location_ix ON public.departments USING btree (location_id);
 $   DROP INDEX public.dept_location_ix;
       public            postgres    false    220            �           1259    16502    emp_department_ix    INDEX     P   CREATE INDEX emp_department_ix ON public.employees USING btree (department_id);
 %   DROP INDEX public.emp_department_ix;
       public            postgres    false    223            �           1259    16503 
   emp_job_ix    INDEX     B   CREATE INDEX emp_job_ix ON public.employees USING btree (job_id);
    DROP INDEX public.emp_job_ix;
       public            postgres    false    223            �           1259    16504    emp_manager_ix    INDEX     J   CREATE INDEX emp_manager_ix ON public.employees USING btree (manager_id);
 "   DROP INDEX public.emp_manager_ix;
       public            postgres    false    223            �           1259    16505    emp_name_ix    INDEX     R   CREATE INDEX emp_name_ix ON public.employees USING btree (last_name, first_name);
    DROP INDEX public.emp_name_ix;
       public            postgres    false    223    223            �           1259    16519 	   idx_email    INDEX     @   CREATE INDEX idx_email ON public.employees USING btree (email);
    DROP INDEX public.idx_email;
       public            postgres    false    223            �           1259    16521    idx_firstname    INDEX     I   CREATE INDEX idx_firstname ON public.employees USING btree (first_name);
 !   DROP INDEX public.idx_firstname;
       public            postgres    false    223            �           1259    16520    idx_last_name    INDEX     H   CREATE INDEX idx_last_name ON public.employees USING btree (last_name);
 !   DROP INDEX public.idx_last_name;
       public            postgres    false    223            �           1259    16509    jhist_department_ix    INDEX     T   CREATE INDEX jhist_department_ix ON public.job_history USING btree (department_id);
 '   DROP INDEX public.jhist_department_ix;
       public            postgres    false    224            �           1259    16508    jhist_employee_ix    INDEX     P   CREATE INDEX jhist_employee_ix ON public.job_history USING btree (employee_id);
 %   DROP INDEX public.jhist_employee_ix;
       public            postgres    false    224            �           1259    16507    jhist_job_ix    INDEX     F   CREATE INDEX jhist_job_ix ON public.job_history USING btree (job_id);
     DROP INDEX public.jhist_job_ix;
       public            postgres    false    224            �           1259    16510    loc_city_ix    INDEX     A   CREATE INDEX loc_city_ix ON public.locations USING btree (city);
    DROP INDEX public.loc_city_ix;
       public            postgres    false    218            �           1259    16512    loc_country_ix    INDEX     J   CREATE INDEX loc_country_ix ON public.locations USING btree (country_id);
 "   DROP INDEX public.loc_country_ix;
       public            postgres    false    218            �           1259    16511    loc_state_province_ix    INDEX     U   CREATE INDEX loc_state_province_ix ON public.locations USING btree (state_province);
 )   DROP INDEX public.loc_state_province_ix;
       public            postgres    false    218            �           2606    16412 "   countries countries_region_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id);
 L   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_region_id_fkey;
       public          postgres    false    215    3219    216            �           2606    16436 (   departments departments_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id);
 R   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_location_id_fkey;
       public          postgres    false    220    3226    218            �           2606    16497    departments dept_mgr_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);
 A   ALTER TABLE ONLY public.departments DROP CONSTRAINT dept_mgr_fk;
       public          postgres    false    220    3239    223            �           2606    16466 &   employees employees_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
 P   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_department_id_fkey;
       public          postgres    false    223    220    3228            �           2606    16456    employees employees_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 I   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_job_id_fkey;
       public          postgres    false    221    223    3231            �           2606    16461 #   employees employees_manager_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);
 M   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_manager_id_fkey;
       public          postgres    false    223    223    3239            �           2606    16492 *   job_history job_history_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
 T   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_department_id_fkey;
       public          postgres    false    3228    224    220            �           2606    16482 (   job_history job_history_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);
 R   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_employee_id_fkey;
       public          postgres    false    223    3239    224            �           2606    16487 #   job_history job_history_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 M   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_job_id_fkey;
       public          postgres    false    221    224    3231            �           2606    16424 #   locations locations_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id);
 M   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_country_id_fkey;
       public          postgres    false    3221    218    216            J     x�5�An�@E�N�	*�r�$���QE�8ĄQ�I4D���Pua��򷟝 ����6���Ho�P�`��fVz�<͆�,�ٙa��	Yj��@r1�Ĕ�mc�����w�=����5�7�B�Jc[�a��ߥ������X9�'�L�����j���Z�.T�!m��;z�.�Qތ���6�)�(�_��I
�O��ǜ��G��L��o�O����X���}�a��l�%��P�V� �="ײ��s���k�5\�����kUd�      T     x�5�An�@E�N�	*�r�$���QE�8ĄQ�I4D���Pua��򷟝 ����6���Ho�P�`��fVz�<͆�,�ٙa��	Yj��@r1�Ĕ�mc�����w�=����5�7�B�Jc[�a��ߥ������X9�'�L�����j���Z�.T�!m��;z�.�Qތ���6�)�(�_��I
�O��ǜ��G��L��o�O����X���}�a��l�%��P�V� �="ײ��s���k�5\�����kUd�      N   ^  x�]QAn�0<;��*�$�-jK�
8rq��X;rl��n��[2�;���=�g�L���;&9gb�y&9�T�ѸD�ξR�G�,Dq.8[��r�Z�<��2a�@��l{4M�-H�)�r��cg��H����3B�$^���()��Iڞs�z��� �����8�4�U
���O�R�8��Pm
7�_� �[��x,򝺎LA��������"@m�Hw!U���5�|�b��a �������:v�tL��L�=�WI�;�@�{��@g[7��XP��65�i�+1�j��'��lSC{qL��/�\��WH̼����OL��!�������?eY��h��      Q   �  x����n����\��@"�?ο��6�sf�Ҫ'acNla����O5`����f��U���~��ƪ�@��y	��|�tD+0U�^��{ôlP]ǾS�;��CQ�����k�x)h��(��?���W��**Dy^R�T��#�!��s�'	OuսS�;M�����T�?-T�0�������D��~��w����:�S���Oy���NO@�}�0]���UV�A����q5�׀Y}}����K3/�Ҍ'�Gwg
�~#Z<Q�&,�k��]/MQ��,�xf���!i�i8S�z:������pؑ��H�s�u���w\���:/�wX�q�Eٷ�j�9u[�-�jS�-�`U�����3D����K��`�)� �e��v����U��bj�"?�3�7�X�C�e#U婖@%�y��2QNVXW��G,������ǅ�w�HG� U.g�����k
A:H���sh]��m[��0�K�ǖ�W���3��z�O������(]88�H�:������w�nǟY�U�i��������8b>�`����1�`�����>�w���3��AgP�k�cU��q�35�4Y骎���^�]�b� =��f�x���H� <S���	Ss�L�♞ ���i���P�W��	ԙBX]��/�׺�����nvg�b5eHk�taC���:�q ��6�8�z���oWddsB��Ҧ9�?�!/.�>xA��e*�8��m,���Ҭ=~G<}�!U O�˺@��e�No<��aF!�O��4l�o����'6Yw�_�طoT����R�	�v�T�D��uu:�*Mq�߾Q�!VU��j�S���'˶�����6�'�xL��C����	�t�P��SA�s�aA�#��Kz���Q��}1q9�z��)�m��R`R�`l6Aph�����_�fO�6��b��o�I�H��P�� f0ԘB�������C�%�&�F��T6�ږ*U���b�����J?��9�չ�Yju��P+�z?�@����T2��
����xa�2.�Vn\��+f�T��5�&a�0@�1XM���oP�5�'f���4��3(uZ�=P�u��}h���#�X�����Ē���R����G6� ���s���K���7��IIޝbM4��sج<od�C�b"��	�gY��wpw,N-_���A���A�8K�QjS�I^^^r�������,�UOU�m�@�Rn�`�k�mA�`�*m��*E'z��N�Ҕ
}�Ǻ�YK�
֩s4��<���f0�w9^)�֘�5�j/|<t�t�S�
v>��	������gƪs�T��o˞�'Q���nЗ��39_0��e�S_���ʨꔪc��V�8I�Af1ulc𐼏ޚB��J�@�g�;�IV�?s�e��w��fw���rA�d��xL�����~o0��jݺf��
#�t>���n����al�7>;Z7%��͎$Y��O�[v�os�oX7����{���hTq	j*�1k�~��w .������'�b;�?ASd��f0�)n�sz�^�멁՜lg	�`�����$��J?��Ħ��Sռ�o�}�l�}������=D�ӕ!A�H7�^0�����]��o>$_ζM�.�&�v��G��i�j���r���l�v|O��9�u���|w��Z��jh��Sb;��0�{�"�급�ť��y�lt2[���R�:��*Ɋ��	�����M�s��d�A�e��V3w��)� c.^�#}m�q�?�}���;����j��>��rٱp�w�w`��l�B'��Z���6u�������.݇�W���l�����`8��}�~�i���{��D3ġ��LT�F�Y�O���\4G�m�����g�ZD���ӡ-��Z\rXTu{�'D����˘� ��BJk�Ѧ�OV<����1����&���@�1!���O�Cq9����!H�HhW��Rؚ4�6߮���z	�B{���io�<�ic�e��Ψ�����Sf�q�C�[���@�;��k�*��������d��tzb�&�d�h92��Ղ.�R>�ք��ȵx���Z�����3fQ�̐K��s�~�ƕ&��z�P�߱A��7a��\�w�"х*���.N��6.&�SU����q���h��i����v�n+�ѷ��~A���+`m+��kɨ*<�B�s�9>v��o�Q؆����e(����3t��f�Sn�E"��.��⊆��zFᥛ=V���/UG�60�k��q�Ȍ3���d�}�6��;��q�u��e�_�%B�}���n�қ���׳q V%�R�`�J����ɔn�ڛ&�E���]Nİ�v�|a��� ;�*���]I"ǐ���g���fx�C��M�L6��PL�PD�����p������V��u�G�,���N%C�C'�bw���MI���>�l�1�5P��?�8sTX�8m���^�,��G���\!;l��(͑�ΦxeN����@x�-�`|�fփuX5��p�pEX��8
x�;^GȂ��zfkP��F��x�C��d�����fޥ��x�-!���#�{k�{�ӀCS0����n	^} N/���8]���3�<]x�>j5��Q�'*0�`%�i�/�{]T@�d��5z���܈U�X���y����y3��C��T{ru6 ���n��Z����싂�׋����K�#���ք���+�UsĶ�Ώl�Ώ�K�-�a���8Wn<vy��N!���2u�ie~��]�`���8���D�c�+�W�&��AW�9uwH���h�}�p��uf��K�,�\^uyq��l`�g��p�8�������@��+��sM8��1g��갎��T^��x�%�=��Ze/���r��A�s�EU�a#U���˵�W'K���`�d��+մj~�Z�)����d�/�*Kv��xG�r`]�Mk�ޤ�.���'z���#�0��%-�)},և#eVg����㾞�?��H܏_#!i���u���<b���]p�]�l}�d��F6�g�����7h�>��٫����%��R�7���eqMEd�{D��Z�6��+u�����mw����
�O:�)<����9{�������Ư�8�#����D���t�^�>?����j�Z��UE�%s��'�#���*��V�Ǿ�q�2��	t����%�l�������}      R   �   x���M
�@���Sx�H����n���֖i�	s�[��jE�z�����"�5 ��~�Is��\����5�`AHbq�S�i ������^FE�D6��P�]��M�1^0�@6�<�h~��S�u�X¨|���U��~�>��:��v�1/9���g��|���L��aT^��U�}Ņy9���+R.�T�����+��u��-��}�l�      O   P  x�m�ێ�0���S��ŕ�^6x��hSԫMHl�bZ���� �� !������y��"!�H�NR�d����G��z*�V�6�V�U&G����y�$���Z� ;�|:t�N�'K��_,�ȥ!ShO���a�;l��eU��0q���h�jJ�$ ���*�t%4��$�����q��� .��C�_�y��8��������	���¯����B�C���o���rs�
�v�V��i�;$Q_>������{߭�ޫ܈��'Ĵ����\��fgC
`�F�a+���Fɨ)��V�y��Z��/.���8�K���y����      L     x�MS�r�8<��ݪ(��(M�I���e;I�2&'""p��e�����^�=���QRJP��ѢX�Ec��HiVv������R5�4J���H4�1|O}DP��sx$gk��׌�R�j��=��q ��{<��)���:���>Sy�d���_�gu�a��9|������I��T~.�������ǳ�5���h����{z��L-&�W.R�>����0F�ˉ!*t�s@W۾��B�/�ű�r, �>��"pM#��ap���G��I\S��<�7�6��4+eT�1vO���!z7Vi*sv��P\�l�B�l[�.z�sY�/2e��F�ҿ��oRg߫'a��Z�e�߇#_���>���Liq��`��+-�
J����d�z�i5�d�!����˿an�����ϰ�$�oc@�b�I��UGl�+E�F*�΍c{�S�{O�Q�NP�[w�B.Z��!���K�
7��>�9��d:a���F!i�?��5,��n2�F��C�w8�梁>�}K����~Ֆ\M���a~�0��s�2) ���ɱ� v�f��,�69$�q�o8Dj��Tu{B[�"�1|�d�V<�lޝJ|�"|��tJ�n@�#Y�9G5
�/� �{R̤�#����[�˴#'vC�Ӟ7;���
��=�"�����t��fy��f���}O�h���CpP^���{KI}h8��%<F���kS���P��s{��z��s^\�v=S�1F�R&װ�w[{����,״ы��P��l�e??fY��Y�      I   ?   x�3�t--�/H�2�t�M-�LN,�2�t,�L�2���LI�IUpM,.QH�KQpL)������ �~�      S      x�3�t����� �.      U   �  x�UU�r�6<��"_�E @�v��k���R�@2""� Hʑ�>Y �kfz݃��po�LTU������}X����U��owZ�%�q7����H�:�a�,H��i��h3$�G������=D��O�����2q����n�ޚq&�+\�ƣ͡u����1j(�1�_qG=�LZs<��w�.?�{��;��f��}x��m�4X	Tx+����ŝ�M1��u�ng���^6'�Ux5v�fFV�&Z��4�����K�R��q��RO�$xS܄M.�5�CL/�$�vk)��,ψ�����$��:n�+�.��0���+��[����:���1��~��<L�鑣B�hac�0�7�5f����z�F���W�����>�<��x�����y�'�E�$i�\��I�PH�Itì�
i�e�B�EǍ^�V4�9�qu1�H��O�3�"�D�9E����hq�w��'7.D):��¸5��*�h*<O�4���ո0ɕ�Fܕ�w4��BO�I*�X����+/��Y�*<M�\4����D0S�vv�gJY�*�d�&���#UZ�$Ëz���%��ff�"�oO��ʛ����dV��8�od]IE��dmYBZ��L�Kb��a��WU�	���JP��5�+F�Gҏ�*W�ӎ�̊R�+��e�БG�K�KV���BD[�H���Ǘ�2�O��R~�Ѥ������?Z:?��)�bo�q�vO�)�ni�&����k�t\�4����.(�$���$�o�M�嶊����m��%��)��W6	����p{l�]�G�1�K�h�ɄŃ���D3�+�����N�(��541ow��x�n���t
7Iz����Ds�O��<t�i!��ڑ)��PMƌ�]뜐�|��ceU:>�h�r���zi}F���l� �=a��������$Ŀ������y��     
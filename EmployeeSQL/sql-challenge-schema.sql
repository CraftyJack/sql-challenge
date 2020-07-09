PGDMP     %    *                x           EmployeeSQL    12.3    12.3     #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    16730    EmployeeSQL    DATABASE     �   CREATE DATABASE "EmployeeSQL" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "EmployeeSQL";
                postgres    false            �            1259    16731    departments    TABLE     t   CREATE TABLE public.departments (
    dept_no character varying(4) NOT NULL,
    dept_name character varying(30)
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    16771    dept_emp    TABLE     i   CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying(4) NOT NULL
);
    DROP TABLE public.dept_emp;
       public         heap    postgres    false            �            1259    16786    dept_manager    TABLE     m   CREATE TABLE public.dept_manager (
    dept_no character varying(4) NOT NULL,
    emp_no integer NOT NULL
);
     DROP TABLE public.dept_manager;
       public         heap    postgres    false            �            1259    16751 	   employees    TABLE     �   CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    emp_title character varying(5),
    birth_date date,
    first_name character varying(30),
    last_name character varying(30),
    sex character varying(5),
    hire_date date
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    16761    salaries    TABLE     R   CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer
);
    DROP TABLE public.salaries;
       public         heap    postgres    false            �            1259    16736    titles    TABLE     l   CREATE TABLE public.titles (
    title_id character varying(5) NOT NULL,
    title character varying(30)
);
    DROP TABLE public.titles;
       public         heap    postgres    false            �
           2606    16735    departments departments_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    202            �
           2606    16775    dept_emp dept_emp_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no);
 @   ALTER TABLE ONLY public.dept_emp DROP CONSTRAINT dept_emp_pkey;
       public            postgres    false    206    206            �
           2606    16790    dept_manager dept_manager_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no);
 H   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT dept_manager_pkey;
       public            postgres    false    207    207            �
           2606    16755    employees employees_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    204            �
           2606    16765    salaries salaries_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (emp_no);
 @   ALTER TABLE ONLY public.salaries DROP CONSTRAINT salaries_pkey;
       public            postgres    false    205            �
           2606    16740    titles titles_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);
 <   ALTER TABLE ONLY public.titles DROP CONSTRAINT titles_pkey;
       public            postgres    false    203            �
           2606    16781    dept_emp dept_emp_dept_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);
 H   ALTER TABLE ONLY public.dept_emp DROP CONSTRAINT dept_emp_dept_no_fkey;
       public          postgres    false    202    2706    206            �
           2606    16776    dept_emp dept_emp_emp_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);
 G   ALTER TABLE ONLY public.dept_emp DROP CONSTRAINT dept_emp_emp_no_fkey;
       public          postgres    false    2710    206    204            �
           2606    16796 &   dept_manager dept_manager_dept_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);
 P   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT dept_manager_dept_no_fkey;
       public          postgres    false    207    2706    202            �
           2606    16791 %   dept_manager dept_manager_emp_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);
 O   ALTER TABLE ONLY public.dept_manager DROP CONSTRAINT dept_manager_emp_no_fkey;
       public          postgres    false    2710    204    207            �
           2606    16756 "   employees employees_emp_title_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_emp_title_fkey FOREIGN KEY (emp_title) REFERENCES public.titles(title_id);
 L   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_emp_title_fkey;
       public          postgres    false    203    2708    204            �
           2606    16766    salaries salaries_emp_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);
 G   ALTER TABLE ONLY public.salaries DROP CONSTRAINT salaries_emp_no_fkey;
       public          postgres    false    204    205    2710           
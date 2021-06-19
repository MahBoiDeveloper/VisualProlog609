%  ��������: �������� �.�. 6�-208�-17. ������ �AI194. 
%
%��������� � ������� 
%"����� ������ �� ������� �� �� ��������� ������?" - ������� ��������� ���� � �������� ����������: 
%1.���� � ������� � � ���������, �� � �������; 
%2.� ������� �� ��������� � ��������; 
%3.� ������� "�� ����� �� ����" ������ � �; 
%4.�����, ����� �, � � �, � ������������ �� �������, � �� ������� ���� ���� �� ���� ������ �������. 
%������� ������� � ������� � ������: "�����, ��� � ����� ������� �� ���� ������ �� ������� �����, ���.
%� �� ������, �������� �� ���, ��������, ��� �� ���� ������������� ������� � ��� �� �������?" 
%"�� ����, - ��������� ����, - ��, ����� ��������� �������������� ��������� ������ ������ �� ���, ��������� ������ ����������". 
%��� ���������� �� �������� ��������? 
DOMAINS 
    ���                = symbol 
    �����              = ���* 
    ����               = �������; ��_������� 
    ��������           = ��������(���, ����) 
    �������������      = ��������*
    ������_���        = �����*
    �����_������������ = integer
PREDICATES
    nondeterm ���������_����              (����)
    nondeterm ���������_��������          (�������������)
    nondeterm ������_�                    (��������, �������������)
    nondeterm ������_�                    (���, �����)
    nondeterm ����������                  (�����, integer)
    nondeterm �������                     (�����_������������,�������������)
    nondeterm ��������_��������           (�������������)
    nondeterm �����_�������               (�����)
    nondeterm �����_���������_�_��������� (���)
    nondeterm �����_���������             (���)
    nondeterm ��������                    (���, ������_���)
    nondeterm �������_���_��������        (�����, �����, �����)
    nondeterm ����_��                     (���, �����)
CLAUSES
    ������_�(��������,[ �������� | _ ]).
    ������_�(��������,[ _ | �����_������_���������� ])
    :-
        ������_�(��������, �����_������_����������)
    .
    
    ����������([], 0).
    ����������([ _������ | �����_���������� ], ����������)
    :-
        ����������(�����_����������, �������������������),
        ���������� = ������������������� + 1
    .
               
    ����_��(�������, [ ������ | _ ])
    :-
        ������� = ������
    .
    ����_��(�������, [ ������ | ��������� ])
    :-
        not(������� = ������),
        ����_��(�������, ���������)
    .
    
    �������_���_��������([], ����������, �����������������)
    :-
        ����������������� = ����������
    .
    �������_���_��������([ ������������� | ����������������� ], ����������, �����������������)
    :-
        ����_��(�������������, ����������), 
        �������_���_��������(�����������������, ����������, �����������������)
    .
    �������_���_��������([ ������������� | ����������������� ], ����������, �����������������)
    :-
        not(����_��(�������������, ����������)),
        �������_���_��������(�����������������, [ ������������� | ���������� ], �����������������)
    .
         
    ��������(���, [ �������������� | ������������� ])
    :- 
        ������_�(���, ��������������),
        not(������������� = []),
        ��������(���, �������������)
    ;
        ������������� = [],
        ������_�(���, ��������������)
    .
          
    ���������_����(�������).
    ���������_����(��_�������).
    
%% ��������� ��������    
    ���������_��������(�������������)
    :-
        ���������_����(����A),
        ���������_����(����B),
        ���������_����(����C),
        ������������� =
        [
            ��������("A", ����A),
            ��������("B", ����B), 
            ��������("C", ����C)
        ],
        %4.�����, ����� �, � � �, � ������������ �� �������, � �� ������� ���� ���� �� ���� ������ �������.          
        findall
        (
            ���, 
            ������_�(��������(���, �������), �������������), 
            ��������
        ), 
        ����������(��������, �������������), 
        ������������� > 0
    .
%1.���� � ������� � � ���������, �� � �������; 
    �������(1,�������������)
    :-
        ������_�(��������("A", �������),    �������������),
        ������_�(��������("B", ��_�������), �������������),  
        ������_�(��������("C", �������),    �������������)
    ;
        ������_�(��������("A", ��_�������), �������������)
    ;
        ������_�(��������("B", �������),    �������������)
    .
                    
%2.� ������� �� ��������� � ��������;   
    �������(2,�������������)
    :-
        ������_�(��������("C",     �������),    �������������),
        findall
        (
            ���, 
            ������_�(��������(���, �������),    �������������), 
            ��������
        ), 
        ����������(��������, �������������), ������������� > 1
    ;
        ������_�(��������("C",     ��_�������), �������������)
    .
                          
%3.� ������� "�� ����� �� ����" ������ � �;          
    �������(3,�������������)
    :-
        ������_�(��������("A",     �������),    �������������),
        not(������_�(��������("C", �������),    �������������))
    ;
        ������_�(��������("A",     ��_�������), �������������)
    .
                        
%% �������� ��������       
    ��������_��������(�������������)
    :-
       ���������_��������(�������������),
       %1.���� � ������� � � ���������, �� � �������
       �������(1,�������������),
       %2.� ������� �� ��������� � ��������
       �������(2,�������������),
       %3.� ������� "�� ����� �� ����" ������ � �
       �������(3,�������������)
    .
        
    �����_�������(����������)
    :-
        ��������_��������(�������������),
        findall
        (
            ���, 
            ������_�(��������(���, �������), �������������), 
            ����������
        )
    .
    �����_���������_�_���������(��������)
    :-
        findall
        (
            ����������������, 
            �����_�������(����������������),
            �����������
        ),
            �����_�������(����������������),
            ������_�(��������, ����������������),
            ��������(��������, �����������)
    .
    �����_���������(��������)
    :-
        findall
        (
            ����������������, 
            �����_���������_�_���������(����������������), �����������),
            �������_���_��������(�����������, [], [ �������� | _ ]
        )
    .
GOAL
    �����_���������(����������_��_��������_��������).

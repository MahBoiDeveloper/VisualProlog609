/*				��� �������� � ��������?

���� � ����� ��������� � ������� ������ ������, ��� ����������, ������ ���������
��������� ��������. ����� �� ����� ������� ���� ���������� ������ ��������� ������
� �������� � ������� ���� � �������� ����, �������� ����� � ���������� ����.
��� ������� ������, ���� �� ��� ��������� ��������� � ��������. ���� �� ��� �
����������, ������� ������ ������� ������, ������ � ����������, ������� ������ ����, �
������ � �����������, ������� ������� ������ � ���� ����� ���, �� ������ ����� �����
���� � �������, � �����. ��� ��� ��� �������:
 
�: 1. � �� ����� ��������� � ��������� � � ���� ���� ����� ���.
   2. � �������� � ������� ��� ����� ���� �������.
   3. � � ������������, ��� ����� ��������� � ���������.
�: 1. � ���� ���� �����.
   2. � � ����������.
   3. � ������� ������ ������.
   4. ��������� � ��������� ���� �.
�: 1. � �� ����� � ������� ��� ���� �������.
   2. � � �����������.
   3. � � ����������.
   4. � �������� � ������� ������������� �.

� ������� ��� ����, ������ ����� ���������. ������ �����, �� �������� ������� ���,
��� �������� �������� ����� ������ �����. ���� ����� ����� �������� ���. �� ��� ��
�� ��� �� ������ �������?
*/

DOMAINS
    ���, �����, ����������, �����, �������, ���������� = symbol
    ������                                             = ������(���, �����, ����������, �����, �������)
    �������                                            = ������*
    ������_�������                                     = �������*
    �����                                              = integer

PREDICATES
    nondeterm ���������_�����             (�����)
    nondeterm ���������_����������        (����������)
    nondeterm ���������_�����             (�����)
    nondeterm ���������_�������           (�������)
    nondeterm ���������_����������        (����������)
    nondeterm ������_�                    (������, �������)
    nondeterm ������_�                    (�������, ������_�������)
    nondeterm ������                      (�����, ���, �������)
    nondeterm ��������                    (�����, ������, �������, ����������)
    nondeterm ���������_��������          (�������)
    nondeterm ��������_��������           (�������)
    nondeterm ��������_��������           (�������)
    nondeterm ���������_�����_�_�������   (�������, �������)
    nondeterm ���_�����������_�������     (�������, ������_�������)
    nondeterm �����_��������              (������_�������, ������_�������)
    nondeterm ������_�������_���_�������� (������_�������)
    nondeterm �������                     (���, �����)
    
CLAUSES
    ���������_�����(����������).
    ���������_�����(����������).
    ���������_�����(�����������).

    ���������_����������(�����).
    ���������_����������(��_�����).

    ���������_�����(����_�����).
    ���������_�����(���_�����).

    ���������_�������(��������).
    ���������_�������(��_��������).

    % ��������� ���������� ������� ������������ �����������
    ���������_����������(������).
    ���������_����������(����).
    % ����� �� ������
    ������_�(������, [������ | _]).
    ������_�(������, [_ | �����])
    :-
        ������_�(������, �����)
    .
    
    % �������� ������������ �� �������
    % �: 1. � �� ����� ��������� � ��������� � � ���� ���� ����� ���.
    ������(1, "�", �������)
    :-
        ������_�(������("�",_,��_�����,���_�����,_), �������)
    .
    % �: 2. � �������� � ������� ��� ����� ���� �������.
    ������(2, "�", �������)
    :-
        ������_�(������("�",_,_,_,��������), �������)
    .    
    % �: 3. � � ������������, ��� ����� ��������� � ���������.
    ������(3, "�", �������)
    :-
        ������_�(������("�",_,�����,_,_), �������)
    .
    
    % �: 1. � ���� ���� �����.
    ������(1, "�", �������)
    :-
        ������_�(������("�",_,_,����_�����,_), �������)
    .
    % �: 2. � � ����������.
    ������(2, "�", �������)
    :-
        ������_�(������("�",����������,_,_,_), �������)
    .
    % �: 3.� ������� ������ ������.
    ������(3, "�", �������)
    :-
        not(������(1, "�", �������)),
        not(������(2, "�", �������)),
        not(������(3, "�", �������)),
        not(������(4, "�", �������))
    .
    % �: 4. ��������� � ��������� ���� �.
    ������(4, "�", �������)
    :-
        ������_�(������("�",_,�����,_,_), �������)
    .

    % �: 1. � �� ����� � ������� ��� ���� �������.
    ������(1, "�", �������)
    :-
        ������_�(������("�",_,_,_,��_��������), �������)
    .
    % �: 2. � � �����������.
    ������(2, "�", �������)
    :-
        ������_�(������("�",�����������,_,_,_), �������)
    .
    % �: 3. � � ����������.
    ������(3, "�", �������)
    :-
        ������_�(������("�",����������,_,_,_), �������)
    .
    % �: 4. � �������� � ������� ������������� �.
    ������(4, "�", �������)
        :- ������(3, "�", �������)
    .
   
   % �������� ������� ����� �����
    ��������(�����, ������(���, ����������, _,_,_), �������, _)
    :-
        ������(�����, ���, �������)
    .
        
    ��������(�����, ������(���, ����������, _,_,_), �������, _)
    :-
        not(������(�����, ���, �������))
    .

    ��������(�����, ������(���, �����������, _,_,_), �������, ������)
    :-
        ������(�����, ���, �������)
    .
    ��������(�����, ������(���, �����������, _,_,_), �������, ����)  
    :-
        not(������(�����, ���, �������))
    .

    % ��������� ��������
    ���������_��������(�������)
    :-
        ���������_�����(�����_1),
        ���������_�����(�����_2), not(�����_1 = �����_2),
        ���������_�����(�����_3), not(�����_1 = �����_3), not(�����_2 = �����_3),

        ���������_����������(����������_1),
        ���������_����������(����������_2),
        ���������_����������(����������_3),

        ���������_�����(�����_1),
        ���������_�����(�����_2),
        ���������_�����(�����_3),

        ���������_�������(�������_1),
        ���������_�������(�������_2),
        ���������_�������(�������_3),

        ������� = 
        [
            ������("�", �����_1, ����������_1, �����_1, �������_1),
            ������("�", �����_2, ����������_2, �����_2, �������_2),
            ������("�", �����_3, ����������_3, �����_3, �������_3)
        ]
    .

    % ��������� ��������
    ��������_��������(�������)
    :-
        ������� = [������_1, ������_2, ������_3],

        % ���� ������ �������� ������������, 
        % �� ��� ���� ������ ������������ ���������� ��� ������������
        ���������_����������(����������_������������_����������),
        ���������_����������(���������������_����������),
        not(���������������_���������� = ����������_������������_����������),
        
        ��������(1, ������_1, �������, ����������_������������_����������),
        ��������(2, ������_1, �������, ���������������_����������),
        ��������(3, ������_1, �������, ����������_������������_����������),

        ��������(1, ������_2, �������, ����������_������������_����������),
        ��������(2, ������_2, �������, ���������������_����������),
        ��������(3, ������_2, �������, ����������_������������_����������),
        ��������(4, ������_2, �������, ���������������_����������),

        ��������(1, ������_3, �������, ����������_������������_����������),
        ��������(2, ������_3, �������, ���������������_����������),
        ��������(3, ������_3, �������, ����������_������������_����������),
        ��������(4, ������_3, �������, ���������������_����������)
    .

    % �������� ��� �������� �� ������ ���� ��������� (��� � �����) ��������������� ��������
    % (������������ ������������ ������ � ��������)
    ��������_��������(�������)
    :-
        ���������_��������(�������),
        ��������_��������(�������)
    . 

    ���������_�����_�_�������([], []).
    ���������_�����_�_�������([������ | �����_������], [������_1 | �����_������_1])
    :-
        ���������_�����_�_�������(�����_������, �����_������_1),
        ������   = ������(���, �����, _,_,_),
        ������_1 = ������(���, �����, _,_,_)
    .

    % �������� ����� ����������, ���� ��� ������ ����� ��������,
    % � ������� � ��������������� �������� ����� �� ����� � �������
    ���_�����������_�������(_, []).
    ���_�����������_�������(�������, [�������_1 | �����_������])
    :-
        ���_�����������_�������(�������, �����_������),
        not(���������_�����_�_�������(�������, �������_1))
    .

    % �������� ���������� �������
    �����_��������([], []). 
    �����_��������([������� | �����_������], ������)
    :- 
        �����_��������(�����_������, ������_1),
        ���_�����������_�������(�������, ������_1),
        ������ = [������� | ������_1]
    ;
        �����_��������(�����_������, ������_1),
        not(���_�����������_�������(�������, ������_1)),
        ������ = ������_1
    .

    % �������� ��� ���������� �������
    ������_�������_���_��������(������)
    :-
        findall
        (
            �������,
            ��������_��������(�������),
            ������_�_�������
        ),
        �����_��������(������_�_�������, ������)
    .
    
    % ������� �������
    �������(���, �����)
    :-
        ������_�������_���_��������(������),
        ������_�(�������, ������),
        ������_�(������(���, �����, _,_,_), �������)
    .

GOAL
    �������(���, �����).
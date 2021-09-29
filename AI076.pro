/*
                ��� �� ����� �����?
���������� ������ ���� �� ����������� �����, ���������� � ����.

������� ���� ���������� � �� ������, �� ��� ������ ����� �� ����������.
��������� ���� ������������� ����� �������� ����� � �����-������ �������, �� ���������� �� ����� �����������.

�� ���� ���������� ���� ������, ��� ��������� ���������, � ��������� ���������, ��� ���� ���������.
����, ����� �� ������������ �����, ������������ ���-�� ������������� ���� ��� ���,
�� ��� � �� ����������, � �� ��������� �� ���� ������� � ��������.

����������, ��� �� ���� ���������� �� �������� ������� ����������� (��������, ��� ��,
��� ������ �����, ������� �� ������� ������).
����� ����, �����������, ��� ����� ����� ���-�� ����.

��� �� ���� ���������� ������ ������� (���� ���-������ �� ���� ������ �������)?
*/
DOMAINS
    ���, ����     = symbol
    ����������    = integer    
    ������������� = �������������(���, ����)
    ������������� = �������������*
    ������_����   = ���*
PREDICATES 
    nondeterm ������_�                          (�������������, �������������)
    nondeterm ������_�                          (���, ������_����)
    nondeterm ���������_����                    (����)
    nondeterm ������                            (���, �������������)
    nondeterm ���������_���������               (���, �������������) 
    nondeterm ���������_���������_������������� (�������������)
    nondeterm �����_���_��_����                 (�������������, ����������)    
    nondeterm ���������_��������                (�������������)
    nondeterm ���_��_���                        (���)
    nondeterm �������_�����                     (������_����, ������_����)
    nondeterm ���������_������_����_�����       (������_����)
    nondeterm �������                           (���)
    
CLAUSES
    ������_�(������,[������|_]).
    ������_�(������,[_|�����])
    :-
        ������_�(������,�����)
    .
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
    ���������_����(�������).
    ���������_����(���������).
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % �� ���� ���������� ���� ������, ��� ��������� ���������. 
    ������("���������� ����", �������������) 
    :-
         ������_�(�������������("���������", ���������), �������������)
    .

    % ��������� ���������, ��� ���� ���������
    ������("���������", �������������) 
    :-
         ������_�(�������������("����", ���������), �������������)
    .

%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % ����������, ��� �� ���� ���������� �� �������� ������� ����������� 
    ���������_���������(���, �������������) 
    :-
         ������_�(�������������(���, ���������), �������������),
         ������(���, �������������)
    .
                                               
    % (��������, ��� ��, ��� ������ �����, ������� �� ������� ������).
    ���������_���������(���, �������������) 
    :-
        ������_�(�������������(���, �������), �������������),
        not(������(���, �������������))
    .
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ���������_���������_�������������(�������������)
    :-
        ���������_���������("���������� ����",�������������),
        ���������_���������("���������", �������������)
    .
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % ����� ����, �����������, ��� ����� ����� ���-�� ����.
	�����_���_��_����([], 0).
	�����_���_��_����([������|�����_������], ����������)
    :-
	    �����_���_��_����(�����_������, ����������_1),
	    ������ = �������������(_, �������),
	    ���������� = ����������_1 + 1
    .

	�����_���_��_����([������|�����_������], ����������)
    :-
	    �����_���_��_����(�����_������, ����������_1),
	    ������ = �������������(_, ���������),
	    ���������� = ����������_1
    .
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ���������_��������(�������������) 
    :-
        % ���������� �������� - ������ ������������� �� ����������: ��� � ����
        ���������_����(����_1), ���������_����(����_2), ���������_����(����_3),
        ������������� = [�������������("���������� ����", ����_1),
                         �������������("���������", ����_2),
                         �������������("����", ����_3)],

        % ��������� ��������
        �����_���_��_����(�������������, 1),
        ���������_���������_�������������(�������������)
    .
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % ������� ������� �� ����������� �������
    ���_��_���(���) 
    :-
        ���������_��������(�������������),
        ������_�(�������������(���, �������), �������������)
    .
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % �������� ���������� �������
    �������_�����([], []). 
    �������_�����([������ | �����], ������) 
    :-
        �������_�����(�����, ������_1),
        not(������_�(������, ������_1)),
        ������ = [������ | ������_1];

        �������_�����(�����, ������_1),
        ������_�(������, ������_1),
        ������ = ������_1
    .
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % ��� ��������� ���������� �������
    ���������_������_����_�����(������) 
    :-
        findall(���, ���_��_���(���), ������_�_�������),
        �������_�����(������_�_�������, ������)
    .
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % ����� �����
    �������(���) 
    :-
        ���������_������_����_�����(������),
        not(������ = []),
        ������_�(���, ������);

        ���������_������_����_�����(������),
        ������ = [],
        ��� = "�������� ���"
    .
    
GOAL 
    �������(���).
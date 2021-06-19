% ��� ���������� ������������� ���������� �� ����������� ����������� �������
% ���� �� ������ ������������ �������� ����� ������������: 
% �� �����������, ��������������, �����������, ����������, �������� � �����������. 
% ������� ����� �� ��������� ��������� ������ �� ������ ��������������, ���� ��������� ����������� ������� ����� ���������������. 
% ����������� ��������� ����� ��������� ������� � ���; ��������������� � ����� � ����; 
% ����������� � ���� � ���; ���������� � �������� � ������; 
% ����� � �������� � ������; ����������� � ������ � ������.
% �� ������������ ��������������� ������������� ����� ����������� ����������
% ������ ����� � ������, � ����� ������� � �������� � ��������. 
% ��������, ������������, ����� �������� �������� � ����� ���������� � �����, � ������ � � �������.
% ���� ������� �������� � ������ ����������?
DOMAINS
    �����               = integer
    ���, �������������  = string
    ����������          = ����������(���, �������������)
    ������_������������ = ����������*
PREDICATES
    nondeterm ���������_������������� (���, �������������)
    nondeterm ������_�                (���, ������_������������)
    nondeterm �����_���               (����������, ������_������������)
    nondeterm ������������            (�����, ������_������������)
    nondeterm ��������_������������   (������_������������)
    nondeterm �����_�������           (���, �������������)
CLAUSES
% ...����������� ��������� ����� ��������� ������� � ���...
    ���������_�������������("�������",  "��������").
    ���������_�������������("���",      "��������").
% ...��������������� � ����� � ����...   
    ���������_�������������("�����",    "��������������").
    ���������_�������������("����",     "��������������").
% ...����������� � ���� � ���...    
    ���������_�������������("����",     "����������").
    ���������_�������������("���",      "����������").
% ...���������� � �������� � ������...   
    ���������_�������������("��������", "���������").
    ���������_�������������("������",   "���������").
% ...����� � �������� � ������...     
    ���������_�������������("��������", "����").
    ���������_�������������("������",   "����").
% ...����������� � ������ � ������....
    ���������_�������������("������",   "����������").
    ���������_�������������("������",   "����������").
% �������� ���������
    ������_�(���, [ ����������(���,_) | _ ]).
    ������_�(���, [ _ | ����� ])
    :-
        ������_�(���, �����)
    .
% ����� � ������
    �����_���(������, [ ������ | _ ]).
    �����_���(������, [ _ | ����� ])
    :-
        �����_���(������, �����)
    .
% ...�� ������������ ��������������� ������������� ����� ����������� ���������� ������ ����� � ������...
    ������������(1, ������_����������)
    :-
        ������_�("����",  ������_����������), 
        ������_�("�����", ������_����������)
    ;
        not(������_�("����",  ������_����������)), 
        not(������_�("�����", ������_����������))
    .
% ...� ����� ������� � �������� � ��������...   
    ������������(2, ������_����������)
    :-
        ������_�("������",   ������_����������), 
        ������_�("������",   ������_����������), 
        ������_�("��������", ������_����������)
    ;
        not(������_�("������",   ������_����������)), 
        not(������_�("������",   ������_����������)), 
        not(������_�("��������", ������_����������))
    .
% ...��������, ������������, ����� �������� �������� � ����� ���������� � �����...
%    ��� �� �������� ������ ������, ����� ��� ��� ������, � ��������� ������ ��� ��������
    ������������(3, ������_����������)
    :-
        not(������_�("��������", ������_����������)),
        ������_�("���",          ������_����������)
    ;
        ������_�("��������", ������_����������),
        not(������_�("���",  ������_����������))
    ;
        not(������_�("��������", ������_����������)),
        not(������_�("���",      ������_����������))
    .
% ...� ������ � � �������..
%   ���������� ������������ 3
    ������������(4, ������_����������)
    :- 
        not(������_�("������", ������_����������)), 
        ������_�("�����",      ������_����������)
    ;
        ������_�("������",    ������_����������), 
        not(������_�("�����", ������_����������))
    ;
        not(������_�("������", ������_����������)),
        not(������_�("�����",  ������_����������))
    .
% �������� �������
    ��������_������������(������_����������)
    :-
        ������������(1, ������_����������),
        ������������(2, ������_����������),
        ������������(3, ������_����������),
        ������������(4, ������_����������)
    .
% ���������� � ��������� ��������
    �����_�������(���, �������������)
    :-
        % ��������� ��������
        ���������_�������������(��������,       "��������"),
        ���������_�������������(��������������, "��������������"),
        ���������_�������������(����������,     "����������"),
        ���������_�������������(���������,      "���������"),
        ���������_�������������(����,           "����"),
        ���������_�������������(����������,     "����������"),

        ������_���������� =
        [
            ����������(��������,       "��������"),
            ����������(��������������, "��������������"),
            ����������(����������,     "����������"),
            ����������(���������,      "���������"),
            ����������(����,           "����"),
            ����������(����������,     "����������")
        ],
        % �������� ��������
        ��������_������������(������_����������),
        �����_���(����������(���, �������������), ������_����������)
    .
GOAL
    �����_�������(���, �������������).
    
    
%  ���������: Ѹ���� �.�. 6�-208�-17. ������ �AI175. 
%
%                           �������� ����
% �� ����� �������� � ������ ���������� ��������, �����, ��������� � �������.
% ���-�� �� ��� ������ ������. ������� ������� ����� � ������� �� ������� �� ��� ������.
% ��������:     1. ���� ������� �� �.
%               2. � ������ � ������ � ������.
%               3. ������� �����, ��� ������ ����
%
% �����:        1. ��� ������ �� �.
%               2. � �������� � ��� ����� �� ������������.
%               3. ���� ������ ���������.
%
% ���������:    1. � �� �������.
%               2. ���� ������� �������.
%    3. ����� ����, ����� ����������, ����� ���� ������ �.
%
% �������:  1. ���� ������� �� �.
%     2. �������� ������� ����.
%     3. ����� �����, ��� � �� ��������, ���� �� �������� �� � ��� ������ ������.
% ����� ����, ������ �� ��� ���������, ��� �� ���� ������� ��� �������� � ���� ������.
% ��� ������ ����?

DOMAINS 
    ���                = ��������; �����; ���������; �������
    ����               = ������; ��_������
    ������             = ������(���,����)
    ���������_�������� = ������(���, ����); �������������(���, ���, ��������)
    �������������      = ���������_��������*
    �����_������������ = integer
    ��������           = ��; ���
    ������             = integer*
    �����              = ���*
    
PREDICATES
    nondeterm ����_��             (���������_��������, �������������)       
    nondeterm ����������          (������, integer) 
    nondeterm ����������          (�����, integer) 
    nondeterm ����������_�������� (���, �������������, integer)
    nondeterm ���������_����      (����)
    nondeterm ���������_��������  (��������)
    nondeterm ���������_��������  (�������������)
    nondeterm ��������_��������   (�������������)
    nondeterm �������_��������    (�������������, ���) -(i,o)
    nondeterm �������             (���,�����_������������,�������������)
    nondeterm ����_������         (���)
CLAUSES
    ����_��(������, [ ������ | _ ]).
    ����_��(������, [ _ | �����_������_�������� ])
    :-
        ����_��(������, �����_������_��������)
    .
    
    ����������([], 0).
    ����������([ _������ | �����_���������� ], ����������)
    :-
        ����������(�����_����������, �������������������),
        ���������� = ������������������� + 1
    .
    ����������_��������(���, �������������, ����������)
    :-
        findall
        (
            �����,
            �������(���, �����, �������������),
            ������������
        ),
        ����������(������������, ����������)
    .
  
    ���������_����(������).
    ���������_����(��_������).
    ���������_��������(��).
    ���������_��������(���).
        
%% ��������� �������� 
    ���������_��������(�������������)
    :-
        ���������_����(�����),
        ���������_����(�����),
        ���������_����(����B),
        ���������_����(�����),
        ���������_��������(�������������),
        ������������� =
        [
            ������(��������, �����), 
            ������(�����,�����), 
            ������(���������,����B), 
            ������(�������,�����),
            �������������(�����, �������, �������������)
        ],
        findall
        (
            ���, 
            ����_��(������(���, ������), �������������), 
            ��������
        ),
        ����������(��������,1)
    .
    ��������_��������(�������������)
    :-
        ������������������ = 2,
        ����������_��������(��������, �������������, ������������������),
        ����������_��������(�����,    �������������, ������������������),
        ����������_��������(���������,�������������, ������������������),
        ����������_��������(�������,  �������������, ������������������)
    .
    �������_��������(�������������, ���)
    :-
        ����_��(������(���, ������), �������������)
    .
% �������� ������������ �� ������� ������
%
% ��������:  1. ���� ������� �� �.
%            2. � ������ � ������ � ������ = "���� ������� �� �"
%            3. ������� �����, ��� ������ ����.
    �������(��������,1, �������������)
    :-
        ����_��(������(��������, ��_������), �������������)
    .
    �������(��������,2, �������������)
    :-
        ����_��(������(��������, ��_������), �������������)
    .
    �������(��������,3, �������������)
    :-
        �������(�������,1, �������������)
    ;
        �������(�������,2, �������������)
    .
% �����:     1. ��� ������ �� �.
%            2. � �������� � ��� ����� �� ������������.
%            3. ���� ������ ���������.
    �������(�����,1, �������������)
    :-
        ����_��(������(�����, ��_������), �������������)
    .
    �������(�����,2, �������������)
    :-
        ����_��(�������������(�����, �������, ���), �������������)
    .
    �������(�����,3, �������������)
    :-
        ����_��(������(���������, ������), �������������)
    .
% ���������: 1. � �� �������. = "���� ������ �� �"
%            2. ���� ������� �������.
%        3. ����� ����, ����� ����������, ����� ���� ������ �.
    �������(���������,1, �������������)
    :-
        ����_��(������(���������, ��_������), �������������)
    .
    �������(���������,2, �������������)
    :-
        ����_��(������(�������, ������), �������������)
    .
    �������(���������,3, �������������)
    :-
        not(�������(�����, 3, �������������))
    .
% �������:   1. ���� ������� �� �.
%        2. �������� ������� ����.
%            3. ����� �����, ��� � �� ��������, ���� �� �������� �� � ��� ������ ������.    
    �������(�������,1, �������������)
    :-
        ����_��(������(�������, ��_������), �������������)
    .
    �������(�������,2, �������������)
    :-
        ����_��(������(��������, ������), �������������)
    .
    �������(�������,3, �������������)
    :-
        ����_��(�������������(�����, �������, ��), �������������)
    .
        
    ����_������(�������)
    :-
        ���������_��������(�������������),
        ��������_��������(�������������),
        �������_��������(�������������,�������)
    .
GOAL
    ����_������(����_������).